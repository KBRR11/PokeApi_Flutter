

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:pokedex_app/models/pokemon_model.dart';

class PokeService extends ChangeNotifier {

  final int _contador = 30;
  final List<Pokemon> pokemons = List();
  

  final _dio = new Dio();
  final _baseUrl = 'https://pokeapi.co/api/v2';


  fetchPokemon() async{
    for (var i = 1; i < _contador; i++) {
      
      await getPokemon(i);
    }
  }

  Future<List<Pokemon>> getPokemon(int id) async{
     final url = '$_baseUrl/pokemon';
 

     final resp = await _dio.get('$url/$id');
     final data = Pokemon.fromJson(resp.data);
     print(data.name);
     pokemons.add(data);
   
   return pokemons;

  }

}