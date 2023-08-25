import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constant {
  SharedPreferences prefs;
  List<String> filter = ['Semua', 'Gunung', 'Pantai', 'Wisata Edukasi', 'Wisata Bahari', 'Wisata Religi', 'Wisata Sejarah'
  ];
  List<WisataCard> wisataCards = [WisataCard(foto: 'assets/images/masjid tiban/masjid.jpg',rating: '4.9', nama: 'Masjid Tiban', deskripsi: 'Kemegahan dan keindahan arsitektur Masjid Tiban. Ternyata ini tidak di Jazirah Arab, melainkan di Kabupaten Malang, Jawa Timur. Disebut Masjid tiban karena Konon masjid yang sangat megah ini dibangun tanpa sepengetahuan warga sekitar, dan menurut mitos dibangun oleh jin dalam waktu hanya semalam.', ),
    WisataCard(foto: 'assets/images/baluran/rusa.jpg', nama: 'Taman Nasional Baluran', rating: '4.5', deskripsi: 'Keindahan hamparan lahan yang berisikan aneka flora dan fauna Indonesia. Terletak di Kabupaten Situbondo, Jawa Timur. Taman nasional ini terdiri dari tipe vegetasi sabana, hutan mangrove, hutan musim, hutan pantai, hutan pegunungan bawah, hutan rawa dan hutan.'),
    WisataCard(foto: 'assets/images/wisata/bor2.jpg', nama: 'Candi Borobudur', rating: '4,6', deskripsi: 'Kemegahan Candi Borobudur memang tidak ada duanya. Sempat masuk ke 7 keajaiban dunia. Candi ini terletak di Kabupaten Magelang.'),
    WisataCard(foto: 'assets/images/wisata/api2.jpg', nama: 'Lava Tour Merapi', rating: '4,4', deskripsi: 'Tour di gunung merapi. Megahnya gunung api aktif di Kabupaten Sleman, Jogjakarta ini bisa jadi destinasi wisata selain Candi Borobudur.')
  ];
  Color blueTheme =  Color(0xFF445EE9);

  List<TokoCard> tokoCards = [TokoCard(foto: 'assets/images/toko/kripik.jpg', nama: 'Kripik Buah Khas Malang', rating: '4.8', pop: '(55)', harga: 'Rp. 35.000/4pack'),
    TokoCard(foto: 'assets/images/toko/masirat.jpg', nama: 'Masirat', rating: '4.2', pop: '(25)', harga: 'Rp. 15.000/pack'),
    TokoCard(foto: 'assets/images/toko/strudel.jpg', nama: 'Malang Strudel', rating: '4.9', pop: '(75)', harga: 'Rp. 55.000/pack'),
    TokoCard(foto: 'assets/images/toko/kripik.jpg', nama: 'Kripik Buah Khas Malang', rating: '4.8', pop: '(55)', harga: 'Rp. 35.000/4pack'),
    TokoCard(foto: 'assets/images/toko/masirat.jpg', nama: 'Masirat', rating: '4.2', pop: '(25)', harga: 'Rp. 15.000/pack'),
    TokoCard(foto: 'assets/images/toko/strudel.jpg', nama: 'Malang Strudel', rating: '4.9', pop: '(75)', harga: 'Rp. 55.000/pack')];

  List<Pemandu> pemandu = [
    Pemandu(nama: 'Bertram Griffin', rating: '4.6', location: 317, foto: 'assets/faces/ToyFaces_Colored_BG_29.jpg'),
    Pemandu(nama: 'Ada Wong', rating: '5.0', location: 315, foto: 'assets/faces/ToyFaces_Colored_BG_47.jpg'),
    Pemandu(nama: 'Lyra Belacqua', rating: '4.9', location: 320, foto: 'assets/faces/ToyFaces_Colored_BG_32.jpg'),
    Pemandu(nama: 'Anna Fang', rating: '4.8', location: 318, foto: 'assets/faces/ToyFaces_Colored_BG_49.jpg'),
    Pemandu(nama: 'Ash William', rating: '4.5', location: 291, foto: 'assets/faces/ToyFaces_Colored_BG_37.jpg'),
  ];

  List<DetailWisata> detailWisata = [
    DetailWisata(tempat: 'Turen, Malang', km: 4, pemandu: [0, 1, 2, 3], olehKhas: [0, 2], cardImage: [ 'assets/images/masjid tiban/masjid1.jpg',  'assets/images/masjid tiban/masjid2.jpg',  'assets/images/masjid tiban/masjid3.jpg',  'assets/images/masjid tiban/masjid4.jpeg']),
    DetailWisata(tempat: 'Tamansari, Situbondo', km: 319, pemandu: [4, 0, 2, 3], olehKhas: [1], cardImage: [ 'assets/images/baluran/rusa1.jpg',
      'assets/images/baluran/rusa2.jpg',
      'assets/images/baluran/rusa3.jpg',
      'assets/images/baluran/rusa4.jpeg',]),
    DetailWisata(tempat: 'Borobudur, Magelang', km: 359, pemandu: [4, 0, 2, 3], olehKhas: [1], cardImage: [ 'assets/images/wisata/bor.jpg',
      'assets/images/wisata/bor1.jpg',
      'assets/images/wisata/bor2.jpg',]),
    DetailWisata(tempat: 'Jogonalan, Kabupaten Klaten', km: 365, pemandu: [4, 0, 2, 3], olehKhas: [1], cardImage: [ 'assets/images/wisata/api.jpg',
      'assets/images/wisata/api1.jpg',
      'assets/images/wisata/api2.jpg',]),
  ];

  List<RapidCard> rapidCards = [
    RapidCard(foto: 'assets/images/rapid/rapid1.jpg', nama: 'Tes di RSSA', harga: 'Rp.150.000'),
    RapidCard(foto: 'assets/images/rapid/rapid2.jpg', nama: 'Tes di Sima Lab', harga: 'Rp.150.000'),
    RapidCard(foto: 'assets/images/rapid/rapid3.webp', nama: 'Tes di Prodia Malang', harga: 'Rp.150.000')
  ];

  List<String> bulan = [
    'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'
  ];
}

class WisataCard {
  String nama;
  String deskripsi;
  String foto;
  String rating;
  WisataCard({this.foto, this.nama, this.deskripsi, this.rating});
}

class TokoCard {
  String nama;
  String foto;
  String rating;
  String pop;
  String harga;

  TokoCard({this.nama, this.foto, this.rating, this.pop, this.harga});
}

class Pemandu {
  String foto;
  String nama;
  String rating;
  int location;
  Pemandu({this.foto, this.nama, this.rating, this.location});
}

class DetailWisata {
  String tempat;
  int km;
  List<String> cardImage;
  List<int> pemandu;
  List<int> olehKhas;

  DetailWisata({this.tempat, this.km, this.cardImage, this.pemandu, this.olehKhas});
}

class RapidCard {
  String foto;
  String nama;
  String harga;

  RapidCard({this.nama, this.foto, this.harga});
}