import 'package:Week5_UI_Dmm/shared/app_colors.dart';
import 'package:Week5_UI_Dmm/shared/widgets/image_carousel.dart';
import 'package:flutter/material.dart';

class StartUpView extends StatelessWidget {
  final Function toggle;

  const StartUpView({Key key, this.toggle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('startup reb');
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Dmm ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '_',
                            style: TextStyle(
                              color: AppColors.orange,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {},
                      iconSize: 30,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nominate Your \nProducts.',
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'For the 2020 Dmm Mid-Year Sale',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey.withOpacity(.8),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .40,
                // color: Colors.red,
                child: ImageCarousel(),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: AppColors.purple,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: FlatButton(
                    onPressed: toggle,
                    child: Text(
                      'Find full details',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
