md() {
    mkdir -p $1
}

mcd() {
    mkdir -p $1 && cd $1
}

getBandCampMusic() {
  cd ~/Music/
  elinks --dump --no-numbering https://$1.bandcamp.com/ | 
  grep -e '.com/album' -e '.com/track' | 
  sed 's/.*https/https/g' |
  uniq > links.txt
  youtube-dl -o $1" - %(playlist)s/%(playlist_index)s. %(title)s.%(ext)s" -a links.txt
  rm links.txt
}
