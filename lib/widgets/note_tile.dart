import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final String text;
  Function() onTap;
  Function()? delete;
  NoteTile({
    Key? key,
    required this.text,
    required this.onTap,
    required this.delete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10, right: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      // width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.white,
              child: Text(
                text,
                maxLines: 4,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: delete,
            child: Icon(
              Icons.delete,
              color: Colors.red[300],
            ),
          ),
        ],
      ),
    );
  }
}
