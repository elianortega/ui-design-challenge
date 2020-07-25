import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({Key key}) : super(key: key);

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> with SingleTickerProviderStateMixin {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          child: Stack(
            children: [
              AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: selected == 0 ? 1 : 0,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  child: _TextContainer(
                    title: 'Nominate Your \nProducts.',
                    subtitle: 'For the 2020 Dmm Mid-Year Sale',
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: selected == 1 ? 1 : 0,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  child: _TextContainer(
                    title: 'Limited Time \nOffer.',
                    subtitle: 'Go get freebies now.',
                  ),
                ),
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: selected == 2 ? 1 : 0,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  child: _TextContainer(
                    title: 'Check In For \nDisccounts. ',
                    subtitle: 'Take a Photo and Check In.',
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            child: CarouselSlider(
              items: [
                SvgPicture.asset('assets/svg/image1.svg'),
                SvgPicture.asset('assets/svg/image2.svg'),
                SvgPicture.asset('assets/svg/image3.svg'),
              ],
              // itemCount: mealList.length,
              // itemBuilder: (context, index) {
              //   return Image.asset(
              //     mealList[index].imgSource,
              //   );
              // },
              options: CarouselOptions(
                  // aspectRatio: 1.5,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  onPageChanged: (index, _) {
                    setState(() {
                      selected = index;
                    });
                  }),
            ),
          ),
        ),
      ],
    );
  }
}

class _TextContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  const _TextContainer({
    Key key,
    this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey.withOpacity(.8),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
