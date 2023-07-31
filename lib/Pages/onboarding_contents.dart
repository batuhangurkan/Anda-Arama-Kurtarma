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
    title: "ANDA Arama Kurtarma",
    image: "assets/images/earthquake1.png",
    desc: "Bu uygulama ANDA arama kurtarma sivil toplum kuruluşu için yapılmıştır.",
  ),
  OnBoardingContents(
    title: "ANDA Arama Kurtarma",
    image: "assets/images/earthquake1.png",
    desc:
        "Bu uygulama ANDA arama kurtarma sivil toplum kuruluşu web sitesinin mobil versiyonudur.",
  ),
  OnBoardingContents(
    title: "ANDA Arama Kurtarma",
    image: "assets/images/earthquake1.png",
    desc:
        "Uygulama içinde son gelişen haberlere ulaşabilir ülke çapında oluşmuş son depremleri görüntüleyebilirsiniz.",
  ),
];
