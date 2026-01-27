import 'package:flutter/material.dart';
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key, required this.title, required this.onTap,
  });

  final String title;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: TextTheme.of(context).titleMedium,),
        Spacer(),
        TextButton(onPressed: onTap, child: Text("See All")),
      ],
    );
  }
}
