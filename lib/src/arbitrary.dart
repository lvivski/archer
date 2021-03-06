part of archer;

abstract class Arbitrary<T> extends Iterator<T> {}

abstract class BasicArbitrary<T> implements Arbitrary<T> {
  bool moveNext() => true;
  T get current;
  Arbitrary<Object> passThrough(f) => new PassThroughArbitrary<T>(this, f);
}

typedef Object MapFunction(Object x);

class PassThroughArbitrary<T> extends BasicArbitrary<Object> {
  final MapFunction f;
  final Arbitrary<T> g;
  PassThroughArbitrary(Arbitrary<T> this.g, MapFunction this.f);
  Object get current => f(g.current);
}

class ArbitraryList<T> extends BasicArbitrary<List<T>> {
  final Iterator<T> g;
  final int minLen, maxLen;

  ArbitraryList(this.g, [this.minLen = 0, this.maxLen = 42]);

  List<T> get current {
    int len = randomInRange(minLen, maxLen);
    List<T> list = new List<T>();
    for (int i = 0; i < len; ++i) {
      list.add(g.current);
    }
    return list;
  }
}

class ArbitraryInt extends BasicArbitrary<int> {
  final int start, end;
  ArbitraryInt(int this.start, int this.end);
  int get current => randomInRange(start, end);
}

class ArbitraryBool extends BasicArbitrary<bool> {
  ArbitraryBool();
  bool get current => randomBool();
}

class ArbitraryChoice<T> extends BasicArbitrary<T> {
  final List<T> elements;
  ArbitraryChoice(List<T> this.elements);
  T get current => elements[randomInRange(0, elements.length)];
}
