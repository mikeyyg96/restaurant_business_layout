import 'package:flutter/material.dart';
import 'package:restaurant_business_layout/styling.dart';

class CustomCard extends StatefulWidget {

  CustomCard({this.food, this.img, this.subtitle, this.description, this.calories});

  final String food, img, subtitle, description;
  final int calories;

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {

  TextEditingController txt = new TextEditingController(text: '1');

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width / 1.6,
              padding: const EdgeInsets.only(left: 50.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.info,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Text(
                      widget.food,
                      style: stylingMedium(),
                    ),
                    Text(widget.subtitle, style: stylingSmall()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.remove_circle_outline),
                            )),
                        Expanded(
                            child: TextField(
                          autofocus: false,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                          controller: txt,
                        )),
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.add_circle_outline),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: FlatButton(
                            onPressed: () {},
                            child: Text('Customize', style: stylingSmall(),),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: RaisedButton(
                              onPressed: () {},
                              child: Text('Add to Cart', style: stylingSmall(),),
                              color: Color(0xFF3DDAD7),
                            ))
                      ],
                    )
                  ],
                ),
              )),
        ),
        Positioned(
          right: 100,
          bottom: 300,
          child: Image.asset(
            widget.img,
            fit: BoxFit.cover,
            width: 200,
            height: 200,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    txt.dispose();
    super.dispose();
  }
}
