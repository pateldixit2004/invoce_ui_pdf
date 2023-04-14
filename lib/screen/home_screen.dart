import 'package:flutter/material.dart';
import 'package:invoce_gentertaer/screen/Modal_class.dart';



List<productModal> itemList=[];

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  TextEditingController pname =TextEditingController();
  TextEditingController pqty =TextEditingController();
  TextEditingController pprice =TextEditingController();
  int? index;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Bridal Studio",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: itemList.asMap().entries.map((e) => list(itemList[e.key],e.key)).toList(),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                product();
              },
              child: Text(
                "Product +",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            ),
            ElevatedButton(
              onPressed: () {



                Navigator.pushNamed(context, 'pdf',arguments: itemList);




              },
              child: Text(
                " Invoce ",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  void product() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: pname,
                decoration: InputDecoration(
                    hintText: '',labelText: 'Product name ',
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.black12))),
              ),
              SizedBox(height: 15),
              TextField(controller: pqty,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    hintText: '',labelText: 'Product Qty ',
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.black12))),
              ),
              SizedBox(height: 15),
              TextField(controller: pprice,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    hintText: '',labelText: 'Product Price ',
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.black12))),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {

                  String name=pname.text;
                  String qty=pqty.text;
                  String price=pprice.text;

                  productModal pro =productModal(name: name,qty: qty,price: price);
                  setState(() {
                    itemList.add(pro);
                  });

                },
                child: Text(
                  "Product +",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              ),

            ],
          ),
        );
      },
    );
  }
  Widget list(productModal p1,int index)
  {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 100,
                color: Colors.white,
                child: Column(
                  children: [
                    Text("Product name"),
                    Center(child: Text("${p1.name}")),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 100,
                color: Colors.white,
                child: Column(
                  children: [
                    Text("Qty"),
                    Center(child: Text("${p1.qty}")),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 100,
                color: Colors.white,
                child: Column(
                  children: [
                    Text("Price"),
                    Center(child: Text("${p1.price}")),
                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
// Row(
// children: [
//
// Column(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text("Product name"),
//
//
// SizedBox(width: 10),
// Text("Qty"),
// Column(
// children: [
// ],
// ),
//
// SizedBox(width: 10),
// Text("price"),
// ],
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
//
// children: [
// SizedBox(width: 5),
// Text("${p1.name}"),
//
// SizedBox(width: 25),
// Text("${p1.qty}"),
//
// SizedBox(width: 20),
// Text("${p1.price}"),
//
// ],
// ),
// ],
// ),
//
// ],
// ),
