#!/usr/bin/env python

import os
pwd = os.getcwd()
homedir = os.path.expanduser('~')
pwd = pwd.replace(homedir, '~', 1)
if len(pwd) > 30:
    pwd = '...'+pwd[-30:]
print(pwd)



