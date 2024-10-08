import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/quran_tab.dart';

class SuraContentScreen extends StatefulWidget {
  const SuraContentScreen({super.key});
  static const String routeName = '/sura-content';

  @override
  State<SuraContentScreen> createState() => _SuraContentScreenState();
}

class _SuraContentScreenState extends State<SuraContentScreen> {
  List<String> ayat = [];
  late SuraContentArgs args;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as SuraContentArgs;
    loadSuraFile();

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            'assets/images/default_bg.png',
          ),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
            ),
          ),
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          title: Text(
            args.suraName,
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(24),
          margin: const EdgeInsets.only(
            top: 120,
            right: 29,
            bottom: 98,
            left: 29,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppTheme.white,
          ),
          child: ayat.isNotEmpty
              ? ListView.builder(
                  itemBuilder: (_, index) => Text(
                    ayat[index],
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  itemCount: ayat.length,
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
        ),
      ),
    );
  }

  Future<void> loadSuraFile() async {
    try {
      await Future.delayed(
        const Duration(seconds: 2),
      );
      String fileContent =
          await rootBundle.loadString('assets/text/${args.index + 1}.txt');
      List<String> loadedAyat = fileContent.split('\r\n');
      setState(() {
        ayat = loadedAyat;
      });
    } catch (e) {
      log('Error loading Sura file: $e');
    }
  }
}
