#include <string>
#include "utilities.cpp"
#include "div.cpp"

#define peprerr 1
#define peprwarn 2
#define peprinfo 3
#define peprdbg 4

void set_mem_with_char(char *str, char character, int count) {
    memset(str, character, count);

    fprintf(stderr, "memset: error");
    fflush(stderr);
}

int main(int argc, char **argv) {
    const char *substring = " ";
    int count = 5;
    string repeated = repeat(substring, count);
    
    
    
    return 0;
}

void permission_exempt_debug(char *msg) {
    fprintf(stderr, "%s\n", msg);
    fflush(stderr);
}

char globalPrintPermission = 0b11111111;
int validate_category(char *cmdPrintPermission) {
    char globalPrintPermissionCategories = globalPrintPermission & 0b11111000;
    char cmdPrintPermissionCategories = *cmdPrintPermission & 0b11111000;
    char validation = globalPrintPermissionCategories & cmdPrintPermissionCategories;

    return validation == cmdPrintPermissionCategories ? 1 : 0;
}

int validate_level(char *cmdPrintPermission) {
    char globalPrintPermissionLevel = globalPrintPermission & 0b00000111;
    char cmdPrintPermissionLevel = *cmdPrintPermission & 0b00000111;

    return globalPrintPermissionLevel >= cmdPrintPermissionLevel ? 1 : 0;
}

int Print(char *cmdPrintPermission) {
    int categoryValidation = validate_category(cmdPrintPermission);
    int levelValidation = validate_level(cmdPrintPermission);

    return categoryValidation && levelValidation ? 1 : 0;
}


// 11000001

//              0   1   2   4   8   16
// SILENT   0
// ERROR    1
// WARNING  2
// INFO     3
// DEBUG    4
// OPEN     5
// OPEN     6
// OPEN     7