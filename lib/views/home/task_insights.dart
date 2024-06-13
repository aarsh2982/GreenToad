// Task Insights Widget for Home view
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:greentoad_app/config/constants.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TaskInsights extends StatefulWidget {
  const TaskInsights({super.key});

  @override
  State<TaskInsights> createState() => _TaskInsightsState();
}

class _TaskInsightsState extends State<TaskInsights> {
  // task boards section states
  int _currentTaskBoardIndex = 0;
  final int _totalTaskBoards = 10;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 10.0),
          _buildTaskBoardCarousel(),
          const SizedBox(height: 10.0),
          _buildTaskBoardCarouselPageIndicator(),
        ],
      ),
    );
  }

  // destructured header widget
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Task Boards",
          style: TextStyle(
            fontSize: 22.0,
            fontFamily: "Roboto",
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          onPressed: () {
            print("Should take user to Add New Task Board Page later!");
          },
          icon: const Icon(
            FontAwesomeIcons.plus,
            color: primaryColor,
            size: 20.0,
          ),
        ),
      ],
    );
  }

  // destructured carousel widget
  Widget _buildTaskBoardCarousel() {
    return CarouselSlider.builder(
      itemCount: _totalTaskBoards,
      options: CarouselOptions(
        initialPage: _currentTaskBoardIndex,
        height: 240.0,
        padEnds: false,
        pageSnapping: true,
        viewportFraction: 0.9,
        enlargeFactor: 20.0,
        enableInfiniteScroll: false,
        animateToClosest: true,
        onPageChanged: (index, reason) {
          setState(() {
            _currentTaskBoardIndex = index;
          });
        },
      ),
      itemBuilder: (context, index, realIndex) {
        return GestureDetector(
          onTap: () {
            print("Should open individual Task Board later!");
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 18.0,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularPercentIndicator(
                      radius: 30.0,
                      percent: 0.75,
                      progressColor: primaryColor,
                      animation: true,
                      animationDuration: 1000,
                      center: const Text(
                        "75%",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      margin: const EdgeInsets.only(left: 16.0),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "750/1000",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            "CN5009 Module Task",
                            style: TextStyle(
                              fontSize: 14.0,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  child: Text(
                    "10 Task Lists · 7 Files",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "University",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  "Recreated section with simple and plain logo variations. Let me know if there's anything on with simple and plain logo variations. Let me know if there's anyth else",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // destructured task board carousel page indicator
  Widget _buildTaskBoardCarouselPageIndicator() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${_currentTaskBoardIndex + 1}/$_totalTaskBoards",
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.grey[600],
          ),
        ),
        GestureDetector(
          onTap: () {
            print("Should take user to All Task Boards Page later!");
          },
          child: const Row(
            children: [
              Text(
                "All Boards",
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: primaryColor,
                  fontSize: 14.0,
                ),
              ),
              SizedBox(width: 4.0),
              Icon(
                FontAwesomeIcons.chevronRight,
                color: primaryColor,
                size: 10.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
