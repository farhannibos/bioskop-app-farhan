class UserService {
  static String? _email;
  static String? _nama;

  static void setUserData(String email, String nama) {
    _email = email;
    _nama = nama;
  }

  static String? getEmail() {
    return _email;
  }

  static String? getNama() {
    return _nama;
  }

  static void clearUserData() {
    _email = null;
    _nama = null;
  }
}