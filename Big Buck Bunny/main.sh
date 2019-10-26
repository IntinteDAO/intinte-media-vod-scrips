#!/bin/bash

# Thumbnail
ffmpeg -i input.mp4 -vf scale=700:400 -ss 00:00:03.000 -vframes 1 thumb.png

# Low Quality
ffmpeg -y -i input.mp4 -c:v libvpx -r 30 -b:v 0 -crf 21 -pass 1 -an -f webm /dev/null
ffmpeg -y -i input.mp4 -c:v libvpx -r 30 -b:v 0 -crf 27 -vf scale=320:240 -pass 2 -c:a libvorbis 240p.webm
ffmpeg -y -i input.mp4 -c:v libvpx -r 30 -b:v 0 -crf 25 -vf scale=480:360 -pass 2 -c:a libvorbis 360p.webm
ffmpeg -y -i input.mp4 -c:v libvpx -r 30 -b:v 0 -crf 23 -vf scale=640:480 -pass 2 -c:a libvorbis 480p.webm
ffmpeg -y -i input.mp4 -c:v libvpx -r 30 -b:v 0 -crf 21 -vf scale=720:576 -pass 2 -c:a libvorbis 576p.webm
rm ffmpeg2pass-0.log

# High Quality
ffmpeg -y -i input.mp4 -c:v libvpx-vp9 -b:v 0 -crf 15 -pass 1 -an -f webm /dev/null
ffmpeg -y -i input.mp4 -c:v libvpx-vp9 -b:v 0 -crf 19 -vf scale=1280:720 -pass 2 -c:a libvorbis 720p.webm
ffmpeg -y -i input.mp4 -c:v libvpx-vp9 -b:v 0 -crf 17 -vf scale=1920:1080 -pass 2 -c:a libvorbis 1080p.webm
ffmpeg -y -i input.mp4 -c:v libvpx-vp9 -b:v 0 -crf 15 -vf scale=3840:2160 -pass 2 -c:a libvorbis 2160p.webm
rm ffmpeg2pass-0.log