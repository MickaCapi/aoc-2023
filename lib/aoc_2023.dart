int textCalibrationValue(String text) {
  final regExp = RegExp(r'\d');
  final matches = regExp.allMatches(text);
  final firstMatch = matches.firstOrNull;
  final lastMatch = matches.lastOrNull;

  int intValue(RegExpMatch? match) {
    return match == null
        ? 0
        : int.parse(text.substring(match.start, match.end));
  }

  final first = intValue(firstMatch);
  final last = intValue(lastMatch);

  return first * 10 + last;
}

int documentCalibrationValue(String document) {
  final lines = document.split('\n');
  return lines
      .map((element) => textCalibrationValue(element))
      .reduce((value, element) => value + element);
}
