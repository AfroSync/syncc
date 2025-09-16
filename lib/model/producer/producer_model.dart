import '../enums/country.dart';
import '../enums/music_genre.dart';

class ProducerModel {
  String username;
  String fullName;
  String profileUrl;
  String password;
  String email;
  Country country;
  String role;
  List<MusicGenre> genres;

  ProducerModel({
    this.role = "filmmaker",
    this.username = "",
    this.fullName = "",
    this.profileUrl = "",
    this.password = "",
    this.email = "",
    this.country = Country.nigeria,
    this.genres = const [],
  });
}
