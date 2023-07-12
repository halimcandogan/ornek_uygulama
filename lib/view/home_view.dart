import 'package:flutter/material.dart';
import 'package:ornekuygulama/components/custom_appbar.dart';
import 'package:ornekuygulama/components/product_card.dart';
import 'package:ornekuygulama/constants/padding_constants.dart';
import 'package:ornekuygulama/constants/string_constants.dart';
import 'package:ornekuygulama/constants/text/medium_text.dart';
import 'package:ornekuygulama/database/db_enums.dart';
import 'package:ornekuygulama/database/db_manager.dart';
import 'package:ornekuygulama/view/product_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final AkilliEvUrunleriDB _db;

  // ignore: prefer_typing_uninitialized_variables
  var recUrunler;

  // db oluşturma
  void dbCreate() async {
    await _db.openDB();
    urunler();
  }

  // Urunleri alıyoruz
  Future<void> urunler() async {
    recUrunler = await _db.getDataListAll(enTables.UrunlerTB.name);
    setState(() {});
  }

  /// Benden istenen 2 ürün oldugundan ilk önce tabloya ürünleri ekledim daha sonra bu kodları çevrimdışı bıraktım.
  /// UrunIsmi gibi db isimleri model olarak oluşturulabilir.

  /* void addTable() async {
    await _db.insertTable(data, enTables.UrunlerTB.name);
    await _db.insertTable(data2, enTables.UrunlerTB.name);
  }

  final Map<String, Object> data = {
    "UrunIsmi": "MyChef Akıllı Fırın",
    "UrunModel": "mychef compact evolution",
    "UrunMacAdresi": "3F:FC:66:66:05:4A",
    "UrunFonksiyonlari": "Kolay Isı Ayarı Yapılabilir.",
  };

  final Map<String, Object> data2 = {
    "UrunIsmi": "Ledvance Akıllı Lamba",
    "UrunModel": "ledvance smart wifi 9w rgbw led ampul",
    "UrunMacAdresi": "DD:34:E3:09:EF:CA",
    "UrunFonksiyonlari": "Lambanın ışık şiddetliği ayarlanabilir.",
  }; */

  /// Çok kompleks birşey olmadığından bu şekilde yaptım. Future Builder ile de yapılabilirdi. Aynı zamanda product View
  /// id gönderip product viewde sorgu ilede çekilebilirdi.
  List<Widget> urunlerComponents() {
    List<Widget> widgetsList = [];
    if (recUrunler != null) {
      for (int i = 0; i < recUrunler.length; i++) {
        var item = recUrunler[i];

        var widget = ProductCard(
          urunIsim: item["UrunIsmi"],
          urunModel: item["UrunModel"],
          urunMacAdresi: item["UrunMacAdresi"],
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductView(
                        urunIsmi: item["UrunIsmi"],
                        urunModel: item["UrunModel"],
                        urunMacAdresi: item["UrunMacAdresi"],
                        urunFonksiyon: item["UrunFonksiyonlari"],
                      )),
            );
          },
        );
        widgetsList.add(widget);
      }
    }
    return widgetsList;
  }

  /// uygulama açılırken dbyi ayağa kaldırıcak ve ürünleri listeleyecek.
  @override
  void initState() {
    super.initState();
    _db = AkilliEvUrunleriDB();
    dbCreate();

    /// sayfayı oluşturduktan sonra çalışacak.
    Future.microtask(() {
      urunlerComponents();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const PaddingConstants.lowValue(),
        child: Column(
          children: [
            const MediumText(
                text: StringConstants
                    .istediginUrunHakkindaKolaycaBilgiAlabilirsin),
            Wrap(
              runSpacing: 10,
              children: urunlerComponents(),
            ),
          ],
        ),
      ),
    );
  }
}
