#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char const *argv[])
{
    char cents[100], line[100];
    int *amts, avg=0, i, s, total=0, xchg=0;

    while(1) {
        scanf("%d", &s);

        if(s==0) break;

        int *amts = malloc(sizeof(int)*s);

        for(i=0; i<s; ++i) {
            scanf("%s", line);

            memset(cents, 0, sizeof cents);
            strcat(cents, strtok(line, "."));
            strcat(cents, strtok(NULL, "."));

            amts[i] = strtol(cents, NULL, 10);

            total += amts[i];
        }

        avg = total / s;

        for(i=0; i<s; ++i) {
            if(amts[i] < avg) xchg += avg - amts[i];
        }

        printf("xchg: %d\n", xchg);

        free(amts);
        total=0, xchg=0;
    }

    return 0;
}

/*
 * Correct output for input.txt:
 * $10.00
 * $11.99
 * $1.10
 * $2407.09
 * $5.00
 * $0.00
 * $0.01
 * $3991.11
 * $0.01
 * $2.25
 * $4.73
 * $0.02
*/
