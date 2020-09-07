import 'package:flutter/material.dart';

class DisplayCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;
  final void Function() onTap;

  DisplayCard({
    @required this.imageUrl,
    @required this.title,
    @required this.date,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 4,
              color: Colors.black.withOpacity(0.2),
            )
          ],
        ),
        child: Row(
          children: [
            Image.network(imageUrl, width: 67, height: 67),
            Container(margin: EdgeInsets.only(left: 10)),
            getDetailTextWidget(),
            Icon(Icons.navigate_next)
          ],
        ),
      ),
    );
  }

  getDetailTextWidget() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 16)),
          Text(
            date,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
