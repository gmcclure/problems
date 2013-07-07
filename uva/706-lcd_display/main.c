#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define LCD_ROWS 5
#define LCD_COLS 3

int main(int argc, char const *argv[])
{
    int mtrx[] = { 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, /* 0 */
                   0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, /* 1 */
                   0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, /* 2 */
                   0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, /* 3 */
                   0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, /* 4 */
                   0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, /* 5 */
                   0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, /* 6 */
                   0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, /* 7 */
                   0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, /* 8 */
                   0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, /* 9 */ };

    int i, j, k=0, len=0, m, n, size=0, t, tc;
    char num[20], p;

    scanf("%d %s", &size, num);

    while (size) {
        for(i=0; i<LCD_ROWS; ++i) {

            if(size==0) exit(0);
            len = strnlen(num, 20);

            if(i%2) {
                p='|';
                t=size; 
                tc=1;
            } else {
                p='-';
                t=1;
                tc=size;
            }

            for (m=0; m<t; m++) {
                for(k=0; k<len; k++) {
                    for(j=0; j<LCD_COLS; ++j) {
                        if (mtrx[(num[k]-'0')*15+i*3+j]) {
                            for(n=0; n<tc; n++) printf("%c", p);
                        } else {
                            if(j%2)
                                for(n=0; n<size; n++) printf(" ");
                            else
                                printf(" ");
                        }
                    }
                    if(k < len-1) printf(" ");
                }
                printf("\n");
            }
        }
        printf("\n");

        scanf("%d %s", &size, num);
    }
}
