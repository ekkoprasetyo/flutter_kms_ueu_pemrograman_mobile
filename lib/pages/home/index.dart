import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:getwidget/getwidget.dart';

class IndexHomePage extends StatelessWidget {
  const IndexHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 13 / 5,
            enlargeCenterPage: true,
          ),
          items: imageSliders,
        ),
        SizedBox(
          height: 15,
        ),
        GFAccordion(
            title: 'KMS Fasilkom UEU',
            content: 'Developed By : \n Devin \n Eko \n Gianina'),
        GFCard(
          boxFit: BoxFit.cover,
          image: Image.asset('your asset image'),
          title: GFListTile(
            avatar: GFAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/images/logo-ueu.png'),
            ),
            title: Text('Universitas Esa Unggul',
                style: TextStyle(fontWeight: FontWeight.w700)),
            subTitle: Text('Fakultas Ilmu Komputer'),
          ),
          content: Text(
              "Salah satu perguruan tinggi kelas dunia berbasis intelektualitas, kreatifitas dan kewirausahaan, yang unggul dalam mutu pengelolaan dan hasil pelaksanaan Tridarma Perguruan Tinggi."),
          // buttonBar: GFButtonBar(
          //   children: <Widget>[
          //     GFButton(
          //       onPressed: () {},
          //       text: 'Buy',
          //     ),
          //     GFButton(
          //       onPressed: () {},
          //       text: 'Cancel',
          //     ),
          //   ],
          // ),
        ),
      ],
    );
  }
}

final List<String> imgList = [
  'https://fasilkom.esaunggul.ac.id/wp-content/uploads/2021/01/Slider-GREEN-MATRICS-2020.jpg',
  'https://fasilkom.esaunggul.ac.id/wp-content/uploads/2020/02/Slider-TI-AKREDITASI-2020.jpg',
  'https://fasilkom.esaunggul.ac.id/wp-content/uploads/2021/02/Slider-WEBO-UNIRANK-DIKBUD-desktop.jpg',
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Image.network(item, fit: BoxFit.fill, width: 400.0)),
          ),
        ))
    .toList();
