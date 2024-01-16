import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';

class productDetails extends StatefulWidget {
  Map m;

  productDetails(this.m);

  @override
  State<productDetails> createState() => _productDetailsState();
}

class _productDetailsState extends State<productDetails> {
  double rate = 0;
  double review = 0;
dynamic l;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    l=widget.m['images'];
    rate=widget.m['rating'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("description"),
      ),
      body: Column(
        children: [
          Text("${widget.m['title']}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
          RatingBar.builder(
            initialRating: rate,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.deepPurple,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          Text("${widget.m['rating']} Reviews"),
          // CarouselSlider(items: [widget.m['images'][0],widget.m['images'][1],widget.m['images'][2],widget.m['images'][3],].map((e) {
          //   return  Builder(
          //     builder: (BuildContext context) {
          //       return Container(
          //           width: MediaQuery.of(context).size.width,
          //           margin: EdgeInsets.symmetric(horizontal: 5.0),
          //           decoration: BoxDecoration(
          //               color: Colors.amber
          //           ),
          //           child:Image.network(e),
          //       );
          //     },
          //   );
          // }).toList(), options: CarouselOptions(height: 400.0),),
          // CarouselSlider(
          //     items: ,
          //     options: CarouselOptions(
          //       height: 400,
          //       aspectRatio: 16/9,
          //       viewportFraction: 0.8,
          //       initialPage: 0,
          //       enableInfiniteScroll: true,
          //       reverse: false,
          //       autoPlay: true,
          //       autoPlayInterval: Duration(seconds: 3),
          //       autoPlayAnimationDuration: Duration(milliseconds: 800),
          //       autoPlayCurve: Curves.fastOutSlowIn,
          //       enlargeCenterPage: true,
          //       enlargeFactor: 0.3,
          //       onPageChanged: callbackFunction,
          //       scrollDirection: Axis.horizontal,
          //     )
          // )
          Expanded(child: Image.network('${widget.m['thumbnail']}')),
          Expanded(child: Text("Description:  ${widget.m['description']}")),
          Expanded(child: Text("dollar:${widget.m['price']}")),
          SizedBox(
            height: 100,
          ),

        ],
      ),
    );
  }
}
