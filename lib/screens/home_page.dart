import 'package:flutter/material.dart';
import 'package:retro_walk/widgets/product_container.dart';
import 'package:http/http.dart' as http;
import 'package:retro_walk/screens/product_details.dart';
import 'dart:convert';
import 'dart:async';
import 'package:retro_walk/widgets/recent_product_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Map data;
  late List productData;

  Future getProduct() async {
    http.Response response =
        await http.get(Uri.parse('https://s3-eu-west-1.amazonaws.com/api.themeshplatform.com/products.json'));
    data = json.decode(response.body);
    setState(() {
      productData = data["data"];
    });
    debugPrint(productData.toString());
  }

  @override
  void initState() {
    super.initState();
    getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "RETRO WALK",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.grey,
          ),
          onPressed: () {
            //getProductDetails();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.grey,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              child: GridView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: productData.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 260,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return ProductContainer(
                      productName: productData[index]["name"],
                      brandName: productData[index]["brandName"],
                      price: productData[index]["price"]["amount"],
                      imageUrl: productData[index]["mainImage"],
                      currency: productData[index]["price"]["currency"],
                    );
                  }),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 10.0,
                top: 10.0,
              ),
              child: Text(
                "Recently Viewed",
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.black54, fontSize: 16),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(10),
                  itemCount: productData.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProductDetailsPage(),
                            ));
                      },
                      child: RecentProductContainer(
                        brandName: productData[index]["brandName"],
                        imageUrl: productData[index]["mainImage"],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
