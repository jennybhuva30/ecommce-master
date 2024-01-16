import 'dart:convert';

import 'package:ecommce/productDetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class productoage extends StatefulWidget {
  String category;
  productoage(this.category);
  @override
  State<productoage> createState() => _productoageState();
}

class _productoageState extends State<productoage> {
  Future get_products() async {
    // print('https://fakestoreapi.com/products/category/${widget.category}');
    var url = Uri.parse('https://dummyjson.com/products/category/${widget.category}');
    var response = await http.get(url);

    // print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    Map list=jsonDecode(response.body);
    print(response.body);
    return list;

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    get_products();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("product"),),
      body: FutureBuilder(
        future: get_products(),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting)
          {
            return Center(child: CircularProgressIndicator(),);
          }
          else
          {
            List l=snapshot.data['products'] ;
            return ListView.separated(itemBuilder: (context, index) {

              Map m=l[index];
              print(m);

              return ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return productDetails(m);
                  },));
                },
                title: Text("${m['title']}"),
                subtitle: Text("${m['price']}"),
                leading: Image.network("${m['thumbnail']}"),
              );
            },itemCount: l!.length, separatorBuilder: (BuildContext context, int index) {
              return Divider(thickness: 1,color: Colors.red,);
            },);
          }
        },
      ),
    );
  }
}
