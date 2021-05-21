class CardConfigRepo {
  bool showDesc;
  CardConfigRepo({this.showDesc = true});

  void SetDesc(bool x) => showDesc = x;
}