import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled5/ReusedWidets/ListbusLine/ListbusLine.dart';
import 'package:untitled5/consts/Colors.dart';
import 'package:untitled5/ReusedWidets/TransItBottomImg/BottomImage.dart';
import 'package:untitled5/ReusedWidets/CustomDashLine/CustomDashLine.dart';
import 'package:untitled5/ReusedWidets/FilterList/DragDown.dart';
import 'cubit/map_cubit_cubit.dart';
import 'cubit/map_cubit_state.dart';

class ShowMap extends StatelessWidget {
  const ShowMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              height: 170,
              width: MediaQuery.of(context).size.width,
              child: Container(color: mapColor),
            ),
            Positioned(
              left: 20,
              top: 42,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back, color: appColorBase),
                      ),
                      const SizedBox(width: 8),
                      Text("Bus Timeline", style: TextStyle(color: appColorBase)),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Welcome Aboard!",
                    style: TextStyle(fontSize: 24, color: appColorBase, fontWeight: FontWeight.w600),
                  ),
                  const Text(
                    "Here’s Your Bus Timeline.",
                    style: TextStyle(fontSize: 16, color: appColorBase, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 20),
                  DragDownList(
                    onFilterChanged: (address) {
                      context.read<BusCubit>().filterBuses(address);
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              top: 280,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Expanded(
                        child: Text(
                          "Bus Number",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          "Departure",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                const SizedBox(height: 50),
                                DashedLine(),
                                Material(
                                  elevation: 2,
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: appColorBase,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: const Text(
                                      "Time",
                                      style: TextStyle(fontSize: 12, color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          "Exhibition",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 300,
                    child: const Divider(color: Colors.grey, thickness: .45),
                  ),
                  BlocBuilder<BusCubit, BusState>(
                    builder: (context, state) {
                      if (state is BusInitialState) {
                        return BusLinesList(filteredBuses: state.buses);
                      } else if (state is BusFilteredState) {
                        return BusLinesList(filteredBuses: state.filteredBuses);
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ],
              ),
            ),
            const ImageFotter(),
          ],
        ),
        backgroundColor: appColorBase,
      ),
    );
  }
}
