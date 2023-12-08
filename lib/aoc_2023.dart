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

  var position = 'AAA';
  var steps = 0;
  while (position != 'ZZZ') {
    final instruction = instructions[steps % instructions.length];

    final node =
        RegExp('$position = \\(\\w{3}, \\w{3}\\)').firstMatch(nodes)!.group(0)!;
    final positionDirections = node.split(' = ');
    final directions =
        positionDirections[1].replaceAll(RegExp(r'\(|\)'), '').split(', ');
    final left = directions[0];
    final right = directions[1];

    if (instruction == 'L') {
      position = left;
    } else {
      position = right;
    }
    steps++;

    if (position == 'ZZZ') {
      break;
    }
  }

  return steps;
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
