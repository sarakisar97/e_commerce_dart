import 'user.dart';
import 'product.dart';
import 'dart:io';

void main(List<String> args) {
  List<User> users = [
            User("Khalid", "P@ssw0rd1", 100), 
            User("Ahmad", "P@ssw0rd2", 500),
            User("Samer", "P@ssw0rd3", 700),
            User("Moute3", "P@ssw0rd4", 1000),
  ];

  List<Product> products = [
      new Product("Soup", 100, 40),
      new Product("Washing liquid", 200, 50),
      new Product("Cleaninig detergent", 150, 12),
      new Product("Shampoo", 400, 60),
  ];
  
        print("Select username number please:");

        for(int i = 0; i < users.length; i++){
            print('$i ${users[i].username}');
        }

        int? currentUserindex = int.parse(stdin.readLineSync() ?? '');

        User currentUser = users[currentUserindex];
        
        print("Enter password please:");

        String? currentPassword = stdin.readLineSync();

        if(currentPassword == currentUser.password){
            buyAProduct(currentUser, products);
        }
        else{
            print("password is wrong");
            stdout.done;
        }
}

void buyAProduct(User currentUser, List<Product> products){
        print("Select product number please:");

            for(int i = 0; i < products.length; i++){
                print('$i ${products[i].name}');
            }

            int currentProductindex = int.parse(stdin.readLineSync() ?? '');

            Product selectedProduct = products[currentProductindex];

            print("Product name: " + selectedProduct.name);
            print("Product price: " + selectedProduct.price.toString());
            print("Product quantity: " + selectedProduct.quantity.toString());

            print("Enter product quantity please:");

            double productQuantity = double.parse(stdin.readLineSync() ?? '');

            double totalPrice = productQuantity * selectedProduct.price;

            if(productQuantity <= selectedProduct.quantity && totalPrice <= currentUser.balance){
                currentUser.balance = currentUser.balance - totalPrice;
                selectedProduct.quantity = selectedProduct.quantity - productQuantity;
                print("Press 0 to buy a new product:");
                print("Press 1 to close:");

                int number = int.parse(stdin.readLineSync() ?? '');

                if(number == 0){
                    buyAProduct(currentUser, products);
                }
                else{
                    stdout.done;
                }
            }
            else{
                print("You cannot buy this product");
            }
    }