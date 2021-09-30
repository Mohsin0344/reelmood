class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent({required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Send & Receive',
      image: 'assets/pic 2.png',
      discription: 'Send & Receive your RMD tokens Directly from your wallet.'
  ),
  UnbordingContent(
      title: 'Track Tokens',
      image: 'assets/pic 3.png',
      discription:  'Track your favorites tokens and crypto on the app. Receives live price updates.'
  ),
  UnbordingContent(
      title: 'Safe & Secure',
      image: 'assets/pic 4.png',
      discription: 'Choose from various security measures for your date and crypto to be safe & secure.'
  ),
];
