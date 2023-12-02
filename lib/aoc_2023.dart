// 'Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green'
int gameIdOrZeroIfImpossible(String game, int red, int green, int blue) {
  final colonSplit = game.split(':');
  final gameId = int.parse(colonSplit[0].split(' ')[1]);

  final games = colonSplit[1].split(';');
  for (final game in games) {
    final commaSplit = game.split(',');
    for (var color in commaSplit) {
      final spaceSplit = color.split(' ');

      final colorNumber = int.parse(spaceSplit[1]);
      final colorName = spaceSplit[2];
      switch (colorName) {
        case 'red':
          if (colorNumber > red) return 0;
        case 'green':
          if (colorNumber > green) return 0;
        case 'blue':
          if (colorNumber > blue) return 0;
      }
    }
  }

  return gameId;
}

int calculate(String games, int red, int green, int blue) {
  final lineBreakSplit = games.split('\n');

  return lineBreakSplit
      .map((game) => gameIdOrZeroIfImpossible(game, red, green, blue))
      .reduce((value, element) => value + element);
}
