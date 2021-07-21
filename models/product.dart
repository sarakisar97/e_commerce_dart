class Product{
  String? _name;
  double? _price;
  int? _quantity;

  Product(this._name, this._price, this._quantity);

  get name => this._name;

  set name(value) => this._name = value;

  get price => this._price;

  set price(value) => this._price = value;

  get quantity => this._quantity;
  
  set quantity(value) => this._quantity = value;
}