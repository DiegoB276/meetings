// ignore: file_names
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../../models/generate_code.dart';

class HomePageDesktop extends StatefulWidget {
  const HomePageDesktop({super.key});

  @override
  State<HomePageDesktop> createState() => _HomePageDesktopState();
}

class _HomePageDesktopState extends State<HomePageDesktop> {
  final _fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SizedBox(
        child: Row(
          children: [
            const BoxButton(), // llamda del widget de los botones agendar y cancelar
            DataBox(fromKey: _fromKey)
          ],
        ),
      ),
    );
  }
}

class DataBox extends StatefulWidget {
  const DataBox({
    super.key,
    required GlobalKey<FormState> fromKey,
  }) : _fromKey = fromKey;

  final GlobalKey<FormState> _fromKey;

  @override
  State<DataBox> createState() => _DataBoxState();
}

class _DataBoxState extends State<DataBox> {
  var code = generateCodeRandom();
  // ignore: non_constant_identifier_names
  var date_day = DateTime.now().day;
  // ignore: non_constant_identifier_names
  var date_month = DateTime.now().month;
  // ignore: non_constant_identifier_names
  var date_year = DateTime.now().year;

  final _timeController = TextEditingController();
  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var myWidth = MediaQuery.of(context).size.width < 2790;
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.65,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: myWidth
            ? const EdgeInsets.symmetric(horizontal: 50)
            : const EdgeInsets.symmetric(horizontal: 150),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: widget._fromKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Datos de Usuario",
                    style: GoogleFonts.lexendDeca(fontSize: 50),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Nombre Completo",
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
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Tipo de Documento",
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Edad",
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Numero de Documento",
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
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Celular",
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: TextField(
                          controller: _dateController,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(3000),
                            );

                            if (pickedDate != null) {
                              setState(() {
                                _dateController.text =
                                    "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                              });
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.date_range,
                              color: Color.fromRGBO(48, 204, 176, 1),
                            ),
                            hintText: "Fecha de cita",
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.18,
                        child: TextField(
                          controller: _timeController,
                          onTap: () async {
                            TimeOfDay? timePicked = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (timePicked != null) {
                              _timeController.text =
                                  // ignore: use_build_context_synchronously
                                  timePicked.format(context).toString();
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.access_time,
                              color: Color.fromRGBO(48, 204, 176, 1),
                            ),
                            hintText: "Hora de cita",
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
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Text(
                    "Datos de Factura",
                    style: GoogleFonts.lexendDeca(fontSize: 50),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  BillDetails(
                    code: code,
                    dateDay: date_day,
                    dateMonth: date_month,
                    dateYear: date_year,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//Info Factura ------------------------------------------------------------------
class BillDetails extends StatelessWidget {
  int? code;
  int? dateDay;
  int? dateMonth;
  int? dateYear;
  BillDetails({
    required this.code,
    required this.dateDay,
    required this.dateMonth,
    required this.dateYear,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Column(
                children: [
                  const Text(
                    "Código de Cita",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.15,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 230, 230, 230),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        code.toString(),
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  const Text(
                    "Valor a Pagar",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.15,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 230, 230, 230),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "\$50000",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  const Text(
                    "Fecha de Agendamiento",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.15,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 230, 230, 230),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "$dateDay/$dateMonth/$dateYear",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                children: [
                  const Text(
                    "Hora de Agendamiento",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.15,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 230, 230, 230),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        TimeOfDay.now().format(context),
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//-----------------------------------------------------------------
class BoxButton extends StatefulWidget {
  const BoxButton({
    super.key,
  });

  @override
  State<BoxButton> createState() => _BoxButtonState();
}

class _BoxButtonState extends State<BoxButton> {
  void showBox() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            width: 500,
            color: Colors.orange,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var myWidth = MediaQuery.of(context).size.width < 2000;
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(48, 204, 176, 1),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: myWidth
            ? const EdgeInsets.only(top: 50, right: 50, left: 50)
            : const EdgeInsets.only(top: 50, right: 200, left: 200),
        child: ListView(
          children: [
            Image.asset(
              "images/logo.png",
              width: 300,
              height: 300,
            ),
            const SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: () {
                showBox();
              },
              child: Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    "Agendar",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(157, 255, 237, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            GestureDetector(
              onTap: () {
                showBox();
              },
              child: Container(
                height: 60,
                //width: 300,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(157, 255, 237, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    "Citas Atendidas",
                    style: TextStyle(color: Colors.black, fontSize: 23),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                showBox();
              },
              child: Container(
                height: 60,
                //width: 300,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(157, 255, 237, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    "Citas sin Atender",
                    style: TextStyle(color: Colors.black, fontSize: 23),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
