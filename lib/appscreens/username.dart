class Userid {
  static final Userid _instance = Userid._internal();

  factory Userid() => _instance;

  Userid._internal();
  String userId;
}
