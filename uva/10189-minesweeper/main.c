#include <stdio.h>
#include <stdlib.h>

#define LINE_MAX 102

int main(int argc, const char *argv[])
{
    int c=0, cols=0, lines=0;

    while(1) {
        char *line = malloc(sizeof(char)*LINE_MAX);

        /* increment curr field being processed */
        c++;

        fgets(line, LINE_MAX, stdin);
        sscanf(line, "%d %d", &lines, &cols);

        /* end program if indicated */
        if(lines==0 && cols==0) {
            free(line);
            break;
        }

        /* print line after fieldset if program continues */
        if(c>1) printf("\n");

        int **grid, g_i, g_j, i, j;

        /* initialize grid */
        grid = malloc(sizeof(int **)*lines);
        for(i=0; i<lines; i++)
            grid[i] = calloc(cols, sizeof(int *));

        /* grab lines and tally grid */
        for(i=0; i<lines; i++) {
            fgets(line, LINE_MAX, stdin);

            for(j=0; j<cols; j++) {

                if(line[j]=='*') {
                    for(g_i=-1; g_i<2; g_i++) {
                        for(g_j=-1; g_j<2; g_j++) {
                            if( i+g_i<0 
                                || i+g_i>lines-1 
                                || j+g_j<0 
                                || j+g_j>cols-1 ) 
                                continue;

                            if(g_i==0 && g_j==0)
                                grid[i+g_i][j+g_j] = -1;
                            else if(grid[i+g_i][j+g_j] != -1)
                                grid[i+g_i][j+g_j]++;
                        }
                    }
                }
            }
        }

        /* print out result */
        printf("Field #%d:\n", c);
        for(i=0; i<lines; ++i) {
            for(j=0; j<cols; ++j) {
                if(grid[i][j]==-1)
                    printf("*");
                else
                    printf("%d", grid[i][j]);
            }
            printf("\n");
        }

        /* free allocated memory */
        free(line);
        for(i=0; i<lines; i++) free(grid[i]);
        free(grid);
    }

    return 0;
}
