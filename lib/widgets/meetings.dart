import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:smart_snackbars/smart_snackbars.dart';
import '../models/data_base_helper.dart';
import 'package:skeletons/skeletons.dart';

// ignore: must_be_immutable
class MeetingDone extends StatelessWidget {
  final int idP;
  final String nameP;
  final int docP;
  final String dateP;
  final String timeP;
  final String typeP;
  final int priceP;
  Function(BuildContext?) deleteTask;
  MeetingDone(
      {super.key,
      required this.idP,
      required this.nameP,
      required this.docP,
      required this.dateP,
      required this.timeP,
      required this.typeP,
      required this.priceP,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: const Color.fromARGB(255, 94, 141, 131),
              borderRadius: BorderRadius.circular(10),
            ),
          ],
        ),
        child: Container(
          height: 130,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 204, 212, 210),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        nameP.toString(),
                        style: GoogleFonts.inter(
                            fontSize: 17, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Código: " "${idP.toString()}",
                        style: GoogleFonts.inter(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${typeP.toString()}" ":" " ${docP.toString()}",
                        style: GoogleFonts.inter(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 186, 194, 196),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            "Precio: \$" "${priceP.toString()}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dateP.toString(),
                      style: GoogleFonts.inter(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      timeP.toString(),
                      style: GoogleFonts.inter(fontSize: 15),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MeetingDoneWitoutFunction extends StatelessWidget {
  final int idP;
  final String nameP;
  final int docP;
  final String dateP;
  final String timeP;
  final String typeP;
  final int priceP;

  const MeetingDoneWitoutFunction({
    super.key,
    required this.idP,
    required this.nameP,
    required this.docP,
    required this.dateP,
    required this.timeP,
    required this.typeP,
    required this.priceP,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 204, 212, 210),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    nameP.toString(),
                    style: GoogleFonts.inter(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Código: " "${idP.toString()}",
                    style: GoogleFonts.inter(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${typeP.toString()}" ":" " ${docP.toString()}",
                    style: GoogleFonts.inter(fontSize: 17),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 186, 194, 196),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        "Precio: \$" "${priceP.toString()}",
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    dateP.toString(),
                    style: GoogleFonts.inter(fontSize: 17),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    timeP.toString(),
                    style: GoogleFonts.inter(fontSize: 17),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//----------------------PAGES--------------------------------
class MeetingDonePage extends StatefulWidget {
  const MeetingDonePage({
    super.key,
  });

  @override
  State<MeetingDonePage> createState() => _MeetingDonePageState();
}

class _MeetingDonePageState extends State<MeetingDonePage> {
  List<List<dynamic>> tableData = [];

  void launchSnackBar(BuildContext context, String text, Color color) {
    SmartSnackBars.showCustomSnackBar(
      context: context,
      persist: false,
      duration: const Duration(seconds: 2),
      animationCurve: Curves.bounceOut,
      child: Container(
        decoration: BoxDecoration(
          //color: const Color.fromARGB(255, 116, 160, 118),
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black.withOpacity(0.2),
              ),
              child: const Icon(
                Icons.info_outline,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    Conection? conection = Conection();
    final data = await conection.getData();
    setState(() {
      tableData = data;
    });
  }

  Future<void> deleteMeetFunction(int id) async {
    Conection? conection = Conection();
    //await conection.conn.open();
    conection.deleteMeet(id);
    //await conection.conn.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(48, 204, 176, 1),
        title: Text(
          "Citas Agendadas",
          style: GoogleFonts.arvo(),
        ),
        centerTitle: true,
      ),
      body: tableData.isEmpty
          ? Center(
              child: SkeletonListView(),
            )
          : Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ListView.builder(
                itemCount: tableData.length,
                itemBuilder: (context, index) {
                  final row = tableData[index];
                  return MeetingDone(
                    idP: row[0],
                    nameP: row[1],
                    docP: row[2],
                    typeP: row[3],
                    dateP: row[4],
                    timeP: row[5],
                    priceP: row[6],
                    deleteTask: (p0) {
                      deleteMeetFunction(row[0]);

                      Future.delayed(const Duration(milliseconds: 500)).then(
                        (value) {
                          launchSnackBar(
                            context,
                            "Cita Eliminada Correctamente",
                            const Color.fromARGB(255, 116, 160, 118),
                          );
                          fetchData();
                        },
                      );
                    },
                  );
                },
              ),
            ),
    );
  }
}

//-------------------------------------------------------------------------------

class MeetingSearchPage extends StatefulWidget {
  const MeetingSearchPage({super.key});

  @override
  State<MeetingSearchPage> createState() => _MeetingSearchPageState();
}

class _MeetingSearchPageState extends State<MeetingSearchPage> {
  final searchController = TextEditingController();
  List<List<dynamic>> tableData = [];

  bool statusButton = false;

  Future<void>? fetchData() async {
    Conection? conection = Conection();
    final data = await conection.getDataWithCode(
      int.parse(searchController.text),
    );
    setState(() {
      tableData = data;
    });
    conection.conn.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(48, 204, 176, 1),
        title: Text(
          "Buscar Cita",
          style: GoogleFonts.arvo(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
          child: Column(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: searchController,
                      decoration: InputDecoration(
                        labelText: "Número de Documento",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(135, 158, 237, 1),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color.fromRGBO(135, 158, 237, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      setState(
                        () {
                          if (searchController.text.isEmpty) {
                            Exception("Error, campo no valido");
                          } else {
                            statusButton = true;

                            fetchData();
                          }
                        },
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Buscar",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 500,
                child: tableData.isEmpty
                    ? Center(
                        child: SkeletonListTile(),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: statusButton
                            ? ListView.builder(
                                itemCount: tableData.length,
                                itemBuilder: (context, index) {
                                  final row = tableData[index];
                                  return MeetingDoneWitoutFunction(
                                    idP: row[0],
                                    nameP: row[1],
                                    docP: row[2],
                                    typeP: row[3],
                                    dateP: row[4],
                                    timeP: row[5],
                                    priceP: row[6],
                                  );
                                },
                              )
                            : const Center(
                                child: Text("No Hay Datos"),
                              ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
