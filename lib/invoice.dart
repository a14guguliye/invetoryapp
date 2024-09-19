import "package:flutter/material.dart";
import "package:inventoryapp/create_order.dart";

class InvoiceConfirmationPage extends StatefulWidget {
  final Invoice invoice;
  final Function()? resetInvoice;
  const InvoiceConfirmationPage(
      {super.key, required this.invoice, this.resetInvoice});

  @override
  State<InvoiceConfirmationPage> createState() =>
      _InvoiceConfirmationPageState();
}

class _InvoiceConfirmationPageState extends State<InvoiceConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("E-qaime Yarat"),
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: widget.invoice.products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ListTile(
                            trailing: Text(widget
                                .invoice.products[index].quantity
                                .toString()),
                            title: Text(
                                "${widget.invoice.products[index].name} ${widget.invoice.products[index].unit} (${widget.invoice.products[index].countInUnit})"),
                            subtitle: Text(
                                "${widget.invoice.products[index].category} ${widget.invoice.products[index].subCategory}"),
                            leading: Image.network(
                              widget.invoice.products[index].image.toString(),
                              errorBuilder: (context, _, __) {
                                return const Icon(
                                    Icons.panorama_fisheye_outlined);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Wrap(
                              spacing: 5,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      widget.invoice.addProductQuantity(
                                          widget.invoice.products[index], 1);
                                    });
                                  },
                                  onLongPress: () {
                                    setState(() {
                                      widget.invoice.addProductQuantity(
                                          widget.invoice.products[index], -1);
                                    });
                                  },
                                  child: const ActionChip(label: Text("+1")),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      widget.invoice.addProductQuantity(
                                          widget.invoice.products[index], 5);
                                    });
                                  },
                                  onLongPress: () {
                                    setState(() {
                                      widget.invoice.addProductQuantity(
                                          widget.invoice.products[index], -5);
                                    });
                                  },
                                  child: const ActionChip(label: Text("+5")),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      widget.invoice.addProductQuantity(
                                          widget.invoice.products[index], 10);
                                    });
                                  },
                                  onLongPress: () {
                                    setState(() {
                                      widget.invoice.addProductQuantity(
                                          widget.invoice.products[index], -10);
                                    });
                                  },
                                  child: const ActionChip(label: Text("+10")),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  })),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    if (widget.resetInvoice != null) {
                      widget.resetInvoice!();
                    }
                    Navigator.of(context)
                        .pushReplacementNamed("/success-invoice");
                  },
                  child: const Text("Sifarisi Tesdiqle")),
            ),
          )
        ],
      ),
    ));
  }
}
