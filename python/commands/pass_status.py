import sys
from status import status

def pass_status(args: list) -> None:
    args = ['PASS'] + args

    for i in range(len(args)):
        match args[i]:
            case '-c' | '--color':
                args.remove(args[i])
                args.append('--color')
                args.append('green')
                break
    
    status(args)

pass_status(sys.argv[1:])