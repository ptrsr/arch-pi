FROM ubuntu:20.04

RUN apt-get update
RUN apt install -y qemu-system-arm qemu-efi-aarch64 qemu-utils

COPY bin/arm-v8.img /project/
COPY bin/pi-3b.dtb /project/
COPY bin/arch-arm.qcow2 /project/

# CMD /bin/bash
CMD qemu-system-aarch64 \
    -M raspi3 -m 1G \
    -kernel /project/arm-v8.img \
    -dtb /project/pi-3b.dtb \
    -sd /project/arch-arm.qcow2 \
    # -serial stdio \
    -smp 4 \
    -nographic -no-reboot \
    -net nic -net user \
    -append "rw console=ttyAMA0,115200 dwc_otg.lpm_enable=0 root=/dev/mmcblk0p2 rootfstype=ext4 rootdelay=1 loglevel=3"
