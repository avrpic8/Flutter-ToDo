class AppSettings {
  bool isDark = false;
  String lan = "en";
  bool requirePass = false;
  bool splash = true;
  String? password;

  AppSettings(
      {required this.isDark,
      required this.lan,
      required this.requirePass,
      required this.splash,
      this.password});

  factory AppSettings.fromJson(Map<String, dynamic> json) => AppSettings(
      isDark: json['isDark'],
      lan: json['lan'],
      requirePass: json['requirePass'],
      splash: json['splash'],
      password: json['password']);

  Map<String, dynamic> toJson() => {
        'isDark': isDark,
        'lan': lan,
        'requirePass': requirePass,
        'splash': splash,
        'password': password
      };
}
