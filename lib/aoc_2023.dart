/*

*/
import 'dart:math';

int calculate(String input) {
  return input.split('\n\n').map((e) {
    return patternValue(e);
  }).reduce((v, e) => v + e);
}

int patternValue(String pattern) {
  // Horizontal
  final rows = pattern.split('\n');
  var value = 0;

  value += valueOf(rows) * 100;

  // Vertical
  final columns = List.generate(rows[0].length, (_) => '');
  for (var rowIndex = 0; rowIndex < rows.length; rowIndex++) {
    final row = rows[rowIndex];
    for (var columnIndex = 0; columnIndex < columns.length; columnIndex++) {
      columns[columnIndex] += row[columnIndex];
    }
  }

  return value + valueOf(columns);
}

int valueOf(List<String> list) {
  final min = 0;
  final max = list.length - 1;
  var value = 0;

  lineLoop:
  for (var i = min; i < max; i++) {
    var currentMin = i;
    var currentMax = i + 1;
    while (list[currentMin] == list[currentMax]) {
      currentMin--;
      currentMax++;
      if (currentMin < min || currentMax > max) {
        value += i + 1;
        continue lineLoop;
      }
    }
  }

  return value;
}
