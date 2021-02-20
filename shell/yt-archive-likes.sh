#!/bin/bash
WORK_DIR='/mnt/storage/root/videos/youtube'
youtube-dl --playlist-reverse --download-archive $WORK_DIR/liked_videos/downloaded.txt --cookies $WORK_DIR/youtube.txt -i --sleep-interval 5 --max-sleep-interval 30 -o "$WORK_DIR/liked_videos/%(playlist_index)s - %(title)s [%(id)s]/%(playlist_index)s - %(title)s [%(id)s].%(ext)s" -f bestvideo[ext=mp4]+bestaudio[ext=m4a] --merge-output-format mp4 --add-metadata --write-description --write-info-json --write-annotations --write-thumbnail https://www.youtube.com/playlist?list=LL
