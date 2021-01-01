abstract class Matcher {
  bool matches(dynamic actual);
}

class Any extends Matcher {
  @override
  bool matches(dynamic actual) => true;
}

class AnyNumber extends Matcher {
  @override
  bool matches(dynamic actual) =>
      actual is int ||
      actual is double ||
      int.tryParse(actual) is int ||
      double.tryParse(actual) is double;
}

class RegExpMatcher extends Matcher {
  final RegExp regexp;

  RegExpMatcher({
    String pattern,
    bool multiline = false,
    bool caseSensitive = false,
    RegExp regexp,
  }) : regexp = regexp ??
            RegExp(
              pattern,
              multiLine: multiline,
              caseSensitive: caseSensitive,
            );

  @override
  bool matches(dynamic actual) => actual is String && regexp.hasMatch(actual);
}

final anyValue = Any();
final anyNumber = AnyNumber();
