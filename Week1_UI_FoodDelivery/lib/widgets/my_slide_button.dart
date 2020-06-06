import 'package:flutter/material.dart';
import 'package:slide_button/slide_button.dart';

class MySlideButton extends StatefulWidget {
  @override
  _MySlideButtonState createState() => _MySlideButtonState();
}

class _MySlideButtonState extends State<MySlideButton> {
  bool addToCart = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        margin: EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
        child: SlideButton(
          slidingChild: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (addToCart)
                Text(
                  'Order Added To Cart',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              SizedBox(width: 10.0),
              Icon(
                addToCart ? Icons.check : Icons.shopping_basket,
                color: Colors.white,
              ),
            ],
          ),
          borderRadius: 20.0,
          height: 64,
          backgroundChild: Center(
            child: Text(
              "Swipe to add to Cart",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16.0,
              ),
            ),
          ),
          backgroundColor: Colors.grey[300],
          slidingBarColor: addToCart ? Colors.green : Color(0xFFF78062),
          slideDirection: SlideDirection.RIGHT,
          onButtonOpened: () {
            setState(() {
              addToCart = true;
            });
          },
          onButtonClosed: () {
            // setState(() {
            //   addToCart = false;
            // });
          },
          onButtonSlide: (value) {
            // setState(
            //   () {
            //     addToCart = false;
            //   },
            // );
          },
        ),
      ),
    );
  }
}
