import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';

class HadethContentScreen extends StatefulWidget {
  const HadethContentScreen({super.key});
  static const String routeName = '/hadeth-content';

  @override
  State<HadethContentScreen> createState() => _HadethContentScreenState();
}

class _HadethContentScreenState extends State<HadethContentScreen> {
  @override
  Widget build(BuildContext context) {
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;

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
            hadeth.title,
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
          child: hadeth.content.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                )
              : ListView.builder(
                  itemBuilder: (_, index) => Text(
                    hadeth.content[index],
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  itemCount: hadeth.content.length,
                ),
        ),
      ),
    );
  }
}
