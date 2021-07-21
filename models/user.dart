class User{
  String? _username;
  String? _password;
  double? _balance;

  User(this._username, this._password, this._balance);

  String? get username => this._username;

  set username(String? value) => this._username = value;

  get password => this._password;

  set password( value) => this._password = value;

  get balance => this._balance;

  set balance( value) => this._balance = value;
}