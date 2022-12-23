class FontChar:
    def __init__(self, lines = [], height = 0, width = 0):
        self.lines = lines
        self.height = height
        self.width = width
    
    def append_line(self, line):
        self.lines.append(line)
        self.height += 1

    def calc_width(self):
        self.width = max([len(line) for line in self.lines])

    def get_line(self, index):
        line = None

        if index > self.height:
            line = " " * self.width
        else:
            line = self.lines[index]
        
        return line
