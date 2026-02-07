import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class IncDecButton extends StatefulWidget {
  const IncDecButton({super.key});

  @override
  State<IncDecButton> createState() => _IncDecButtonState();
}

class _IncDecButtonState extends State<IncDecButton> {
  int _currentValue = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
        spacing: 12,
        children: [
          GestureDetector(
            onTap: (){
              _currentValue--;
              setState(() {

              });
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.themeColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.remove, color: Colors.white,),
            ),
          ),
          Text('${_currentValue}', style: TextStyle(fontSize: 16, fontWeight: .w700),),
          GestureDetector(
            onTap: (){
              _currentValue++;
              setState(() {

              });
            },
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: AppColors.themeColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.add, color: Colors.white,),
            ),
          ),
        ],
      );
  }
}
