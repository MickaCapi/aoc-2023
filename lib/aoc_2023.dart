import 'dart:math';

int calculate(String input) {
  return input
      .split('\n')
      .map((e) => arrangementsCount(e))
      .reduce((value, element) => value + element);
  //return 21;
}

int arrangementsCount(String record) {
  final statesDamageCounts = record.split(' ');
  final states = statesDamageCounts[0].split('');
  final unknownStatesCount = states.where((e) => e == '?').length;
  final damageCounts =
      statesDamageCounts[1].split(',').map((e) => int.parse(e)).toList();

  final possibleStates =
      List.generate(pow(2, unknownStatesCount).toInt(), (index) => '');
  final possibleStatesLength = possibleStates.length;
  for (var i = 0; i < possibleStatesLength; i++) {
    var unknownStatesIndex = unknownStatesCount;

    for (var j = 0; j < states.length; j++) {
      final state = states[j];
      switch (state) {
        case '#':
        case '.':
          possibleStates[i] += state;
          break;
        case '?':
          if ((i ~/ (possibleStatesLength / pow(2, unknownStatesIndex)) % 2) ==
              0) {
            possibleStates[i] += '#';
          } else {
            possibleStates[i] += '.';
          }
          unknownStatesIndex--;
          break;
      }
    }
  }

  final source = '^\\.*${damageCounts.map((e) => '#{$e}').join(r'\.+')}\\.*\$';

  return possibleStates.where((e) => RegExp(source).hasMatch(e)).length;
}
