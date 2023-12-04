import 'package:collection/collection.dart';

/*
Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11'
*/
int calculate(String cards) {
  final cardsSplit = cards.split('\n');
  final cardsNumber = cardsSplit.length;
  final copies = List.generate(
    cardsNumber,
    (index) => 1,
  );

  return cardsSplit.mapIndexed((index, card) {
    final pipeSplit = card.split(':')[1].split('|');
    final winningNumbers = pipeSplit[0]
        .split(' ')
        .map((element) => int.tryParse(element))
        .where((element) => element != null)
        .toSet();
    final numbers = pipeSplit[1]
        .split(' ')
        .map((element) => int.tryParse(element))
        .where((element) => element != null)
        .toSet();
    final intersectLength = winningNumbers.intersection(numbers).length;

    for (var i = 0; i < intersectLength; i++) {
      copies[index + i + 1] += copies[index];
    }
    return copies[index];
  }).reduce((value, element) => value + element);

  // return 13;
}

// 6:30 7:50
// 7:00 8:10
// 7:30 22:00
