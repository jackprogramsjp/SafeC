#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "info.h"

const char *
usage (void) {
    return "usage: " SCC_SHORT_NAME " [file] [-v | --version]\n";
}

void
print_usage (void) {
    fputs(usage(), stderr);
}

const char *
version (void) {
    return SCC_NAME " " SCC_VERSION "\n" SCC_DESCRIPTION "\n";
}

int main(int argc, char **argv) {
    FILE *fp;
    const char *argument;

    if (argc != 2) {
        print_usage();
        return EXIT_FAILURE;
    }

    argument = argv[1];

    if (strcmp(argument, "-v") == 0 || strcmp(argument, "--version") == 0) {
        fputs(version(), stdout);
        return EXIT_SUCCESS;
    }

    if (argument[0] == '-') {
        fprintf(stderr, "Unknown flag '%s'\n\n%s", argument, usage());
        return EXIT_FAILURE;
    }

    

    return EXIT_SUCCESS;
}
