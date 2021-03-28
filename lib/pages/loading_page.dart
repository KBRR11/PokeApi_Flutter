import 'package:flutter/material.dart';
import 'package:pokedex_app/services/poke_service.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatefulWidget {
  // const LoadingPage({Key key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
    void initState() { 
      super.initState();
      _cargarPokemons();
    }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body: Stack(
      children: [_fondo(context), _title(context), _loading(context)],
    ));
  }

  Widget _fondo(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.red[700],
    );
  }

  Widget _title(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      margin: EdgeInsets.symmetric(vertical: size.height * 0.15),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Image(
        image: AssetImage('assets/titlepoke.png'),
      ),
    );
  }

  Widget _loading(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height * .5,
      child: Column(
        children: [
          Container(
           // color: Colors.yellow,
            width: size.width,
            child: Image(
              image: AssetImage('assets/pokeballgif.gif'),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            child: Text('Please wait...', style: TextStyle(color: Colors.white, fontSize: 20),),
          )
        ],
      ),
    );
  }

  void _cargarPokemons() async{
    final pokemonService = Provider.of<PokeService>(context, listen: false);
    if(pokemonService.pokemons.length==0){
     await pokemonService.fetchPokemon();
     Navigator.pushReplacementNamed(context, 'home');
    }else{
      Navigator.pushReplacementNamed(context, 'home');
    }
  }
}
