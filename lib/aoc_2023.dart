/*

*/
// https://www.maths-cours.fr/methode/algorithme-de-dijkstra-etape-par-etape
int calculate(String input) {
  final numbers = input
      .split('\n')
      .map((e) => e.split('').map((e) => int.parse(e)).toList())
      .toList();
  final rowLength = numbers[0].length;
  final rowEndingIndex = numbers.length - 1;
  final columnEndingIndex = rowLength - 1;

  List<Path> fromPath(Path path) {
    final paths = <Path>[];
    final rowIndex = path.position.$1;
    final columnIndex = path.position.$2;
    final previousPathPositions = path.previousPaths.map((e) => e.position);

    // Left
    final leftColumnIndex = columnIndex - 1;
    final leftPosition = (rowIndex, leftColumnIndex);
    if (leftColumnIndex >= 0 &&
        !previousPathPositions.contains(leftPosition) &&
        (path.previousPaths.length < 3 ||
            path.previousPaths[path.previousPaths.length - 3].position !=
                (rowIndex, leftColumnIndex + 4))) {
      paths.add(
        Path(
          previousPaths: [...path.previousPaths, path],
          position: (rowIndex, leftColumnIndex),
          value: path.value + numbers[rowIndex][leftColumnIndex],
        ),
      );
    }

    // Right
    final rightColumnIndex = columnIndex + 1;
    final rightPosition = (rowIndex, rightColumnIndex);
    if (rightColumnIndex <= columnEndingIndex &&
        !previousPathPositions.contains(rightPosition) &&
        (path.previousPaths.length < 3 ||
            path.previousPaths[path.previousPaths.length - 3].position !=
                (rowIndex, rightColumnIndex - 4))) {
      paths.add(
        Path(
          previousPaths: [...path.previousPaths, path],
          position: rightPosition,
          value: path.value + numbers[rowIndex][rightColumnIndex],
        ),
      );
    }

    // Top
    final topRowIndex = rowIndex - 1;
    final topPosition = (topRowIndex, columnIndex);
    if (topRowIndex >= 0 &&
        !previousPathPositions.contains(topPosition) &&
        (path.previousPaths.length < 3 ||
            path.previousPaths[path.previousPaths.length - 3].position !=
                (topRowIndex + 4, columnIndex))) {
      paths.add(
        Path(
          previousPaths: [...path.previousPaths, path],
          position: topPosition,
          value: path.value + numbers[topRowIndex][columnIndex],
        ),
      );
    }

    // Bottom
    final bottomRowIndex = rowIndex + 1;
    final bottomPosition = (bottomRowIndex, columnIndex);
    if (bottomRowIndex <= rowEndingIndex &&
        !previousPathPositions.contains(bottomPosition) &&
        (path.previousPaths.length < 3 ||
            path.previousPaths[path.previousPaths.length - 3].position !=
                (bottomRowIndex - 4, columnIndex))) {
      paths.add(
        Path(
          previousPaths: [...path.previousPaths, path],
          position: bottomPosition,
          value: path.value + numbers[bottomRowIndex][columnIndex],
        ),
      );
    }
    return paths;
  }

  final pathNumbers = List<Path?>.generate(
      (rowEndingIndex + 1) * (columnEndingIndex + 1), (_) => null);
  pathNumbers[0] = Path(
    previousPaths: [],
    position: (0, 0),
    value: 0,
  );
  while (pathNumbers[pathNumbers.length - 1]?.selected != true) {
    final sortedPathNumbers = pathNumbers
        .where((e) => e?.selected == false)
        .toList()
      ..sort((p1, p2) => p1!.value.compareTo(p2!.value));
    final currentPath = sortedPathNumbers.first!;
    pathNumbers[currentPath.position.$1 * rowLength + currentPath.position.$2] =
        pathNumbers[
            currentPath.position.$1 * rowLength + currentPath.position.$2]!
          ..selected = true;

    final newPaths = <Path>[];
    fromPath(currentPath).forEach((e1) {
      newPaths.add(e1);
      fromPath(e1).forEach((e2) {
        newPaths.add(e2);
        fromPath(e2).forEach((e3) {
          newPaths.add(e3);
          fromPath(e3).forEach((e4) {
            newPaths.add(e4);
          });
        });
      });
    });

    for (final path in newPaths) {
      final pathNumber =
          pathNumbers[path.position.$1 * rowLength + path.position.$2];
      if (pathNumber == null || path.value < pathNumber.value) {
        pathNumbers[path.position.$1 * rowLength + path.position.$2] = path;
      }
    }
    // print('${currentPath.position}');
  }

  return pathNumbers[pathNumbers.length - 1]!.value;
}

class Path {
  Path({
    required this.previousPaths,
    required this.position,
    required this.value,
    this.selected = false,
  });

  final List<Path> previousPaths;
  final (int, int) position;
  final int value;
  bool selected;

  @override
  String toString() {
    return '$position - $value - $selected';
  }
}
