// 'Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green'
import 'dart:math';

int power(String game, int red, int green, int blue) {
  final colonSplit = game.split(':');
  var redPower = 0;
  var greenPower = 0;
  var bluePower = 0;

  final games = colonSplit[1].split(';');
  for (final game in games) {
    final commaSplit = game.split(',');
    for (var color in commaSplit) {
      final spaceSplit = color.split(' ');

      final colorNumber = int.parse(spaceSplit[1]);
      final colorName = spaceSplit[2];
      switch (colorName) {
        case 'red':
          redPower = max(redPower, colorNumber);
        case 'green':
          greenPower = max(greenPower, colorNumber);
        case 'blue':
          bluePower = max(bluePower, colorNumber);
      }
    }
  }

  return redPower * greenPower * bluePower;
}

int calculate(String games, int red, int green, int blue) {
  final lineBreakSplit = games.split('\n');

  return lineBreakSplit
      .map((game) => power(game, red, green, blue))
      .reduce((value, element) => value + element);
}
