class UserModel {
  String role;
  String firstName;
  String lastName;
  String countryCode;
  String email;
  String password;

  UserModel({
    this.role = 'user',
    this.firstName = '',
    this.lastName = '',
    this.countryCode = 'NG',
    this.email = '',
    this.password = '',
  });

  // Computed property for full name
  String get fullName => '$firstName $lastName';

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'first_name': firstName,
      'last_name': lastName,
      'country_code': countryCode,
      'email': email,
      'password': password,
    };
  }

  // fromJson factory constructor
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      role: json['role'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      countryCode: json['country_code'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  // Copy with method for updates
  UserModel copyWith({
    String? role,
    String? firstName,
    String? lastName,
    String? countryCode,
    String? email,
    String? password,
  }) {
    return UserModel(
      role: role ?? this.role,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      countryCode: countryCode ?? this.countryCode,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  String toString() {
    return 'UserModel(role: $role, fullName: $fullName, countryCode: $countryCode, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserModel &&
        other.role == role &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.countryCode == countryCode &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return role.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        countryCode.hashCode ^
        email.hashCode ^
        password.hashCode;
  }
}
