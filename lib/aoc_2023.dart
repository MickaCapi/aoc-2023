final digitTranslations = [
  'one',
  'two',
  'three',
  'four',
  'five',
  'six',
  'seven',
  'eight',
  'nine'
];

int textCalibrationValue(String text) {
  final firstValue = _value(digitTranslations, text);
  final lastValue = _value(
      digitTranslations.map((e) => e.split('').reversed.join()).toList(),
      text.split('').reversed.join());
  return firstValue * 10 + lastValue;
}

int _value(List<String> digitTranslations, String text) {
  final digitTranslationOrRegex = digitTranslations.join('|');

  final regExpSource = '\\d|$digitTranslationOrRegex';
  final regExp = RegExp(regExpSource);
  final matches = regExp.allMatches(text);
  final firstMatch = matches.firstOrNull;

  int intValue(RegExpMatch? match) {
    int digit(String digitTranslation) {
      return digitTranslations.indexOf(digitTranslation) + 1;
    }

    if (match == null) {
      return 0;
    } else {
      final matchedText = match.group(0)!;
      return int.tryParse(matchedText) ?? digit(matchedText);
    }
  }

  return intValue(firstMatch);
}

int documentCalibrationValue(String document) {
  final lines = document.split('\n');
  return lines.map((element) {
    print('$element = ${textCalibrationValue(element)}');
    return textCalibrationValue(element);
  }).reduce((value, element) => value + element);
}
