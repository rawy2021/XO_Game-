import 'package:flutter/material.dart';

class ButtonBoard extends StatelessWidget{
  String text;
  Function onBtnClickCallBack;
  int index;
  ButtonBoard(this.text,this.index,this.onBtnClickCallBack);
  @override
  Widget build(BuildContext context) {
    return    Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2,horizontal: 2),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 2),

          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey[300]),

            ),
              onPressed: (){
                onBtnClickCallBack (index);
              },
              child: Text(text,style: Theme.of(context).textTheme.headline1),),
        ),
      ),
    );
  }
}