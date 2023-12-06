/*
Time:      7  15   30
Distance:  9  40  200
*/
int calculate(String input) {
  final timeDistance = input.split('\n').map(
    (e) {
      return int.parse(
          RegExp(r'\d+').allMatches(e).map((e) => e.group(0)).join());
    },
  ).toList();

  final time = timeDistance[0];
  final distance = timeDistance[1];

  var wins = 0;
  for (var j = 1; j < time; j++) {
    //print('${(time - j) * j} > $distance');
    if ((time - j) * j > distance) {
      wins++;
    }
  }
  return wins;
}
