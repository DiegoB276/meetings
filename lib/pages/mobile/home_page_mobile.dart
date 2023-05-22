import 'dart:async';
import 'package:citas/models/data_base_helper.dart';
import 'package:citas/widgets/my_drawer.dart';
import 'package:citas/widgets/my_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/generate_code.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

//------------------------------------------------------------------------------
class CampsForm extends StatefulWidget {
  const CampsForm({
    super.key,
  });

  @override
  State<CampsForm> createState() => _CampsFormState();
}

class _CampsFormState extends State<CampsForm> {
  Conection? conection;
  int code = generateCodeRandom();
  double? indicatorValue;
  Timer? timer;
  var dateDay = DateTime.now().day;
  var dateMonth = DateTime.now().month;
  var dateYear = DateTime.now().year;
  late String typeDoc = "";
  late String date = "Fecha Cita";
  late String time = "Hora Cita";

  final nameController = TextEditingController();
  final documentController = TextEditingController();
  final phoneController = TextEditingController();
  final priceController = TextEditingController();

  List<String> listaDeOpciones = ["CC", "TI", "Contraseña"];

  //Retorna un TimeOfDay y lo formatea segun el contexto en el que se encuentre.
  String timeP(BuildContext context) {
    return TimeOfDay.now().format(context);
  }

  //Lanza un snackbar o mensaje que dice que la cita ha sido agendada o cancelada

  //Valida que los campos no estén vacíos
  void validateCamps() {
    if (nameController.text.isEmpty ||
        documentController.text.isEmpty ||
        time == "Hora Cita" ||
        date == "Fecha Cita" ||
        priceController.text.isEmpty) {
      Exception("Error Hay Campos vacios");
      launchSnackBar(
        context,
        "Error, hay campos vacíos",
        Color.fromARGB(255, 134, 53, 42),
      );
    }
  }

//Actualiza los segundos
  updateSeconds() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          indicatorValue = DateTime.now().second / 60;
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    indicatorValue = DateTime.now().second / 60;
    updateSeconds();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String dateP = "$dateDay/$dateMonth/$dateYear";
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Datos de Usuario",
          style: GoogleFonts.lexendDeca(fontSize: 35),
        ),
        const SizedBox(
          height: 40,
        ),
        TextFormField(
          controller: nameController,
          decoration: InputDecoration(
            labelText: "Nombre Completo",
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
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.40,
              child: DropdownButtonFormField(
                decoration: InputDecoration(
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
                items: listaDeOpciones.map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        e,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                }).toList(),
                isDense: true,
                isExpanded: true,
                onChanged: (String? value) {
                  typeDoc = value!;
                },
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.40,
              child: TextFormField(
                controller: documentController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintStyle: const TextStyle(fontSize: 17),
                  labelText: "Num. Documento",
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
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.40,
              child: TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintStyle: const TextStyle(fontSize: 17),
                  labelText: "Celular",
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
            GestureDetector(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(3000),
                );
                setState(() {
                  date =
                      "${pickedDate!.day}/${pickedDate.month}/${pickedDate.year}";
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.40,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                  border: const Border(
                    bottom: BorderSide(color: Color.fromRGBO(135, 158, 237, 1)),
                    top: BorderSide(color: Color.fromRGBO(135, 158, 237, 1)),
                    right: BorderSide(color: Color.fromRGBO(135, 158, 237, 1)),
                    left: BorderSide(color: Color.fromRGBO(135, 158, 237, 1)),
                  ),
                ),
                child: Center(
                  child: Text(
                    date,
                    style: TextStyle(fontSize: 17, color: Colors.grey.shade700),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () async {
            TimeOfDay? timePicked = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (timePicked != null) {
              time =
                  // ignore: use_build_context_synchronously
                  timePicked.format(context).toString();
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.40,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
              border: const Border(
                bottom: BorderSide(color: Color.fromRGBO(135, 158, 237, 1)),
                top: BorderSide(color: Color.fromRGBO(135, 158, 237, 1)),
                right: BorderSide(color: Color.fromRGBO(135, 158, 237, 1)),
                left: BorderSide(color: Color.fromRGBO(135, 158, 237, 1)),
              ),
            ),
            child: Center(
              child: Text(
                time,
                style: TextStyle(fontSize: 17, color: Colors.grey.shade700),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Text(
          "Datos de Factura",
          style: GoogleFonts.lexendDeca(fontSize: 35),
        ),
        const SizedBox(
          height: 40,
        ),
        Column(
          children: [
            const Text(
              "Codigo de Cita",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.50,
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
          height: 30,
        ),
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
              width: MediaQuery.of(context).size.width * 0.50,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 230, 230, 230),
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: Center(
                child: Text(
                  dateP,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
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
              width: MediaQuery.of(context).size.width * 0.50,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 230, 230, 230),
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: Center(
                child: Text(
                  timeP(context),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.50,
              child: TextFormField(
                textAlign: TextAlign.center,
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintStyle: const TextStyle(fontSize: 17),
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
          height: 50,
        ),
        //--------------------------HERE
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () async {
                  final connectivityResult =
                      await (Connectivity().checkConnectivity());
                  if (connectivityResult == ConnectivityResult.wifi ||
                      connectivityResult == ConnectivityResult.mobile) {
                    try {
                      validateCamps();
                      Conection conection = Conection();
                      conection.addElements(
                        code,
                        nameController.text,
                        int.parse(documentController.text),
                        typeDoc,
                        date,
                        time,
                        int.parse(priceController.text),
                        dateP,
                        timeP(context),
                      );
                      Future.delayed(const Duration(seconds: 1)).then(
                        (value) {
                          launchSnackBar(
                            context,
                            "Cita Agendada",
                            const Color.fromARGB(255, 116, 160, 118),
                          );
                        },
                      );
                      Future.delayed(const Duration(milliseconds: 200)).then(
                        (value) {
                          nameController.clear();
                          documentController.clear();
                          phoneController.clear();
                          priceController.clear();
                          date = "Fecha Cita";
                          time = "Hora Cita";
                          code = generateCodeRandom();
                        },
                      );
                    } on Exception catch (exception) {
                      exception.toString();
                      nameController.clear();
                      documentController.clear();
                      phoneController.clear();
                      priceController.clear();
                      date = "Fecha Cita";
                      time = "Hora Cita";
                      code = generateCodeRandom();
                    }
                  } else {
                    launchSnackBar(
                      context,
                      "No hay conexion a internet",
                      Color.fromARGB(255, 82, 19, 141),
                    );
                    nameController.clear();
                    documentController.clear();
                    phoneController.clear();
                    priceController.clear();
                    date = "Fecha Cita";
                    time = "Hora Cita";
                    code = generateCodeRandom();
                  }
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.35,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      "Agendar",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  launchSnackBar(context, "Cita Cancelada",
                      Color.fromARGB(255, 134, 53, 42));

                  Future.delayed(const Duration(seconds: 2)).then(
                    (value) {
                      nameController.clear();
                      documentController.clear();
                      phoneController.clear();
                      priceController.clear();
                      date = "Fecha Cita";
                      time = "Hora Cita";
                      code = generateCodeRandom();
                    },
                  );
                },
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.35,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(157, 255, 237, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      "Cancelar",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//------------------------------------------------------------------------------

class HomePageMobile extends StatefulWidget {
  const HomePageMobile({super.key});

  @override
  State<HomePageMobile> createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(48, 204, 176, 1),
        title: Text(
          "Bienvenido",
          style: GoogleFonts.arvo(),
        ),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Form(
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
                  child: CampsForm(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
