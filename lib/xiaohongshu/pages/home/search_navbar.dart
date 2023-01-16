import 'package:flutter/material.dart';

class XHSSearchNavBar extends StatelessWidget {
  const XHSSearchNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: SizedBox(
        width: double.infinity,
        height: 30,
        child: OutlinedButton.icon(
          icon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          label: Text(
            'search',
            style: TextStyle(color: Colors.grey),
          ),
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            side: BorderSide(width: 0.5, color: Colors.grey.shade100),
            elevation: 4,
            shadowColor: Color.fromARGB(111, 245, 245, 245),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
