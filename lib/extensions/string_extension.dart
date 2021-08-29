part of 'extensions.dart';

// ! METHODE DI BAWAH INI DIGUNAKAN UNTUK MEMUNCULKAN INDEX
//  ! YANG AKAN MEMUNCULKAN HANYA ANGKA SAJA YANG AKAN DIGUNAKAN DI TOP UP
//  ! 48 DAN 57 ADALAH KODE ASCI = YAITU YANG MEMUNCULKAN
//  ! ANGKA 0 DAN 9

extension StringExtension on String {
  bool isDigit(int index) =>
      this.codeUnitAt(index) >= 48 && this.codeUnitAt(index) <= 57;
}
