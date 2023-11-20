class User {
  String firstName;
  String lastName;
  String email;
  String role;
  String regOrEmpID;
  String refreshToken;
  String accessToken;

  bool isStudent;

  User({
    required this.role,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.regOrEmpID,
    required this.accessToken,
    required this.refreshToken,
    this.isStudent = true,
  });

  factory User.fromJson(dynamic data) {
    return User(
      role: data["role"] as String,
      email: data["email"] as String,
      firstName: data["firstName"] as String,
      lastName: data["lastName"] as String,
      regOrEmpID: data["regOrEmpID"] as String,
      refreshToken: data["refresh"] as String,
      accessToken: data["access"] as String,
      isStudent: data["student"],
    );
  }
}
