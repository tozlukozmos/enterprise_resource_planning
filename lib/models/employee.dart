class Employee {
  int employeeId;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String departmentName;
  String imageUrl;
  bool isAdmin;
  String createdAt;
  String updatedAt;

  Employee(
      {required this.employeeId,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.phoneNumber,
        required this.departmentName,
        required this.imageUrl,
        required this.isAdmin,
        required this.createdAt,
        required this.updatedAt});

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    employeeId: json["employeeId"] as int,
    firstName: json["firstName"] as String,
    lastName: json["lastName"] as String,
    email: json["email"] as String,
    phoneNumber: json["phoneNumber"] as String,
    departmentName: json["departmentName"] as String,
    imageUrl: json["imageUrl"] as String,
    isAdmin: json["isAdmin"] as bool,
    createdAt: json["createdAt"] as String,
    updatedAt: json["updatedAt"] as String,
  );

  Map<String, dynamic> toJson() => {
    "id": employeeId,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phoneNumber": phoneNumber,
    "departmentName": departmentName,
    "image": imageUrl,
    "isAdmin": isAdmin,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}
