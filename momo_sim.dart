// Student: Izabayo Nazer
// Reg no: 27869

const String regNo = '27869';
final int d = int.parse(regNo[regNo.length - 1]);            // 9
final int t = int.parse(regNo.substring(regNo.length - 2));  // 69

// by IN
int momoFee(int amount) {
  if (amount <= 0) return -1;
  if (amount <= 1000) return 20;
  if (amount <= 10000) return 100;
  if (amount <= 150000) return 250;
  return 1500;
}

// by IN
String formatRwf(int amount) {
  final bool neg = amount < 0;
  final String digits = amount.abs().toString();
  final buf = StringBuffer();
  final int len = digits.length;
  for (int i = 0; i < len; i++) {
    if (i > 0 && (len - i) % 3 == 0) buf.write(',');
    buf.write(digits[i]);
  }
  return '${neg ? '-' : ''}${buf.toString()} RWF';
}

// by IN
bool isValidPin(String pin) {
  if (pin.length != 5) return false;
  for (int i = 0; i < pin.length; i++) {
    final c = pin[i];
    if (c.codeUnitAt(0) < 48 || c.codeUnitAt(0) > 57) return false;
  }
  if (pin == '12345') return false;
  bool same = true;
  for (int i = 1; i < pin.length; i++) {
    if (pin[i] != pin[0]) { same = false; break; }
  }
  if (same) return false;
  return true;
}

// by IN
int sendMoney(int balance, int amount) {
  final int fee = momoFee(amount);
  if (fee == -1) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount + fee > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  final int newBalance = balance - amount - fee;
  print('Sent ${formatRwf(amount)} (fee ${formatRwf(fee)}). '
      'New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

// by IN
int buyAirtime(int balance, int amount) {
  if (amount < 100 || amount > 50000) {
    print('Failed: invalid amount');
    return balance;
  }
  if (amount > balance) {
    print('Failed: insufficient balance');
    return balance;
  }
  final int newBalance = balance - amount;
  print('Bought airtime ${formatRwf(amount)}. '
      'New balance: ${formatRwf(newBalance)}');
  return newBalance;
}

void main() {
  print('Reg no: $regNo | D = $d | T = $t');
  print('');

  // 1. PIN validation
  print(isValidPin('12345'));   // false
  print(isValidPin('77777'));   // false
  print(isValidPin('4821'));    // false (length)
  print(isValidPin('48a21'));   // false (letter)
  print(isValidPin('4821$d'));  // false? (digit 9, length 5, not banned -> true)

  // 2. Starting balance
  int balance = 20000 + t * 500;   // 20000 + 34500 = 54,500
  print('Start balance: ${formatRwf(balance)}');

  // 3. Transactions
  int k = 0;
  while (k < 3) {
    balance = sendMoney(balance, (d + 1) * 3000);  // send 30,000 three times
    k++;
  }
  balance = buyAirtime(balance, 1000);
  balance = sendMoney(balance, 0);
  balance = sendMoney(balance, 200000);

  // 4. Final
  print('Final balance: ${formatRwf(balance)}');

  // 5. Extra tests
  // formatRwf(0)        -> 0 RWF
  // formatRwf(999)      -> 999 RWF
  // formatRwf(1000)     -> 1,000 RWF
  // formatRwf(-5000)    -> -5,000 RWF
  // formatRwf(1250000)  -> 1,250,000 RWF
  // isValidPin('00000')-> false
  // isValidPin('00001')-> true
  print(formatRwf(0));
  print(formatRwf(999));
  print(formatRwf(1000));
  print(formatRwf(-5000));
  print(formatRwf(1250000));
  print(isValidPin('00000'));   // expect false
  print(isValidPin('00001'));   // expect true
}