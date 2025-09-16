import '../enums/country.dart';

class ProducerModel {
  String organization;
  String fullName;
  String profileUrl;
  String password;
  String email;
  Country country;
  String role;

  ProducerModel({
    this.role = "filmmaker",
    this.organization = "",
    this.fullName = "",
    this.profileUrl = "",
    this.password = "",
    this.email = "",
    this.country = Country.nigeria,
  });
}
