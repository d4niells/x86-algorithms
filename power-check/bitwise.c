#include <stdio.h>

void main() {
    int quocient;
    scanf("%d", &quocient);

    if (quocient > 0 && (quocient & (quocient - 1)) == 0) {
        printf("É potência de 2\n");
    } else {
        printf("Não é potência de 2\n");
    }
}
