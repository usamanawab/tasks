import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Model/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/location.png'),
                ),
                 Text(
                    AppLocalizations.of(context)!.shoppinginriyadh,
                  style: const TextStyle(
                    color: Color(0xFF07052A),
                    fontSize: 14,
                    fontFamily: 'HeadingNow-74Regular',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  width: 125,
                  height: 27,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.50, color: Color(0xFFE95F36)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child:  Center(
                    child: Text(
                      AppLocalizations.of(context)!.changelocation,
                      style:const TextStyle(
                        color: Color(0xFFE95F36),
                        fontSize: 12,
                        fontFamily: 'HeadingNow-73Book',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Image.asset('assets/heart.png'),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding:  EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.search,
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(0xFFF8DDCB)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            AppLocalizations.of(context)!.twentyoff,
                            style: const TextStyle(
                              color: Color(0xFFE95F36),
                              fontSize: 22.08,
                              fontFamily: 'HeadingNow-75Medium',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                         Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            AppLocalizations.of(context)!.onany,
                            style:const TextStyle(
                              color: Color(0xFF07052A),
                              fontSize: 22.08,
                              fontFamily: 'HeadingNow-74Regular',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(8.0),
                          width: 115,
                          height: 30,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.83, 0.56),
                              end: Alignment(-0.83, -0.56),
                              colors: [
                                Color(0xFF6633FF),
                                Color(0xFF20BD52)],
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child:  Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.ordernow,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'HeadingNow-74Regular',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(width: 6),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                         Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            AppLocalizations.of(context)!.valid,
                            style:const TextStyle(
                              color: Color(0xFF8B919D),
                              fontSize: 12,
                              fontFamily: 'HeadingNow-73Book',
                              fontWeight: FontWeight.w300,
                              height: 4.63,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/Pizza.png',
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      width: 191,
                      height: 182,
                      decoration: ShapeDecoration(
                        color: Color(0xFFF0F8F0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              AppLocalizations.of(context)!.fooddelivery,
                              style:const TextStyle(
                                color: Color(0xFF07052A),
                                fontSize: 16,
                                fontFamily: 'HeadingNow-74Regular',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                           Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              AppLocalizations.of(context)!.orderfrom,
                              style:const TextStyle(
                                color: Color(0xFF8B919D),
                                fontSize: 12,
                                fontFamily: 'HeadingNow-73Book',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Image.asset(
                                  'assets/tomato 1.png',
                                  height: 80,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  'assets/food 1.png',
                                  height: 80,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      width: 191,
                      height: 182,
                      decoration: ShapeDecoration(
                        color: Color(0xFFF1F0FB),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              AppLocalizations.of(context)!.stores,
                              style:const TextStyle(
                                color: Color(0xFF07052A),
                                fontSize: 16,
                                fontFamily: 'HeadingNow-74Regular',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                           Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                            AppLocalizations.of(context)!.shoptill,
                              style: const TextStyle(
                                color: Color(0xFF8B919D),
                                fontSize: 12,
                                fontFamily: 'HeadingNow-73Book',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                'assets/storefood.png',
                                height: 80,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      width: 191,
                      height: 182,
                      decoration: ShapeDecoration(
                        color: Color(0xFFEDFBFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              AppLocalizations.of(context)!.courier,
                              style: const TextStyle(
                                color: Color(0xFF07052A),
                                fontSize: 16,
                                fontFamily: 'HeadingNow-74Regular',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                           Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              AppLocalizations.of(context)!.reliable,
                              style: TextStyle(
                                color: Color(0xFF8B919D),
                                fontSize: 12,
                                fontFamily: 'HeadingNow-73Book',
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Image.asset('assets/corrier.png')
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: 191,
                          height: 83,
                          decoration: ShapeDecoration(
                            color: Color(0xFFFFF1F1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        AppLocalizations.of(context)!.discounts,
                                        style: const TextStyle(
                                          color: Color(0xFF07052A),
                                          fontSize: 16,
                                          fontFamily: 'HeadingNow-74Regular',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8,right: 8),
                                      child: Text(
                                        AppLocalizations.of(context)!.shopsmart,
                                        style: const TextStyle(
                                          color: Color(0xFF8B919D),
                                          fontSize: 12,
                                          fontFamily: 'HeadingNow-73Book',
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Image.asset(
                                      'assets/discounts.png',
                                      height: 30,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 191,
                          height: 83,
                          decoration: ShapeDecoration(
                            color: Color(0xFFF0F8F0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 8,right: 8),
                                      child: Text(
                                        AppLocalizations.of(context)!.member,
                                        style: const TextStyle(
                                          color: Color(0xFF07052A),
                                          fontSize: 16,
                                          fontFamily: 'HeadingNow-74Regular',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8,right: 8),
                                      child: Text(
                                        AppLocalizations.of(context)!.getmore,
                                        style: const TextStyle(
                                          color: Color(0xFF8B919D),
                                          fontSize: 10,
                                          fontFamily: 'HeadingNow-73Book',
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Image.asset(
                                      'assets/membership.png',
                                      height: 50,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
             Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.favorite,
                    style: const TextStyle(
                      color: Color(0xFF07052A),
                      fontSize: 18,
                      fontFamily: 'HeadingNow-74Regular',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.viewall,
                    style: const TextStyle(
                      color: Color(0xFFE95F36),
                      fontSize: 12,
                      fontFamily: 'HeadingNow-74Regular',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 263,
                    height: 134,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/favor1.png'))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: 64,
                          height: 20,
                          decoration: const ShapeDecoration(
                            color: Color(0xFF2CA66F),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(4),
                                bottomRight: Radius.circular(4),
                              ),
                            ),
                          ),
                          child:  Center(
                            child: Text(
                              AppLocalizations.of(context)!.thirtyoff,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontFamily: 'HeadingNow-75Medium',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: const ShapeDecoration(
                              color: Colors.white,
                              shape: OvalBorder(),
                              shadows: [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Center(
                                child: Image.asset('assets/heart_fill.png')),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 263,

                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Text(
                              'English Tea House',
                              style: TextStyle(
                                color: Color(0xFF07052A),
                                fontSize: 14,
                                fontFamily: 'HeadingNow-74Regular',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Image.asset('assets/star-Filled.png'),
                          const SizedBox(width: 10,),
                          const Text('4.0 (100+)',
                            style: TextStyle(
                              color: Color(0xFF07052A),
                              fontSize: 12,
                              fontFamily: 'HeadingNow-74Regular',
                              fontWeight: FontWeight.w400,

                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
             Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                AppLocalizations.of(context)!.category,
                style: const TextStyle(
                  color: Color(0xFF07052A),
                  fontSize: 18,
                  fontFamily: 'HeadingNow-74Regular',
                  fontWeight: FontWeight.w400,

                ),
              ),
            ),

            FutureBuilder<List<ProductModel>>(
              future: _fetchProducts(),
              builder: (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error Occurred: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final categories = snapshot.data!;
                  return Container(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal, // Set scroll direction to horizontal
                      shrinkWrap: true,
                      physics: PageScrollPhysics(),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        ProductModel product = categories[index];

                        return Container(
                          width: 150,
                          child: Card(

                            margin: EdgeInsets.all(10),
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: Image.network(
                                    product.image!,
                                    height: 70,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Center(
                                    child: Text(
                                      product.category!,
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
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
}
