class PokemonModel {
  PokemonModel({
    required this.id,
    required this.numPokemon,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.candy,
    required this.candyCount,
    required this.egg,
    required this.multipliers,
    required this.weaknesses,
    required this.nextEvolution,
  });

  int id;
  String numPokemon;
  String name;
  String img;
  List<String> type;
  String height;
  String weight;
  String candy;
  int candyCount;
  String egg;
  List<double> multipliers;
  List<String> weaknesses;
  List<NextEvolution> nextEvolution;

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        id: json["id"],
        numPokemon: json["num"],
        name: json["name"],
        img: json["img"],
        type: List<String>.from(json["type"].map((x) => x)),
        height: json["height"],
        weight: json["weight"],
        candy: json["candy"],
        candyCount: json["candy_count"] ?? 0,
        egg: json["egg"],
        multipliers: List<double>.from(
            json["multipliers"]?.map((x) => x?.toDouble()) ?? []),
        weaknesses: List<String>.from(json["weaknesses"].map((x) => x)),
        nextEvolution: List<NextEvolution>.from(
            json["next_evolution"]?.map((x) => NextEvolution?.fromMap(x)) ??
                []),
      );
}

class NextEvolution {
  NextEvolution({
    required this.num,
    required this.name,
  });

  String num;
  String name;

  factory NextEvolution.fromMap(Map<String, dynamic> json) => NextEvolution(
        num: json["num"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "num": num,
        "name": name,
      };
}
