import "package:flutter/material.dart";

class SuccessInvoice extends StatelessWidget {
  const SuccessInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Text("Sifarisiniz ugula anbara gonderildi"),
      ),
    ));
  }
}
