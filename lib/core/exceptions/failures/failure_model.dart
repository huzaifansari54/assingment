class FailureModel {
  final bool success;
  final String message;

  const FailureModel({required this.success, required this.message});
  factory FailureModel.fromJson(Map<String, dynamic> json) =>
      FailureModel(success: json["success"], message: json["message"]);
}

class SuccessModel {
  final bool success;
  final String message;
  final String token;

  const SuccessModel(this.token,
      {required this.success, required this.message});
  factory SuccessModel.fromJson(Map<String, dynamic> json) =>
      SuccessModel(json["token"],
          success: json["success"], message: json["message"]);
}
