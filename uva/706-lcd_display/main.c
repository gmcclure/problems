#include <stdio.h>
#include <stdlib.h>

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

    int i, j, k=0, len=0, size=0;
    char num[20];

    scanf("%d %s", &size, num);

    if(size==0) exit(0);

    len = sizeof(num)/sizeof(char);
    printf("len: %d\n", len);

    for (i = 0; i < LCD_ROWS; i++) {

    }

    for(k = 0; k < len; k++) {
        for(i=0; i<LCD_ROWS; ++i) {
            for(j=0; j<LCD_COLS; ++j) {
                if (mtrx[(num[k]-'0')*15+i*3+j]) {
                    if (j%2) {
                        printf("|");
                    } else {
                        printf("-");
                    }
                }
            }
            printf("\n");
        }
    }
}
