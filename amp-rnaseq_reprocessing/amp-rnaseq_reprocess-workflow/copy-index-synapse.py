#! /usr/bin/env python

import os

import synapseclient
from synapseclient import File

syn = synapseclient.Synapse()
syn.login()

dirname = 'out'
files = os.listdir(dirname)

project = 'syn19985744'
path_prefix = os.getcwd()
for filename in files:
	path = '{}/{}/{}'.format(path_prefix, dirname, filename)
	print(path)
	f = File(path=path, parent=project)
	syn.store(f)


# delete all children of a synapse id

# project = 'syn19985744'
# for child in syn.getChildren(project):
#   synid = child.get('id')
#   print('deleting {}'.format(synid))
#   print(syn.delete(synid))
