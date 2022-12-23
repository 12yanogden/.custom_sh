#include <filesystem>
#include <iostream>
#include <unistd.h>
#include <string>
#include <cstdarg>
using namespace std;

#define FILE_NAMES_SIZE 102400
#define IS_DEBUG 1

void print_bytes(unsigned char *bytes, int byteslen) {
	int i, j, byteslen_adjusted;

	if (byteslen % 8) {
		byteslen_adjusted = ((byteslen / 8) + 1) * 8;
	} else {
		byteslen_adjusted = byteslen;
	}

	for (i = 0; i < byteslen_adjusted + 1; i++) {
		if (!(i % 8)) {
			if (i > 0) {
				for (j = i - 8; j < i; j++) {
					if (j >= byteslen_adjusted) {
						fprintf(stderr, "  ");

					} else if (j >= byteslen) {
						fprintf(stderr, "  ");

					} else if (bytes[j] >= '!' && bytes[j] <= '~') {
						fprintf(stderr, " %c", bytes[j]);

					} else {
						fprintf(stderr, " .");
					}
				}
			}

			if (i < byteslen_adjusted) {
                if (i > 0) {
                    fprintf(stderr, "\n");
                }

				fprintf(stderr, "\t%02X: ", i);
			}
		} else if (!(i % 4)) {
			fprintf(stderr, " ");
		}

		if (i >= byteslen_adjusted) {
			continue;

		} else if (i >= byteslen) {
			fprintf(stderr, "   ");

		} else {
			fprintf(stderr, "%02X ", bytes[i]);
		}
	}

	fprintf(stderr, "\n");
}

void pbDebug(string name, unsigned char *bytes, int byteslen) {
    if (IS_DEBUG) {
        fprintf(stderr, "%s [\n", name.c_str());
        print_bytes(bytes, byteslen);
        fprintf(stderr, "]\n");
        fflush(stderr);
    }
}

void debug(const char* msg) {
    if (IS_DEBUG) {
        fprintf(stderr, "%s\n", msg);
        fflush(stderr);
    }
}

void iDebug(string name, int value) {
    if (IS_DEBUG) {
        fprintf(stderr, "%s: %d\n", name.c_str(), value);
        fflush(stderr);
    }
}

int read_buffer(int fd, char *buffer, int bufferSize) {
    int sumRead = 0;
    int continueRead = 1;

    printf("2\n");

    do {
        int readCount = read(fd, &buffer[sumRead], bufferSize);
        
        printf("3\n");

        if (readCount > 0) {
            sumRead += readCount;

        } else if (readCount == 0) {
            continueRead = 0;

        } else {
            fprintf(stderr, "read_buffer: error(%d): %s\n", errno, strerror(errno));
            fflush(stderr);
            pbDebug("buffer", (unsigned char *)buffer, sumRead);
            iDebug("sumRead", sumRead);
        }

    } while (continueRead == 1);

    printf("4\n");

    return sumRead;
}

int main() {
    char *fileNames[FILE_NAMES_SIZE];
    string command = "find /Users/ryan/Downloads";
    
    // Get non-archive files
    system(command.c_str());

    // Compress files

    // Get archive files

    // Delete archive files more than 8+ weeks old

    printf("1\n");
    read_buffer(fileno(stdout), *fileNames, FILE_NAMES_SIZE);

    

    return 0;
}