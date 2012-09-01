#include <stdio.h>
#include <stdlib.h>

int cycle_length(int m, int n)
{
    int count=0, c=0, i, k;

    for(i=m; i<=n; ++i) {
        c=0; k=i;

        while(k>0) {
            c++;
            if(k==1) {
                break;
            } else if (k%2==0) {
                k>>=1;
            } else {
                k=(k*3)+1;
            }
        }

        if(c>count) count=c;
    }

    return count;
}

int main(void)
{
    int m=0, n=0;

    while(scanf("%d %d", &m, &n)==2) {
        int tm=m, tn=n, tmp;
        if(tn<tm) {
            tmp=tm;
            tm=n;
            tn=tmp;
        }
        printf("%d %d %d\n", m, n, cycle_length(tm, tn));
    }

    return 0;
}
