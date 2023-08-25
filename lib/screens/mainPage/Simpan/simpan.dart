import 'package:dipandu/screens/mainPage/Simpan/imageCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Simpan extends StatelessWidget {
  List<String> savedImages = ['assets/images/masjid tiban/masjid3.jpg',
    'assets/images/masjid tiban/masjid4.jpeg',
    'assets/images/baluran/rusa.jpg',
    'assets/images/wisata/bor1.jpg',
    'assets/images/wisata/bor.JPG',
    'assets/images/wisata/api.jpg',
    'assets/images/wisata/api1.jpg',
    'assets/images/wisata/api2.jpg',
    'assets/images/baluran/rusa1.jpg',
    'assets/images/baluran/rusa2.jpg',
    'assets/images/baluran/rusa3.jpg',
    'assets/images/baluran/rusa4.jpeg',
  ];
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.count(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(12, 0, 12, 72),
            crossAxisCount: 6,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            children: List.generate(savedImages.length, (index) => ImageCard(imageData: savedImages[index],)),
            staggeredTiles: List.generate(savedImages.length, (index) {
              if(index % 6 == 0 || index % 6 == 1){
                return StaggeredTile.extent(3, 150.0);
              } else if (index % 6 == 2){
                return StaggeredTile.extent(6, 150.0);
              } else {
                return StaggeredTile.extent(2, 150.0);
              }
            }
          ),
    );
  }
}
