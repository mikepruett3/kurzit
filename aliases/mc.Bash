# Minio Sync Images
Function_Check "mc-mirror"
function mc-mirror {
    pushd ~/;
    mc.exe mirror ~/Images/ minio;
    popd;
}
