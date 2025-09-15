import 'package:syncc/model/enums/country.dart';

import '../enums/music_genre.dart';

class ArtistModel {
  String username;
  String fullName;
  String profileUrl;
  String password;
  String email;
  Country country;
  String role;
  List<MusicGenre> genres;

  ArtistModel({
    this.role = "Artist",
    this.username = "",
    this.fullName = "",
    this.profileUrl = "",
    this.password = "",
    this.email = "",
    this.country = Country.nigeria,
    this.genres = const [],
  });
}
