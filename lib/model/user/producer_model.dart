import 'user_model.dart';

class ProducerModel extends UserModel {
  String organization;

  ProducerModel({
    super.firstName = '',
    super.lastName = '',
    super.countryCode = 'NG',
    super.email = '',
    super.password = '',
    this.organization = '',
  }) : super(role: 'filmmaker');

  // toJson method
  @override
  Map<String, dynamic> toJson() {
    return {...super.toJson(), 'organization': organization};
  }

  // fromJson factory constructor
  factory ProducerModel.fromJson(Map<String, dynamic> json) {
    return ProducerModel(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      countryCode: json['country_code'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      organization: json['organization'] as String,
    );
  }

  // Copy with method for updates
  @override
  ProducerModel copyWith({
    String? role,
    String? firstName,
    String? lastName,
    String? countryCode,
    String? email,
    String? password,
    String? organization,
  }) {
    return ProducerModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      countryCode: countryCode ?? this.countryCode,
      email: email ?? this.email,
      password: password ?? this.password,
      organization: organization ?? this.organization,
    );
  }

  @override
  String toString() {
    return 'ProducerModel(fullName: $fullName, organization: $organization)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProducerModel &&
        super == other &&
        other.organization == organization;
  }

  @override
  int get hashCode {
    return super.hashCode ^ organization.hashCode;
  }
}
