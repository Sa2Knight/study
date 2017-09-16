#include<stdio.h>

int main() {
  int m, n;
  int a, b;
  int i;
  scanf("%d %d", &m, &n);

  a = 99;
  b = 0;
  for (i = 0; i< m; i++) {
    printf("%d + %d =\n", a, b);
    b -= 1;
    if (b < 0) {
      a -= 1;
      b = 99 - a;
    }
  }

  a = 99;
  b = 99;
  for (i = 0; i< n; i++) {
    printf("%d - %d =\n", a, b);
    b -= 1;
    if (b < 0) {
      a -= 1;
      b = a;
    }
  }

  return 0;
}
