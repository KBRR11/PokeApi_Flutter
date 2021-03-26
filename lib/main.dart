import 'package:flutter/material.dart';
import 'package:pokedex_app/pages/home_page.dart';
import 'package:pokedex_app/services/poke_service.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (BuildContext context) => PokeService(),)
          ],
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokédex App',
        initialRoute: 'home',
        routes: {
          'home':(_) => HomePage() 
        },
      ),
    );
  }
}