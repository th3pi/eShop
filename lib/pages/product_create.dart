import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue;
  String _descriptionValue;
  double _priceValue;
  FocusNode firstNode = FocusNode(),
      secondNode = FocusNode(),
      thirdNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: ListView(
        children: <Widget>[
          TextField(
            focusNode: firstNode,
            onSubmitted: (String value) {
              _titleValue = value;
              FocusScope.of(context).requestFocus(secondNode);
            },
            decoration: InputDecoration(labelText: 'Title'),
            onChanged: (String value) {
              setState(() {
                _titleValue = value;
              });
            },
          ),
          TextField(
            focusNode: secondNode,
            onSubmitted: (String value) {
              _descriptionValue = value;
              FocusScope.of(context).requestFocus(thirdNode);
            },
            decoration: InputDecoration(labelText: 'Description'),
            maxLines: 4,
            onChanged: (String value) {
              setState(() {
                _descriptionValue = value;
              });
            },
          ),
          TextField(
            focusNode: thirdNode,
            onSubmitted: (String value){
              _priceValue = double.parse(value);
            },
            decoration: InputDecoration(labelText: 'Price'),
            keyboardType: TextInputType.number,
            onChanged: (String value) {
              setState(() {
                _priceValue = double.parse(value);
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            child: Text('Submit'),
            onPressed: () {
              final Map<String, dynamic> product = {
                'title': _titleValue,
                'description': _descriptionValue,
                'price': _priceValue,
                'image': 'assets/food.jpg'
              };
              widget.addProduct(product);
              Navigator.pushReplacementNamed(context, 'products');
            },
          )
        ],
      ),
    );
  }
}
