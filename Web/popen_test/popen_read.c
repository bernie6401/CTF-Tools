#include "stdio.h"
#include "stdlib.h"

int main()
{
    FILE *fp;
    char buf[200] = {0};
    if((fp = popen("cat test", "r")) == NULL)
    {
        perror("Fail to popen\n");
        exit(1);
    }

    while(fgets(buf, 200, fp) != NULL)
        printf("%s", buf);
    
    pclose(fp);
    return 0;
}