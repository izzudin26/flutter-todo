import 'package:flutter/material.dart';
import 'components/TodoHistoryList.dart';

class TodoHistoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff374ABE), Color(0xff64B6FF)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Text("Riwayat Pekerjaan", style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 30
                ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: TodoHistoryList(),
            )
          ],
        ),
      ),
    );
  }
}
