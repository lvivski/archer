import 'package:archer/archer.dart';

main () {
  property("any int over 5", ForAll.positiveIntegers.greaterThan(5), (x) => x > 5);
  property("any int under 5", ForAll.positiveIntegers.lessThan(5), (x) => x < 5);

  property("positive ints", ForAll.positiveIntegers, (x) => x > 0);
  property("negative ints", ForAll.negativeIntegers, (x) => x < 0);
  property("non-negative ints", ForAll.nonNegativeIntegers, (x) => x >= 0);
  property("non-positive ints", ForAll.nonPositiveIntegers, (x) => x <= 0);
  property("integers", ForAll.integers, (x) => x is int);

  property("chars", ForAll.chars, (x) => x is String);
  property("chars in range", ForAll.chars.ofRange('A','F'), (x) => "ABCDEF".indexOf(x) != -1);

  property("lists of positive integers", ForAll.lists.of.positiveIntegers,
    (x) => x is List && x.every((e) => e >= 0)
  );

  property("lists of booleans", ForAll.bools,
      (x) => x == true || x == false
  );

  property("lists of list of integers", ForAll.lists.of.lists.of.positiveIntegers,
    (x) => x is List && x.every((e) => e is List)
  );

  property("lists of length", ForAll.lists.ofLength(3).of.integers.between(1, 3),
    (xs) => xs.length == 3);

  property("choice", ForAll.objectsIn([1, "a"]), (x) => x == 1 || x == "a");
  property("list of choice", ForAll.lists.of.objectsIn([1, "a"]),
    (xs) => xs.every((x) => x == 1 || x == "a")
  );
  checkAll();
}
