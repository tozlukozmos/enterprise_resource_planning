import 'app_material.dart';
import 'user.dart';

class AppProcess {
  int processId;
  User user;
  AppMaterial material;
  int amount;
  String processTypeName;
  String createdAt;
  String updatedAt;

  AppProcess(
      {required this.processId,
      required this.user,
      required this.material,
      required this.amount,
      required this.processTypeName,
      required this.createdAt,
      required this.updatedAt});

  factory AppProcess.fromJson(Map<String, dynamic> json) => AppProcess(
        processId: json["processId"] as int,
        user: User.fromJson(json["user"]),
        material: AppMaterial.fromJson(json["material"]),
        amount: json["amount"] as int,
        processTypeName: json["processTypeName"] as String,
        createdAt: json["createdAt"] as String,
        updatedAt: json["updatedAt"] as String,
      );

  Map<String, dynamic> toJson() => {
        "processId": processId,
        "user": user.toJson(),
        "material": material.toJson(),
        "amount": amount,
        "processTypeName": processTypeName,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
