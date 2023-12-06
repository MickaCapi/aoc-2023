/*
Time:      7  15   30
Distance:  9  40  200
*/
int calculate(String input) {
  final timeDistanceLists = input
      .split('\n')
      .map(
        (e) => RegExp(r'\d+')
            .allMatches(e)
            .map((e) => int.parse(e.group(0)!))
            .toList(),
      )
      .toList();

  final winList = <int>[];
  for (var i = 0; i < timeDistanceLists[0].length; i++) {
    final time = timeDistanceLists[0][i];
    final distance = timeDistanceLists[1][i];

    var wins = 0;
    for (var j = 1; j < time; j++) {
      //print('${(time - j) * j} > $distance');
      if ((time - j) * j > distance) {
        wins++;
      }
    }
    winList.add(wins);
  }

  return winList.reduce((value, element) => value * element);
}
