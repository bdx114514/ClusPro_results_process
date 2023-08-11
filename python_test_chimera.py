import os
from chimera import runCommand as rc # use 'rc' as shorthand for runCommand
from chimera import replyobj # for emitting status messages

# change to folder with data files

# gather the names of .pdb files in the folder
fn="model.000.00.pdb"

# loop through the files, opening, processing, and closing each in turn
for i in range(10):
	a = "model.000.0"
	c = ".pdb"
	fn =  a + str(i) + c
	replyobj.status("Processing " + fn) # show what file we're working on
	rc("open " + fn)
	rc("sel :.A")
	rc("hbond spec :.A intramol false intrares fall log true batch true savefile honds"+str(i))
	rc("findclash :.A test other overlapcutoff -0.4 hbondallowance 0.0 log true savefile contacs"+str(i))
	rc("close all")
# uncommenting the line below will cause Chimera to exit when the script is done
#rc("stop now")
# note that indentation is significant in Python; the fact that
# the above command is exdented means that it is executed after
# the loop completes, whereas the indented commands that 
# preceded it are executed as part of the loop.
