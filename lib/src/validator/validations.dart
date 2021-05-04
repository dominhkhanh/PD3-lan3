class Validation {
  static bool isValidUser(String user) {
    return user != null && user.length >= 10;
  }

  static bool isValidPass(String pass) {
    return pass != null && pass.length >= 3;
  }
}
