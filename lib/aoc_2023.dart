/*
RL

AAA = (BBB, CCC)
BBB = (DDD, EEE)
CCC = (ZZZ, GGG)
DDD = (DDD, DDD)
EEE = (EEE, EEE)
GGG = (GGG, GGG)
ZZZ = (ZZZ, ZZZ)
*/

int calculate(String input) {
  final instructionsElements = input.split('\n\n');
  final instructions = instructionsElements[0].split('');
  final nodes = instructionsElements[1];

  var positions = RegExp('^\\w{2}A', multiLine: true)
      .allMatches(nodes)
      .map((e) => e.group(0)!)
      .toList();
  var steps = <String, int>{};
  var step = 0;
  while (steps.length < positions.length) {
    final instruction = instructions[step % instructions.length];

    for (var i = 0; i < positions.length; i++) {
      final position = positions[i];

      final node = RegExp('$position = \\(\\w{3}, \\w{3}\\)')
          .firstMatch(nodes)!
          .group(0)!;
      final positionDirections = node.split(' = ');
      final directions =
          positionDirections[1].replaceAll(RegExp(r'\(|\)'), '').split(', ');
      final left = directions[0];
      final right = directions[1];

      if (instruction == 'L') {
        positions[i] = left;
      } else {
        positions[i] = right;
      }

      if (positions[i].endsWith('Z') && !steps.containsKey(position)) {
        steps[positions[i]] = step + 1;
      }
    }
    step++;
  }

  return steps.values
      .reduce((value, element) => (value * element) ~/ value.gcd(element));
}

class Node {
  const Node(
    this.position,
    this.left,
    this.right,
  );

  final String position;
  final String left;
  final String right;
}
