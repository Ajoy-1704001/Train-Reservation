import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trainapp/utilities/apptheme.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({super.key, required this.type});
  final String type;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
              color: type == "Available"
                  ? AppTheme.primary
                  : type == "Selected"
                      ? Colors.white
                      : AppTheme.secondary,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  color: AppTheme.primary, width: type == "Selected" ? 1 : 0)),
          child: type == "Unavailable"
              ? const Icon(
                  Icons.close,
                  size: 17,
                  color: Colors.white,
                )
              : Container(),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          type,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
      ],
    );
  }
}
