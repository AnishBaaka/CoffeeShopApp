import 'package:coffeeshopapp/components/coffee_tile.dart';
import 'package:coffeeshopapp/models/coffee.dart';
import 'package:coffeeshopapp/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
//remove cart item
  void removeFromCart(Coffee coffee) {
    //show dialogue box to remove from cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Remove this item from your cart?"),
        actions: [
          //cancel button
          MaterialButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          //yes button
          MaterialButton(
            child: const Text("Yes"),
            onPressed: () {
              //pop dialog box
              Navigator.pop(context);

              //Remove from cart
              Provider.of<CoffeeShop>(context, listen: false)
                  .removeItemFromCart(coffee);
            },
          ),
        ],
      ),
    );
  }

  //user pressed the pay button
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content:
            Text("User wants to pay connect this app to your payment backend"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              //heading
              const Text(
                "Your Cart",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              //List of cart items
              Expanded(
                child: ListView.builder(
                    itemCount: value.userCart.length,
                    itemBuilder: (context, index) {
                      //get individual cart coffee
                      Coffee eachCoffee = value.userCart[index];

                      //return coffee tile
                      return CoffeeTile(
                          coffee: eachCoffee,
                          onPressed: () => removeFromCart(eachCoffee),
                          icon: const Icon(
                            Icons.delete,
                          ));
                    }),
              ),
              GestureDetector(
                onTap: () => payButtonPressed(context),
                child: Container(
                  padding: const EdgeInsets.all(25),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      "Pay Now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
