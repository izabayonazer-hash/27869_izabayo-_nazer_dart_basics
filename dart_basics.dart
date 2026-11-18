// Student: Izabayo Nazer
// Reg no: 27869

const String regNo = '27869';
final int d = int.parse(regNo[regNo.length - 1]);              // 9
final int t = int.parse(regNo.substring(regNo.length - 2));    // 69

// by IN
int countVowels(String text) {
  int count = 0;
  final vowels = 'aeiouAEIOU';
  for (int i = 0; i < text.length; i++) {
    if (vowels.contains(text[i])) count++;
  }
  return count;
}

// by IN
String initials(String fullName) {
  final parts = fullName.trim().split(RegExp(r'\s+'));
  if (parts.isEmpty || parts[0].isEmpty) return '';
  final buf = StringBuffer();
  for (final p in parts) {
    if (p.isEmpty) continue;
    buf.write(p[0].toUpperCase());
    buf.write('.');
  }
  return buf.toString();
}

// by IN
void drawTriangle(int height) {
  if (height <= 0) return;
  int row = 1;
  while (row <= height) {
    final ch = (row % 2 == 1) ? '*' : '#';
    final spaces = ' ' * (height - row);
    print('$spaces${ch * row}');
    row++;
  }
}

// by IN
int momoFee(int amount) {
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// by IN
String maskPhone(String phone) {
  if (phone.length != 10) return 'INVALID';
  final middle = '*' * (phone.length - 5);
  return '${phone.substring(0, 3)}$middle${phone.substring(phone.length - 2)}';
}

void main() {
  print('Reg no: $regNo | D = $d | T = $t');
  print('');

  // ---- B2 ----
  final name = 'Izabayo Nazer';
  print('$name has ${countVowels(name)} vowels');

  // ---- B3 ----
  print(initials('Izabayo Nazer'));   // I.N.
  print(initials('ana uwase'));       // A.U.
  print(initials(''));                // (empty line)

  // ---- C5 ----
  print('');
  drawTriangle(d + 3);   // height = 12
  drawTriangle(0);       // nothing
  drawTriangle(-2);      // nothing

  // ---- D2 ----
  print('');
  final phone = '0788123456';
  int totalFees = 0;
  int i = 1;
  final int limit = d + 3;  // 12
  while (i <= limit) {
    final int amount = i * 4000 + t * 100;
    final int fee = momoFee(amount);
    totalFees += fee;
    print('Receipt $i | $amount RWF | fee $fee RWF | to ${maskPhone(phone)}');
    i++;
  }
  print('Total fees: $totalFees RWF');
}