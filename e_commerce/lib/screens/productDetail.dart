import 'dart:math';

import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductDetailState();
}

class ProductDetailState extends State with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, //başlığı ortalar
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 40.0,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop(); //Geri git
          },
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Product Detail",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _buildProductDetails(context),
      bottomNavigationBar: _buildButtomNavigationBar(),
    );
  }

  _buildProductDetails(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .start, //kolon arasında düzenli boşluklar bırakır
            children: [
              _buildProductImages(),
              _buildProductTitle(),
              SizedBox(
                height: 12.0,
              ),
              _buildProductPrice(),
              SizedBox(
                height: 12.0,
              ),
              _builDivider(size),
              SizedBox(
                height: 12.0,
              ),
              _buildFurtherInfo(),
              SizedBox(
                height: 12.0,
              ),
              _builDivider(size),
              SizedBox(
                height: 12.0,
              ),
              _buildSizeArea(), //beden için method oluşturduk
              SizedBox(
                height: 12.0,
              ),
              _buildInfo(),
            ],
          ),
        )
      ],
    );
  }

  _buildProductImages() {
    TabController imagesController = TabController(length: 3, vsync: this);
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        height: 250.0,
        child: Center(
          child: DefaultTabController(
            //TabController kullanarak fotoğraflar arasında geçiş yapacağız
            length: 3, //3 elemandan oluşacak
            child: Stack(
              children: [
                TabBarView(
                  controller: imagesController,
                  children: [
                    Image.network(
                        "https://img-lcwaikiki.mncdn.com/mnresize/800/-/productimages/20192/2/3795274/l_20192-9wl638z8-hbh_a1.jpg"),
                    Image.network(
                        "https://img-lcwaikiki.mncdn.com/mnresize/800/-/productimages/20192/2/3795274/l_20192-9wl638z8-hbh_a3.jpg"),
                    Image.network(
                        "https://img-lcwaikiki.mncdn.com/mnresize/800/-/productimages/20192/2/3795274/l_20192-9wl638z8-hbh_b.jpg"),
                  ],
                ),
                Container(
                  alignment: FractionalOffset(0.5, 1.01),
                  //TabPageSelector ün bulunduğu yerin x koordinatonda 0.5(yani yarısına)
                  //koyar.y koordinatında 1.01 e yani en altın biraz üstüne koyar.
                  child: TabPageSelector(
                    //ürün resminde yana kaymak için 3 nokta oluşturduk
                    controller: imagesController,
                    selectedColor: Colors.grey,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildProductTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12.0,
      ),
      child: Center(
        child: Text(
          "Renk Bloklu Triko Kazak",
          style: TextStyle(fontSize: 16.0, color: Colors.black),
        ),
      ),
    );
  }

  _buildProductPrice() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 12.0), //yatayda 12 lik boşluk bıraktık
      child: Row(
        children: [
          Text(
            "\$70",
            style: TextStyle(fontSize: 20.0, color: Colors.black),
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            "\$140",
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough),
          ),
          SizedBox(
            width: 8.0,
          ),
          Text("\%50 indirim",
              style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.white,
                  backgroundColor: Colors.red)),
          SizedBox(
            width: 8.0,
          ),
        ],
      ),
    );
  }

  _builDivider(Size screenSize) {
    return Column(
      children: [
        Container(
          color: Colors.grey,
          width: screenSize.width,
          height: 0.25,
        )
      ],
    );
  }

  _buildFurtherInfo() {
    //bu method ta ürün hakkında daha fazla bilgilendirme yapacağız
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          Icon(Icons.local_offer, color: Colors.grey),
          SizedBox(
            width: 12.0,
          ),
          Text("Daha fazla bilgi için tıklayınız",
              style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  _buildSizeArea() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max, //maximum büyüklükte boşluk bırakır.
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //Row lar arası boşluk bırakır.Yani birisini en sola diğerini en sağa koyar.
        children: [
          Row(
            children: [
              Icon(Icons.straighten, color: Colors.grey),
              SizedBox(
                width: 12.0,
              ),
              Text(
                "Beden: Small",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Beden Tablosu",
                style: TextStyle(fontSize: 12.0, color: Colors.blue),
              )
            ],
          ),
        ],
      ),
    );
  }

  _buildInfo() {
    //ürün detay ve bilgilendirme
    TabController tabController = TabController(length: 2, vsync: this);
    //vsync: farklı mobil cihazlarda uyumluluğu sağlar.
    return Container(
      child: Column(
        children: [
          TabBar(
            controller: tabController,
            tabs: [
              Tab(
                child: Text("Ürün bilgisi",
                    style: TextStyle(color: Colors.black, fontSize: 20.0)),
              ),
              Tab(
                child: Text("Yıkama bilgisi",
                    style: TextStyle(color: Colors.black, fontSize: 20.0)),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            //yazılarımızın yukardan ve soldan boşluk bırakmasını sağladık.
            height: 40.0,
            child: TabBarView(
              //TabBarView TabBar ın altındaki yerdir.
              controller: tabController,
              children: [
                Text(
                  "%78 Akrilik %22 Polyester",
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                ),
                Text(
                  "MAKSİMUM 30 °C SICAKLIKTA YIKAYINIZ",
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildButtomNavigationBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            //butonlarımızı Flexible ile oluşturuyoruz
            fit: FlexFit
                .tight, //butonları sıkı yani birbirlerine yapışık yerleştirebilmemiz içindir
            flex:
                1, //Row da iki buton yerleştireceğimiz için 1 parçanın yani yarısını kaplayacağı alan olarak belirttik.
            child: RaisedButton(
              onPressed: () {},
              color: Colors.blueGrey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.list,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  Text("Favorilere Ekle", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
          Flexible(
            //butonlarımızı Flexible ile oluşturuyoruz
            fit: FlexFit
                .tight, //butonları sıkı yani birbirlerine yapışık yerleştirebilmemiz içindir
            flex:
                1, //Row da iki buton yerleştireceğimiz için 1 parçanın yani yarısını kaplayacağı alan olarak belirttik.
            child: RaisedButton(
              onPressed: () {},
              color: Colors.deepOrangeAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.card_travel,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  Text("Sepete Ekle", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
