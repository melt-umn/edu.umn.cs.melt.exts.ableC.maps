#include <stdio.h>

int main(int argc, char **argv) {
    map<int, const char*> m = new_map<int, const char*> {
        1: "OK",
        2: "Hello",
        5: "why this?"
    };
    printf("%s World.\n", m[5]);
    return 0;
}
