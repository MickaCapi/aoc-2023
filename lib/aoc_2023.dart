/*

*/
int calculate(String input) {
  final places = tiltToNorth(
    input.split('\n').map((e) => e.split('').toList()).toList(),
  );

  var value = 0;
  for (var i = 0; i < places.length; i++) {
    final rowValue = places.length - i;
    value += places[i].where((e) => e == 'O').length * rowValue;
  }
  return value;
}

List<List<String>> tiltToNorth(List<List<String>> currentPlaces) {
  // i = vertical
  // j = horizontal
  final places = currentPlaces.toList();
  for (var i = 0; i < places.length; i++) {
    final placesLine = places[i];
    for (var j = 0; j < placesLine.length; j++) {
      final place = placesLine[j];
      var previousLineIndex = i - 1;
      if (i > 0 && place == 'O' && places[previousLineIndex][j] == '.') {
        while (previousLineIndex >= 0 && places[previousLineIndex][j] == '.') {
          previousLineIndex--;
        }
        places[previousLineIndex + 1][j] = 'O';
        places[i][j] = '.';
      }
    }
  }
  return places;
}
