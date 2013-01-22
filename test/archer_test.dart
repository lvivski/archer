import 'package:unittest/unittest.dart';
import 'package:archer/archer.dart';

void main() {
  check(g, p, [limit = 10]) {
    var i = 0;
    while (i++ < limit) {
      expect(g.toArbitrary().current, p);
    }
  }
  group('archer shoud generate', () {
    test('ints', () {
      check(ForAll.positiveIntegers.greaterThan(5), greaterThan(5));
    });
    
    test('negative ints', () {
      check(ForAll.negativeIntegers, lessThan(0));
    });
    
    test('lists of ints', () {
      check(ForAll.lists.of.positiveIntegers, everyElement(greaterThan(0)));
    });
    
    test('lists of lists of chars in range (A:F)', () {
      check(ForAll.lists.of.lists.of.chars.ofRange('A','F'), everyElement(everyElement(predicate((c) => 'ABCDEF'.contains(c)))));
    });
  });
}

