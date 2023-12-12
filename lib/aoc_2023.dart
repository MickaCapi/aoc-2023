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
  final states = statesDamageCounts[0];
  final damageCounts =
      statesDamageCounts[1].split(',').map((e) => int.parse(e)).toList();

  var count = 0;
  final firstDamage = damageCounts[0];
  var hashFound = false;
  for (var i = 0; i < states.length; i++) {
    // print('$i - $record');
    if (i + firstDamage > states.length) {
      break;
    }
    final stateSubstring = states.substring(i, i + firstDamage);
    if (hashFound && stateSubstring[0] != '#') {
      break;
    }
    hashFound = stateSubstring[0].contains('#');
    if (!stateSubstring.replaceAll('?', '#').contains('.') &&
        (states.length == i + firstDamage || states[i + firstDamage] != '#') &&
        (i == 0 || states[i - 1] != '#')) {
      if (damageCounts.length == 1) {
        if (states.substring(i + firstDamage).contains('#')) {
          continue;
        }
        // print('count + 1');
        count += 1;
      } else {
        if (i + firstDamage + 1 > states.length) {
          continue;
        }
        count += arrangementsCount(
            '${states.substring(i + firstDamage + (stateSubstring != '.' ? 1 : 0))} ${damageCounts.sublist(1).join(',')}');
      }
    }
  }

  return count;
}
