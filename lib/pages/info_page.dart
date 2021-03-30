
import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon_model.dart';
import 'package:pokedex_app/widgets/curve_header.dart';


class InfoPage extends StatelessWidget {
  //const InfoPage({this.pokemon});

  @override
  Widget build(BuildContext context) {
    final Pokemon pokemon = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [_header(context, pokemon), _decription(context, pokemon)],
        ),
      ),
    );
  }

  Widget _header(BuildContext context, Pokemon pokemon) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.49,
      child: Stack(
        children: [
          Container(
            //! Fondo curveado metodo independiente
            //CustomPaint
            height: size.height * 0.45,
            width: size.width,
            //color: Colors.blueAccent,
            child: CustomPaint(
              painter: CurveHeaderPainter(colors: pokemon.colorsRGB),
            ),
          ),
          Positioned(
            //* Pokeball metodo independiente
            top: size.height * 0.16,
            left: size.width * 0.23,
            child: Transform.rotate(
              angle: 11.9,
              child: Container(
                //height: 50,
                width: size.width * 0.55,
                //color: Colors.blue,
                child: Image(
                  image: AssetImage('assets/pokeball.png'),
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            //* Nombre del Pokemon metodo independiente
            top: size.height * 0.096,
            child: Container(
              width: size.width,
              padding: EdgeInsets.symmetric(horizontal: 20),
              //color: Colors.teal,
              child: Text(
                '${pokemon.name} - #${pokemon.order}',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
            ),
          ),
          Positioned(
            //* imagen del Pokemon
            top: 150,
            left: size.width * 0.20,
            child: Container(
              width: size.width * 0.6,
              //height: 50,
              //color: Colors.red,
              child: Hero(
                tag: '${pokemon.name}',
                child: Image(
                  image: NetworkImage(
                      pokemon.sprites.other.officialArtwork.frontDefault),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Container(
              width: size.width,
              height: 50,
              //color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  IconButton(
                      icon: Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        print('Add to Favorites');
                      })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _decription(BuildContext context, Pokemon pokemon) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Type',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Row(
                children: [
                  for (var type in pokemon.types) 
                  (type.slot==pokemon.types.length) 
                  ? Text('${type.type.name}.',style: TextStyle(fontSize: 16))
                  :Text('${type.type.name}, ',style: TextStyle(fontSize: 16))
                ],
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Weight',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Text('${pokemon.weight}', style: TextStyle(fontSize: 16))
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Default Sprite',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Container(
                        width: 85,
                        child: Image(
                            image: NetworkImage(pokemon.sprites.frontDefault))),
                    Container(
                        width: 85,
                        child: Image(
                            image: NetworkImage(pokemon.sprites.backDefault))),
                    Container(
                        width: 85,
                        child: Image(
                            image: NetworkImage(pokemon.sprites.frontShiny))),
                    Container(
                        width: 85,
                        child: Image(
                            image: NetworkImage(pokemon.sprites.backShiny))),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Abilities',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Row(
                children: [
                  for (var ability in pokemon.abilities) 
                  (ability.ability.name==pokemon.abilities.last.ability.name) 
                  ? Text('${ability.ability.name}.',style: TextStyle(fontSize: 16))
                  : Text('${ability.ability.name}, ', style: TextStyle(fontSize: 16))
                ],
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Moves',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              //Container(
              //  color: Colors.blueGrey,
                               Column(
                              
                  children: [
                    _getMoves(pokemon)
                  ],
                ),
              //)
             // Text('${pokemon.moves[0].move.name}',
             //     style: TextStyle(fontSize: 16))
            ],
          ),
        ),
      ],
    );
  }

  Widget _getMoves(Pokemon pokemon) {
   
    var moves = pokemon.moves;
    var concatenate = StringBuffer();

    moves.forEach((move) {
      concatenate.write(
        (move.move.name==moves.last.move.name) 
       ?  "${move.move.name}." 
       : "${move.move.name}, "
      );
     });
     
     return Text(concatenate.toString(),style: TextStyle(fontSize: 16) , textAlign: TextAlign.justify,);
  }
  
  

}
