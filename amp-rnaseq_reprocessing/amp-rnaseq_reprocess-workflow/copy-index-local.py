#! /usr/bin/env python

import boto3
import os

region = 'us-east-1'
client = boto3.client('s3', region_name=region)
bucket_name = 'rna-seq-reprocessing-scicomp-toil-cluster-v001-out'
response = client.list_objects_v2(
        Bucket = bucket_name
)

keys = [item.get('Key') for item in response.get('Contents')]

dirname = 'indexing-output'
os.mkdir(dirname)

for key in keys:
        filename = '{}/{}'.format(dirname, key)
        client.download_file(bucket_name, key, filename)

