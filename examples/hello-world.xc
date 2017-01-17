#include <maps.xh>

#include <stdio.h>

int main(int argc, char **argv) {
    map<int, const char*> m = new_map<int, const char*> {
        1: "OK",
        2: "Hello",
        5: "why this?"
    };
    // printf("%s World.\n", m[5]);
    printf("%s World.\n", map_get(m, 5));
    return 0;
}

/*
int main2(int argc, char** argv) {
	map<int, const char*> m = ({
		map<int, const char*> tmp = map_new();
		map_insert(tmp, 1, "OK");
		map_insert(tmp, 2, "Hello");
		map_insert(tmp, 5, "why this?");
		tmp;
	});
	printf("%s World.\n", map_get(m, 5));
	return 0;
}
*/

/* vim: set ft=c: */
