import 'package:e_commerce/widgets/productListRow.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product List",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true, //başlığı ortalar
      ),
      body: _buildProductListPage(),
    );
  }

  _buildProductListPage() {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildFilterWidgets(screenSize);
          } else if (index == 4) {
            return SizedBox(height: 12.0,);
          } else {
            return _buildProductListRow();
          }
        },
      ),
    );
  }

  _buildFilterWidgets(Size screenSize) {
    return Container(
      margin: EdgeInsets.all(12.0),
      width: screenSize.width,
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.0), //vertical:dikey boşluk
          child: Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceEvenly, //başında ve sonunda boşluk bırakır.
            children: [
              _buildFilterButton("Sırala"),
              Container(
                color: Colors.black,
                width: 2.0,
                height: 24.0,
              ),
              _buildFilterButton("Filtrele"),
            ],
          ),
        ),
      ),
    );
  }

  _buildFilterButton(String title) {
    return InkWell(
      onTap: (){//sırala ve filtrele butonlarına tıkladığımızda print(title) işlemini yaptırdık.
        print(title);
      },
      child: Row(
        children: [
          Icon(Icons.arrow_drop_down, color: Colors.black),
          SizedBox(width: 2.0),
          Text(title)
        ],
      ),
    );
  }

  _buildProductListRow() {
    return ProductListRow(name:"Kazak",currentPrice:150,originalPrice:300,discount:50,imageUrl:"https://img-lcwaikiki.mncdn.com/mnresize/600/-/productimages/20192/2/3795274/l_20192-9wl638z8-hbh_a.jpg");
  }
}
