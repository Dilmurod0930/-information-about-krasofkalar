import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hirowidget/model/rekamindatsiya_model.dart';
import 'package:hirowidget/model/shop_model.dart';
import 'package:hirowidget/view/page/nike_page.dart';

class MyHiroWidget extends StatefulWidget {
  const MyHiroWidget({Key? key}) : super(key: key);

  @override
  State<MyHiroWidget> createState() => _MyHiroWidgetState();
}

class _MyHiroWidgetState extends State<MyHiroWidget> {
  int _corantIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 60,
                  width: 300,
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        hintText: 'Search...',
                        fillColor: Colors.grey.withOpacity(0.6),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Center(
                    child: IconButton(
                      icon: const Icon(
                        Icons.settings,
                        size: 32,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Brands",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
              Text(
                "View all",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.redAccent,
                ),
              )
            ],
          ),
          SizedBox(
            height: 170,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ShopModel.shopImage.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Container(
                      height: 90,
                      width: 120,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 6,
                            child: Container(
                              child: Center(
                                child: Image.network(
                                  ShopModel.shopImage[index],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: Container(
                                child: Center(
                                  child: Text(
                                    ShopModel.shopName[index],
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Text(
            "Recommened",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 26),
          ),
          InkWell(
            child: Container(
              height: 357,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: ShopModel.shopImage.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                            height: 280,
                            width: 250,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(NikeImage.nikeImage[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(NikeName.nikeName[index]),
                                Text(
                                  NikePrise.nikePrise[index],
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyNikePage() ));
            },
          ),
        ],
      ),

//! BottomNavigatorBar

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Person',
          )
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _corantIndex,
        onTap: (index) {
          setState(() {
            _corantIndex = index;
          });
        },
      ),

// !  App Bar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: const [
          Icon(
            Icons.shopping_bag,
            color: Colors.grey,
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
