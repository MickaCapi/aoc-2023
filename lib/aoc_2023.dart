import 'dart:math';

import 'package:collection/collection.dart';

final starRegExp = RegExp(r'\*');

int calculate(String engineSchematic) {
  var sum = 0;

  final lines = engineSchematic.split('\n');
  final matrix = lines.map((line) => line.split('')).toList();

  lines.forEachIndexed((lineIndex, line) {
    starRegExp.allMatches(line).forEach((match) {
      //print('${match.group(0)} [$lineIndex - ${match.start}/${match.end}]');

      final startSearchRow = max(0, lineIndex - 1);
      final endSearchRow = min(lines.length - 1, lineIndex + 1);

      final startSearchColumn = max(0, match.start - 1);
      final endSearchColumn = min(line.length - 1, match.end);

      final numbers = <int>[];

      for (var rowIndex = startSearchRow;
          rowIndex <= endSearchRow;
          rowIndex++) {
        for (var columnIndex = startSearchColumn;
            columnIndex <= endSearchColumn;
            columnIndex++) {
          final character = matrix[rowIndex][columnIndex];
          //print(character);
          var figure = int.tryParse(character);
          if (figure != null) {
            var numberString = character;

            // print('figure');
            for (var figureColumnIndex = columnIndex - 1;
                figureColumnIndex >= 0;
                figureColumnIndex--) {
              final previousCharacter = matrix[rowIndex][figureColumnIndex];
              if (int.tryParse(previousCharacter) == null) {
                break;
              }
              numberString = previousCharacter + numberString;
              // print(previousCharacter);
            }

            for (var figureColumnIndex = columnIndex + 1;
                figureColumnIndex < line.length;
                figureColumnIndex++) {
              final nextCharacter = matrix[rowIndex][figureColumnIndex];
              if (int.tryParse(nextCharacter) == null) {
                break;
              }
              numberString = numberString + nextCharacter;
              // print(nextCharacter);
              columnIndex = figureColumnIndex;
            }

            sum += 0;
            //print('numberString $numberString');
            numbers.add(int.parse(numberString));
          }
        }
      }

      if (numbers.length == 2) {
        sum += numbers[0] * numbers[1];
      }
    });
  });

  return sum;
}
