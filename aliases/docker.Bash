# Flush Docker Logs
Function_Check "docker-log-flush"
function docker-log-flush {
    truncate -s 0 $(docker inspect --format='{{.LogPath}}' ${1})
}
