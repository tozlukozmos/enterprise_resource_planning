class AppMaterial {
  int materialId;
  int referenceNumber;
  // String imageName;
  // String imageData;
  String imageUrl;
  String materialName;
  String typeName;
  String unitName;
  int amount;
  String colorName;
  String sizeName;
  String description;
  String createdAt;
  String updatedAt;

  AppMaterial(
      {required this.materialId,
        required this.referenceNumber,
        required this.imageUrl,
        // required this.imageName,
        // required this.imageData,
        required this.materialName,
        required this.typeName,
        required this.unitName,
        required this.amount,
        required this.colorName,
        required this.sizeName,
        required this.description,
        required this.createdAt,
        required this.updatedAt});

  factory AppMaterial.fromJson(Map<String, dynamic> json) => AppMaterial(
    materialId: json["materialId"] as int,
    referenceNumber: json["referenceNumber"] as int,
    imageUrl: json["imageUrl"] as String,
    // imageName: json["imageName"] as String,
    // imageData: json["imageData"] as String,
    materialName: json["materialName"] as String,
    typeName: json["typeName"] as String,
    unitName: json["unitName"] as String,
    amount: json["amount"] as int,
    colorName: json["colorName"] as String,
    sizeName: json["sizeName"] as String,
    description: json["description"] as String,
    createdAt: json["createdAt"] as String,
    updatedAt: json["updatedAt"] as String,
  );

  Map<String, dynamic> toJson() => {
    "materialId": materialId,
    "referenceNumber": referenceNumber,
    "imageUrl": imageUrl,
    // "imageName": imageName,
    // "imageData": imageData,
    "materialName": materialName,
    "typeName": typeName,
    "unitName": unitName,
    "amount": amount,
    "colorName": colorName,
    "sizeName": sizeName,
    "description": description,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}
