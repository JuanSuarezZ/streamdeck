import 'package:flutter/material.dart';

class ProgramButton extends StatelessWidget {
  final IconData? icon;
  final String? asset;
  final Function function;
  const ProgramButton(
      {super.key, this.asset, this.icon, required this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: icon != null
          ? IconButton(
              icon: Icon(
                icon,
                size: 60,
              ),
              onPressed: () => function,
            )
          : SizedBox(
              height: 20,
              width: 20,
              child: InkWell(
                child: Image.asset(asset!),
                onTap: () => function,
              ),
            ),
    );
  }
}
