
import 'package:flutter/material.dart';
import 'package:xogame/ButtonBoard.dart';

class GameBoard extends StatefulWidget{
  static const String routName ='GameBoard';
  @override
  State<GameBoard> createState() => _GameBoardState();
}
class _GameBoardState extends State<GameBoard> {
  List<String>BorderText=['','','','','','','','',''];
  int Player1Score = 0;
  int Player2Score = 0;
  @override
  Widget build(BuildContext context) {
    BmArgs args =ModalRoute.of(context)?.settings.arguments as BmArgs;
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        title: Text('X-O game',textAlign: TextAlign.center,),
      ),
      body: Column(
        children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.face,size: 80 ,color: Colors.black,),
                      Text('${args.Playerr1Name}',style: Theme.of(context).textTheme.headline3,),
                      Text('$Player1Score',style: Theme.of(context).textTheme.headline3,),

                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.face,size: 80,color: Colors.black,),
                      Text('${args.Playerr2Name}',style: Theme.of(context).textTheme.headline3,),
                      Text('$Player2Score',style: Theme.of(context).textTheme.headline3,),

                    ],
                  ),
                ],
              ),
            ),

          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ButtonBoard(BorderText[0],0,onBtnClick),
                  ButtonBoard(BorderText[1],1,onBtnClick),
                  ButtonBoard(BorderText[2],2,onBtnClick),
                ],
              ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ButtonBoard(BorderText[3],3,onBtnClick),
                ButtonBoard(BorderText[4],4,onBtnClick),
                ButtonBoard(BorderText[5],5,onBtnClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ButtonBoard(BorderText[6],6,onBtnClick),
                ButtonBoard(BorderText[7],7,onBtnClick),
                ButtonBoard(BorderText[8],8,onBtnClick),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int Counter = 0;
  void onBtnClick (int index){
    if(BorderText[index].isNotEmpty){
      return;
    }
    if (Counter %2==0){
      BorderText[index]='X';
      Player1Score+=1;
    }else{
      BorderText[index]='O';
      Player2Score+=1;
    }
    Counter++;
    if(checkWinner('X')){
      Player1Score+=100;
      cleraBoard();
     //showindialog('achieved $Player1Score points');
    }else if(checkWinner('O')){
      Player2Score+=100;
      cleraBoard();
      //showindialog('achieved $Player2Score points');
    }
    else if(Counter==9){
      cleraBoard();
    }
    setState(() {

    });
  }
  bool checkWinner(String symbole){
    //Row
     if (BorderText[0]==BorderText[1] && BorderText[0]==BorderText[2] &&BorderText[0]!=''){
        showindialog(BorderText[0]);
        return true;
     }
     if (BorderText[3]==BorderText[4] && BorderText[3]==BorderText[5] &&BorderText[3]!=''){
       showindialog(BorderText[3]);
       return true;
     }
     if (BorderText[6]==BorderText[7] && BorderText[6]==BorderText[8] &&BorderText[6]!=''){
       showindialog(BorderText[6]);
       return true;
     }
    //Columns
     if (BorderText[0]==BorderText[3] && BorderText[0]==BorderText[6] &&BorderText[0]!=''){
       showindialog(BorderText[0]);
       return true;
     }
     if (BorderText[1]==BorderText[4] && BorderText[1]==BorderText[7] &&BorderText[1]!=''){
       showindialog(BorderText[1]);
       return true;
     }
     if (BorderText[2]==BorderText[5] && BorderText[2]==BorderText[8] &&BorderText[2]!=''){
       showindialog(BorderText[2]);
       return true;
     }
    //X
    if (BorderText[0]==BorderText[4] && BorderText[0]==BorderText[8] &&BorderText[0]!=''){
      showindialog(BorderText[0]);
      return true;
    }
    if (BorderText[2]==BorderText[4] && BorderText[2]==BorderText[6] &&BorderText[2]!=''){
      showindialog(BorderText[2]);
      return true;
    }
    return false;
  }
  void cleraBoard (){

    setState(() {
      BorderText=['','','','','','','','',''];

    });
    Counter=0;
  }
  void showindialog(String Winner){
    showDialog(context: context,
        builder: (BuildContext context){
      return AlertDialog(
        title: Text('Winner is :' +Winner , style: TextStyle(fontSize: 35),),
      );

        }
    );
  }
}
class BmArgs {
  String Playerr1Name='';
  String Playerr2Name='';
  BmArgs({required this.Playerr1Name,required this.Playerr2Name});
}