/*

*/

extension on String {
  List<List<String>> toPlaces() {
    return split('\n').map((e) => e.split('').toList()).toList();
  }
}

extension on List<List<String>> {
  String toPlacesString() {
    return map((e) => e.join('')).join('\n');
  }
}

int calculate(String input) {
  final p = <String>[];
  var pIndex = 0;

  var places = input.toPlaces();
  while (true) {
    places = tiltToNorth(places);
    places = tiltToWest(places);
    places = tiltToSouth(places);
    places = tiltToEast(places);
    if (p.contains(places.toPlacesString())) {
      pIndex = p.indexOf(places.toPlacesString());
      p.removeRange(0, pIndex);
      break;
    } else {
      p.add(places.toPlacesString());
    }
  }

  places = p[((1000000000 - pIndex) % p.length) - 1].toPlaces();

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

List<List<String>> tiltToWest(List<List<String>> currentPlaces) {
  // i = vertical
  // j = horizontal
  final places = currentPlaces.toList();
  for (var i = 0; i < places.length; i++) {
    final placesLine = places[i];
    for (var j = 0; j < placesLine.length; j++) {
      final place = placesLine[j];
      var previousColumnIndex = j - 1;
      if (j > 0 && place == 'O' && places[i][previousColumnIndex] == '.') {
        while (
            previousColumnIndex >= 0 && places[i][previousColumnIndex] == '.') {
          previousColumnIndex--;
        }
        places[i][previousColumnIndex + 1] = 'O';
        places[i][j] = '.';
      }
    }
  }
  return places;
}

List<List<String>> tiltToSouth(List<List<String>> currentPlaces) {
  // i = vertical
  // j = horizontal
  final places = currentPlaces.toList();
  for (var i = places.length - 1; i >= 0; i--) {
    final placesLine = places[i];
    for (var j = placesLine.length - 1; j >= 0; j--) {
      final place = placesLine[j];
      var nextLineIndex = i + 1;
      if (i < places.length - 1 &&
          place == 'O' &&
          places[nextLineIndex][j] == '.') {
        while (
            nextLineIndex < places.length && places[nextLineIndex][j] == '.') {
          nextLineIndex++;
        }
        places[nextLineIndex - 1][j] = 'O';
        places[i][j] = '.';
      }
    }
  }
  return places;
}

List<List<String>> tiltToEast(List<List<String>> currentPlaces) {
  // i = vertical
  // j = horizontal
  final places = currentPlaces.toList();
  for (var i = places.length - 1; i >= 0; i--) {
    final placesLine = places[i];
    for (var j = places.length - 1; j >= 0; j--) {
      final place = placesLine[j];
      var nextColumnIndex = j + 1;
      if (j < placesLine.length - 1 &&
          place == 'O' &&
          places[i][nextColumnIndex] == '.') {
        while (nextColumnIndex < placesLine.length &&
            places[i][nextColumnIndex] == '.') {
          nextColumnIndex++;
        }
        places[i][nextColumnIndex - 1] = 'O';
        places[i][j] = '.';
      }
    }
  }
  return places;
}
