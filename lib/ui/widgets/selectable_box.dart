part of 'widgets.dart';

class SelectableBox extends StatelessWidget {
  // yang menunjukan apakah sedang diselect atau tidak
  //  digunakan untuk menunjukan jam tayang
  // saat kita pilih kursi
  // dan saat kita pilih hari
  final bool isSelected;
  // menunjukan bisa diselect atau tidak
  final bool isEnabled;
  // untuk lebar  dan tinggi boxnya
  final double width;
  final double height;
  // untuk tulisan didalamnya
  final String text;
  // apa yang terjadi jika di tap
  final Function onTap;
  // untuk style untuk teksnya
  final TextStyle textStyle;

  // yang ada di dalam {} artinya opsional

  SelectableBox(this.text,
      {this.isSelected = false,
      this.isEnabled = true,
      this.width = 144,
      this.height = 60,
      this.onTap,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: (!isEnabled)
                ? Color(0xFFE4E4E4)
                : isSelected ? accentColor2 : Colors.transparent,
            border: Border.all(
                color: (!isEnabled)
                    ? Color(0xFFE4E4E4)
                    : isSelected ? Colors.transparent : Color(0xFFE4E4E4))),
        child: Center(
          child: Text(
            text ?? "None",
            style: (textStyle ?? blackTextFont)
                .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
