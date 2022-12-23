import sys
from status import status

def fail_status(args: list) -> None:
    args = ['FAILED'] + args

    for i in range(len(args)):
        match args[i]:
            case '-c' | '--color':
                args.remove(args[i])
                args.append('--color')
                args.append('red')
                break
            
    status(args)

fail_status(sys.argv[1:])