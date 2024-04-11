import 'package:coffeeshopapp/components/coffee_tile.dart';
import 'package:coffeeshopapp/models/coffee.dart';
import 'package:coffeeshopapp/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add coffee to cart
  void addToCart(Coffee coffee) {
    //add to cart
    //let the user know it has been added successfully
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Add this to your cart"),
        actions: [
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

              //add to cart
              Provider.of<CoffeeShop>(context, listen: false)
                  .addItemToCart(coffee);
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //acess coffee in coffeeshop
    final coffee = context.watch<CoffeeShop>().coffeeShop;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            //heading message
            const Text(
              "How would you like your coffee?",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 25,
            ),
            //list of coffee
            Expanded(
              child: ListView.builder(
                itemCount: coffee.length,
                itemBuilder: (context, index) {
                  //get each individual coffee from coffee shop
                  final eachCoffee = coffee[index];

                  //return as a product tile UI
                  return CoffeeTile(
                    coffee: eachCoffee,
                    icon: const Icon(Icons.add),
                    onPressed: () => addToCart(eachCoffee),
                  );
                },
              ),
            ),

            // ),
          ],
        ),
      ),
    );
  }
}
