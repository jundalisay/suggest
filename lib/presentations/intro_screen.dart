import 'package:flutter/material.dart';
import 'package:introduction_slider/introduction_slider.dart';
import 'package:suggestion_app/presentations/index.dart';


class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionSlider(
      items: [
        const IntroductionSliderItem(
          title: Text(
            'SCENAC Suggest',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black,              
              fontWeight: FontWeight.bold,
              fontSize: 16,              
            ),
          ),
          subtitle: Text("Introduction Slider Subtitle"),
          backgroundImageDecoration: BackgroundImageDecoration(
            image: AssetImage("assets/health.jpg"),
            fit: BoxFit.cover,
            opacity: 1.0,
          ),
        ),
        IntroductionSliderItem(
          title: const Text("Title"),
          subtitle: const Text("Subtitle"),
          backgroundImageDecoration: BackgroundImageDecoration(
            image: const AssetImage("assets/herbs650.jpg"),
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.1),
              BlendMode.darken,
            ),
            fit: BoxFit.cover,
            opacity: 1.0,
          ),
        ),
      ],
      done: const Done(
        child: Icon(Icons.done),
        home: Index(),
        // Get.toNamed("/index"),
      ),
      next: const Next(child: Icon(Icons.arrow_forward)),
      back: const Back(child: Icon(Icons.arrow_back)),
      dotIndicator: const DotIndicator(),
    );
  }
}

