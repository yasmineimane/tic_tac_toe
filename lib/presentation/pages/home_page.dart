import 'package:flutter/material.dart';
import 'package:tic_tac_to/presentation/pages/login_screen.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  String player1;
  String player2;
  HomePage({super.key, required this.player1, required this.player2});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  bool oTurn = true;
  String resultDeclaration = '';
  String playerX = playerXcontroler.text;
  String playerO = playerOcontroler.text;
  int oScore = 0;
  int xScore = 0;
  int filedBoxes = 0;
  bool winnerFound = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        playerX,
                        style: const TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'Pangolin',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        xScore.toString(),
                        style: const TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'Pangolin',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 33.0,
                  ),
                  Column(
                    children: [
                      Text(
                        playerO,
                        style: const TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'Pangolin',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        oScore.toString(),
                        style: const TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'Pangolin',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            width: 5,
                            color: Colors.black,
                          ),
                          color: Colors.pink[400],
                        ),
                        child: Center(
                          child: Text(
                            displayXO[index],
                            style: const TextStyle(
                              fontSize: 65.0,
                              fontFamily: 'Pangolin',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[200],
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 16.0,
                    ),
                  ),
                  onPressed: () {
                    _showConfirmDialog();
                  },
                  child: const Text(
                    'Resset',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontFamily: 'Pangolin',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (oTurn && displayXO[index] == '') {
        displayXO[index] = 'O';
        filedBoxes++;
      } else if (!oTurn && displayXO[index] == '') {
        displayXO[index] = 'X';
        filedBoxes++;
      }

      oTurn = !oTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      setState(() {
        _updateScore(displayXO[0]);
        _showDialog(displayXO[0]);
      });
    }
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      setState(() {
        _updateScore(displayXO[3]);
        _showDialog(displayXO[3]);
      });
    }
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      setState(() {
        _updateScore(displayXO[6]);
        _showDialog(displayXO[6]);
      });
    }
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      setState(() {
        _updateScore(displayXO[0]);
        _showDialog(displayXO[0]);
      });
    }
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      setState(() {
        _updateScore(displayXO[1]);
        _showDialog(displayXO[1]);
      });
    }
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      setState(() {
        _updateScore(displayXO[2]);
        _showDialog(displayXO[2]);
      });
    }
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      setState(() {
        _updateScore(displayXO[0]);
        _showDialog(displayXO[0]);
      });
    }
    if (displayXO[6] == displayXO[4] &&
        displayXO[6] == displayXO[2] &&
        displayXO[6] != '') {
      setState(() {
        _updateScore(displayXO[6]);
        _showDialog(displayXO[6]);
      });
    }
    if (filedBoxes == 9) {
      setState(() {
        resultDeclaration = 'No winner';
        _showDialog(resultDeclaration);
        _updateScore(resultDeclaration);
      });
    }
  }

  void _updateScore(String winner) {
    if (winner == 'X') {
      xScore += 3;
    } else if (winner == 'O') {
      oScore += 3;
    } else {
      xScore++;
      oScore++;
    }
    winnerFound = true;
  }

  void _showDialog(String winner) {
    if (winner == 'X') {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(20.0),
              ),
              title: Text(
                'Winner is $playerX',
                style: TextStyle(
                  color: Colors.red[300],
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    _clearBoard();
                    Navigator.pop(context);
                  },
                  child: const Text('Play Again'),
                ),
              ],
            );
          });
    } else if (winner == 'O') {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(20.0),
              ),
              title: Text(
                'Winner is $playerO',
                style: TextStyle(
                  color: Colors.red[300],
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    _clearBoard();
                    Navigator.pop(context);
                  },
                  child: const Text('Play Again'),
                ),
              ],
            );
          });
    }
    if (winner != 'O' && winner != 'X') {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(20.0),
              ),
              title: Text(
                'No Body Wins',
                style: TextStyle(
                  color: Colors.red[300],
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    _clearBoard();
                    Navigator.pop(context);
                  },
                  child: const Text('Play Again'),
                ),
              ],
            );
          });
    }
  }

  void _clearBoard() {
    setState(() {
      for (var i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
      resultDeclaration = '';
    });
    filedBoxes = 0;
  }

  void _showConfirmDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            title: Text(
              'Are U Sure U want To Resset the Game!!',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.red[300],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  _clearBoard();
                  Navigator.pop(context);
                  oScore = 0;
                  xScore = 0;
                },
                child: const Text('YES'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('NO'),
              ),
            ],
          );
        });
  }
}
