/*

*/
import 'dart:collection';

int calculate(String input) {
  var d = <int, LinkedHashMap<String, int>>{};
  input.split(',').forEach((e) {
    if (e.contains('=')) {
      final labelLens = e.split('=');
      final label = labelLens[0];
      final boxNumber = hashValue(label);
      final lens = int.parse(labelLens[1]);

      final LinkedHashMap<String, int> map =
          // ignore: prefer_collection_literals
          d[boxNumber] ?? LinkedHashMap<String, int>();
      d.addAll({
        boxNumber: map..addAll({label: lens})
      });
    } else {
      final label = e.substring(0, e.length - 1);
      final boxNumber = hashValue(label);

      d[boxNumber]?.remove(label);
    }
    //print(d);
  });

  return d.entries.fold(0, (v, e) {
    var focusingPower = 0;
    final values = e.value.values.toList();
    for (var i = 0; i < values.length; i++) {
      final lens = values[i];
      focusingPower += (e.key + 1) * (i + 1) * lens;
    }
    return v + focusingPower;
  });
}

/*
Determine the ASCII code for the current character of the string.
Increase the current value by the ASCII code you just determined.
Set the current value to itself multiplied by 17.
Set the current value to the remainder of dividing itself by 256.
*/
int hashValue(String input) {
  var hashValue = 0;
  for (var codeUnit in input.codeUnits) {
    hashValue += codeUnit;
    hashValue *= 17;
    hashValue %= 256;
  }
  return hashValue;
}
