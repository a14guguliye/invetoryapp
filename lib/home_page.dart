import "package:flutter/material.dart";

/////NOTE to be separated as model class
///TODO:
class Invoice {
  final bool entered;

  final String number;

  final String dateEntered;

  final String itemCount;

  Invoice(
      {required this.entered,
      required this.number,
      required this.dateEntered,
      required this.itemCount});
}

List<Invoice> invoices = [
  Invoice(
      entered: false,
      number: "Q10122",
      dateEntered: "12/22/23",
      itemCount: "20"),
  Invoice(
      entered: true,
      number: "Q10122",
      dateEntered: "12/22/23",
      itemCount: "20"),
  Invoice(
      entered: true,
      number: "Q10122",
      dateEntered: "12/22/23",
      itemCount: "20"),
  Invoice(
      entered: false,
      number: "Q10122",
      dateEntered: "12/22/23",
      itemCount: "20"),
  Invoice(
      entered: false,
      number: "Q10122",
      dateEntered: "12/22/23",
      itemCount: "20"),
  Invoice(
      entered: true,
      number: "Q10122",
      dateEntered: "12/22/23",
      itemCount: "20"),
  Invoice(
      entered: true,
      number: "Q10122",
      dateEntered: "12/22/23",
      itemCount: "20"),
  Invoice(
      entered: false,
      number: "Q10122",
      dateEntered: "12/22/23",
      itemCount: "20"),
  Invoice(
      entered: false,
      number: "Q10122",
      dateEntered: "12/22/23",
      itemCount: "20"),
  Invoice(
      entered: true,
      number: "Q10122",
      dateEntered: "12/22/23",
      itemCount: "20"),
  Invoice(
      entered: false,
      number: "Q10122",
      dateEntered: "12/22/23",
      itemCount: "20"),
  Invoice(
      entered: false,
      number: "Q10122",
      dateEntered: "12/22/23",
      itemCount: "20"),
  Invoice(
      entered: true,
      number: "Q10122",
      dateEntered: "12/22/23",
      itemCount: "20"),
  Invoice(
      entered: false,
      number: "Q10122",
      dateEntered: "12/22/23",
      itemCount: "20"),
  Invoice(
      entered: false,
      number: "Q10122",
      dateEntered: "12/22/23",
      itemCount: "20"),
  Invoice(
      entered: true,
      number: "Q10122",
      dateEntered: "12/22/23",
      itemCount: "20"),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Emeliyyatlar Merkezi",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.message),
                title: const Text("Contact Admin"),
                onTap: () {
                  print("Hello You are contacting admin...");
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: const Icon(Icons.menu));
          }),

          ///TODO: SUBJECT TO CHANGE
          title: const Text("Naftalan MMC"),
          centerTitle: true,
          elevation: 3,

          actions: [
            IconButton(
                onPressed: () {},
                icon: const Badge(child: Icon(Icons.notifications))),
            IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle))
          ],
        ),
        body: ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return const Divider(
                thickness: 1.0,
                color: Colors.grey,
                indent: 16.0,
                endIndent: 16.0,
              );
            },
            itemCount: invoices.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: invoices[index].entered
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : const Icon(
                          Icons.pending,
                          color: Colors.red,
                        ),
                  title: Text(invoices[index].number),
                  subtitle: Text(invoices[index].dateEntered),
                  trailing: const Icon(Icons.arrow_right),
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
            tooltip: "Yeni Sifaris",
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed("/create-order");
            }),
        bottomNavigationBar: NavigationBar(
            onDestinationSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            selectedIndex: selectedIndex,
            destinations: const <Widget>[
              NavigationDestination(
                icon: Icon(Icons.receipt_outlined),
                label: "Sifaris",
                selectedIcon: Icon(Icons.receipt_long),
                tooltip: "Menim Sifarislerim",
              ),
              NavigationDestination(
                icon: Icon(Icons.history_outlined),
                label: "Tarixce",
                selectedIcon: Icon(Icons.history_sharp),
                tooltip: "Sifaris Tarixcesi",
              ),
              NavigationDestination(
                icon: Icon(Icons.storage_outlined),
                label: "Anbar",
                selectedIcon: Icon(Icons.storage_sharp),
                tooltip: "Menim Anbarim",
              ),
            ]),
      ),
    );
  }
}
