import sys
from configs import get_config
import textwrap

def block(args: list) -> None:
    nw_corner = ''
    ne_corner = ''
    sw_corner = ''
    se_corner = ''
    w_edge = 'X'
    e_edge = 'X'
    n_edge = 'X'
    s_edge = 'X'
    message = ''
    block_width = get_config('width')
    skip_arg = False

    for i in range(len(args)):
        if skip_arg:
            skip_arg = False
            continue

        match args[i]:
            case '--corners':
                nw_corner = args[i + 1]
                ne_corner = args[i + 1]
                sw_corner = args[i + 1]
                se_corner = args[i + 1]
                skip_arg = True
            case '--nw-corner':
                nw_corner = args[i + 1]
                skip_arg = True
            case '--ne-corner':
                ne_corner = args[i + 1]
                skip_arg = True
            case '--sw-corner':
                sw_corner = args[i + 1]
                skip_arg = True
            case '--se-corner':
                se_corner = args[i + 1]
                skip_arg = True
            case '--v-edges':
                w_edge = args[i + 1]
                e_edge = args[i + 1]
                skip_arg = True
            case '--w-edge':
                w_edge = args[i + 1]
                skip_arg = True
            case '--e-edge':
                e_edge = args[i + 1]
                skip_arg = True
            case '--h-edges':
                n_edge = args[i + 1]
                s_edge = args[i + 1]
                skip_arg = True
            case '--n-edge':
                n_edge = args[i + 1]
                skip_arg = True
            case '--s-edge':
                s_edge = args[i + 1]
                skip_arg = True
            case '--width':
                block_width = int(args[i + 1])
                skip_arg = True
            case other:
                message = args[i]

    #-------------------------------- Process Input --------------------------------#
    # Rectify corners
    nw_corner = w_edge if not nw_corner else nw_corner
    ne_corner = e_edge if not ne_corner else ne_corner
    sw_corner = w_edge if not sw_corner else sw_corner
    se_corner = e_edge if not se_corner else se_corner
    n_corner_lengths = len(nw_corner) + len(ne_corner)
    s_corner_lengths = len(sw_corner) + len(se_corner)

    # Rectify edges
    w_edge = w_edge + " "
    e_edge = " " + e_edge
    edge_lengths = len(w_edge) + len(e_edge)

    # Wrap message
    message = textwrap.wrap(message, width = block_width - edge_lengths, break_long_words = True) # TODO: Need to wrap ASCII fonts

    #--------------------------------- Print Block ---------------------------------#
    print(nw_corner + n_edge * (block_width - n_corner_lengths) + ne_corner)
    print(w_edge + ' ' * (block_width - edge_lengths) + e_edge)

    for line in message:
        print(w_edge + line.center(block_width - edge_lengths) + e_edge)

    print(w_edge + ' ' * (block_width - edge_lengths) + e_edge)
    print(sw_corner + s_edge * (block_width - s_corner_lengths) + se_corner)

block(sys.argv[1:])