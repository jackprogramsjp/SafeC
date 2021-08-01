#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "utils.h"

void
memory_failure_exit (void) {
    fputs("fatal error: OUT OF MEMORY", stderr);
    fflush(stderr);
    abort();
}

char *
safec_strdup (const char *s) {
    char *str = malloc(sizeof(*str) * (strlen(s) + 1));

    if (str == NULL) {
        memory_failure_exit();
    }

    strcpy(str, s);

    return str;
}
