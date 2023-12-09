/*
0 3 6 9 12 15
1 3 6 10 15 21
10 13 16 21 30 45
*/
int calculate(String input) {
  return input.split('\n').map((e) {
    return RegExp(r'-*\d+')
        .allMatches(e)
        .map((e) => int.parse(e.group(0)!))
        .toList();
  }).map((e) {
    return diffLists(e)
        .fold(0, (previousValue, element) => previousValue + element.last);
  }).reduce((value, element) => value + element);
}

List<List<int>> diffLists(List<int> list) {
  final lists = <List<int>>[list];

  var currentDiffList = diffList(list);
  while (!currentDiffList.every((element) => element == 0)) {
    lists.add(currentDiffList);
    currentDiffList = diffList(currentDiffList);
  }
  lists.add(currentDiffList);
  return lists;
}

List<int> diffList(List<int> list) {
  final diffList = <int>[];
  for (var i = 0; i < list.length - 1; i++) {
    diffList.add(list[i + 1] - list[i]);
  }
  return diffList;
}
