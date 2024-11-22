# Minio Sync Images
Function_Check "mc-mirror"
function mc-mirror {
    pushd ~/;
    mc mirror ~/Images/ minio;
    popd;
}

# Minio Copy Images
Function_Check "mc-cp"
function mc-cp {
    pushd ~/;
    mc cp --recursive minio ~/Images/;
    popd;
}
