import 'package:flutter/material.dart';
import 'package:flutter_codigo_pokedex/models/pokemon_model.dart';
import 'package:flutter_codigo_pokedex/ui/general/colors.dart';
import 'package:flutter_codigo_pokedex/ui/widgets/item_data_widget.dart';
import 'package:flutter_codigo_pokedex/ui/widgets/item_type_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../ui/widgets/item_data_list_widget.dart';
import '../ui/widgets/item_value_widget.dart';

// ignore: must_be_immutable
class DetailPage extends StatelessWidget {
  PokemonModel pokemon;

  DetailPage({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: colorsPokemon[pokemon.type.first],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border_outlined,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: height * 0.1,
            right: -30,
            child: Image.asset(
              'assets/images/pokeball.png',
              height: 200,
              color: Colors.white.withOpacity(0.2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      pokemon.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Row(
                      children: pokemon.type
                          .map((e) => ItemTypeWidget(text: e))
                          .toList(),
                    ),
                  ],
                ),
                Text(
                  "#${pokemon.numPokemon}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const Expanded(
                flex: 4,
                child: SizedBox(),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      //Data del Pokemon
                      Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Column(
                          children: [
                            const Text(
                              "About Pokemon",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ItemDataWidget(
                              title: "Height",
                              data: pokemon.height,
                            ),
                            ItemDataWidget(
                              title: "Weight",
                              data: pokemon.weight,
                            ),
                            ItemDataWidget(
                              title: "Candy",
                              data: pokemon.candy,
                            ),
                            ItemDataWidget(
                              title: "Candy Count",
                              data: pokemon.candyCount.toString(),
                            ),
                            if (pokemon.multipliers.isNotEmpty) ...[
                              ItemDataListWidget(
                                title: "Multipliers",
                                children: pokemon.multipliers
                                    .map((item) => ItemValueWidget(
                                          text: item.toString(),
                                        ))
                                    .toList(),
                              ),
                            ],
                            if (pokemon.nextEvolution.isNotEmpty) ...[
                              ItemDataListWidget(
                                title: "Evolution",
                                children: pokemon.nextEvolution
                                    .map((item) => ItemValueWidget(
                                          text: item.name,
                                        ))
                                    .toList(),
                              )
                            ],
                          ],
                        ),
                      ),
                      //Imagen del Pokemon
                      Positioned.fill(
                        top: -90.0,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: CachedNetworkImage(
                            imageUrl: pokemon.img,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
