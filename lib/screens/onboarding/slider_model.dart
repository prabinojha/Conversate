class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel([
    this.imageAssetPath = '',
    this.title = '',
    this.desc = '',
  ]);

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

}

List<SliderModel> getSlides() {
  List<SliderModel> slides = <SliderModel>[];
  SliderModel sliderModel = SliderModel();

  //1

  sliderModel.setImageAssetPath("./lib/assets/icons/slide1.svg");
  slides.add(sliderModel);

  sliderModel = SliderModel();

  //2

  sliderModel.setImageAssetPath("./lib/assets/icons/slide2.svg");
  slides.add(sliderModel);

  sliderModel = SliderModel();

  //3

  sliderModel.setImageAssetPath("./lib/assets/icons/slide3.svg");
  slides.add(sliderModel);

  sliderModel = SliderModel();

  //4

  sliderModel.setImageAssetPath("./lib/assets/icons/slide4.svg");
  slides.add(sliderModel);

  sliderModel = SliderModel();

  return slides;
}
