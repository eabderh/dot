#!/usr/bin/env python

import os
pwd = os.getcwd()
homedir = os.path.expanduser('~')
pwd = pwd.replace(homedir, '~', 1)
maxlen = 40
if len(pwd) > maxlen:
    pwd = '...'+pwd[-maxlen:]
print(pwd)



