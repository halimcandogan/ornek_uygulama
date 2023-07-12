import 'package:flutter/material.dart';

@immutable
class StringConstants {
  // static yazıları bu şekilde toplamak hem clean code mantığına yatkın hemde ilerleyen zamanlarda çoklu dil vs.
  // ekleyeceğimiz zamanlarda işimizi kolaylaştırır.

  // login
  static const hosgeldiniz = 'Hoşgeldiniz.';
  static const email = "E-mail";
  static const password = "Şifre";
  static const tekrarSifre = "Tekrar Şifre";
  static const girisYap = "Giriş Yap";
  static const hesabinizaGirisYapiniz = "Hesabınıza Giriş Yapınız Lütfen";

  // general
  static const akilliEvUrunleri = "Bks Akıllı Ev Ürünleri";
  static const urunModel = "Model";
  static const urunMacAdresi = "Mac Adresi";
  static const urunFonksiyon = "Fonksiyonlar";

  //home
  static const istediginUrunHakkindaKolaycaBilgiAlabilirsin =
      "İstediğin Ürün Hakkında Kolayca Bilgi Alabilirsin.";
}
