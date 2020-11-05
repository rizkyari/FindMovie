import 'package:flutter/material.dart';

class Next extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1B2C3B),
        title: Text("Coming Soon"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'This feature will coming shortly, please keep close with us',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25,),
              Image.network(
                  'https://adderra.com/wp-content/uploads/2020/09/under-construction.png')
            ],
          ),
        ),
      ),
    );
  }
}
