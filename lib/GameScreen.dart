import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late List<String> occupied;
  late String currentPlayer = "X";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeGame();
  }

  void initializeGame() {
    occupied = ["", "", "", "", "", "", "", "", ""];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Tic Tac Toe"),
        Text("Player $currentPlayer turn"),
        Container(
          width: 300,
          height: 600,
          margin: EdgeInsets.all(8),
          child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, int index) {
                return InkWell(
                    onTap: () {
                      setState(() {
                        occupied[index] = currentPlayer;
                        if (currentPlayer == "X")
                          currentPlayer = "O";
                        else
                          currentPlayer = "X";
                      });
                    },
                    child: Container(
                        margin: EdgeInsets.all(2),
                        color: Color.fromRGBO(86, 86, 86, 1),
                        child: Center(
                            child: Text(
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28,
                                    color: Color.fromARGB(255, 247, 247, 247)),
                                occupied[index]))));
              }),
        )
      ],
    );
  }
}
