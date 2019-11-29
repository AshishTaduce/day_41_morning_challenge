import 'package:test/test.dart';
import '../bin/main.dart';

void main() {
  test('Test Case 1', () {
//    expect(winInTwoMove([[1],[2],[3,4]]), [[1], [2], [3, 4]]);
//    expect(winInOneMove([[1],[2],[3,4]]), null);
//    expect(winInOneMove([[1],[],[2,3,4]]), [[1], [], [2, 3, 4]]);
//    expect(winInTwoMove([[1],[],[2,3,4]]), null);
    expect(winInNMoves([[1,2,3,4],[],[]], 15), [[2,3,4],[1],[]]);
    expect(winInNMoves([[2,3,4],[1],[]], 14), [[3,4],[1],[2]]);
    //expect(winInNMoves([[1,2,3,4,5,6],[],[]], 63), [[2,3,4,5,6],[1],[]]);
  });
}
