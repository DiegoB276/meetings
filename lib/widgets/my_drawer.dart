import 'package:citas/widgets/download_page.dart';
import 'package:flutter/material.dart';

import 'meetings.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350, //MediaQuery.of(context).size.width * 0.7,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset(
              "images/logo.png",
              width: 400,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MeetingDonePage(),
                ),
              );
            },
            leading: const Icon(
              Icons.done_rounded,
              size: 25,
            ),
            title: const Text(
              "Citas Agendadas",
              style: TextStyle(fontSize: 20),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MeetingSearchPage(),
                ),
              );
            },
            leading: const Icon(
              Icons.question_mark,
              size: 25,
            ),
            title: const Text(
              "Buscar Cita",
              style: TextStyle(fontSize: 20),
            ),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const DownloadPage(),
                ),
              );
            },
            leading: const Icon(
              Icons.download,
              size: 25,
            ),
            title: const Text(
              "Descargar Datos",
              style: TextStyle(fontSize: 20),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
