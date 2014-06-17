docker image for makerware desktop so we can run it in arch linux

!! not running yet :( !!

make sure current user is in docker group

docker pull ubuntu:13.10
cd /path/to/subuser/programsThatCanBeInstalled/
ln -s /path/to/makerware-docker makerware
subuser install makerware

-----------------------------------------------------------------

Bugs:
OPEN:
[gryphius@boscos subuser]$ makerware
Warning: '--networking' is deprecated, it will be removed soon. See usage.
libGL error: failed to load driver: swrast
libGL error: Try again with LIBGL_DEBUG=verbose for more details.
Segmentation fault (core dumped)



CLOSED
###########
makerware
Traceback (most recent call last):
  File "/work/subuser/logic/subuserCommands/install", line 27, in <module>
    subuserlib.install.installProgramAndDependencies(program, options.useCache)
  File "/work/subuser/logic/subuserCommands/subuserlib/install.py", line 99, in installProgramAndDependencies
    if dockerImages.isProgramsImageInstalled(programName):
  File "/work/subuser/logic/subuserCommands/subuserlib/dockerImages.py", line 29, in isProgramsImageInstalled
    return not (getImageID("subuser-"+program) == None)
  File "/work/subuser/logic/subuserCommands/subuserlib/dockerImages.py", line 44, in getImageID
    return imageInfo["id"]
KeyError: 'id'

=>  fixed by using "Id" instead of "id" in getImageID
=> now fixed in upstream, obsolete

##############

Traceback (most recent call last):
  File "/work/subuser/logic/subuserCommands/run", line 30, in <module>
    subuserlib.run.runProgram(programName,getArgsToPassToProgram())
  File "/work/subuser/logic/subuserCommands/subuserlib/run.py", line 163, in runProgram
    if subuserlib.update.needsUpdate(programName):
  File "/work/subuser/logic/subuserCommands/subuserlib/update.py", line 79, in needsUpdate
    if not permissions.getLastUpdateTime(myPermissions) == _registry[programToCheck]["last-update-time"] and not permissions.getLastUpdateTime(myPermissions) == None:
KeyError: 'makerware'

=> fixed by uninstalling and reinstalling makerware

