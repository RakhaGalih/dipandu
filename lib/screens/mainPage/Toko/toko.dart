import 'package:dipandu/screens/mainPage/Beranda/constant.dart';
import 'package:dipandu/screens/mainPage/Toko/tokoCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Toko extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.count(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.fromLTRB(15, 0, 15, 72),
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: List.generate(Constant().tokoCards.length, (index) => TokoCardWidget(index: index,)),
      staggeredTiles: List.generate(Constant().tokoCards.length, (index) => StaggeredTile.extent(1, 250)),
    );
  }
}
