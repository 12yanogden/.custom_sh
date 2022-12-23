from FontChar import FontChar
import os
import re

class Font:
    def __init__(self, file):
        self.lines = file.readlines()
        self.alphabet = self.get_alphabet()
    
    def read_lines(font_name):
        parent_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
        file = open(parent_dir + "/fonts/" + font_name + ".txt", "r")
        return file.readlines() 

    def get_alphabet(self):
        alphabet = []

        for line in self.lines:
            if re.search("^.\n$", line) is not None:
                alphabet.append(line[:-1])
        
        return alphabet

    def get(self, char):
        font_char = FontChar()
        found_char = False

        for i in range(len(self.lines)):
            if self.lines[i] == (char + '\n'):
                found_char = True
                continue

            if found_char:
                if self.lines[i] == '\n':
                    break

                font_char.append_line(self.lines[i][:-1])
            
        return font_char

    def contains(self, str):
        out = True

        for char in str:
            if char not in self.alphabet:
                out = char
                break
        
        return out