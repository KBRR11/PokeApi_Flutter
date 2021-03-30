import 'package:flutter/material.dart';
//import 'package:pokedex_app/helpers/helper.dart';
import 'package:pokedex_app/models/pokemon_model.dart';
//import 'package:pokedex_app/pages/info_page.dart';
import 'package:pokedex_app/services/poke_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _PonerFondo(),
        _PonerTitulo(),
        _ContenidoPokemon(),
      ],
    ));
  }
}

class _ContenidoPokemon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pokemonService = Provider.of<PokeService>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 80, left: 20, right: 20),
      
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1.4,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15),
          physics: BouncingScrollPhysics(),
          itemCount: pokemonService.pokemons.length,
          itemBuilder: (BuildContext context, int index) {
            final pokemon = pokemonService.pokemons[index];
            return GestureDetector(
              onTap: ()async{
              //final pokemonService = Provider.of<PokeService>(context, listen: false);
              // print(pokemon.name);
              //navegarFadeIn(context, InfoPage());
              
              Navigator.pushNamed(context, 'info', arguments: pokemon);
              },
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(pokemon.colorsRGB[0], pokemon.colorsRGB[1], pokemon.colorsRGB[2], 1),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  _pokeball(),
                  _name(pokemon),
                  _imageOfPokemon(pokemon)
                ],
              ),
            );
          }),
    );
  }

  Widget _imageOfPokemon(Pokemon pokemon) {
    return Positioned(
      top: 13,
      left: 50,
          child: Container(
        width: 110,
        height: 110,
        child: Hero(tag: '${pokemon.name}',
        child: Image(image: NetworkImage(pokemon.sprites.other.officialArtwork.frontDefault))),
      ),
    );
  }

  Widget _name(Pokemon pokemon){
    return Positioned(
      top: 19,
      left: 10,
          child: Container(
      child: Text(pokemon.name , style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20,))
      ),
    );
  }

  Widget _pokeball() {
    return Positioned(
      top: 25,
      left: 70,
      child: Opacity(
        opacity: 0.9,
        child: Transform.rotate(
          angle: 11.9,
          child: Container(
            width: 110,
            height: 110,
            child: Image(
              image: AssetImage('assets/pokeball.png'),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}


class _PonerTitulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          height: MediaQuery.of(context).size.height,
          //margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          width: MediaQuery.of(context).size.width,
          child: Text('Pokédex',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30))),
    );
  }
}

class _PonerFondo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height * -0.12,
      right: size.width * -0.19,
      child: Transform.rotate(
        angle: 11.9,
        child: Opacity(
          opacity: 0.3,
          child: Container(
            width: size.width * 0.7,
            child: Image(
              image: AssetImage('assets/pokeball.png'),
            ),
          ),
        ),
      ),
    );
  }
}
