# crash_gcp

Test case for crashing google cloud using Snakemake

1. Create a bucket
2. run ```snakemake  --google-lifesciences --default-remote-prefix MY_BUCKET_NAME_HERE --preemption-default 10 --use-conda -r --jobs 100 -np```
