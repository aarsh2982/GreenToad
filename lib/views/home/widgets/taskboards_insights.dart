// Task Boards Insights Widget for Home view
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:greentoad_app/config/constants.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TaskBoards extends StatefulWidget {
  const TaskBoards({super.key});

  @override
  State<TaskBoards> createState() => _TaskBoardsState();
}

class _TaskBoardsState extends State<TaskBoards> {
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
        Text(
          "Task Boards",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        IconButton(
          onPressed: () {
            context.push("/taskboards/create");
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
            context.push("/taskboards/$index");
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
              color: Theme.of(context).primaryColor,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "750/1000",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "CN5009 Module Task",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.labelMedium,
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
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "University",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Text(
                  "Recreated section with simple and plain logo variations. Let me know if there's anything on with simple and plain logo variations. Let me know if there's anyth else",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.labelMedium,
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
          style: Theme.of(context).textTheme.labelSmall,
        ),
        GestureDetector(
          onTap: () {
            context.push("/taskboards");
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
