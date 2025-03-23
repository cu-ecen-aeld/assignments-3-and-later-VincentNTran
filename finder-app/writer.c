#include <stdio.h>
#include <syslog.h>
#include <string.h>

int main (int argc, char* argv[]) {
    if (argc != 3) {
        printf("Error: Invalid Number of Arguments.\n");
	printf("Total number of arguments should be 2.\n");
	printf("Arguments Received %d\n", argc);
	printf("The order of arguments should be:\n");
	printf("    1) Full path to a file\n");
	printf("    2) Text string to be written\n");

        syslog(LOG_ERR, "Error: Invalid Number of Arguments.\n");
	syslog(LOG_ERR, "Total number of arguments should be 2.\n");
	syslog(LOG_ERR, "Arguments Received %d\n", argc);
	syslog(LOG_ERR, "The order of arguments should be:\n");
	syslog(LOG_ERR, "    1) Full path to a file\n");
	syslog(LOG_ERR, "    2) Text string to be written\n");
	return 1;
    }

    char* path_to_file = argv[1];
    char* string_to_write = argv[2];
    int length = strlen(string_to_write);

    FILE *file = fopen(path_to_file, "w");
    if (file == NULL) {
        syslog(LOG_ERR, "Error opening file.\n");
	return 1;
    }

    printf("Writing %s to file %s\n", string_to_write, path_to_file);
    syslog(LOG_DEBUG, "Writing %s to file %s\n", string_to_write, path_to_file);

    int count = fwrite(string_to_write, sizeof(char), length, file); 
    if (count != length){
	syslog(LOG_ERR, "Error written to file");
	return 1;
    }

    fclose(file);
}
