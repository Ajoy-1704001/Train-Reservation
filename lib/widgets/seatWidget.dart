import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trainapp/utilities/apptheme.dart';

class SeatWidget extends StatefulWidget {
  SeatWidget({super.key, required this.type});
  String type;

  @override
  State<SeatWidget> createState() => _SeatWidgetState();
}

class _SeatWidgetState extends State<SeatWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: () {
          if (widget.type == "Available") {
            setState(() {
              widget.type = "Selected";
            });
          } else if (widget.type == "Selected") {
            setState(() {
              widget.type = "Available";
            });
          }
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: widget.type == "Available"
                  ? AppTheme.primary
                  : widget.type == "Selected"
                      ? Colors.white
                      : AppTheme.secondary,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  color: AppTheme.primary,
                  width: widget.type == "Selected" ? 1 : 0)),
          child: widget.type == "Unavailable"
              ? const Icon(
                  Icons.close,
                  size: 17,
                  color: Colors.white,
                )
              : Container(),
        ),
      ),
    );
  }
}
