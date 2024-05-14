import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_creator/controllers/routes.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingPagePresenter(
        onSkip: () => Get.toNamed(Routes.home),
          onFinish: () => Get.toNamed(Routes.home),
          pages: [
        OnboardingPageModel(
          title: 'Create Resumes On The Fly',
          description: 'Easily create resumes of your requirements',
          imageUrl: 'assets/images/splash_image_resume_maker.png',
          isAsset: true,
          bgColor: Colors.grey,
        ),
        OnboardingPageModel(
          title: 'Customize it & Save it',
          description: 'Choose resumes from variety of types and customize it.',
          imageUrl: 'assets/images/pencil-icon-left-side.png',
          isAsset: true,
          bgColor: const Color(0xff1eb090),
        ),
        OnboardingPageModel(
          title: 'Bookmark your favourites',
          description:
          'Bookmark your favourite resume & reuse it.',
          imageUrl: 'assets/images/bookmark-button-front-side-white-background.png',
          isAsset: true,
          bgColor: const Color(0xfffeae4f),
        ),
        OnboardingPageModel(
          title: 'Check Hot Resumes',
          description: 'Check hot resume of your fields',
          imageUrl: 'assets/images/trending_logo.PNG',
          isAsset: true,
          bgColor: Colors.purple,
        ),
      ]),
    );
  }
}

class OnboardingPagePresenter extends StatefulWidget {
  final List<OnboardingPageModel> pages;
  final VoidCallback? onSkip;
  final VoidCallback? onFinish;

  const OnboardingPagePresenter(
      {Key? key, required this.pages, this.onSkip, this.onFinish})
      : super(key: key);

  @override
  State<OnboardingPagePresenter> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPagePresenter> {
  // Store the currently visible page
  int _currentPage = 0;
  // Define a controller for the pageview
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        color: widget.pages[_currentPage].bgColor,
        child: Column(
          children: [
            Expanded(
              // Pageview to render each page
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.pages.length,
                onPageChanged: (idx) {
                  // Change current page when pageview changes
                  setState(() {
                    _currentPage = idx;
                  });
                },
                itemBuilder: (context, idx) {
                  final item = widget.pages[idx];
                  return Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: item.isAsset ? Image.asset(item.imageUrl) : Image.network(
                            item.imageUrl,
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: SingleChildScrollView(
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(item.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: item.textColor,
                                    )),
                              ),
                              Container(
                                constraints:
                                const BoxConstraints(maxWidth: 280),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 4.0),
                                child: Text(item.description,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.copyWith(
                                      color: item.textColor,
                                    )),
                              )
                            ]),
                          ))
                    ],
                  );
                },
              ),
            ),

            // Current page indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.pages
                  .map((item) => AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: _currentPage == widget.pages.indexOf(item)
                    ? 30
                    : 8,
                height: 8,
                margin: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
              ))
                  .toList(),
            ),

            // Bottom buttons
            SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          visualDensity: VisualDensity.comfortable,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        widget.onSkip?.call();
                      },
                      child: const Text("Skip")),
                  TextButton(
                    style: TextButton.styleFrom(
                        visualDensity: VisualDensity.comfortable,
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      if (_currentPage == widget.pages.length - 1) {
                        widget.onFinish?.call();
                      } else {
                        _pageController.animateToPage(_currentPage + 1,
                            curve: Curves.easeInOutCubic,
                            duration: const Duration(milliseconds: 250));
                      }
                    },
                    child: Row(
                      children: [
                        Text(
                          _currentPage == widget.pages.length - 1
                              ? "Finish"
                              : "Next",
                        ),
                        const SizedBox(width: 8),
                        Icon(_currentPage == widget.pages.length - 1
                            ? Icons.done
                            : Icons.arrow_forward),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OnboardingPageModel {
  final String title;
  final String description;
  final String imageUrl;
  final bool isAsset;
  final Color bgColor;
  final Color textColor;

  OnboardingPageModel(
      {required this.title,
        required this.description,
        required this.imageUrl,
        required this.isAsset,
        this.bgColor = Colors.blue,
        this.textColor = Colors.white});
}
   
    