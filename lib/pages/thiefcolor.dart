import 'package:color_thief_flutter/color_thief_flutter.dart';
import 'package:flutter/material.dart';

class ThiefColorTest extends StatefulWidget {
 // const ThiefColorTest({Key key}) : super(key: key);

  @override
  _ThiefColorTestState createState() => _ThiefColorTestState();
}

class _ThiefColorTestState extends State<ThiefColorTest> {
   dynamic colorImage ;
   @override
   void initState() { 
     super.initState();
     obtenerColor();
   }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
    body: Center(
      child: Text('Color: $colorImage'),
    )
    );
  }

 void obtenerColor(){
    getColorFromUrl('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png').then((color) {
  print(color); // [R,G,B]
  final colors= color.toString();
  final coloresRGB = colors.split(",");
 
  print(coloresRGB[0].trim().split("[")[0]);
  print(coloresRGB[1].trim());
  print(coloresRGB[2].trim().split("]")[0]);
  setState(() {
    this.colorImage = color;
  });
});
  }
}