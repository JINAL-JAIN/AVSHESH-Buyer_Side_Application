import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:buyer/constants.dart';
import 'package:buyer/API.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:buyer/splash screen.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:buyer/profile.dart';
import 'package:filter_list/filter_list.dart';
import 'package:buyer/product.dart';


class Home extends StatefulWidget {
  static String route = 'home';


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List <Product>selectedUserList = [];
  int selectedIndex = 0;
  APIservice apIservice = APIservice();

  String selectedStubble = 'NONE';

  static const List<String> stubbleList = [
    'NONE',
    'RICE',
    'WHEAT',
    'SUGARCANE'
  ];

  List<DropdownMenuItem> getDropdownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (int i = 0; i < stubbleList.length; i++) {
      String stubble = stubbleList[i];

      var newItem = DropdownMenuItem(
        child: Text(stubble),
        value: stubble,
      );
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }

  void openFilterDialog() async {
    await FilterListDialog.display<Product>(
      context,
      listData: prodList,
      selectedListData: selectedUserList,
      choiceChipLabel: (product) => product.stubble,
      validateSelectedItem: (list, val) => list.contains(val),
      onItemSearch: (product, query) {
        return product.stubble.toLowerCase().contains(query.toLowerCase());
      },
      onApplyButtonClick: (list) {
        setState(() {
          selectedUserList = List.from(list);
        });
        Navigator.pop(context);
      },
    );
  }

  getProducts() async {
    await apIservice.getProductList();
  }
  @override
  void initState() {
    getProducts();
    print(1);
    print(Productlist);
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text("AVSHESH"),
      ),

      body: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(10),
                width: 300,
                child: DropdownButton<String>(
                    value: selectedStubble,
                    items: getDropdownItems(),
                    isExpanded: true,
                    icon: Icon(Icons.filter_alt),
                    onChanged: (value) {
                      setState(() {
                        selectedStubble = value;
                        Filterlist=prodList.where((i) => i.stubble==selectedStubble).toList();
                      });
                    }),
              ),
            ),

            selectedStubble=="NONE"?
            Expanded(
              child: Center(
              child: ListView.builder(itemCount: Productlist == null ? 0 : Productlist.length,
    itemBuilder: (BuildContext context, int index) {
    return InkWell( child: Container(
    width: 350,
    height: 250,
    child:Card(
    shadowColor: Colors.green[700],
    elevation: 4.0,
    child: Row(
    children: [
    Expanded(
    flex: 1,
    child: Container(
    child: Padding(
    padding: const EdgeInsets.fromLTRB(5.0, 2, 2, 2),
    child: Image.network(
    'https://assets.thehansindia.com/h-upload/feeds/2019/07/13/195638-paddy-crop.jpg'),
    ),
    ),
    ),
    SizedBox(
    width: 8.0,
    ),
    Expanded(
    flex: 2,
    child:
    Padding(
    padding: const EdgeInsets.all(1.0),
    child: Column(
    children: [
    SizedBox(
    height: 30,
    width: 200,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
    IconButton(
    icon: Icon(Icons.phone, color: Colors.blue,),
    onPressed: (){
          launch('tel: +91'+ Productlist[index].phone);
    }
    ),
    IconButton(
    icon: Icon(
    Icons.email, color:Colors.blue,),
    onPressed: () {
          launch('mailto:$Productlist[index].email');
    },

    ),
    ],
    ),
    ),
    SizedBox(
    height: 10,
    ),
    SizedBox(
    height: 75,
    child: ListTile(
    title:
    Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text('LOCATION',
                  style: TextStyle(fontSize: 14, color: Colors.green[700], fontWeight: FontWeight.bold)),

              Text(Productlist[index][5], style: TextStyle(fontSize: 14))
          ],
    ),
    ),
    ),
    SizedBox(
    height: 40,
    child: ListTile(
    title:
    Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text('STUBBLE',
              style: TextStyle(fontSize: 14, color: Colors.green[700], fontWeight: FontWeight.bold)),
              Text(Productlist[index][2], style: TextStyle(fontSize: 14,))
          ],
    ),
    ),
    ),
    SizedBox(
    height: 40,
    child: ListTile(
    title:
    Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text('QUANTITY',
              style: TextStyle(fontSize: 14,
              color: Colors.green[700],
              fontWeight: FontWeight.bold),),

              Text(Productlist[index][3].toString(), style: TextStyle(fontSize: 14))
          ],
    ),
    ),
    ),
    SizedBox(
    height: 40,
    child: ListTile(
    title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Text('PRICE',
    style:TextStyle(fontSize: 14,
              color: Colors.green[700],
              fontWeight: FontWeight.bold),
                ),
                Text(Productlist[index][4].toString(), style: TextStyle(fontSize: 14,),)]
    ),
    ),
    )]
    )
    )
    ),
    ]
    ),
    ),
    ),);}

          ),
          ),
            ):
            Expanded(
              child: Center(
                child: ListView.builder(itemCount: Filterlist == null ? 0 : Filterlist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell( child: Container(
                        width: 350,
                        height: 250,
                        child:Card(
                          shadowColor: Colors.green[700],
                          elevation: 4.0,
                          child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(5.0, 2, 2, 2),
                                      child: Image.network(
                                          'https://assets.thehansindia.com/h-upload/feeds/2019/07/13/195638-paddy-crop.jpg'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.0,
                                ),
                                Expanded(
                                    flex: 2,
                                    child:
                                    Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: Column(
                                            children: [
                                              SizedBox(
                                                height: 30,
                                                width: 200,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    IconButton(
                                                        icon: Icon(Icons.phone, color: Colors.blue,),
                                                        onPressed: (){
                                                          launch('tel: +91'+ Filterlist[index].phone);
                                                        }
                                                    ),
                                                    IconButton(
                                                      icon: Icon(
                                                        Icons.email, color:Colors.blue,),
                                                      onPressed: () {
                                                        launch('mailto:$Filterlist[index].email');
                                                      },

                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                height: 75,
                                                child: ListTile(
                                                  title:
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('LOCATION',
                                                          style: TextStyle(fontSize: 14, color: Colors.green[700], fontWeight: FontWeight.bold)),

                                                      Text(Filterlist[index].location, style: TextStyle(fontSize: 14))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 40,
                                                child: ListTile(
                                                  title:
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('STUBBLE',
                                                          style: TextStyle(fontSize: 14, color: Colors.green[700], fontWeight: FontWeight.bold)),
                                                      Text(Filterlist[index].stubble, style: TextStyle(fontSize: 14,))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 40,
                                                child: ListTile(
                                                  title:
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('QUANTITY',
                                                        style: TextStyle(fontSize: 14,
                                                            color: Colors.green[700],
                                                            fontWeight: FontWeight.bold),),

                                                      Text(Filterlist[index].quantity.toString(), style: TextStyle(fontSize: 14))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 40,
                                                child: ListTile(
                                                  title: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children:[
                                                        Text('PRICE',
                                                          style:TextStyle(fontSize: 14,
                                                              color: Colors.green[700],
                                                              fontWeight: FontWeight.bold),
                                                        ),
                                                        Text(Filterlist[index].price.toString(), style: TextStyle(fontSize: 14,),)]
                                                  ),
                                                ),
                                              )]
                                        )
                                    )
                                ),
                              ]
                          ),
                        ),
                      ),);}

                ),
              ),
            ),
    ]
        ),


        bottomNavigationBar: FFNavigationBar(
          theme: FFNavigationBarTheme(
            barBackgroundColor: Colors.white,
            selectedItemBorderColor: Colors.transparent,
            selectedItemBackgroundColor: Colors.green,
            selectedItemIconColor: Colors.white,
            selectedItemLabelColor: Colors.black,
            showSelectedItemShadow: false,
            barHeight: 70,
          ),

    selectedIndex: selectedIndex,

    onSelectTab: (index){
    setState(() {
    selectedIndex = index;
    if (selectedIndex == 0) {
    Navigator.pushNamed(context, Home.route);
    }  else if (selectedIndex == 1) {
    Navigator.pushNamed(context, Profile.route);
    }
    });
    },

    items: items,
    )
    );
  }
}


