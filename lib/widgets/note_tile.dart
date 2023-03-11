import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final String text;
  Function() onTap;
  NoteTile({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        // height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          text,
          maxLines: 4,
          style: const TextStyle(
            fontSize: 17,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
