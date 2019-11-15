alias subs=subs

function subs() {
    movie="${1}"
    filename="${1%.*}"
    mappings=`ffprobe -loglevel error -select_streams s -show_entries stream=index:stream_tags=language -of csv=p=0 "${movie}"`
    OLDIFS=$IFS
    IFS=,
    ( while read idx lang
    do
        echo "Extracting ${lang} subtitle #${idx} from ${movie}"
        ffmpeg -nostdin -hide_banner -loglevel quiet -i "${movie}" -map 0:"$idx" subs/"${lang}.vtt"
    done <<< "${mappings}" )
    IFS=$OLDIFS
}

mkdir subs
subs input.mkv