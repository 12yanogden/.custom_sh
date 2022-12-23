import sys
from configs import get_config

def ceil_div(a: int, b: int) -> int:
    return -(a // -b)

def div(args: list) -> None:
    arms = '-'
    left_edge = ''
    right_edge = ''
    message = ''
    width = get_config('width')
    left_arm_length = 0
    right_arm_length = 0
    skip_arg = False

    for i in range(len(args)):
        if skip_arg:
            skip_arg = False
            continue

        match args[i]:
            case '--edges':
                left_edge = args[i + 1]
                right_edge = args[i + 1]
                skip_arg = True
            case '--left-edge':
                left_edge = args[i + 1]
                skip_arg = True
            case '--right-edge':
                right_edge = args[i + 1]
                skip_arg = True
            case '--arms':
                arms = args[i + 1]
                skip_arg = True
            case '--width':
                width = int(args[i + 1])
                skip_arg = True
            case other:
                message = args[i]

    message = ' ' + message +  ' ' if message else message
    left_arm_length = (width - len(left_edge) - len(right_edge) - len(message)) // 2
    right_arm_length = ceil_div(width - len(left_edge) - len(right_edge) - len(message), 2)

    print(left_edge + arms * left_arm_length + message + arms * right_arm_length + right_edge)

div(sys.argv[1:])
