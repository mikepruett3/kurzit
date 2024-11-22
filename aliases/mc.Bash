# Minio Sync Images
Function_Check "mc-mirror"
function mc-mirror {
    pushd ~/;
    mc mirror ~/Images/ minio;
    popd;
}
