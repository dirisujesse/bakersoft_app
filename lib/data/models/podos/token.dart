class AppTokenModel {
  String? accessToken;
  String? refreshToken;
  DateTime? createdAt;

  AppTokenModel({
    required this.accessToken,
    required this.refreshToken,
    required this.createdAt,
  });

  toJson() {
    return {
      "accessToken": accessToken,
      "refreshToken": refreshToken,
      "createdAt": createdAt?.toIso8601String(),
    };
  }
}
