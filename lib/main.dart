import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (context) => Data(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar( title: MyText()),
          body: Level1(),
        ),
      ),
    );
  }
}

class Level1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Level2())
    ;
  }
}

class Level2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextFeild(),
        Level3(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context).data);
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<Data>(context, listen: false).data);
  }
}

class MyTextFeild extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final myData = Provider.of<Data>(context);
    return TextField(
      onChanged: (newText){
        myData.changeString(newText);
      },
    );
  }
}

class Data extends ChangeNotifier{
  String data = "some dataa";

  void changeString(String newString){

    data = newString;
    notifyListeners();
  }
}





