#!/bin/bash

build=0
dry=0
write=0

# if options are passed, parse them
if [[  $1 =~ - ]] ; then
	if [[ $1 =~ b ]] ; then
		build=1
	fi
	if [[ $1 =~ w ]] ; then
		write=1
	fi
	if [[ $1 =~ d ]] ; then
		dry=1
	fi
	shift
fi

if [[ $build -eq 0 ]] && [[ $write -eq 0 ]] ; then
    build=1
    write=1
fi

DIR_SOURCE=/home/cael/snal
DIR_BUILD=/box/snal

if [[ ! -d $DIR_SOURCE ]] ; then
    echo "ERROR: $DIR_SOURCE does not exist"
    exit 1
fi
if [[ ! -d $DIR_BUILD ]] ; then
    echo "ERROR: $DIR_BUILD does not exist"
    exit 1
fi

USB=""
found_usb=0
for DEV in /sys/block/sd* ; do
    udevadm info --no-pager $DEV | grep -q "^P:.*usb"
    test_usb=$?
    if [[ $test_usb -eq 0 ]] ; then
        found_usb=$((found_usb+1))
        vendor=$(udevadm info --no-pager $DEV | grep "^E: ID_USB_VENDOR=" | sed -e "s/E: ID_USB_VENDOR=//")
        cd $DEV
        NAME=$(basename $DEV)
        USB="/dev/$NAME"
        if [ -d ${NAME}1 ] ; then
            echo "found /dev/$NAME $vendor USB with partitions"
            for PART in ${NAME}[0-9]* ; do
                filesystem=$(udevadm info --no-pager $PART | grep "^E: ID_FS_TYPE=" | sed -e "s/E: ID_FS_TYPE=//")
                label=$(udevadm info --no-pager $PART | grep "^E: ID_FS_LABEL=" | sed -e "s/E: ID_FS_LABEL=//")
                size=$(udevadm info --no-pager $PART | grep "^E: ID_PART_ENTRY_SIZE=" | sed -e "s/E: ID_PART_ENTRY_SIZE=//" | numfmt --format="%5.2f" --to=iec)
                echo -n "     "
                printf %4s $PART
                printf %16s $label
                printf %12s $filesystem
                printf %6s $size
                echo ""
            done
        else
            echo "$NAME is USB with no partitions"
        fi
    fi
done

if [[ $write -eq 1 ]] ; then
    if [[ $found_usb -eq 1 ]] && [[ $USB != "" ]] ; then
        echo "Using $USB"
    else
        echo "Found $found_usb USB drives. Run with -b to build only or insert exactly one USB drive."
        exit 1
    fi
fi

if [[ $build -eq 1 ]] ; then
    if [[ $dry -eq 0 ]] ; then
        cd $DIR_BUILD
        rm -r archiso out releng work
        
        cp -r $DIR_SOURCE/{archiso,configs/releng} .
        ./archiso/mkarchiso -v -w work -o out releng || exit 1
    else
        echo "cd $DIR_BUILD"
        echo "rm -r archiso out releng work"
        
        echo "cp -r $DIR_SOURCE/{archiso,configs/releng} ."
        echo "./archiso/mkarchiso -v -w work -o out releng || exit 1"
    fi
fi

ISO=$(find ${DIR_BUILD}/out -name "*.iso")

if [[ $write -eq 1 ]] ; then
    if [[ -e $ISO ]] ; then
        if [[ $dry -eq 0 ]] ; then
            echo "Writing $ISO to $USB in 3 seconds . . . "
            sleep 3
            dd if=${ISO} of=${USB} status=progress
        else
            echo "Writing $ISO to $USB in dry mode"
            echo dd if=${ISO} of=${USB} status=progress
        fi
    else
        echo "ERROR: Snal ISO not found in ${DIR_BUILD}/out"
        exit 1
    fi
fi
