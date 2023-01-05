import 'package:flutter/material.dart';

class ProgramButton extends StatefulWidget {
  final IconData? icon;
  final IconData? icon2;
  final String? asset;
  final Function function;
  final Function? function2;
  const ProgramButton({
    super.key,
    this.asset,
    this.icon,
    this.icon2,
    required this.function,
    this.function2,
  });

  @override
  State<ProgramButton> createState() => _ProgramButtonState();
}

class _ProgramButtonState extends State<ProgramButton> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.icon != null
              ? SizedBox(
                  height: 100,
                  width: 100,
                  child: IconButton(
                    icon: Icon(
                      flag == true ? widget.icon : widget.icon2 ?? widget.icon,
                      size: 60,
                    ),
                    onPressed: () {
                      flag == true ? widget.function() : widget.function2!();
                      setState(() {
                        flag = !flag;
                      });
                    },
                  ),
                )
              : SizedBox(
                  height: 70,
                  width: 70,
                  child: InkWell(
                    child: Image.asset(widget.asset!),
                    onTap: () => widget.function(),
                  ),
                ),
        ],
      ),
    );
  }
}
