import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'favorites.dart';
import 'messages.dart';
import 'cart.dart';
import 'notification.dart';
import 'about.dart';
import 'settings.dart';
import 'profileSettings.dart';
import 'addressDelivery.dart';
import 'history.dart';
import 'package:ecommerce/components/store.dart';
import 'itemDetails.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}
class _homePageState extends State<homePage>{
  BuildContext context;
  @override
  Widget build(BuildContext context){
    this.context = context;
    return new Scaffold(
      // the header
      appBar: new AppBar(
//        title
        title: new Text("kopen"),
        centerTitle: true,
        actions: <Widget>[
//          favorite
          new IconButton(icon: new Icon(Icons.favorite, color: Colors.black,), onPressed: (){
           Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context){
             return new favorite();
           }));
          }),
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
                  child: new Text("0",
                    style: new TextStyle(color: Colors.black, fontSize: 12.0),
                  ),
                );
              })],
          )
        ],
      ),
      // the body "store items"
      body: new Center(
        child: new Column(
          children: <Widget>[
            new Flexible(
                child: new GridView.builder(
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: storeItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return new GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(new MaterialPageRoute(
                              builder: (context) => new ItemDetail(
                              itemImage: storeItems[index].itemImage,
                              itemName: storeItems[index].itemName,
                              itemPrice: storeItems[index].itemPrice,
                              itemRating: storeItems[index].itemRating,
                              )));
                              },
                      child: new Card(
                      child: Stack(
                        alignment: FractionalOffset.topLeft,
                        children: <Widget>[
//                          product card
                          new Stack(
                            alignment: FractionalOffset.bottomCenter,
                            children: <Widget>[
//                              image
                              new Container(
                                decoration: new BoxDecoration(
                                    image: new DecorationImage(
                                        fit: BoxFit.fitWidth,
                                        image: new NetworkImage(
                                            storeItems[index].itemImage))),
                              ),
//                              text "product name and price"
                              new Container(
                                height: 35.0,
                                color: Colors.amber.withAlpha(150),
                                child: new Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: new Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      new Text(
                                        "${storeItems[index].itemName}...",
                                        style: new TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16.0,
                                            color: Colors.black),
                                      ),
                                      new Text(
                                        "${storeItems[index].itemPrice} \E£",
                                        style: new TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
//                          favorite product
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Container(
                                width: 45.0,
                                height: 30.0,
                              ),
                              new IconButton(icon: Icon(Icons.favorite_border, color: Colors.amber,), onPressed: null)
                            ],
                          ),
//                          reviews
                          new Container(
                            width: 45.0,
                            height: 30.0,
                            decoration: new BoxDecoration(
                              color: Colors.amber,
                              borderRadius: new BorderRadius.only(
                                bottomRight: new Radius.circular(8.0),
                                bottomLeft: new Radius.circular(8.0),
                              )
                            ),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                new Text("${storeItems[index].itemRating}",
                                  style: new TextStyle(color: Colors.black),
                                  textAlign: TextAlign.right,
                                ),
                                new Icon(Icons.star, color: Colors.black,size:15.0 ,),
                              ],
                            ),
                          )
                        ],
                      ),
                    ));
                  }
                      )
                      )
                      ])
                      ),

//      add to cart button
      floatingActionButton: new FloatingActionButton(onPressed: null, child: new Stack(
        children: <Widget>[
          new IconButton(icon: new Icon(Icons.add_shopping_cart, color: Colors.black,), onPressed: (){
            Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context){
              return new cart();
            }));
          }),
          new CircleAvatar(
            radius: 8.0,
            backgroundColor: Colors.red,
            child: new Text("0",
              style: new TextStyle(color: Colors.amber, fontSize: 12.0),
            ),
          )
        ],
      )),
//      create drawer "sidebar list"
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
//            create user account header
            new UserAccountsDrawerHeader(accountName: new Text("Mayar"), accountEmail: new Text("mayaramein@gmail.com"),
            currentAccountPicture: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Icon(Icons.person),
      )
            ),
//            create "sidebar list items"
            new ListTile(
              leading: new CircleAvatar(
                child: new Icon(Icons.notifications, color: Colors.black, size: 20.0,),
              ),
              title: new Text("Order Notifications"),
              onTap: (){
                Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context) => new notification()
                )
                );},
            ),
            new ListTile(
              leading: new CircleAvatar(
                child: new Icon(Icons.history, color: Colors.black, size: 20.0,),
              ),
              title: new Text("Order History"),
              onTap: (){
                Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context) => new history()
                )
                );},
            ),
            new Divider(),
            new ListTile(
              leading: new CircleAvatar(
                child: new Icon(Icons.person, color: Colors.black, size: 20.0,),
              ),
              title: new Text("Profile Settings"),
              onTap: (){
                Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context) => new profileSettings()
                )
                );},
            ),
            new ListTile(
              leading: new CircleAvatar(
                child: new Icon(Icons.home, color: Colors.black, size: 20.0,),
              ),
              title: new Text("Delivary Address"),
              onTap: (){
                Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context) => new addressDelivery()
                )
                );},
            ),
            new Divider(),
            new ListTile(
              leading: new CircleAvatar(
                child: new Icon(Icons.help, color: Colors.black, size: 20.0,),
              ),
              title: new Text("About As"),
              onTap: (){
                Navigator.of(context).push(new CupertinoPageRoute(builder: (BuildContext context) => new About()
                )
                );},
            ),
            new ListTile(
              leading: new CircleAvatar(
                child: new Icon(Icons.exit_to_app, color: Colors.black, size: 20.0,),
              ),
              title: new Text("Login"),

            ),

          ],
        ),
      ),
    );
  }
}

