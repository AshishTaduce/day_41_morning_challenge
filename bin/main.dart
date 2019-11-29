// Part 1
// Tower of Hanoi - 3 Moves
// Write a function which will check win in 3 moves, use the code you wrote yesterday

// Part 2
// Tower of Hanoi - N Moves
// Write a function which will check win in N moves for a given state of Tower of Hanoi
// The function will take an additional parameter 'n' (number of moves)


// Stretch: Show all moves which lead to win, given a state.
List<List<List<int>>> possibleMoves(List<List<int>> input){
  List<List<List<int>>> result = [];

  for(int i = 0; i< input.length; i++){
    for(int j = 0; j< input.length; j++){
      if(validMove(input, i, j)){
        List<List<int>> copy=[];
        for (List<int> columns in input){
          copy.add(List.from(columns));
        }
        copy[j].insert(0, input[i][0]);
        copy[i].remove(input[i][0]);
        result.add(copy);
      }
    }
  }
  //print('after func $input = input  || $copy = copy');
  return result;
}


List<List<int>> winInOneMove(List<List<int>> currentInput){
  for(List<List<int>> move in possibleMoves(currentInput)){
    if(move[0].isEmpty && move[1].isEmpty){
      return move;
    }
  }
  return null;
}


List<List<int>> winInTwoMove(List<List<int>> currentInput){

  for(List<List<int>> move in (possibleMoves(currentInput))){
    print(move);
    if(winInOneMove(move) != null){
      return move;
    }
  }
  return null;
}


List<List<int>> winInThreeMove(List<List<int>> currentInput){

  for(List<List<int>> move in (possibleMoves(currentInput))){
    if(winInTwoMove(move) != null){
      return move;
    }
  }
  return null;
}


List<List<int>> winInNMoves(List<List<int>> currentInput, int n){
  //print(currentInput);
//  if(n == 1){
//  }

  List<List<List<int>>> listOfMoves = possibleMoves(currentInput);

  for(List moves in listOfMoves){
    if (n != 1) {
      if(winInNMoves(moves, n - 1) !=null){
        return moves;
      };
    }
    else{
      return(winInOneMove(currentInput));

    }
  }
  return null;
}

void printMoves(List<List<int>> currentInput, int n){
  for(int i = 0; i < n; n--){
   print(winInNMoves(currentInput, n));
   currentInput = winInNMoves(currentInput, n);
  }}

bool validMove(List<List<int>> input, int from, int to){
  if(input[from].isEmpty) return false;
  //print('to = $to & from = $from');
  return(input[to].isEmpty || input[to].first > input[from].first);
}


main() {
  printMoves([[1,2,3,4],[],[]], 15);
}
