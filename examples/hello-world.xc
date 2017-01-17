#include <stdio.h>

int main(int argc, char **argv) {
    map<int, const char*> m;
    /*map<int, const char*> m = map {
        4: "OK",
        5: "Hello",
        9: "why this?",
    };*/
    printf("%s World.\n", m[5]);
    return 0;
}
