/*

*/
import 'dart:math';

int calculate(String input) {
  final characters =
      input.split('\n').map((e) => e.split('').toList()).toList();
  final rowCount = characters.length;
  final columnCount = characters[0].length;

  final beamHistory = <Beam>{};
  var beams = [
    Beam(previousTile: (-1, 0), currentTile: (0, 0)),
  ];
  while (beams.isNotEmpty) {
    // print(beams);
    final nextBeams = <Beam>[];
    for (var beamIndex = 0; beamIndex < beams.length; beamIndex++) {
      final beam = beams[beamIndex];
      final previousTile = beam.previousTile;
      final currentTile = beam.currentTile;
      final character = characters[currentTile.$2][currentTile.$1];

      if (!beamHistory.add(beam)) {
        continue;
      }

      void toLeft() {
        final previousColumn = currentTile.$1 - 1;
        if (previousColumn >= 0) {
          nextBeams.add(
            Beam(
              previousTile: currentTile,
              currentTile: (previousColumn, currentTile.$2),
            ),
          );
        }
      }

      void toRight() {
        final nextColumn = currentTile.$1 + 1;
        if (nextColumn < columnCount) {
          nextBeams.add(
            Beam(
              previousTile: currentTile,
              currentTile: (nextColumn, currentTile.$2),
            ),
          );
        }
      }

      void toTop() {
        final previousRow = currentTile.$2 - 1;
        if (previousRow >= 0) {
          nextBeams.add(
            Beam(
              previousTile: currentTile,
              currentTile: (currentTile.$1, previousRow),
            ),
          );
        }
      }

      void toBottom() {
        final nextRow = currentTile.$2 + 1;
        if (nextRow < rowCount) {
          nextBeams.add(
            Beam(
              previousTile: currentTile,
              currentTile: (currentTile.$1, nextRow),
            ),
          );
        }
      }

      if (previousTile.$1 - currentTile.$1 < 0) {
        // from left to right
        switch (character) {
          case '.':
          case '-':
            toRight();
            break;
          case r'/':
            toTop();
            break;
          case r'\':
            toBottom();
            break;
          case '|':
            toTop();
            toBottom();
            break;
        }
      } else if (previousTile.$1 - currentTile.$1 > 0) {
        // from right to left
        switch (character) {
          case '.':
          case '-':
            toLeft();
            break;
          case r'/':
            toBottom();
            break;
          case r'\':
            toTop();
            break;
          case '|':
            toTop();
            toBottom();
            break;
        }
      } else if (previousTile.$2 - currentTile.$2 < 0) {
        // from top to bottom
        switch (character) {
          case '.':
          case '|':
            toBottom();
            break;
          case r'/':
            toLeft();
            break;
          case r'\':
            toRight();
            break;
          case '-':
            toLeft();
            toRight();
            break;
        }
      } else {
        // from bottom to top
        switch (character) {
          case '.':
          case '|':
            toTop();
            break;
          case r'/':
            toRight();
            break;
          case r'\':
            toLeft();
            break;
          case '-':
            toLeft();
            toRight();
            break;
        }
      }
    }
    beams = nextBeams;
  }
  // print(energizedTiles);

  return beamHistory.map((e) => e.currentTile).toSet().length;
}

class Beam {
  const Beam({
    required this.previousTile,
    required this.currentTile,
  });

  final (int, int) previousTile;
  final (int, int) currentTile;

  @override
  String toString() {
    return 'pi: $previousTile | ci: $currentTile';
  }

  @override
  bool operator ==(Object other) {
    if (other is! Beam) return false;
    return previousTile == other.previousTile &&
        currentTile == other.currentTile;
  }

  @override
  int get hashCode {
    var result = 17;
    result = 37 * result + previousTile.hashCode;
    result = 37 * result + currentTile.hashCode;
    return result;
  }
}
