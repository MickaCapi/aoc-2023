import 'dart:math';

import 'package:collection/collection.dart';

final numberRegExp = RegExp(r'\d+');
final notSymbolRegExp = RegExp(r'\d|\.');

int calculate(String engineSchematic) {
  var sum = 0;

  final lines = engineSchematic.split('\n');
  final matrix = lines.map((line) => line.split('')).toList();

  lines.forEachIndexed((lineIndex, line) {
    numberRegExp.allMatches(line).forEach((match) {
      //print('${match.group(0)} [$lineIndex - ${match.start}/${match.end}]');

      final startSearchRow = max(0, lineIndex - 1);
      final endSearchRow = min(lines.length - 1, lineIndex + 1);

      final startSearchColumn = max(0, match.start - 1);
      final endSearchColumn = min(line.length - 1, match.end);

      rowLoop:
      for (var rowIndex = startSearchRow;
          rowIndex <= endSearchRow;
          rowIndex++) {
        for (var columnIndex = startSearchColumn;
            columnIndex <= endSearchColumn;
            columnIndex++) {
          //print(matrix[rowIndex][columnIndex]);
          if (notSymbolRegExp.hasMatch(matrix[rowIndex][columnIndex]) ==
              false) {
            //print('add');
            sum += int.parse(match.group(0)!);
            break rowLoop;
          }
        }
      }
    });
  });

  return sum;
}
