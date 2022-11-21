import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:lameco_grocery/src/config/app_data.dart' as app_data;
import 'package:lameco_grocery/src/config/custom_colors.dart';

import 'components/category_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Frutas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text.rich(
          TextSpan(
            style: const TextStyle(
              fontSize: 30,
            ),
            children: [
              TextSpan(
                  text: 'Green',
                  style: TextStyle(color: CustomColors.customSwatchColor)),
              TextSpan(
                  text: 'grocer',
                  style: TextStyle(color: CustomColors.customContrastColor)),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15, right: 15),
            child: GestureDetector(
              onTap: () {
                print('Cart');
              },
              child: Badge(
                badgeColor: CustomColors.customContrastColor,
                badgeContent: const Text(
                  '2',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: CustomColors.customSwatchColor,
                ),
              ),
            ),
          )
        ],
      ),

      // Search Field
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              isDense: true,
              hintText: 'Pesquise aqui...',
              hintStyle: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 14,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: CustomColors.customContrastColor,
                size: 21,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(60),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
            ),
          ),
        ),

        // Categories
        Container(
          padding: const EdgeInsets.only(left: 25),
          height: 40,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return CategoryTile(
                  category: app_data.categories[index],
                  isSelected: app_data.categories[index] == selectedCategory,
                  onPressed: () {
                    setState(() {
                      selectedCategory = app_data.categories[index];
                    });
                  },
                );
              },
              separatorBuilder: (_, index) => const SizedBox(
                    width: 10,
                  ),
              itemCount: app_data.categories.length),
        )
        // Grid
        ,
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 9 / 11.5,
            ),
            itemCount: app_data.items.length,
            itemBuilder: (_, index) {
              return Container(
                color: Colors.red,
              );
            },
          ),
        )
      ]),
    );
  }
}
