class OnBoardingContents {
  final String title;
  final String image;
  final String desc;

  OnBoardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnBoardingContents> contents = [
  OnBoardingContents(
    title: "Track Your work and get the result",
    image: "assets/images/earthquake1.png",
    desc: "Remember to keep track of your professional accomplishments.",
  ),
  OnBoardingContents(
    title: "Stay organized with team",
    image: "assets/images/earthquake1.png",
    desc:
        "But understanding the contributions our colleagues make to our teams and companies.",
  ),
  OnBoardingContents(
    title: "Get notified when work happens",
    image: "assets/images/earthquake1.png",
    desc:
        "Take control of notifications, collaborate live or on your own time.",
  ),
];
