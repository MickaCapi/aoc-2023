/*

*/
int calculate(String input) {
  return input.split(',').map((e) => hashValue(e)).reduce((v, e) => v + e);
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
