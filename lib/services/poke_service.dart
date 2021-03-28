import 'package:color_thief_flutter/color_thief_flutter.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:pokedex_app/models/pokemon_model.dart';

class PokeService extends ChangeNotifier {
  final int _contador = 20;
  final List<Pokemon> pokemons = List();

  final _dio = new Dio();
  final _baseUrl = 'https://pokeapi.co/api/v2';

  fetchPokemon() async {
    //  if (pokemons.length <= 0) {
    for (var i = 1; i <= _contador; i++) {
      await getPokemon(i);
    }
    // } else {
    //   for (var i = (pokemons.length+1); i < count; i++) {
    //
    //   }
    // }
  }

  Future<List<Pokemon>> getPokemon(int id) async {
    final url = '$_baseUrl/pokemon';

    final resp = await _dio.get('$url/$id');
    final data = Pokemon.fromJson(resp.data);

    await getColors(data.sprites.other.officialArtwork.frontDefault, data);

    pokemons.add(data);
    //print(pokemons.length);

    return pokemons;
  }

  Future getColors(String urlPhoto, Pokemon data) async {
    await getColorFromUrl(urlPhoto).then((color) {
      final colors = color.toString();
      final coloresRGB = colors.split(",");
      final int r = int.parse(coloresRGB[0].trim().split("[")[1]);
      final int g = int.parse(coloresRGB[1].trim());
      final int b = int.parse(coloresRGB[2].trim().split("]")[0]);

      data.colorsRGB = [r, g, b];
    });
  }
}
