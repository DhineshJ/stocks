import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:stocks/Views/stock_details.dart';

import '../models/sector.dart';

class SectorPerformance extends StatelessWidget {
  const SectorPerformance({super.key, required this.sector});
  final Sector sector;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sector Performance'),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            shrinkWrap: true,
            itemCount: sector.data.length,
            itemBuilder: (context, index) {
              return Container(
                height: 75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white12),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WhiteText(datum: sector.data[index].sector),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: sector.data[index].percentage > 0
                                ? MaterialStateProperty.all<Color>(Colors.green)
                                : MaterialStateProperty.all<Color>(Colors.red)),
                        onPressed: () {},
                        child: WhiteText(
                          datum: sector.data[index].percentage.toString(),
                          // color: sector.data[index].percentage > 0
                          //     ? Colors.green
                          //     : Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
