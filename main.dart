import 'models/user.dart';
import 'models/product.dart';
import 'dart:io';

List<User> _users = [
            User("Khalid", "P@ssw0rd1", 100), 
            User("Ahmad", "P@ssw0rd2", 500),
            User("Samer", "P@ssw0rd3", 700),
            User("Moute3", "P@ssw0rd4", 1000),
  ];

List<Product> _products = [
      new Product("Soup", 100, 40),
      new Product("Washing liquid", 200, 50),
      new Product("Cleaninig detergent", 150, 12),
      new Product("Shampoo", 400, 60),
  ];

void main(List<String> args) {
        print("Select username number please:");

        for(int i = 0; i < _users.length; i++){
            print('$i ${_users[i].username}');
        }

        int? currentUserindex = int.parse(stdin.readLineSync() ?? '-1');

        User currentUser = _users[currentUserindex];
        
        print("Enter password please:");

        String? currentPassword = stdin.readLineSync();

        if(currentPassword == currentUser.password){
            _buyAProduct(currentUser, _products);
        }
        else{
            print("password is wrong");
            stdout.done;
        } 
}

void _buyAProduct(User currentUser, List<Product> products){
        print("Select product number please:");

            for(int i = 0; i < products.length; i++){
                print('$i ${products[i].name}');
            }

            int currentProductindex = int.parse(stdin.readLineSync() ?? '-1');

            Product selectedProduct = products[currentProductindex];

            print("Product name: " + selectedProduct.name);
            print("Product price: " + selectedProduct.price.toString());
            print("Product quantity: " + selectedProduct.quantity.toString());

            print("Enter product quantity please:");

            int productQuantity = int.parse(stdin.readLineSync() ?? '0');

            double totalPrice = productQuantity * selectedProduct.price;

            if(productQuantity <= selectedProduct.quantity && totalPrice <= currentUser.balance){
                currentUser.balance = currentUser.balance - totalPrice;
                selectedProduct.quantity = selectedProduct.quantity - productQuantity;
                print("Press 0 to buy a new product:");
                print("Press 1 to close:");

                int number = int.parse(stdin.readLineSync() ?? '-1');

                if(number == 0){
                    _buyAProduct(currentUser, products);
                }
                else{
                    stdout.done;
                }
            }
            else{
                print("You cannot buy this product");
            }
    }