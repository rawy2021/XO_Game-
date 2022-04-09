import 'package:flutter/material.dart';
import 'package:xogame/GameBoard.dart';

class LoginScreen extends StatelessWidget{
  static const String routeName ='Login';
  String player1Name='';
  String player2Name='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
            decoration: InputDecoration(
            labelText: ('Player 1 Name'),
        ),
              onChanged: (Text){
              player1Name = Text;
              print(player1Name);
              },
        ),
            TextField(
        decoration: InputDecoration(
        labelText: ('Player 2 Name'),
        ),
              onChanged: (Text){
          player2Name =Text;
          print(player2Name);
              },
        ),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey[400]),
                ),
                onPressed: (){
              Navigator.pushNamed(context,GameBoard.routName ,arguments: BmArgs(Playerr1Name: player1Name, Playerr2Name: player2Name));
            }, child: Text("lts Play",style: Theme.of(context).textTheme.headline2,)
            )


          ],
        ),
      ),

    );
  }
}