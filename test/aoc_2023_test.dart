import 'package:aoc_2023/aoc_2023.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    final input = '''Time:      7  15   30
Distance:  9  40  200''';

    print(calculate(input));

    // expect(calculate(input), 24000);
  });

  test('aoc 2023', () {
    final input = '''Time:        38     67     76     73
Distance:   234   1027   1157   1236''';

    print(calculate(input));
  });
}
