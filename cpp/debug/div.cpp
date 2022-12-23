#include <string>
#include "Div.h"

int validateMainArgs(const int expectedArgc, const string scriptName) {

}

int main(int argc, char **argv) {
    const int EXPECTED_ARGC = 13;
    
    if (argc != EXPECTED_ARGC) {
        fprintf(stderr, "div: expected %d args. Received %d args", EXPECTED_ARGC, argc);
    }
    
    Div *div = new Div( atoi(argv[0]),
                        argv[1],
                        argv[2],
                        argv[3],
                        atoi(argv[4]),
                        argv[5],
                        atoi(argv[6]),
                        argv[0],
                        argv[7],
                        argv[8],
                        atoi(argv[9]),
                        atoi(argv[10]),
                        atoi(argv[11]));
    
    div->to_string();

    return 0;
}