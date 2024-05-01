class UserModel {
  final String username;
  final String email;
  final String gender;
  final String birthDate;

  UserModel(
      {required this.username,
      required this.email,
      required this.gender,
      required this.birthDate});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      email: json['email'],
      gender: json['gender'],
      birthDate: json['birth_date'],
    );
  }
}
