
import os
from imploder import *

startupfile_local = 'pyload.py'
if os.path.lexists(startupfile_local):
    with open(startupfile_local) as f:
        code = compile(f.read(), startupfile_local, 'exec')
        exec(code)
    #execfile(startupfile_local, globals(), locals())



