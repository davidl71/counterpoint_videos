#!/bin/bash
rm -f test.mp4
INPUT_PREFIX=$(echo "$1" | cut -d "." -f 1) 
echo "$INPUT_PREFIX"

mkdir "$INPUT_PREFIX".tmp
pushd "$INPUT_PREFIX".tmp

#Compile png images
lilypond -fpng ../fifth_species_fourb_1_voices_jfux_cf_tenor.ly 

#For each page generate a video
for i in fifth_species_fourb_1_voices_jfux_cf_tenor-page*.png
do
        OUTPUT_FILE_NAME="$(echo "$i" | cut -d "." -f 1).avi"
        echo "Processing $i $OUTPUT_FILE_NAME"
        ffmpeg -y -loop 1 -t 12 -i "$i" -c:v libx264 -t 30 -pix_fmt yuv420p "$OUTPUT_FILE_NAME"
        #Add video to list of concatenate
        echo "file $OUTPUT_FILE_NAME" >> "$INPUT_PREFIX".txt
done

NOSOUND_VIDEO="$INPUT_PREFIX"-nosound.avi

#Concatenate videos
ffmpeg -f concat -i "$INPUT_PREFIX".txt "$NOSOUND_VIDEO"

WAV_OUTPUT="$INPUT_PREFIX".wav

#Convert midi to audio
timidity --output-stereo --output-16bit -Ow -o "$WAV_OUTPUT" "$INPUT_PREFIX".midi
#Add audio
ffmpeg -i "$NOSOUND_VIDEO" -i "$WAV_OUTPUT" "$INPUT_PREFIX".avi

mv "$INPUT_PREFIX".avi ../
popd
rm -rf "$INPUT_PREFIX".tmp
