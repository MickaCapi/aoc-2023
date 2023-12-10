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
  var distance = 1;

  while (currentX != startX || currentY != startY) {
    // while (distance < 9) {
    distance++;

    final newPreviousX = currentX;
    final newPreviousY = currentY;

    final character = characters[currentY][currentX];
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

  return distance ~/ 2;
}
