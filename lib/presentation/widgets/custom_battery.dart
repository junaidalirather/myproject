import 'package:flutter/material.dart';

import '../../app/config/app_colors.dart';

class CustomBattery extends StatelessWidget {
  const CustomBattery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 200,
      child: Stack(
        children: [
          Positioned(
              child: Row(
            children: [
              Container(
                  width: 180,
                  height: 70,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: AppColors.batteryBorder, width: 3),
                    color: const Color(0xffFFf8f8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: AppColors.batteryGrey,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5.0),
                                bottomLeft: Radius.circular(5.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Container(
                            color: AppColors.batteryYellow,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 8,
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Container(
                            color: Colors.white,
                            child: const Center(
                              child: Text(
                                '5 - 15 % \n85 - 95 % ',
                                style: TextStyle(
                                  color: AppColors.batteryYellow,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Container(
                            color: AppColors.batteryYellow,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: AppColors.batteryGrey,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5.0),
                                bottomRight: Radius.circular(5.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          )),
          const Positioned(
              left: 180,
              top: 25,
              child: SizedBox(
                height: 25,
                width: 6,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: AppColors.batteryBorder),
                ),
              ))
        ],
      ),
    );
  }
}
