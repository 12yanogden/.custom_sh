#include <string>
#include <unistd.h>
#include <iostream>
using namespace std;

#define STDIN_FILENO fileno(stdin)
#define STDOUT_FILENO fileno(stdout)
#define STDERR_FILENO fileno(stderr)

char* shell(char* cmd, char* arg, ...){
	int buff_size = 32;
    char* buffer[buff_size];
	
	char* ret = NULL;
	string str = "";
	
    int fd[2];
    int old_fd[3];
    pipe(fd);
	
	
	old_fd[0] = dup(STDIN_FILENO);
	old_fd[1] = dup(STDOUT_FILENO);
	old_fd[2] = dup(STDERR_FILENO);
	
	int pid = fork();
	switch(pid){
		case 0:
			close(fd[0]);
			close(STDOUT_FILENO);
			close(STDERR_FILENO);
			dup2(fd[1], STDOUT_FILENO);
			dup2(fd[1], STDERR_FILENO);
			system(cmd);
			//execlp((const char*)cmd, cmd,0);
			close (fd[1]);
			exit(0);
			break;
		case -1:
			cerr << "GetSystemOutput/fork() error\n" << endl;
			exit(1);
		default:
			close(fd[1]);
			dup2(fd[0], STDIN_FILENO);
			
			int rc = 1;
			while (rc > 0){
				rc = read(fd[0], buffer, buff_size);
				str.append(buffer, rc);
				//memset(buff, 0, buff_size);
			}
			
			ret = new_char(strlen((char*)str.c_str()));
			
			strcpy(ret, (char*)str.c_str());
			
			waitpid(pid, NULL, 0);
			close(fd[0]);
	}
	
	dup2(STDIN_FILENO, old_fd[0]);
	dup2(STDOUT_FILENO, old_fd[1]);
	dup2(STDERR_FILENO, old_fd[2]);
	
    return ret;
}

main(int argc, char **argv) {
    
}