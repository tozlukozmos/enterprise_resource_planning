class User {
  int userId;
  String username;
  String firstName;
  String lastName;
  String email;
  String password;
  String phoneNumber;
  String departmentName;
  // String imageName;
  // String imageData;
  String imageUrl;
  bool isAdmin;
  String createdAt;
  String updatedAt;

  User(
      {required this.userId,
        required this.username,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.password,
        required this.phoneNumber,
        required this.departmentName,
        required this.imageUrl,
        // required this.imageName,
        // required this.imageData,
        required this.isAdmin,
        required this.createdAt,
        required this.updatedAt});

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["userId"] as int,
    username: json["username"] as String,
    firstName: json["firstName"] as String,
    lastName: json["lastName"] as String,
    email: json["email"] as String,
    password: json["password"] as String,
    phoneNumber: json["phoneNumber"] as String,
    departmentName: json["departmentName"] as String,
    imageUrl: json["imageUrl"] as String,
    // imageName: json["imageName"] as String,
    // imageData: json["imageData"] as String,
    isAdmin: json["admin"] as bool,
    createdAt: json["createdAt"] as String,
    updatedAt: json["updatedAt"] as String,
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "username": username,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "password": password,
    "phoneNumber": phoneNumber,
    "departmentName": departmentName,
    "imageUrl": imageUrl,
    // "imageName": imageName,
    // "imageData": imageData,
    "admin": isAdmin,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}
