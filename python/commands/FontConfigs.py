class FontConfigs:
    def __init__(self, lines):
        self.config = {}

    def get(self, key):
        return config[key]

    def calc_config_indexes(lines):
        begin_index = -1
        end_index = -1

        for i in range(len(lines)):
            if "Font Configs" in lines[i] :
                begin_index = i + 4
                break
        
        for i in range(begin_index, len(lines)):
            if "End of Font Configs" in lines[i]:
                end_index = i - 1
                break

        return begin_index, end_index

    def isbool(string):
        isbool = False

        string = string.lower()

        if string == "t" or \
            string == "f" or \
            string == "true" or \
            string == "false":
            isbool = True
        
        return isbool

    def to_bool(string):
        string = string.lower()
        bool = False

        if string == "t" or string == "true":
            bool = True
        elif string != "f" and string != "false":
            raise Exception("unrecognized boolean string: '" + string + "'")

        return bool        

    def get_configs(lines):
        begin_index, end_index = calc_config_indexes(lines)
        configs = {}
            
        for i in range(begin_index, end_index):
            line = lines[i]
            config = line.split(":")

            config[1] = config[1].strip()

            if config[1].isnumeric():
                config[1] = int(config[1])
            elif isbool(config[1]):
                config[1] = to_bool(config[1])

            configs[config[0]] = config[1]
        
        return configs