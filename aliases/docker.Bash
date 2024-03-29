
# https://stackoverflow.com/questions/42510002/docker-how-to-clear-the-logs-properly-for-a-docker-container
# Flush Docker Logs
Function_Check "docker-log-flush"
function docker-log-flush {
    truncate -s 0 $(docker inspect --format='{{.LogPath}}' ${1})
}
