#! /usr/bin/env python

import os

import synapseclient
from synapseclient import File

syn = synapseclient.Synapse()
syn.login()

dirname = 'indexing-output'
files = os.listdir(dirname)

# Add a local file to an existing project (syn12345) on Synapse
project = 'syn20645801'
path_prefix = os.getcwd()
for filename in files:
	path = '{}/{}/{}'.format(path_prefix, dirname, filename)
	print(path)
	f = File(path=path, parent=project)
	syn.store(f)

