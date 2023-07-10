import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:task/Model/product.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;



  Future<List<ProductModel>> _fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      print(
          "name are ${data.map((json) => ProductModel.fromJson(json)).toList()}");
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  @override
  void initState() {
    _fetchProducts();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        title:  Text(AppLocalizations.of(context)!.category,style: TextStyle(color: Colors.black),),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<List<ProductModel>>(
              future: _fetchProducts(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<ProductModel>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error Occurred: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final categories = snapshot.data!;
                  return GridView.builder(

                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    //  childAspectRatio: 1,
                    ),
                    shrinkWrap: true,
                    physics: PageScrollPhysics(),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      ProductModel product = categories[index];

                      return Card(
                        margin: EdgeInsets.all(10),
                        elevation: 20,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.network(
                                product.image!,
                                height: 70,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Center(
                                child: Text(
                                  product.title!,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Category: ${product.category!}',
                                style: const TextStyle(
                                  fontSize: 12.0,

                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Price: ${product.price!}',
                                style: TextStyle(
                                  fontSize: 12.0,

                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Rating: ${product.rating!}',
                                style: TextStyle(
                                  fontSize: 10.0,

                                ),
                              ),
                            ),

                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const Text('No categories available');
                }
              },
            ),
          ],
        ),
      ),

    );
  }

  Widget _buildTabItem(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: _currentIndex == index ? Colors.blue : Colors.transparent,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Icon(
        Icons.home,
        color: _currentIndex == index ? Colors.white : Colors.grey,
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
