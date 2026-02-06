import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bey/app/app_colors.dart';
import 'package:flutter/material.dart';
class HomeCarouselWidgets extends StatefulWidget {
  const HomeCarouselWidgets({super.key});

  @override
  State<HomeCarouselWidgets> createState() => _HomeCarouselWidgetsState();
}

class _HomeCarouselWidgetsState extends State<HomeCarouselWidgets> {

  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(

          options: CarouselOptions(
              height: 200.0,
              viewportFraction: 1.0,
            autoPlay: true,
            onPageChanged: (index, reason){
                _selectedIndex.value = index;
            }
          ),

          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Colors.amber
                    ),
                    child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                );
              },
            );

          }).toList(),
        ),
      SizedBox(height: 12,),
      ValueListenableBuilder(
        valueListenable: _selectedIndex,
        builder: (context, selectedIndex, _) {
          return Row(
            mainAxisAlignment: .center,
            children: [
              for (var i = 0; i < 5; i++)
                Container(
                  width: 12,
                  height: 12,
                  margin: EdgeInsets.only(right: 4),
                  decoration: BoxDecoration(
                      color: i == selectedIndex ? AppColors.themeColor : null,
                      border: Border.all(color: Colors.grey),
                      shape: BoxShape.circle
                  ),
                )
            ],
          );
        }
      )

      ],
    );
  }
}
