#include "../include/maps.xh"

#include <stdio.h>

int main(int argc, char **argv) {
    map<int, const char*> m = new_map<int, const char*> {
        1: "OK",
        2: "Hello",
        5: "why this?"
    };
	int two = 2;
    // printf("%s World.\n", m[2]);
    printf("%s World.\n", _map_get(m, &two));
    return 0;
}

/* vim: set ft=c: */
