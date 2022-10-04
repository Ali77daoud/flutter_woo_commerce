class UserDataModel {
  final String email;
  final String firstName;
  final String lastName;
  final String userName;

  UserDataModel(
      {required this.email,
      required this.firstName,
      required this.lastName,
      required this.userName});

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
        email: json['email'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        userName: json['username']);
  }
}
