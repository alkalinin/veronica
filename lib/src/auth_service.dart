class AuthService {
  bool _isAuth = false;

  bool get auth => _isAuth;
  set auth(bool value) => _isAuth = value;
}