# gspca-kinect2

Linux kernel driver for the "Kinect for Windows 2" sensor.

This repo is forked from https://github.com/yoshimoto/gspca-kinect2; @pw4ever adds DKMS support for module lifecycle (adding, installation, uninstallation, and removing) management.

## Requirements ##
* Linux 3.x+
* DKMS setup successfully tested on `5.6.14-arch1-1 #1 SMP PREEMPT Wed, 20 May 2020 20:43:19 +0000 x86_64 GNU/Linux`

## Build & install

```bash
sudo dkms add gspca_kinect2/1.0
sudo dkms install gspca_kinect2/1.0
sudo modprobe gspca_kinect2
```

## Usage

This driver provides two v4l2 interfaces per a single kinect sensor; color camera is mapped to /dev/video0, and depth camera is mapped to /dev/video1. If you have two or more sensors, they shall be mappaed to /dev/videoX, where X are (2*n) for n-th color and (2*n+1) for n-th depth.

### Capture color video

```bash
ffmpeg  -framerate 30 -video_size 640x480 -i /dev/video0  test.avi  
mplayer test.avi  
```

### View live color/depth video

@yoshimoto wrote an open source library, named libk4w2. See https://github.com/yoshimoto/libk4w2/ for details.

### Misc

```bash
v4l2-ctl --info
```

# Acknowledgements

This driver is based on the following discussions and source codes;
- libfreenect2, https://github.com/OpenKinect/libfreenect2
- Analyzing Kinect 2 ISO data, https://groups.google.com/forum/#!topic/openkinect/8Aa8ab3aAs4

Special thanks to the people in the OpenKinect project!!!

Hiromasa YOSHIMOTO
