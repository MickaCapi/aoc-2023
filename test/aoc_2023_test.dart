import 'package:aoc_2023/aoc_2023.dart';
import 'package:test/test.dart';

void main() {
  test('patternValue 5', () {
    final input = '''#.##..##.
..#.##.#.
##......#
##......#
..#.##.#.
..##..##.
#.#.##.#.''';

    print(patternValue(input));
  });

  test('patternValue 400', () {
    final input = '''#...##..#
#....#..#
..##..###
#####.##.
#####.##.
..##..###
#....#..#''';

    print(patternValue(input));
  });

  test('patternValue aoc 14', () {
    final input = '''.###....#.###..
...#.##...#.#..
.#.#.#.......##
#######..#..#..
#####.###...#..
##.##......#.##
###.#.##.#...##
#####.#.###....
###..##.####...
....#...#....##
...#.######.#..
.#..#...#.###..
.###.####..#...
..#####........
####...#.#..###
####...#.#..###
..###.#........''';

    print(patternValue(input));
  });

  test('patternValue aoc 8', () {
    final input = '''..##..####..#
#######..####
.####.####.##
#....######..
.####..##..##
#.##.#.##.#.#
...#...##...#''';

    print(patternValue(input));
  });

  test('calculate', () {
    final input = '''#.##..##.
..#.##.#.
##......#
##......#
..#.##.#.
..##..##.
#.#.##.#.

#...##..#
#....#..#
..##..###
#####.##.
#####.##.
..##..###
#....#..#''';

    print(calculate(input));

    // expect(calculate(input), 405);
  });

  test('aoc 2023', () {
    final input = '''.###....#.###..
...#.##...#.#..
.#.#.#.......##
#######..#..#..
#####.###...#..
##.##......#.##
###.#.##.#...##
#####.#.###....
###..##.####...
....#...#....##
...#.######.#..
.#..#...#.###..
.###.####..#...
..#####........
####...#.#..###
####...#.#..###
..###.#........

....#.#..
.######.#
##.......
###.....#
.#.#.#.#.
##.#.#.#.
###.....#
##.......
.######.#
....#.#..
....#.#..

..#...##...#..#
#....####....#.
.##.##..##.##..
..##.####.##...
###.......####.
.###.#..#.###.#
#.###....###.##
....#....#.....
###........####
#.....##.....##
#.....##.....##

.##..##..##....##
#.#.####.#.#..#.#
#..........#..#..
#..##..##..####..
#.#..##..#.####.#
..##....##.#..#.#
.##########.##.##
..#.####.#......#
#.#......#.#..#.#
.##..##..##.##.##
.##########.##.##

..##..####..#
#######..####
.####.####.##
#....######..
.####..##..##
#.##.#.##.#.#
...#...##...#

..####.....
########.##
..#..#...##
.#.##.#..#.
#......#...
.#.##.#.#..
........##.
..#..#.....
.....#.....
#......#..#
#......#..#

..#..#.##
..#..#.##
#...#..#.
##.#..##.
#.##.#.#.
###.#...#
##..#####
.....#..#
.#...#..#
##..#####
###.#...#

###.##.#.##
###.##.####
...#..#.##.
##...##..#.
..###.##.#.
##.#.#..#.#
#########.#
....#.....#
##.#.###.#.
##...##.##.
.......#..#
..########.
##...#.#...

..#.##.#..#.###
#.######.###.##
...........##..
...#..##....###
#........##..##
..#....#...#...
##.####.##...##
.#.####.#.#....
.########....##
###....###...##
...........#...
###########.#..
##########.##..

##.#.#.##..
##.#.#.###.
#..####.##.
#..#####..#
#..#####..#
#..####.##.
##.#.#.###.
##.#.#.##..
..#.#.....#
..#...##.##
.###..##...
.#.###..###
#.#.#...###
.##.#.##...
#.######...
.......####
.##.#.#.#.#

####..###
####..###
##.###...
.#.###.#.
..#..#.#.
..#..#.##
.#.###.#.
##.###...
####..###

####........#
###...####...
###..#....#..
....#......#.
##.###.######
..##...##...#
##...##..##..
#####.####.##
####.######.#

#...#..##
...#.###.
...#..##.
#...#..##
.##..#..#
..#.#..##
.#####..#
..##..#.#
..##..#.#

.#....#
#.#####
#.#...#
.##....
....#..
##..##.
...#.#.
...#.#.
##..##.
....#..
.##....
#.#...#
#.#####
.#.....
.#.....

##.#.#.#...###.
###.#...#..##.#
#.##...##...#.#
..#.##.#....#..
####.####..##.#
####..#....##.#
..##.#.....#.#.
....#..##.#....
###.####...##.#
.....#.##.#...#
..##.#######...
..###....###..#
..###....###..#

####.#.##..
####.######
####.######
####...##..
#######.###
.##...#...#
.##.##..#..
####.##..#.
#..#....###
#####....#.
#..##..#..#
....##....#
####.#..#.#

...#...#..#..
#..#..######.
#..#..######.
...#...#..#..
..##.#......#
.#.###.#..#.#
.##.#..#..#..
...####....##
..#.##......#
.#.##.#.##.#.
##.##..#..#..
.###.#....#.#
.##....#..#..
..#..##....##
#.###...##...
..#..#.####.#
#.####......#

##..#....##
##..##...##
...#...###.
.....##...#
#####.#..#.
##.........
##..##.#..#

....#..........
##.#....##..##.
##.#.#.#..##..#
####.###......#
..##.##..#..#..
##...##.######.
..#.##.#######.

#.####.###.....
##....#..#.#...
.......#..##.##
.....#.#..##.##
##....#..#.#...
#.####.###.....
##...##.###.###
########.#.#.##
....#.######.##
..##.#..#.#####
...####.#.#####

##.####
.#..#..
#####.#
#.###.#
###...#
###...#
#.###.#
.####.#
.#..#..
##.####
##.####
.#..#..
.####.#
#.###.#
###...#

.##...#
#..###.
####...
####...
#..###.
.##...#
##.#.#.
######.
#..#...
####...
.##..#.
#####..
.##...#

....###...##...
..#....#..##..#
...#..#........
#........#..#..
##.####.######.
##########..###
#..#..#..#..#..
##......######.
#.##..##.#..#.#
..#.##.#......#
##.####.##..##.
..#.##.#..##..#
..##..##......#

##...#.
....##.
####..#
...#..#
...#..#
##..##.
###.##.
##.#..#
..#.##.
###.##.
...#..#

...####..
.#.#..#.#
.###..###
..#....#.
##..##..#
##.#..#.#
#..####..
.##....##
#.#.##.#.
.#......#
###....##
.##....##
.#......#
#.#.##.#.
.##....##
#..####..
##.#..#.#

.##..#.######.#..
#..#.###.##.###.#
......##....##...
####.####..####.#
....##.######.##.
....##.#....#.##.
#..##.###..###.##
.##.#....##....#.
#..##..#.##.#..##
####.#.#....#.#.#
.##.##.#.##.#.##.
.......######....
.##...########...
.##..........#...
.##...########...

########..#.##.#.
.##.###..#.######
#...###..###.##.#
#.#.##....#..##..
#..#....##.#.##.#
##.######...#..#.
...#..#....#.##.#
##.#....##...##..
##.#....##...##..

#.###..####
##..##.#...
...#...#.##
.##.#######
#..#..#..##
#.####.....
#...#..##..
....#..#.##
.#.###.....
##..#######
#..#.##....
...#...##..
...#...##..
#.##.##....
##..#######

##..#........
.###.##...##.
....###..####
###.###.#.##.
...#.#....##.
....##.###..#
##.####..####
.##..###.....
#.########..#
#.#.#.#.#.##.
..#...#......
..#...#......
#.#.#.#.#.##.
#.####.###..#
.##..###.....

..###.##.
..#...##.
#.#...##.
..###.##.
#.....##.
.####.##.
.#.#.####
#.#.#....
...######
#...#.##.
#.###.##.
#..#.....
###......
.#.##....
.###.#..#
#..######
.#.######

..........#
##.####.###
.#..##..#..
.##....##.#
####..####.
##..##..###
..#....#..#
#.######.##
#.######.#.
..#....#..#
##..##..###

.###.#..#.#
...#......#
###.######.
##...#.##..
#####.##.##
#.####..###
##..#....#.
##..#....#.
#.####..###

.........#....#.#
#.#..#.##......#.
#......##.####...
#..##..####......
.#....#.#........
#......#....####.
..####....#.#.#.#
#.##.#.##.#####..
.#....#..########
.#.##.#.#.###.#.#
.##..##...####..#
..####...#.#.#..#
.#.##.#..#.###.#.
...##.....#..#.#.
...##.....#..#.#.

.##...###.##.#.
#..###.###..###
....#...#..#.##
....####..#..##
....####.##..##
....#...#..#.##
#..###.###..###
.##...###.##.#.
.##.#...#.#..##
....##..##.##.#
.....#...##.###
.....#....##.##
#####...#.....#
.......#.#..#..
####.#..#.#..##

####...##.#.#
##.#....##..#
##.#....##..#
####...##.#.#
#..#.#..#.##.
......##...##
###.#.#.#.##.
...#...###.#.
#.#..#..####.
###..#..####.
...#...###.#.

..##.##.#.###
.#..#...####.
#.#..##..#...
..##..##..###
..#.##.###..#
.#########..#
.#########..#
..#.##.###..#
..##..##...##
#.#..##..#...
.#..#...####.
..##.##.#.###
..##.##.#.###
.#..#...####.
#.#..##..#...
..##..##...##
..#.##.###..#

.##...####...#.
.##...####...#.
.##....##.#####
#.####...##.#..
.#.#...#...#..#
.##.#.#..#...##
#.##...#....##.
..#.#####.#####
##.######..###.
.##.##...##.###
#.#...#.#....#.
.#..###########
.#....###.####.
.#....###.####.
.#..###########
#.#...#.#....#.
.##..#...##.###

######.#.
######.#.
.####....
#.#..#...
#.##.##.#
.#..#.#..
#.##.#.##

...#.....
#..###...
###.#####
#######..
#######..
###.#####
#..###...
...#.....
#...#.##.
..##.###.
..##..##.
#...#.##.
...#.....
#..###...
###.#####

.###...#.#..##.
.#.#....#.#####
......#....##..
...###.####....
..#.....#....##
#..#.#.#...###.
#..#...#...###.
#.##..##.#..##.
#.##..##.#..##.
#..#...#...###.
#..#.#.#...###.

##..####.
#....#.##
..##..#.#
#.......#
#.##.###.
#....##..
#.##.###.
#.##.###.
#.##.###.
#.##.###.
#....##..

####....#####
.##.####.##..
.#.#....#.#..
#.#.#..#.#.##
.#.#....#.#..
.#.#.##.#.#..
##.#....#.###
#.#.#..#.#.##
..#......#...
##..####..###
####.##.#####
.##########..
.####..####..
.##..##..##..
##..####..###
###....#.####
####....#####

.####..##..####.#
.####..##..####.#
###..##..##..####
..##.##..##.##..#
..###.####.###..#
...#..####..#....
#.#...####...#.#.
#.#..######..#.##
##.#........#.###
#.#.#..##..#.#.##
..#.###..###.##.#
.##############..
.###........###.#
######.##.#######
###..........####

.#..#....#.....
##..#....#..##.
#.#.#....#.#.##
##.###..###.###
###..#..#..###.
#.#.######.#.##
#.#.######.#.##

####..#
.##.##.
....#..
####...
####..#
#####.#
.....##
.....##
####.##

##....#####
.##.###.###
#.#..#.##..
#.####.#.##
..#..#...#.
#.####.##.#
.##..##...#
.#.##.#..#.
.######..#.
.#.##.#....
##.##.###.#
...##...#..
...##...#..

.#..#...#.#.#
.#..#...#.#.#
...#####...##
.######...##.
#.#.##.#.####
.##.##..#####
.##.##..#####
#.#..#.#.####
.######...##.
...#####...##
.#..#...#.#.#

.#.####.#..##..##
#.######.#.#..###
..#.##.#..#....#.
###.##.#####..#..
.###..###...#.#..
#..####..#..##.#.
.#......#.##...#.
#..#..#..#....##.
....##....##..##.
###....###.##.##.
###....###.##.##.
....##....##..##.
#..#..#..#....###
.#......#.##...#.
#..####..#..##.#.

.......#.
..#...###
##....##.
..#.#..#.
#######.#
...##....
###.#.#..
.###....#
###......
##.######
##.#.#.#.
##...##..
...#..#.#
###....##
####.##.#
..#..#.#.
..#..#.#.

##..#.##......###
##.##.##.##.#.#..
..####..###.###..
#......##.###....
...##............
#.####.#..#..####
.#.##.#.######...
##....##.#.#.....
#.####.##....#...

#.######.#.....##
##.#..#.#####...#
.#......#..#.....
..######...##.#.#
##..##..##..###..
..#..#.#....##.##
#.#....#.##...###
.###..###.##..###
#.######.#.###.##
.#.#..#.#...#..#.
....##.....##.#.#
....##.....##.#.#
.#.#..#.#...#..#.
#.######.#.###.##
.###..###.##..###

#.####.##.####.#.
.#.....##.....#.#
.#.....##.....#.#
#.####.##.####.##
##.##..##..##.###
##.#...##...#.##.
..#.##....##.#...
####..####..####.
####.#.##.#.#####
##.....##.....###
....###..###....#
#..#.##..##.#..#.
###.########.###.

..##.##
#..##..
..###.#
##....#
#..#.#.
#..#.#.
##....#
..###..
#..##..
..##.##
..##.##

#....######....
##.##..##..##.#
##.##.####.##.#
.###.#.##.#.###
.###.#.##.#.###
##.##.####.##.#
##.##..##..##.#
#....######....
#.##........##.
#..##......##..
.#.##..##..##.#
#.#..#....#..#.
....#..##..#...
.#...#....#..##
##..###..###..#
..#.###..###.#.
.#####.##.#####

.#..#.#....#.
.#..#.#....#.
.....#####.##
#..####....##
##..#########
#.###..####..
.#......##...

#.#..#..#..#.
#..##....##..
...##....##..
.##..####..##
#.####..####.
#.#..#..#..#.
#.####..####.
...##....##..
##....##....#
.############
..####..####.
#..##....##..
.#.########.#
.##..####..##
..#..#..#..#.

######.#.
.#..#.##.
.####.#..
.####.#..
.#..#.##.
######.##
######..#
#.##.#.##
.####..#.
##..##.#.
.#..#..#.
##..##.#.
.#..#.##.
......##.
##..#####

.....##.##.
....#..####
#####.#.##.
.##.#..##..
.....#..###
####....#..
####.##.#..
....#.#....
....#..#.#.

.###.#..####.#..#
.#.#.#######.#..#
..#.###.###..####
..##.#..##.##.##.
.##....###.##....
.####..##.#######
##.######.###.##.
##...##..#.......
#.#######.#.#.##.
#.#######.#.#.##.
##...##..#.......
##.######.###.##.
.####..##.#######
.##....###.##....
..##....##.##.##.
..#.###.###..####
.#.#.#######.#..#

...##....
#..##..##
..####...
##....###
.##..##..
#.#..#.##
.#.##.#..
#.####.##
..#..#...
#.####.##
#.#..#.##
..####...
##.##.###
.#.##.#..
.########
...##....
.#.##.#..

.##..#.
...#..#
....#..
...#..#
##.##.#
....#.#
....#.#

##.#.####.##..#
########...####
......#.##.....
.#####.###..##.
..###..#...#..#
....##.##.#####
###...#..##....
.#..########..#
....#.#..##....
..##..##.......
..##..##.......
....#.#..##....
.#..########..#
###...#...#....
....##.##.#####

.##.####..#.#
...###...###.
...###...###.
.##.####..#.#
#.#..##..####
...#..#....##
.#.##...##.##
#.#..##.###..
.####..#.#...
#.##.#...#..#
....###..##..
###.#..##..#.
#.#.#..##..#.
....###..##..
#.##.#...#..#
.####..#.#...
#.#..##.###..

.#..#..
#....##
..##...
##.####
#.##.##
.#..#..
#....##

#.###....
#.###....
#.#.###..
##.#..###
..##.#..#
.###.####
#..#####.
#..#####.
.###.####
..##.#..#
##....###
#.#.###..
#.###....

.#..#.#.#
#.##.#...
######.#.
..##..###
##..####.
#.##.#...
.####.#.#
.####.#.#
#.##.#...
##..####.
..##...##

#.#..###...
#.#..###...
###..#.##.#
...##....##
........#.#
.#.##..####
########...
..###.##...
#.####.##..
#.#.#..#...
.#......#.#
###..#.##..
##.###.#.##
.#.###.#.##
###..#.##..

....#.##...
..###.#..##
..###.#..##
.#..#.##...
#...#...###
.##..###...
..#.##.#...

.#....#......
#.####.###..#
#......######
#..##..#.####
##.##.##.####
..####..#....
#......######
.#....#...##.
.#....#......
##.##.####..#
......#......
.######......
.######.#.##.
###..#####..#
#.#..#.#.....
##....####..#
#..##..#.....

...#......#####
#.#####..##..#.
####.#.#..##.#.
..##..####.##.#
#..#.#..#..####
#.#.#.###.##.##
#.#.#.###.##.##
#..#.#..#..####
..##..####.##.#
####.#.#..##.#.
#.#####..##..#.
...#......#####
...#.....######

#.#.###..###.#.##
#...#......#...##
#...#......#...##
#.#.###..###.#.##
.###.#....#.###.#
...#.######.#....
#..#........#..##
...#...##...#....
#.#...####.#.#.#.

##.######.####.##
#.#.#..#.#.##.#.#
##.##..##.####.##
..#......#....#..
#..######..##..##
###.####.######.#
....#..#........#
###..##..#####...
#.##....##.##.##.
##.##..##.####.##
.#........#..#...
##........####...
##..#..#..####..#

##.#...
##.....
#.....#
.####.#
.##.###
..#...#
#.###.#
.##..##
.##..##
#.###.#
..#...#
.##.###
.####.#

##...#.#.##
.#....#....
#.####..##.
#...###.###
##..###.###
#.####..##.
.#....#....
##...#.#.##
##...#.#.##

#....#....##...
..###....####..
..####...####..
#....#....##...
##..#.##.#..#.#
..#...#########
...#####......#
.#.###.########
..#...#..####..
#...#..#..##..#
.#####.##....##
##...#.#......#
....###.#.##.#.

.#..#..#..#
.#..#..#..#
#.########.
...##..##..
####....###
.#.##..##.#
.#..####..#
#####..####
###.#..#.##
##.#.##.#.#
####...####
#.#.####.#.
####.##.###

###..###....#
.#.##.#.#..#.
#.####.######
.######..##..
####.###....#
.#....#.####.
#.#..#.######
##.##.#######
.#....#..##..
..#..#.......
#.#..#.##..##
.######......
..####..####.

.##.##..##.##
###..#..#..##
###..#..#..##
.##.##..##.##
..###.##.###.
##.#.####.#.#
....#.##.#...
.#.#..##..#.#
.#..##..##..#
..#.#####..#.
###.#.##.#.##
..#...##...#.
#..#.####.#..

#..#....#########
#.....######..###
###.#...###....##
###.#...###....##
#.....######..###
#..#....#########
...#..#..#..##..#
#..#.#....#######
..#.#.#.#..####..
#..#..##.#..##..#
...##..##.######.
#..#.#...########
.#.###......##...

##.#...
..#....
..#....
##.....
...#..#
...#..#
..#.##.
##.####
...####
..#.#.#
###..##
###..##
......#

......##.
#..##....
.#...#.##
.###..###
.####....
.####....
.###..###
.##..#.##
#..##....
......##.
......##.

.##.##.#.#.#.####
#..#...###.##....
#..#...###.##....
.##.##.#.#.#.####
.##.#........#...
#..######..###...
.#..###.#..##....
.##.####.###..###
#...#.##..##.....
#.#....#..##.####
..##..#..#####.##
#.#...#...#....##
..#.#.#.#.#......
..#.....######.#.
#.#####.##...####

##.#..#.###.##.
##..##..##...#.
.########...#..
.#.#..#.#.##..#
####..####...##
##..##..###.##.
.#......#.#.##.
..#....#.....##
#.#.##.#.###...
.##.##.##.....#
.##.##.##..#..#
#.#.##.#.###...
..#....#.....##
.#......#.#.##.
##..##..###.##.
####..####...##
.#.#..#.#.##..#

....###
..###.#
...#.#.
###.#.#
....#.#
....#.#
###...#

....##...
...#..#..
##.#..#.#
###....##
..##..##.
###....##
####..###
..##..##.
####..#.#
..######.
..#.##.#.

##..######..###
..##.....####..
..##....######.
.#..#.#...##...
##..####......#
......#.##.###.
#....#.#......#
.......#......#
######.##.##.##
#....#...####..
##..##..#.##.#.
##..##.#.####.#
......####..###

.#..#.##..#
.##.######.
#...#.##...
##..#..#.#.
#.##...##.#
#.###....#.
.....#....#
.....#....#
#.###....#.
#.##...##.#
##..#..#.#.
#...#.##...
.##.######.
.#..#.##...
.#..#.##...
.##.######.
#...#.##...

#.###....###.
#.###....###.
.#....##....#
.#.########.#
..##......##.
.#.#.#..#.#.#
#.####..####.
####.####.###
.#.##.##.##.#
..####..#####
#.#..#..#..#.
.##..####..##
###..####..##
..##......##.
###.#....#.##
###.#.##.#.##
.###......###

####.##....##..
#...###.#######
#...###.#######
####.##....##..
###..###...##..
###..#..##.##.#
...#.#..#.#..#.
.###.#####.##.#
#.###...#.####.
#.###..##.#..#.
#####..##.#..#.
#..##..#..#....
###.#.#.#.#..#.

#.#.###
.##.#..
.####..
#.#.###
###....
##.#...
#......
#####..
.....##
..#.#..
#.#..##

##.##.##.##.##...
.##.#....#.##.###
###.##..##.###.##
###...##...######
##.#..##..#.#####
.##.#.##.#.##.###
#..#.#..#.#...#..
......##.......##
.#....##....#.#..

...###.#.##.#
#..#.##.#####
#.#.###.#.#..
##.#######..#
##..######..#
...##.######.
.#.#...#.#..#
.#.#...#.#..#
...##.######.
##..######..#
##.#######..#

###..####.###
.######..#...
.######..#...
###..####.###
........##.#.
.######.#.##.
.#...##.....#

....####.....
####....####.
....#..#....#
#..######..#.
#..#.##.#..##
..#.#..#.#...
#..##..##..##
....#..#.....
............#
#..#.##.#..##
.##.#..#.##..
####....####.
.##..##..##..

.#.#..###.######.
..####.##..#..#.#
#.#.....####.....
#....#.##.#.....#
###....#..#....##
###....#..#....##
#....#.##.#.....#
#.#.....####.....
..#.##.##..#..#.#
.#.#..###.######.
###......##.#.#..
#######.##..####.
#######.##..####.
###......##.#.#..
.#.#..###.######.
..#.##.##..#..#.#
#.#.....####.....

#..#....#..##
..##....##...
#.#......#.##
.#.##..##.#..
##........###
#..........##
.#.#....#.#..
#.##....##.##
####....#####
.#.#....#.#..
#.#.####.#.##
#..##..##..##
.####..####..
##..#..#...##
...#....#....

.####.##.####.#..
####.####.####...
#.##....#.##.##.#
..#.##..##.#...##
#####....######..
#...#....#...####
..##......##..#.#
###.##..##.###...
###.##..##.###...

..#.#..###.#.
..#.#..###.#.
#####.##....#
.#..##...####
#.#.##.##.#.#
##..#####.#.#
.#..####.#.##
#..#..#.##..#
#..#..#.##..#
##..####.#.##
##..#####.#.#
#.#.##.##.#.#
.#..##...####
#####.##....#
..#.#..###.#.

##.#.#..####.
..##.....#..#
..##.....#..#
##.#.#..####.
.#.######..##
.#.#.#...#.#.
###.#.#####.#
#..##.#.##...
.##.#####.###
#.##.####.#.#
#.##.##.#.#.#
.##.#####.###
#..##.#.##...
###.#.#####.#
.#.#.#...#.#.
.#.######..##
##.#.#..####.

#####.#
......#
.##.#.#
.....##
.##.###
#..#..#
.##....
.####..
####.##
.##.#..
.....#.
#..##..
######.
.....#.
#..#..#
#..#..#
.....#.''';

    print(calculate(input));
  });
}
