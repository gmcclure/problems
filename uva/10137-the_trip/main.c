#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char const *argv[])
{
    char cents[100], line[100];
    int avg=0, i, p, s, total=0, xchg=0;

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
        p = total % s;

        for(i=0; i<s; ++i) {
            if(amts[i] < avg) {
                xchg += avg - amts[i];
                continue;
            }

            if((amts[i] > avg) && p) p--;
        }

        xchg += p;

        printf("$%d.%02d\n", xchg/100, xchg%100);

        free(amts);
        p=0, total=0, xchg=0;
    }

    return 0;
}
