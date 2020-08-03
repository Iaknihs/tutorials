# Setup

- install compatible python version (3.5.6 was used here, but others are likely compatible)
- install all requirements `pip install -r requirements.txt`
- build .exe from python source `pyinstaller --onefile ctrlaltdel.py`
- copy the generated file `/dist/ctrlaltdel.exe` into the godot resource folder
- build / run the godot project (on build, make sure to include `*.exe` files)

Executable: https://github.com/Iaknihs/tutorials/releases/tag/1

## Note:
This process does not always close the python listener when the godot
application is closed, and doesn't remove the copy of the ctrlaltdel.exe
automatically. With some cleanup those features wouldn't be too hard to add.

[Here is the itch.io page of the ~great~ game I made this for.](https://iakdev.itch.io/i-couldnt-use-real-ads-so-i-self-advertised-instead)
