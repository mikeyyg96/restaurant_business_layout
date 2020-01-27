import 'package:flutter/material.dart';
import 'package:restaurant_business_layout/objects/cart.dart';
import 'package:restaurant_business_layout/pages/customize_page.dart';
import 'package:restaurant_business_layout/styling/styling.dart';

class IngredientTile extends StatefulWidget {
  IngredientTile({this.ingredient});

  Ingredient ingredient;

  @override
  _TilePageState createState() => _TilePageState();
}

class _TilePageState extends State<IngredientTile> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 6,
      child: Row(
        children: <Widget>[
          Container(
            width: 150,
            child: Image.asset(widget.ingredient.img, fit: BoxFit.fitHeight),
          ),
          Expanded(
            child: Center(
              child: Text(widget.ingredient.name, style: stylingMedium()),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  onPressed: () {
                    setState(() {
                      widget.ingredient.counter++;
                    });
                    
                  },
                  icon: Icon(
                    Icons.add,
                    size: 20.0,
                  )),
              Text(
                '${widget.ingredient.counter}',
                style: stylingSmall(),
                textAlign: TextAlign.center,
              ),
              IconButton(
                  onPressed: () {
                    if (widget.ingredient.counter == 1) {
                      setState(() {
                        widget.ingredient.isRemoved = true;
                        widget.ingredient.counter--;
                      });
                      
                    } else if (widget.ingredient.counter > 1){
                      setState(() {
                        widget.ingredient.counter--;
                      });
                    } else {

                    }
                  },
                  icon: Icon(
                    Icons.remove,
                    size: 20.0,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
