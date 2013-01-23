part of archer;

class Reporter {
  final bool verbose;

  Reporter(this.verbose);

  void testStart(Property<Object> p) =>
    print("Testing property: '${p.name}'");

  void testSuccess(Property<Object> p, Results rs) {
    // print("SUCCESS: '${p.name}' after ${rs.count()} checks.\n");
  }

  void testFail(Property<Object> p, Results rs) =>
    print("FAIL: '${p.name}' after ${rs.count()} check(s).\n");

  void singleCheck(Result<Object> r) {
    if (r.result != null) {
      _success(r);
    } else {
      _fail(r);
    }
  }

  void summary(List<bool> rs) {
    var failed = rs.where((r) => !r);
    int numFailed = failed.length;
    if (numFailed > 0) {
      print ("\nFAILURE: ${numFailed} test(s) failed!");
    } else {
      print ("\nSUCCESS: tested ${rs.length} properties.");
    }
  }

  void _fail(Result<Object> r) =>
    print("\tFAILED for '${r.input.toString()}'");

  void _success(Result<Object> r) {
    if (verbose) {
      print("\tSUCCESS for '${r.input.toString()}'");
    }
  }

}

