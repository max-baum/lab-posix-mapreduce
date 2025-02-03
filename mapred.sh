#!/bin/sh


for file in /data/Twitter\ dataset/geoTwitter20-01-0*.zip; do
unzip -p "$file" \
| jq '.["place"]["country_code"]' \
| sort \
| uniq -c \
| sort -n \
> map.$(basename "$file").dat &
done

cat map.geoTwitter20-01-01.zip.dat | while read line; do
    country_code=$(echo "$line" | sed 's/[^a-zA-Z"]//g')
    counts=$(cat map.* | grep "$country_code" | sed 's/[^0-9]//g')
    sum=$(echo $counts | sed 's/ /+/g' | bc)
    echo "$sum" "$country_code"
done | sort -n > reduce


