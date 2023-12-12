int calculate(String input) {
  return input.split('\n').map((e) {
    final statesDamageCounts = e.split(' ');
    final states = formatStates(statesDamageCounts[0]);
    final damageCounts = formatDamageCounts(statesDamageCounts[1])
        .split(',')
        .map((e) => int.parse(e))
        .toList();
    return arrangementsCount(states, damageCounts,
        damageCounts.reduce((value, element) => value + element + 1));
  }).reduce((value, element) => value + element);
}

// https://en.wikipedia.org/wiki/Memoization
// key = states + damageCounts
final d = <String, int>{};

int arrangementsCount(String states, List<int> damageCounts, int totalDamage) {
  if (d.containsKey(states + damageCounts.toString())) {
    return d[states + damageCounts.toString()]!;
  }

  var count = 0;
  final firstDamage = damageCounts[0];
  var hashFound = false;
  for (var i = 0; i < states.length; i++) {
    final iPlusDamage = i + firstDamage;
    if (totalDamage > states.length - i) {
      break;
    }
    final stateSubstring = states.substring(i, iPlusDamage);
    final firstCharacter = stateSubstring[0];
    if (hashFound && firstCharacter != '#') {
      break;
    }
    hashFound = firstCharacter == '#';
    if (!stateSubstring.contains('.') &&
        (states.length == iPlusDamage || states[iPlusDamage] != '#') &&
        (i == 0 || states[i - 1] != '#')) {
      if (damageCounts.length == 1) {
        if (states.substring(iPlusDamage).contains('#')) {
          continue;
        }
        count += 1;
      } else {
        if (i + firstDamage + 1 > states.length) {
          break;
        }
        count += arrangementsCount(
          states.substring(i + firstDamage + (stateSubstring != '.' ? 1 : 0)),
          damageCounts.sublist(1),
          totalDamage - firstDamage - 1,
        );
      }
    }
  }

  d.addAll({states + damageCounts.toString(): count});

  return count;
}

String formatRecord(String e) {
  final statesDamageCounts = e.split(' ');
  final states = formatStates(statesDamageCounts[0]);
  final damageCounts = formatDamageCounts(statesDamageCounts[1]);
  return '$states $damageCounts';
}

final multiply = 5;

String formatStates(String states) {
  return Iterable.generate(multiply, (_) => states).join('?');
}

String formatDamageCounts(String damageCounts) {
  return Iterable.generate(multiply, (_) => damageCounts).join(',');
}
