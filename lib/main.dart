import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

// Stateless widget is immutable so, as the dice image needs to be updated dynmaically, satefull widget used
class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  // Statically typed prog. lang. -> cannot assign var of one type to another
  // Benificial for safty of application
  // dynamic variable can be used by 'dynamic' keyword -> dynamic a = 1;
  // if, var a; is just declared and not defined, it is automatically assigned the dynamic datatype
  // generally not recommonded to use dynamic as it removes benefits of a type safe language. so, use specific datatypes like String, int, double, etc.
  int leftValue = 1;
  int rightValue = 1;

  @override
  Widget build(BuildContext context) {
    void change() {
      // setState method used in stateful widgets to update or change values.
      // when this method is called, the entire page is not reloaded, the contents of this method are marked
      // these marked values are checked in the widget and only the places in wich they are used are updated
      // in this case, only the Image.asset is reloaded
      setState(() {
        // Using the Random class from the dart math library
        // The func. next int takes 1 arg. which is max no. so, nextInt(6) will display 0-5 as images named dice1-6 1 is added
        leftValue = Random().nextInt(6) + 1;
        rightValue = Random().nextInt(6) + 1;
      });
    }

    return Center(
      child: Row(
        children: <Widget>[
          // Used to create a child of row or column which expands according to screen
          Expanded(
            flex: 1,
            // Children expandex based on flex factor.(Used to set ratio to other children)
            // by default set to 1(equally divided)
            child: FlatButton(
              // Simple button used to wrap the image.
              padding: EdgeInsets.all(16.0),
              // Directly insert asset image, rather than creating an Image object and specifying type of image
              child: Image.asset('images/dice$leftValue.png'),
              // onpressed property to provide fuctionality to button
              // void callback function returns no value and takes no argument
              onPressed: () {
                change();
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              padding: EdgeInsets.all(16.0),
              child: Image.asset('images/dice$rightValue.png'),
              onPressed: () {
                change();
              },
            ),
          )
        ],
      ),
    );
  }
}
