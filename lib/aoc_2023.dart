/*

*/

final cardRank = {
  'T': 10,
  'J': 1,
  'Q': 12,
  'K': 13,
  'A': 14,
};

int calculate(String input) {
  final reversedSortHands = input.split('\n').map((e) {
    final handBidSplit = e.split(' ');
    final hand = handBidSplit[0];
    final bid = int.parse(handBidSplit[1]);
    final rank = getRank(hand);
    return Hand(hand, bid, rank);
  }).toList()
    ..sort((h1, h2) {
      final rankCompareValue = h1.rank.compareTo(h2.rank);
      if (rankCompareValue == 0) {
        final c1 = h1.cards;
        final c2 = h2.cards;
        for (var i = 0; i < c1.length; i++) {
          final c1Rank = cardRank[c1[i]] ?? int.parse(c1[i]);
          final c2Rank = cardRank[c2[i]] ?? int.parse(c2[i]);
          final cardRankCompareValue = c1Rank.compareTo(c2Rank);
          if (cardRankCompareValue != 0) {
            return -cardRankCompareValue;
          }
        }
      }

      return rankCompareValue;
    });

  final sortedHands = reversedSortHands.reversed.toList();

  var sum = 0;
  for (var i = 0; i < sortedHands.length; i++) {
    sum += (i + 1) * sortedHands[i].bid;
  }
  return sum;
  //5905
}

int getRank(String hand) {
  final cards = hand.split('');
  final dict = <String, int>{};
  for (var card in cards) {
    if (dict.containsKey(card)) {
      dict[card] = dict[card]! + 1;
    } else {
      dict[card] = 1;
    }
  }
  final jackNumber = dict.remove('J') ?? 0;
  final unsortedKinds = dict.values.toList()..sort();
  final kinds = unsortedKinds.reversed.toList();
  if (jackNumber == 5) {
    kinds.add(5);
  } else {
    kinds[0] += jackNumber;
  }

  if (kinds.length == 1) {
    return 1;
  } else if (kinds.length == 2) {
    if (kinds[0] == 4) {
      return 2;
    } else {
      return 3;
    }
  } else if (kinds.length == 3) {
    if (kinds[0] == 3) {
      return 4;
    } else {
      return 5;
    }
  } else if (kinds.length == 4) {
    return 6;
  } else {
    return 7;
  }
}

class Hand {
  const Hand(
    this.hand,
    this.bid,
    this.rank,
  );

  final String hand;
  final int bid;
  final int rank;

  get cards => hand.split('');
}
