import "dart:math";

import "package:flutter/material.dart";
import "package:inventoryapp/invoice.dart";

class Product {
  String? name;
  String? category;

  String? subCategory;

  String? barCode;
  String? unit;
  String? countInUnit;

  String? image;

  Product(this.name, this.category, this.subCategory, this.barCode, this.unit,
      this.countInUnit, this.image);
}

class ProductInvoice {
  Product p;
  int quantity;

  ProductInvoice(this.p, this.quantity);
}

List<Product> generateProducts() {
  List<String> productNames = [
    "Hepatitic C",
    "Hepatitic B",
    "FLLM kit",
    "Blood kit",
    "Limf kit",
    "Body kit",
  ];
  List<String> categories = [
    "Category A",
    "Category B",
    "Category C",
    "Category D",
    "Category E"
  ];
  List<String> subCategories = [
    "Subcategory 1",
    "Subcategory 2",
    "Subcategory 3",
    "Subcategory 4",
    "Subcategory 5"
  ];
  List<String> units = ["kg", "pcs", "ltr", "mtr", "box"];
  List<String> images = [
    "image1.png",
    "image2.png",
    "image3.png",
    "image4.png",
    "image5.png"
  ];

  Random random = Random();
  List<Product> products = [];

  for (int i = 0; i < 10; i++) {
    String name =
        "${productNames[random.nextInt(productNames.length)]} ${random.nextInt(100) + 1}";
    String category = categories[random.nextInt(categories.length)];
    String subCategory = subCategories[random.nextInt(subCategories.length)];
    String barCode = "${random.nextInt(100) + 200}"; // Random 12-digit barcode
    String unit = units[random.nextInt(units.length)];
    String countInUnit = "${random.nextInt(100) + 1}";
    String image = images[random.nextInt(images.length)];

    products.add(Product(
        name, category, subCategory, barCode, unit, countInUnit, image));
  }

  return products;
}

List<Product> products = generateProducts();

enum category_names {
  Category_1,

  Category_2,

  Category_3,

  Category_4,

  Category_5,

  Category_6,

  Category_7,
}

enum sub_category_names {
  Category_1,

  Category_2,

  Category_3,

  Category_4,

  Category_5,

  Category_6,

  Category_7,
}

class Invoice {
  List<ProductInvoice> products = [];

  Invoice();

  void addProduct(Product p) {
    if (!checkIfProductExists(p)) {
      products.add(ProductInvoice(p, 1));
    }
  }

  bool checkIfProductExists(Product p) {
    bool existsFlag = false;

    products.forEach((e) {
      if (e.p.barCode == p.barCode) {
        existsFlag = true;
      }
    });

    return existsFlag;
  }

  void addProductQuantity(Product p, int quantity) {
    products.forEach((e) {
      if (e.p.barCode == p.barCode) {
        e.quantity += quantity;
      }
    });
  }
}

class CreateOrderPage extends StatefulWidget {
  const CreateOrderPage({super.key});

  @override
  State<CreateOrderPage> createState() => _CreateOrderPageState();
}

class _CreateOrderPageState extends State<CreateOrderPage> {
  Invoice inv = Invoice();

  void resetInvoice() {
    inv.products.forEach((e) {
      e.quantity = 0;
    });
    setState(() {
      inv.products = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Material Secim Sehifesi"),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Materialin Adini Daxil Et")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      ElevatedButton(onPressed: () {}, child: const Text("Ok")),
                )
              ],
            ),
          ),
          Container(
            color: Color(0xFFF5F5F5), // A light grey shade.
            height: 50,
            child: Center(
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: category_names.values
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FilterChip(
                                label: Text(e.name), onSelected: (e) {}),
                          ))
                      .toList()),
            ),
          ),

          //// SUB CATEGOY NAMES
          Container(
            color: Color(0xFFF5F5F5), // A light grey shade.
            height: 50,
            child: Center(
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: sub_category_names.values
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FilterChip(
                                label: Text(e.name), onSelected: (e) {}),
                          ))
                      .toList()),
            ),
          ),

          /////products lists

          Expanded(
            child: AnimatedList.separated(
                initialItemCount: products.length,
                separatorBuilder: (context, index, _) {
                  return const Divider();
                },
                removedSeparatorBuilder: (context, index, _) {
                  return const Divider();
                },
                itemBuilder: (context, index, _) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      trailing: inv.checkIfProductExists(products[index])
                          ? const Icon(Icons.check_circle)
                          : IconButton(
                              tooltip: "Qaimeye elave et",
                              onPressed: () {
                                setState(() {
                                  inv.addProduct(products[index]);
                                });
                              },
                              icon: const Icon(Icons.add),
                            ),
                      title: Text(
                          "${products[index].name} ${products[index].unit} (${products[index].countInUnit})"),
                      subtitle: Text(
                          "${products[index].category} ${products[index].subCategory}"),
                      leading: Image.network(
                        products[index].image.toString(),
                        errorBuilder: (context, _, __) {
                          return const Icon(Icons.panorama_fisheye_outlined);
                        },
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
              width: double.infinity,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return InvoiceConfirmationPage(
                          invoice: inv,
                          resetInvoice: resetInvoice,
                        );
                      }));
                    },
                    child: const Text("Qaime Tesdiqle")),
              )),
        ],
      ),
    ));
  }
}
