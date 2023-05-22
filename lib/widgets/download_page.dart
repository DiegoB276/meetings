import 'package:citas/models/data_base_helper.dart';
import 'package:citas/widgets/my_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({super.key});

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  //Download function
  Future<void> download() async {
    Conection con = Conection();
    await con.downloadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(48, 204, 176, 1),
        title: Text(
          "Descargar Datos",
          style: GoogleFonts.arvo(),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Verifica que tengas conexión a internet para descargar los datos",
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(
                      255, 51, 95, 179), // Color de fondo del botón
                  foregroundColor: Colors.white, // Color del texto del botón
                ),
                onPressed: () async {
                  final connectivity =
                      await (Connectivity().checkConnectivity());
                  if (connectivity == ConnectivityResult.wifi) {
                    launchSnackBar(
                      context,
                      "Los Datos se han descargado con éxito",
                      const Color.fromARGB(255, 116, 160, 118),
                    );
                    download();
                  } else if (connectivity == ConnectivityResult.mobile) {
                    launchSnackBar(
                      context,
                      "Para más confiabilidad \ndescárga los datos con wifi",
                      Color.fromARGB(255, 134, 53, 42),
                    );
                    download();
                  } else {
                    launchSnackBar(
                      context,
                      "No hay conexión a internet",
                      Color.fromARGB(255, 82, 19, 141),
                    );
                  }
                },
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.download),
                      Text(
                        "Descargar",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
