from os import getenv
from os.path import exists, join

def which(exe):
    for dir in getenv("PATH").split(":"):
        if exists(join(dir, exe)):
            print("Exe file exists")
            break

which("bash")

