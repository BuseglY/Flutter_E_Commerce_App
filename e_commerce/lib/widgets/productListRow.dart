import 'package:e_commerce/utilities/constants.dart';
import 'package:flutter/material.dart';

class ProductListRow extends StatelessWidget {
  String name;
  int currentPrice;
  int originalPrice;
  int discount;
  String imageUrl;
  ProductListRow(
      {this.name,
      this.currentPrice,
      this.originalPrice,
      this.discount,
      this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [_builProductItemCard(context), _builProductItemCard(context)],
    );
  }

  _builProductItemCard(BuildContext context) {
    return InkWell(
        onTap: () {
          //Inkwell gölgelendirme yapan butondur
          Navigator.of(context).pushNamed(Constants.ROUTE_PRODUCT_DETAIL);
        },
        child: Card(
          child: Column(
            children: [
              Container(
                child: Image.network(this.imageUrl),
                height: 250.0,
                width: MediaQuery.of(context).size.width / 2.2, //
              ),
              SizedBox(
                height: 8.0,
              ), //boşluk bıraktık
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start, //baştan dizmeye başlar vve aralarında düzenli boşluklar bırakır
                  children: [
                    Text(
                      this.name,
                      style: TextStyle(fontSize: 16.0, color: Colors.grey),
                    ), //resmin altına ismini yazırdık
                    SizedBox(
                      height: 2.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start, //baştan dizmeye başlar vve aralarında düzenli boşluklar bırakır
                      children: [
                        Text(
                          "\$$currentPrice", //int değer old. için bu formatta yazdırdık
                          style: TextStyle(fontSize: 16.0, color: Colors.black),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "\$$originalPrice", //int değer old. için bu formatta yazdırdık
                          style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                              decoration: TextDecoration
                                  .lineThrough), //lineThrough üzerini çizer
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                            "$discount\% indirim", //int değer old. için bu formatta yazdırdık.indirim oranı
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                            )),
                        SizedBox(
                          width: 8.0,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
