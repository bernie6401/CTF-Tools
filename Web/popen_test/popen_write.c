#include "stdio.h"
#include "stdlib.h"

int main()
{
    FILE *fp;
    char buf[200] = {0};
    if((fp = popen("cat > test1", "w")) == NULL)
    {
        perror("Fail to popen\n");
        exit(1);
    }
    
    fwrite("Read pipe successfully !", 1, sizeof("Read pipe successfully !"), fp);
    pclose(fp);

    return 0;
}