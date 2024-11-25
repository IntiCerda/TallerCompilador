# Taller Compilador

## Descripción

Este proyecto es un compilador simple que utiliza Flex para el análisis léxico y Bison para el análisis sintáctico. Permite procesar un archivo de entrada y generar salidas correspondientes.

## Archivos del Proyecto

- **`lexer.l`**: Archivo de definición para el analizador léxico, que especifica las reglas de tokenización.
- **`parser.y`**: Archivo de definición para el analizador sintáctico, que define la gramática del lenguaje.
- **`main.cpp`**: Archivo principal que contiene la lógica del programa y la interacción con el analizador.
- **`input.ps`**: Archivo de entrada utilizado para pruebas y ejemplos.
- **`README.md`**: Documento que explica cómo compilar y ejecutar el proyecto.

## Comandos para Compilar

Para compilar el proyecto, sigue estos pasos:

1. Ejecutar Flex para el analizador léxico:
   ```bash
   flex lexer.l

2. bison -dv parser.y

3. gcc -o TallerCompilador lex.yy.c parser.tab.c main.cpp