import 'package:flutter/material.dart';

class MewPage extends StatelessWidget {
  const MewPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
     body:  Hero(
       tag: 'a',
       child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoIKvx_A2A3vDblJGx6nXZeRN6ZnMgwLWKUg&usqp=CAU',
              ),fit: BoxFit.cover
            ),
          ),
        ),
    
    
      ),
    ),
      
    );
  }
}