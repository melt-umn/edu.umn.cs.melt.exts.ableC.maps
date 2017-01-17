#include <stdio.h>

int main(int argc, char **argv) {
    map<int, const char*> m = new_map<int, const char*> {
        "OK",
        "Hello",
        "why this?"
    };
    printf("%s World.\n", m[5]);
    return 0;
}
