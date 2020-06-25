import 'package:flutter/material.dart';

// import 'package:slider_button/slider_button.dart';

class AddToCartSlider extends StatefulWidget {
  const AddToCartSlider({
    Key key,
  }) : super(key: key);

  @override
  _AddToCartSliderState createState() => _AddToCartSliderState();
}

class _AddToCartSliderState extends State<AddToCartSlider> {
  var estado = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      padding: EdgeInsets.symmetric(vertical: 20.0),
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            spreadRadius: -10.0,
            blurRadius: 20,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Center(
        child: Container(),
        // child: SliderButton(
        //   shimmer: false,
        //   action: () {
        //     setState(() {
        //       estado = true;
        //     });
        //   },

        //   ///Put label over here
        //   label: Text(
        //     !estado ? 'Swipe to add on Cart' : 'Agregado al Carrito',
        //     style: TextStyle(
        //         color: Color(0xff4a4a4a),
        //         fontWeight: FontWeight.w500,
        //         fontSize: 17),
        //   ),
        //   icon: Center(
        //     child: Icon(
        //       !estado ? Icons.shopping_basket : Icons.check,
        //       color: Colors.white,
        //       size: 30.0,
        //       semanticLabel: 'Text to announce in accessibility modes',
        //     ),
        //   ),

        //   ///Change All the color and size from here.
        //   width: MediaQuery.of(context).size.width * .7,
        //   height: 80,
        //   radius: 10,
        //   buttonColor: Color(0xFFF78062),
        //   backgroundColor: !estado ? Colors.black12 : Colors.green,
        //   highlightedColor: Colors.white,
        //   baseColor: Colors.black26,
        // ),
      ),
    );
  }
}
