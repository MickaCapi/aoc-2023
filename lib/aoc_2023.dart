/*

*/
int calculate(String input) {
  final lines = input.split('\n');
  final lineLength = lines[0].length;
  final characters = lines.map((e) => e.split('')).toList();

  final start = RegExp('S').firstMatch(input)!;
  final startX = start.start % (lineLength + 1);
  final startY = start.start ~/ (lineLength + 1);

  (int, int) getStartingNextStep() {
    // Left
    var newX = startX - 1;
    var newY = startY;
    if (newX > 0) {
      final character = characters[newY][newX];
      if (['-', 'L', 'F'].contains(character)) {
        return (newX, newY);
      }
    }

    // Top
    newX = startX;
    newY = startY - 1;
    if (newY > 0) {
      final character = characters[newY][newX];
      if (['|', '7', 'F'].contains(character)) {
        return (newX, newY);
      }
    }

    // Right
    newX = startX + 1;
    newY = startY;
    if (newX < lineLength) {
      final character = characters[newY][newX];
      if (['-', 'J', '7'].contains(character)) {
        return (newX, newY);
      }
    }

    return (-1, -1);
  }

  final startingNextStep = getStartingNextStep();
  var previousX = startX;
  var previousY = startY;
  var currentX = startingNextStep.$1;
  var currentY = startingNextStep.$2;
  final path = [(startX, startY)];

  while (currentX != startX || currentY != startY) {
    final newPreviousX = currentX;
    final newPreviousY = currentY;

    final character = characters[currentY][currentX];

    path.add((currentX, currentY));

    // print(character);
    // print('$previousX - $previousY | $currentX - $currentY');
    switch (character) {
      case '|':
        if (currentY - previousY > 0) {
          currentY += 1;
        } else {
          currentY -= 1;
        }
        break;
      case '-':
        if (currentX - previousX > 0) {
          currentX += 1;
        } else {
          currentX -= 1;
        }
        break;
      case 'L':
        if (currentX - previousX == 0) {
          currentX += 1;
        } else {
          currentY -= 1;
        }
        break;
      case 'J':
        if (currentX - previousX > 0) {
          currentY -= 1;
        } else {
          currentX -= 1;
        }
        break;
      case '7':
        if (currentX - previousX > 0) {
          currentY += 1;
        } else {
          currentX -= 1;
        }
        break;
      case 'F':
        if (currentX - previousX == 0) {
          currentX += 1;
        } else {
          currentY += 1;
        }
        break;
    }

    previousX = newPreviousX;
    previousY = newPreviousY;
  }

  var xTilesInsideCount = 0;
  for (var y = 0; y < characters.length; y++) {
    final charactersLine = characters[y];

    var characterOfLineInPathCount = 0;
    String? lastTurnCharacter;
    for (var x = 0; x < charactersLine.length; x++) {
      final character = characters[y][x];
      if (path.contains((x, y))) {
        if (character == '|') {
          characterOfLineInPathCount++;
        } else if (lastTurnCharacter == null) {
          lastTurnCharacter = character;
        } else if (character != '-') {
          if (!(lastTurnCharacter == 'L' && character == 'J') &&
              !(lastTurnCharacter == 'F' && character == '7')) {
            characterOfLineInPathCount++;
          }
          lastTurnCharacter = null;
        }
      } else if (characterOfLineInPathCount % 2 == 1) {
        xTilesInsideCount++;
      }
    }
  }

  return xTilesInsideCount;
}
