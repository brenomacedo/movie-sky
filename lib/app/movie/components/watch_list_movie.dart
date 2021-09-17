import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WatchListMovie extends StatelessWidget {
  const WatchListMovie({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10)
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text('Nome do filme', style: GoogleFonts.ubuntu(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
              )),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: SizedBox(
                  width: 55,
                  height: 55,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)
                    ),
                    child: Icon(Icons.delete),
                    onPressed: () {},
                  ),
                ),
              ),
              SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: SizedBox(
                  width: 55,
                  height: 55,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green[300])
                    ),
                    child: Icon(Icons.check),
                    onPressed: () {},
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}