part of archer;

var rnd = new Random();

int randomInRange(int a, int b) => (rnd.nextDouble() * (b - a)).toInt() + a;
bool randomBool() => rnd.nextDouble() > 0.5 ? true : false;