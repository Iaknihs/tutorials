# made with python 3.5.6
# likely compatible with later and some earlier python versions

from pynput.keyboard import Key, Listener
import sys

ctrl_down = alt_down = del_down = False

folder = sys.argv[-1]  # last (and only) argument


def on_press(key):
    global ctrl_down, alt_down, del_down

    if key in [Key.ctrl, Key.ctrl_l, Key.ctrl_r]:
        ctrl_down = True
    if key in [Key.alt, Key.alt_l, Key.alt_r]:
        alt_down = True
    if key == Key.delete:
        del_down = True
    if ctrl_down and alt_down and del_down:
        ctrl_down = del_down = alt_down = False
        try:
            with open(folder + "/ctrlaltdel.dat", "w") as f:
                f.write("gg")
        except:
            pass


def on_release(key):
    global ctrl_down, alt_down, del_down
    if key in [Key.ctrl, Key.ctrl_l, Key.ctrl_r]:
        ctrl_down = False
    if key in [Key.alt, Key.alt_l, Key.alt_r]:
        alt_down = False
    if key == Key.delete:
        del_down = False


with Listener(on_press=on_press, on_release=on_release) as listener:
    listener.join()

