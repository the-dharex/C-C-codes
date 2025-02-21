#include <windows.h>
#include <stdio.h>

int main() {
    char username[256];
    DWORD size = sizeof(username);

    if (GetUserNameA(username, &size)) {
        printf("Usuario: %s\n", username);
    }
    else {
        printf("Error al obtener el usuario\n");
    }

    return 0;
}