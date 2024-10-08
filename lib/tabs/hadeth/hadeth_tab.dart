import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';
import 'package:islami/tabs/hadeth/hadeth_content_screen.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if(ahadeth.isEmpty){
      loadAhadethFile();
    }
    return Column(
      children: [
        Image.asset(
          'assets/images/hadeth_logo.png',
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Table(
              children: [
                TableRow(
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 3,
                        color: Color(0XFFB7935F),
                      ),
                      bottom: BorderSide(
                        width: 3,
                        color: Color(0XFFB7935F),
                      ),
                    ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'الأحاديث',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ],
                ),
                ...List.generate(
                  ahadeth.length,
                  (index) => TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pushNamed(
                            HadethContentScreen.routeName,
                            arguments: ahadeth[index],
                          ),
                          child: Text(
                            ahadeth[index].title,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> loadAhadethFile() async {
    try {
      await Future.delayed(
        const Duration(seconds: 2),
      );
      String fileContent =
          await rootBundle.loadString('assets/text/ahadeth.txt');
      List<String> loadedAhadethString = fileContent.split('#');
      setState(() {
        ahadeth = loadedAhadethString.map((hadethString) {
          List<String> hadethLines = hadethString.trim().split('\n');
          String title = hadethLines[0];
          hadethLines.removeAt(0);
          List<String> content = hadethLines;
          return Hadeth(title, content);
        }).toList();
      });
    } catch (e) {
      log('Error loading Sura file: $e');
    }
  }
}
