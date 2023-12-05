/*
seeds: 79 14 55 13

seed-to-soil map:
50 98 2
52 50 48

soil-to-fertilizer map:
0 15 37
37 52 2
39 0 15

fertilizer-to-water map:
49 53 8
0 11 42
42 0 7
57 7 4

water-to-light map:
88 18 7
18 25 70

light-to-temperature map:
45 77 23
81 45 19
68 64 13

temperature-to-humidity map:
0 69 1
1 0 69

humidity-to-location map:
60 56 37
56 93 4
*/

import 'dart:math';

int calculate(String input) {
  final inputNumbers = getInputNumbers(input);
  final seedNumbers = inputNumbers[0][0];
  final otherNumbers = inputNumbers.sublist(1);

  var seed = -1;
  var location = 0;
  final reversedOtherNumbers = otherNumbers.reversed;
  while (seed == -1) {
    var currentNumber = location;
    for (var on in reversedOtherNumbers) {
      for (var o in on) {
        final destination = o[0];
        final source = o[1];
        final length = o[2];
        if (destination <= currentNumber &&
            currentNumber <= destination + length) {
          final diff = currentNumber - destination;
          currentNumber = source + diff;
          break;
        }
      }
    }

    for (var i = 0; i < seedNumbers.length; i += 2) {
      final minSeed = seedNumbers[i];
      final maxSeed = seedNumbers[i] + seedNumbers[i + 1];
      if (minSeed <= currentNumber && currentNumber <= maxSeed) {
        seed = location;
        break;
      }
    }

    location++;
  }

  return seed;
}

List<List<List<int>>> getInputNumbers(String input) {
  final mapSplit = input.split('map:');

  final numbers = <List<List<int>>>[];

  for (var data in mapSplit) {
    final dataNumbers = data
        .split('\n')
        .map((e) {
          return RegExp(r'\d+')
              .allMatches(e)
              .map((e) => int.parse(e.group(0)!))
              .toList();
        })
        .where((element) => element.isNotEmpty)
        .toList();
    numbers.add(dataNumbers);
  }

  return numbers;
}
