class Auth {
  static final Auth _instance = Auth._internal();

  factory Auth() => _instance;

  Auth._internal();
  String userId;
  String username;
  String name;

  setUserFromMap(userData){
    userId = userData['id'];
    username = userData['username'];

  }
}
