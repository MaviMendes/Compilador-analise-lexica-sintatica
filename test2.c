fn fatorial(n) {
var
i = 1;
r = 1;

if n < 0 {
return -1;
}

while i < n + 1 {
r = r * i;
i++;
}
return r;
}

fn main () {
var
i = 3;
f = 0;

f = fat(i);

return 0;
}