// To parse this JSON data, do
//
//     final pokemon = pokemonFromJson(jsonString);

import 'dart:convert';

Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));

String pokemonToJson(Pokemon data) => json.encode(data.toJson());

class Pokemon {
    Pokemon({
        this.abilities,
        this.baseExperience,
        this.forms,
        this.gameIndices,
        this.height,
        this.heldItems,
        this.id,
        this.isDefault,
        this.locationAreaEncounters,
        this.moves,
        this.name,
        this.order,
        this.pastTypes,
        this.species,
        this.sprites,
        this.stats,
        this.types,
        this.weight,
    });

    List<Ability> abilities;
    int baseExperience;
    List<Species> forms;
    List<GameIndex> gameIndices;
    int height;
    List<dynamic> heldItems;
    int id;
    bool isDefault;
    String locationAreaEncounters;
    List<Move> moves;
    String name;
    int order;
    List<dynamic> pastTypes;
    Species species;
    Sprites sprites;
    List<Stat> stats;
    List<Type> types;
    int weight;

    factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        abilities: List<Ability>.from(json["abilities"].map((x) => Ability.fromJson(x))),
        baseExperience: json["base_experience"],
        forms: List<Species>.from(json["forms"].map((x) => Species.fromJson(x))),
        gameIndices: List<GameIndex>.from(json["game_indices"].map((x) => GameIndex.fromJson(x))),
        height: json["height"],
        heldItems: List<dynamic>.from(json["held_items"].map((x) => x)),
        id: json["id"],
        isDefault: json["is_default"],
        locationAreaEncounters: json["location_area_encounters"],
        moves: List<Move>.from(json["moves"].map((x) => Move.fromJson(x))),
        name: json["name"],
        order: json["order"],
        pastTypes: List<dynamic>.from(json["past_types"].map((x) => x)),
        species: Species.fromJson(json["species"]),
        sprites: Sprites.fromJson(json["sprites"]),
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
        weight: json["weight"],
    );

    Map<String, dynamic> toJson() => {
        "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
        "base_experience": baseExperience,
        "forms": List<dynamic>.from(forms.map((x) => x.toJson())),
        "game_indices": List<dynamic>.from(gameIndices.map((x) => x.toJson())),
        "height": height,
        "held_items": List<dynamic>.from(heldItems.map((x) => x)),
        "id": id,
        "is_default": isDefault,
        "location_area_encounters": locationAreaEncounters,
        "moves": List<dynamic>.from(moves.map((x) => x.toJson())),
        "name": name,
        "order": order,
        "past_types": List<dynamic>.from(pastTypes.map((x) => x)),
        "species": species.toJson(),
        "sprites": sprites.toJson(),
        "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
        "weight": weight,
    };
}

class Ability {
    Ability({
        this.ability,
        this.isHidden,
        this.slot,
    });

    Species ability;
    bool isHidden;
    int slot;

    factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability: Species.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
    );

    Map<String, dynamic> toJson() => {
        "ability": ability.toJson(),
        "is_hidden": isHidden,
        "slot": slot,
    };
}

class Species {
    Species({
        this.name,
        this.url,
    });

    String name;
    String url;

    factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}

class GameIndex {
    GameIndex({
        this.gameIndex,
        this.version,
    });

    int gameIndex;
    Species version;

    factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"],
        version: Species.fromJson(json["version"]),
    );

    Map<String, dynamic> toJson() => {
        "game_index": gameIndex,
        "version": version.toJson(),
    };
}

class Move {
    Move({
        this.move,
        this.versionGroupDetails,
    });

    Species move;
    List<VersionGroupDetail> versionGroupDetails;

    factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: Species.fromJson(json["move"]),
        versionGroupDetails: List<VersionGroupDetail>.from(json["version_group_details"].map((x) => VersionGroupDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "move": move.toJson(),
        "version_group_details": List<dynamic>.from(versionGroupDetails.map((x) => x.toJson())),
    };
}

class VersionGroupDetail {
    VersionGroupDetail({
        this.levelLearnedAt,
        this.moveLearnMethod,
        this.versionGroup,
    });

    int levelLearnedAt;
    Species moveLearnMethod;
    Species versionGroup;

    factory VersionGroupDetail.fromJson(Map<String, dynamic> json) => VersionGroupDetail(
        levelLearnedAt: json["level_learned_at"],
        moveLearnMethod: Species.fromJson(json["move_learn_method"]),
        versionGroup: Species.fromJson(json["version_group"]),
    );

    Map<String, dynamic> toJson() => {
        "level_learned_at": levelLearnedAt,
        "move_learn_method": moveLearnMethod.toJson(),
        "version_group": versionGroup.toJson(),
    };
}

class GenerationV {
    GenerationV({
        this.blackWhite,
    });

    Sprites blackWhite;

    factory GenerationV.fromJson(Map<String, dynamic> json) => GenerationV(
        blackWhite: Sprites.fromJson(json["black-white"]),
    );

    Map<String, dynamic> toJson() => {
        "black-white": blackWhite.toJson(),
    };
}

class GenerationIv {
    GenerationIv({
        this.diamondPearl,
        this.heartgoldSoulsilver,
        this.platinum,
    });

    Sprites diamondPearl;
    Sprites heartgoldSoulsilver;
    Sprites platinum;

    factory GenerationIv.fromJson(Map<String, dynamic> json) => GenerationIv(
        diamondPearl: Sprites.fromJson(json["diamond-pearl"]),
        heartgoldSoulsilver: Sprites.fromJson(json["heartgold-soulsilver"]),
        platinum: Sprites.fromJson(json["platinum"]),
    );

    Map<String, dynamic> toJson() => {
        "diamond-pearl": diamondPearl.toJson(),
        "heartgold-soulsilver": heartgoldSoulsilver.toJson(),
        "platinum": platinum.toJson(),
    };
}

class Versions {
    Versions({
        this.generationI,
        this.generationIi,
        this.generationIii,
        this.generationIv,
        this.generationV,
        this.generationVi,
        this.generationVii,
        this.generationViii,
    });

    GenerationI generationI;
    GenerationIi generationIi;
    GenerationIii generationIii;
    GenerationIv generationIv;
    GenerationV generationV;
    Map<String, GenerationVi> generationVi;
    GenerationVii generationVii;
    GenerationViii generationViii;

    factory Versions.fromJson(Map<String, dynamic> json) => Versions(
        generationI: GenerationI.fromJson(json["generation-i"]),
        generationIi: GenerationIi.fromJson(json["generation-ii"]),
        generationIii: GenerationIii.fromJson(json["generation-iii"]),
        generationIv: GenerationIv.fromJson(json["generation-iv"]),
        generationV: GenerationV.fromJson(json["generation-v"]),
        generationVi: Map.from(json["generation-vi"]).map((k, v) => MapEntry<String, GenerationVi>(k, GenerationVi.fromJson(v))),
        generationVii: GenerationVii.fromJson(json["generation-vii"]),
        generationViii: GenerationViii.fromJson(json["generation-viii"]),
    );

    Map<String, dynamic> toJson() => {
        "generation-i": generationI.toJson(),
        "generation-ii": generationIi.toJson(),
        "generation-iii": generationIii.toJson(),
        "generation-iv": generationIv.toJson(),
        "generation-v": generationV.toJson(),
        "generation-vi": Map.from(generationVi).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "generation-vii": generationVii.toJson(),
        "generation-viii": generationViii.toJson(),
    };
}

class Sprites {
    Sprites({
        this.backDefault,
        this.backFemale,
        this.backShiny,
        this.backShinyFemale,
        this.frontDefault,
        this.frontFemale,
        this.frontShiny,
        this.frontShinyFemale,
        this.other,
        this.versions,
        this.animated,
    });

    String backDefault;
    dynamic backFemale;
    String backShiny;
    dynamic backShinyFemale;
    String frontDefault;
    dynamic frontFemale;
    String frontShiny;
    dynamic frontShinyFemale;
    Other other;
    Versions versions;
    Sprites animated;

    factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
        other: json["other"] == null ? null : Other.fromJson(json["other"]),
        versions: json["versions"] == null ? null : Versions.fromJson(json["versions"]),
        animated: json["animated"] == null ? null : Sprites.fromJson(json["animated"]),
    );

    Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
        "other": other == null ? null : other.toJson(),
        "versions": versions == null ? null : versions.toJson(),
        "animated": animated == null ? null : animated.toJson(),
    };
}

class GenerationI {
    GenerationI({
        this.redBlue,
        this.yellow,
    });

    RedBlue redBlue;
    RedBlue yellow;

    factory GenerationI.fromJson(Map<String, dynamic> json) => GenerationI(
        redBlue: RedBlue.fromJson(json["red-blue"]),
        yellow: RedBlue.fromJson(json["yellow"]),
    );

    Map<String, dynamic> toJson() => {
        "red-blue": redBlue.toJson(),
        "yellow": yellow.toJson(),
    };
}

class RedBlue {
    RedBlue({
        this.backDefault,
        this.backGray,
        this.frontDefault,
        this.frontGray,
    });

    String backDefault;
    String backGray;
    String frontDefault;
    String frontGray;

    factory RedBlue.fromJson(Map<String, dynamic> json) => RedBlue(
        backDefault: json["back_default"],
        backGray: json["back_gray"],
        frontDefault: json["front_default"],
        frontGray: json["front_gray"],
    );

    Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_gray": backGray,
        "front_default": frontDefault,
        "front_gray": frontGray,
    };
}

class GenerationIi {
    GenerationIi({
        this.crystal,
        this.gold,
        this.silver,
    });

    Crystal crystal;
    Crystal gold;
    Crystal silver;

    factory GenerationIi.fromJson(Map<String, dynamic> json) => GenerationIi(
        crystal: Crystal.fromJson(json["crystal"]),
        gold: Crystal.fromJson(json["gold"]),
        silver: Crystal.fromJson(json["silver"]),
    );

    Map<String, dynamic> toJson() => {
        "crystal": crystal.toJson(),
        "gold": gold.toJson(),
        "silver": silver.toJson(),
    };
}

class Crystal {
    Crystal({
        this.backDefault,
        this.backShiny,
        this.frontDefault,
        this.frontShiny,
    });

    String backDefault;
    String backShiny;
    String frontDefault;
    String frontShiny;

    factory Crystal.fromJson(Map<String, dynamic> json) => Crystal(
        backDefault: json["back_default"],
        backShiny: json["back_shiny"],
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
    );

    Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_shiny": backShiny,
        "front_default": frontDefault,
        "front_shiny": frontShiny,
    };
}

class GenerationIii {
    GenerationIii({
        this.emerald,
        this.fireredLeafgreen,
        this.rubySapphire,
    });

    Emerald emerald;
    Crystal fireredLeafgreen;
    Crystal rubySapphire;

    factory GenerationIii.fromJson(Map<String, dynamic> json) => GenerationIii(
        emerald: Emerald.fromJson(json["emerald"]),
        fireredLeafgreen: Crystal.fromJson(json["firered-leafgreen"]),
        rubySapphire: Crystal.fromJson(json["ruby-sapphire"]),
    );

    Map<String, dynamic> toJson() => {
        "emerald": emerald.toJson(),
        "firered-leafgreen": fireredLeafgreen.toJson(),
        "ruby-sapphire": rubySapphire.toJson(),
    };
}

class Emerald {
    Emerald({
        this.frontDefault,
        this.frontShiny,
    });

    String frontDefault;
    String frontShiny;

    factory Emerald.fromJson(Map<String, dynamic> json) => Emerald(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
    );

    Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
    };
}

class GenerationVi {
    GenerationVi({
        this.frontDefault,
        this.frontFemale,
        this.frontShiny,
        this.frontShinyFemale,
    });

    String frontDefault;
    dynamic frontFemale;
    String frontShiny;
    dynamic frontShinyFemale;

    factory GenerationVi.fromJson(Map<String, dynamic> json) => GenerationVi(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
    );

    Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
    };
}

class GenerationVii {
    GenerationVii({
        this.icons,
        this.ultraSunUltraMoon,
    });

    DreamWorld icons;
    GenerationVi ultraSunUltraMoon;

    factory GenerationVii.fromJson(Map<String, dynamic> json) => GenerationVii(
        icons: DreamWorld.fromJson(json["icons"]),
        ultraSunUltraMoon: GenerationVi.fromJson(json["ultra-sun-ultra-moon"]),
    );

    Map<String, dynamic> toJson() => {
        "icons": icons.toJson(),
        "ultra-sun-ultra-moon": ultraSunUltraMoon.toJson(),
    };
}

class DreamWorld {
    DreamWorld({
        this.frontDefault,
        this.frontFemale,
    });

    String frontDefault;
    dynamic frontFemale;

    factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
    );

    Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
    };
}

class GenerationViii {
    GenerationViii({
        this.icons,
    });

    DreamWorld icons;

    factory GenerationViii.fromJson(Map<String, dynamic> json) => GenerationViii(
        icons: DreamWorld.fromJson(json["icons"]),
    );

    Map<String, dynamic> toJson() => {
        "icons": icons.toJson(),
    };
}

class Other {
    Other({
        this.dreamWorld,
        this.officialArtwork,
    });

    DreamWorld dreamWorld;
    OfficialArtwork officialArtwork;

    factory Other.fromJson(Map<String, dynamic> json) => Other(
        dreamWorld: DreamWorld.fromJson(json["dream_world"]),
        officialArtwork: OfficialArtwork.fromJson(json["official-artwork"]),
    );

    Map<String, dynamic> toJson() => {
        "dream_world": dreamWorld.toJson(),
        "official-artwork": officialArtwork.toJson(),
    };
}

class OfficialArtwork {
    OfficialArtwork({
        this.frontDefault,
    });

    String frontDefault;

    factory OfficialArtwork.fromJson(Map<String, dynamic> json) => OfficialArtwork(
        frontDefault: json["front_default"],
    );

    Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
    };
}

class Stat {
    Stat({
        this.baseStat,
        this.effort,
        this.stat,
    });

    int baseStat;
    int effort;
    Species stat;

    factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: Species.fromJson(json["stat"]),
    );

    Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat.toJson(),
    };
}

class Type {
    Type({
        this.slot,
        this.type,
    });

    int slot;
    Species type;

    factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: Species.fromJson(json["type"]),
    );

    Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type.toJson(),
    };
}
