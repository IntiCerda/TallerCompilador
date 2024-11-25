#include <stdio.h>
#include <stdlib.h>
#include "parser.tab.h"

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            perror("Error al abrir el archivo");
            return EXIT_FAILURE;
        }
        yyin = file; 
    }
    yyparse(); 
    return 0;
}