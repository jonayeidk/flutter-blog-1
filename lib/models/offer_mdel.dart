class OfferModel {
  int id;
  String offerName;

  OfferModel({this.id, this.offerName});
}

final List<OfferModel> offersList = [
  OfferModel(id: 1, offerName: 'Cashback'),
  OfferModel(id: 2, offerName: 'Comeback'),
  OfferModel(id: 3, offerName: 'Discount'),
];
