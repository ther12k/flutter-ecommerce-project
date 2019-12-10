import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/userScreens/cart.dart';
import 'messages.dart';
import 'favorites.dart';

class ItemDetail extends StatefulWidget {
  String itemName;
  String itemImage;
  String itemSubName;
  double itemPrice;
  double itemRating;

  ItemDetail(
      {this.itemName,
        this.itemImage,
        this.itemRating,
        this.itemPrice,
        this.itemSubName});

  @override
  _ItemDetailState createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
//      item details header
      appBar: new AppBar(
//        backgroundColor: Colors.black.withOpacity(0.5),
//        title: new Text("Item Details"),
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
//          Chat
          new Stack(
            children: <Widget>[
              new IconButton(icon: new Icon(Icons.chat, color: Colors.black,), onPressed:() {
                Navigator.of(context).push(
                  new CupertinoPageRoute(builder: (BuildContext context) {
                    return new messages();
                  }),
                );
                new CircleAvatar(
                  radius: 8.0,
                  backgroundColor: Colors.red,
                  child: new Text(
                    "0",
                    style: new TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                );
              })],
          )
        ],
      ),
//      the body
      body: new Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          new Container(
            height: 650.0,
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new NetworkImage(widget.itemImage),
                    fit: BoxFit.fitHeight),
                ),
          ),
          new SingleChildScrollView(

            child: new Column(
//              the product whole picture
              children: <Widget>[
                new SizedBox(
                  height: 180.0,
                ),
//                item details of the product
                new Card(
                  color: Colors.black.withAlpha(125),
                  child: new Container(
                    width: screenSize.width,
                    margin: new EdgeInsets.only(left: 20.0, right: 20.0),
                    child: new Column(
                      children: <Widget>[
                        new SizedBox(
                          height: 20.0,
                        ),
                        new Text(
                          widget.itemName,
                          style: new TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                        new Text(
                          "Item subname",
                          style: new TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.white),
                        ),
                        new SizedBox(
                          height: 20.0,
                        ),
//                        the all pictures about the product
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Row(
//                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                new Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 25.0,
                                ),
                                new SizedBox(
                                  width: 5.0,
                                ),
                                new Text(
                                  "${widget.itemRating}",
                                  style: new TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                            new Text(
                              "${widget.itemPrice} \E£",
                              style: new TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.amber[500],
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
//          the full images about product
                new Card(
                  color: Colors.black.withAlpha(50),
                  child: new Container(
                    width: screenSize.width,
                    height: 150.0,
                    child: new ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return new Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              new Container(
                                margin:
                                new EdgeInsets.only(left: 5.0, right: 5.0),
                                height: 145.0,
                                width: 100.0,
                                child: new Image.network(widget.itemImage),
                              ),
                              new Container(
                                margin:
                                new EdgeInsets.only(left: 5.0, right: 5.0),
                                height: 140.0,
                                width: 100.0,
                                decoration: new BoxDecoration(
                                    color: Colors.grey.withAlpha(25)),
                              ),
                            ],
                          );
                        }),
                  ),
                ),
//            product description
                new Card(
                  color: Colors.black.withAlpha(125),
                  child: new Container(
                    width: screenSize.width,
                    margin: new EdgeInsets.only(left: 20.0, right: 20.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text(
                          "Description",
                          style: new TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Text(
                          "My item full information",
                          style: new TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.white),
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
//                product options
                new Card(
                  color: Colors.black.withAlpha(100),
                  child: new Container(
                    width: screenSize.width,
                    margin: new EdgeInsets.only(left: 20.0, right: 20.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new SizedBox(
                          height: 10.0,
                        ),
//                        colors
                        new Text(
                          "Colors",
                          style: new TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new SizedBox(
                          height: 50.0,
                          child: new ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: new ChoiceChip(
                                      label: new Text("Color ${index}"),
                                      selected: false),
                                );
                              }),
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
//                        sizes
                        new Text(
                          "Sizes",
                          style: new TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new CircleAvatar(
                              child: new Icon(Icons.remove),
                            ),
                            new Text("0",style: new TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w700, color: Colors.white),
                            ),
                            new CircleAvatar(
                              child: new Icon(Icons.add),
                            ),
                          ],
                        ),
                        new SizedBox(
                          height: 45.0,
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          )

            ],
      ),

//          cart
      floatingActionButton: new Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          new FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(new CupertinoPageRoute(
                  builder: (BuildContext context) => new cart()));
            },
            child: new Icon(Icons.shopping_cart),
          ),
          new CircleAvatar(
            radius: 8.0,
            backgroundColor: Colors.red,
            child: new Text(
              "0",
              style: new TextStyle(color: Colors.white, fontSize: 12.0),
            ),
          )
        ],
      ),
//      bottom bar
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: new BottomAppBar(
        color: Theme.of(context).primaryColor,
//        elevation: 0.0,
        shape: new CircularNotchedRectangle(),
//        notchMargin: 5.0,
        child: new Container(
          height: 55.0,
          decoration: new BoxDecoration(color: Theme.of(context).primaryColor),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Container(
                width: (screenSize.width - 20) / 2,
                child: new Text(
                  "ADD TO FAVORITES",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w700),
                ),
              ),
              new Container(
                width: (screenSize.width - 20) / 2,
                child: new Text(
                  "ORDER NOW",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}