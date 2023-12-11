/*

*/

int calculate(String input) {
  final characters =
      input.split('\n').map((e) => e.split('').toList()).toList();
  final lineLength = characters[0].length;
  final galaxyPositions = RegExp('#')
      .allMatches(input.replaceAll('\n', ''))
      .map((e) => (e.start % lineLength, e.start ~/ lineLength))
      .toList();

  // Find empty lines and columns
  final emptyLines = List.generate(characters.length, (_) => true);
  final emptyColumns = List.generate(lineLength, (_) => true);

  for (var y = 0; y < characters.length; y++) {
    final charactersLine = characters[y];
    for (var x = 0; x < charactersLine.length; x++) {
      final character = charactersLine[x];

      final isEmpty = character == '.';
      emptyLines[y] = emptyLines[y] && isEmpty;
      emptyColumns[x] = emptyColumns[x] && isEmpty;
    }
  }

  // Expand empty lines and columns
  for (var y = emptyLines.length - 1; y >= 0; y--) {
    final isEmptyLine = emptyLines[y];
    if (isEmptyLine) {
      for (var i = 0; i < galaxyPositions.length; i++) {
        final galaxyPosition = galaxyPositions[i];
        if (galaxyPosition.$2 > y) {
          galaxyPositions[i] = (galaxyPosition.$1, galaxyPosition.$2 + 999999);
        }
      }
    }
  }

  for (var x = emptyColumns.length - 1; x >= 0; x--) {
    final isEmptyColumn = emptyColumns[x];
    if (isEmptyColumn) {
      for (var i = 0; i < galaxyPositions.length; i++) {
        final galaxyPosition = galaxyPositions[i];
        if (galaxyPosition.$1 > x) {
          galaxyPositions[i] = (galaxyPosition.$1 + 999999, galaxyPosition.$2);
        }
      }
    }
  }

  // Sum shortest distances between galaxies
  var distance = 0;
  for (var i = 0; i < galaxyPositions.length; i++) {
    final galaxyPosition1 = galaxyPositions[i];
    for (var j = i; j < galaxyPositions.length; j++) {
      final galaxyPosition2 = galaxyPositions[j];
      distance += (galaxyPosition2.$1 - galaxyPosition1.$1).abs();
      distance += (galaxyPosition2.$2 - galaxyPosition1.$2).abs();
    }
  }

  return distance;
}
