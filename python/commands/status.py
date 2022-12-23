import sys
from configs import get_config
from termcolor import colored

def status(args: list) -> None:
    status = args[0] if len(args) > 0 else 'NO STATUS'
    message = 'No message provided'
    color = ''
    width = get_config('width')
    skip_arg = False

    for i in range(1, len(args)):
        if skip_arg:
            skip_arg = False
            continue

        match args[i]:
            case '--color':
                color = args[i + 1]
                skip_arg = True
            case '--width':
                width = int(args[i + 1])
                skip_arg = True
            case other:
                message = args[i]

    status = '[ ' + (colored(status, color) if color else status) + ' ]'
    print(message + ' ' * (width - (len(message) + (len(status) - 9 if color else len(status)))) + status)