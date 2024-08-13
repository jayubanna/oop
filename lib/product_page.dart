import 'package:dart_day1/person_page.dart';
import 'package:flutter/material.dart';

class Product {
  int _id;
  String _name;
  double _price;

  Product({required int id, required String name, required double price})
      : _id = id,
        _name = name,
        _price = price;

  int get id => _id;

  set id(int value) => _id = value;

  String get name => _name;

  set name(String value) => _name = value;

  double get price => _price;

  set price(double value) => _price = value;
  @override
  String toString() {
    return 'Product{id: $_id, name: $_name, price: $_price}';
  }
}

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    List<Product> products = [
      Product(id: 1, name: 'Product 1', price: 10.99),
      Product(id: 2, name: 'Product 2', price: 9.99),
      Product(id: 3, name: 'Product 3', price: 12.99),
    ];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PersonPage();
          }));
        },
        child: Icon(Icons.arrow_forward,),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text('Product List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(products[index].name),
              subtitle: Text('ID: ${products[index].id} - \$${products[index].price}'),
            ),
          );
        },
      ),
    );
  }
}
