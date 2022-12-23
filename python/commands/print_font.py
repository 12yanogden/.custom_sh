import sys
import os
from FontChar import FontChar
from Font import Font

def validate_msg(msg):
    unrecognized_char = in_alphabet(msg, lines, alphabet_begin_line)

    if unrecognized_char != '':
        raise Exception("unrecognized character: " + unrecognized_char)

# ----------------------------------------------------------------------------- #
#                                                                               #
#                                  Main Helpers                                 #
#                                                                               #
# ----------------------------------------------------------------------------- #
def calc_alphabet_begin(lines):
    for i in range(len(lines)):
        if lines[i] == ' \n':
            return i

def get_file(font_name):
    parent_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    
    return open(parent_dir + "/fonts/" + font_name + ".txt", "r")

# ----------------------------------------------------------------------------- #
#                                                                               #
#                                      Main                                     #
#                                                                               #
# ----------------------------------------------------------------------------- #
def print_font(argv):
    font_name = argv[0]
    msg = argv[1]
    font = Font(get_file(font_name))
    configs = font.get_configs()
    font_chars = []

    # Accomodate case sensitivity
    if not configs.get("case_sensitive"):
        msg = msg.lower()

    # Validate message
    is_valid_msg = font.contains(msg)

    if is_valid_msg != True:
        raise Exception("unrecognized character: " + is_valid_msg)
    
    # Get font chars
    for char in msg:
        font_chars.append(font.get(char))
    
    tallest_char = max(font_chars, key=lambda font_char: font_char.height)

    # Print font chars
    for i in range(tallest_char.height):
        for font_char in font_chars:
            print(font_char.get_line(i), end="")

        print("\n", end="")

print_font(sys.argv[1:])

