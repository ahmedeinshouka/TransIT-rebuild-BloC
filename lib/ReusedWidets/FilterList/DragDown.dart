import 'package:flutter/material.dart';

import 'package:untitled5/SharedData/UsedData/BusLineInfo.dart';
import 'package:untitled5/consts/Colors.dart';

class DragDownList extends StatefulWidget {
  final Function(String) onFilterChanged;

  const DragDownList({super.key, required this.onFilterChanged});

  @override
  State<DragDownList> createState() => _DragDownListState();
}

class _DragDownListState extends State<DragDownList> {
  String address = 'Select an address';

  void onSearchPressed() {
    widget.onFilterChanged(address); // Trigger the callback
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(Icons.location_on_outlined, color: appColorBase),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: address,
                    isExpanded: true,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 2,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700]),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    dropdownColor: Colors.white,
                    onChanged: (String? newValue) {
                      setState(() {
                        address = newValue!;
                      });
                    },
                    items: addresses.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ));
                    }).toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: 324,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: appColorBase,
              ),
              child: ElevatedButton(
                onPressed: onSearchPressed,
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(appColorBase)),
                child: const Text("Search"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
