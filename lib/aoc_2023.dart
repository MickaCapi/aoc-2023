/*

*/

int calculate(String input) {
  return input.split('\n\n').map((e) {
    return patternValue(e);
  }).reduce((v, e) => v + e);
}

int patternValue(String pattern) {
  // Horizontal
  final rows = pattern.split('\n');
  final rowValue = valueOf(rows) * 100;

  if (rowValue > 0) {
    return rowValue;
  }

  // Vertical
  final columns = List.generate(rows[0].length, (_) => '');
  for (var rowIndex = 0; rowIndex < rows.length; rowIndex++) {
    final row = rows[rowIndex];
    for (var columnIndex = 0; columnIndex < columns.length; columnIndex++) {
      columns[columnIndex] += row[columnIndex];
    }
  }

  return valueOf(columns);
}

int valueOf(List<String> list) {
  final min = 0;
  final max = list.length - 1;
  var value = 0;

  lineLoop:
  for (var i = min; i < max; i++) {
    var currentMin = i;
    var currentMax = i + 1;
    var differencesTotalCount =
        differencesCount(list[currentMin], list[currentMax]);
    while (differencesTotalCount <= 1) {
      currentMin--;
      currentMax++;
      if ((currentMin < min || currentMax > max)) {
        if (differencesTotalCount == 1) {
          return i + 1;
        }
        continue lineLoop;
      }
      differencesTotalCount +=
          differencesCount(list[currentMin], list[currentMax]);
    }
  }

  return value;
}

int differencesCount(String s1, String s2) {
  var differences = 0;
  for (var j = 0; j < s1.length; j++) {
    if (s1[j] != s2[j]) {
      differences++;
    }
  }
  return differences;
}
