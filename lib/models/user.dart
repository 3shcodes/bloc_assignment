class User {
    final String userName;
    final String email;
    final String firstName;
    final String middleName;
    final String lastName;
    final String dateOfBirth;
    final String gender;
    final String phoneNumber;

    User({
      required this.userName,
      required this.email,
      required this.firstName,
      required this.middleName,
      required this.lastName,
      required this.dateOfBirth,
      required this.gender,
      required this.phoneNumber,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        userName: json["userName"].toString(),
        email: json["email"].toString(),
        firstName: json["firstName"].toString(),
        middleName: json["middleName"].toString(),
        lastName: json["lastName"].toString(),
        dateOfBirth: json["dateOfBirth"].toString(), 
        gender: json["gender"].toString(),
        phoneNumber: json["phoneNumber"].toString(),
    );

    Map<String, String> toJson() => {
        "userName": userName,
        "email": email,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "dateOfBirth": dateOfBirth,
        "gender": gender,
        "phoneNumber": phoneNumber,
    };
}
