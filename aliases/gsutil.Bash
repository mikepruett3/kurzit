# Get Total Google Cloud Storage, by Bucket
Function_Check "gdu"
function gdu {
    gcloud storage du --summarize --readable-sizes --total
}

Function_Check "gls"
function gls {
    gsutil ls gs://${1}
}

Function_Check "grma"
function grma {
    gsutil -m rm -a gs://${1}/**
}

Function_Check "gdesc"
function gdesc {
    gcloud storage buckets describe gs://${1}
}
