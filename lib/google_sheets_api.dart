import 'package:gsheets/gsheets.dart';

class GoogleSheetsApi {
  // create credentials
  static const _credentials = r'''
  {
  "type": "service_account",
  "project_id": "my-project-todo-356103",
  "private_key_id": "a479dabf19724d662f4c022616222fb39b3103fc",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCxGLIM60cg6Jlo\nseqh6hkTlce8iv1ygufdSGkdT0TNrSTZqmRmZAIY0n9LA3g5y1NDmivdUS3xsnda\nPRNjKYD1/dQf+BOLgOU1HtEXZ2b/zYbi4mDvn69eEwujmabR1X3CIL+VtSenAs7z\nniPOJ2lT9UDqp5nak4U4C+rwjfneEhYmwv8x4AeBPRGb3+RV2veaGwOjN/Oq06L5\nflSnT5upQoHWhvK0y0aVZbgTZTQzkFGsr1Yq6InjWJRQoX8pUzgv3klNzJdqMLBd\n/i4AIcFJMd8fC8K2Yg6tO2nerDaSmsk/kH0x5mILFYQtUtNclNKNRC8VABnk5eIj\naTPAdQ8RAgMBAAECggEAB6ZHPhQ9Vzo+0qExPydOSByZkx7+j7dAckwn+K9xa5Ar\nmeCQm8Tc+5MfkxcaNsZd4UsX8xRIJ5MPsVjXJRrQRofdVVhtCTMDC4hqTBBQCFN5\njKQuP1l6nOXWFE3tMQ3/g66wEdSQavgNxgN+HM/yXnFW+Y/N3y1tNSCcKEH8sZMs\nZz0v7IQbM5cOTiaBM4SIlogW8O+iA3g+oOzz9IQsQL6GNDLKac41G8lGzLIwvCue\nWG6ZJi6msCszzpvlQ1DkhS6DKJV5nplUCZs7QJP4PMzmzyHZAkvePn+Qu++3ndvu\nliK7wxyUkTydOUCjQzz/3NLr9cR2HH5wumoRWsfKQQKBgQDW1ijMjz2ux6nMyNES\n8U/WXfUwwSquhev39BmPu/bNX4grw2HuqC7HpwpwFYCodacNA1s6P9CAjOecqHQB\nrfq+YZ+ShGG+bVHyTUn3W5atwS4f6TYFnR5lU7X2Z8+epB4Dmfkj3LUB9lG+nwMO\nXZz/d5fCDmvJJFCU5NXAnJPa0QKBgQDTB12e9jbqJYviqEQi3ZWVEBz8giEUXmFa\nsIO2wJgf2XayXVK1X/OkTxRvk2iIs8pN/Qv1Xku8jaqam1LPqTcWNvyMVLZYxOWD\nOi7TXqhh0QnQISx1CdtE+w7n3m9YWwxc1BLEEFkFE5EpLLlQstJxnnwgL3fPxpNN\nrQN71eKAQQKBgGt4FlC+Fw0ntDlM+8mODXIe7ljFSKSlObV/1omgbYWvFF9QDd1l\nJIGbfg0ztHiQ4lAQLcKlyZeE5Rfo7J8qeRRjoX+Z2Yt5BFVBdI7YsjeZO4mbD/se\n7eWiSpRIugOR9bG3hHn8HlAs+BdzVAQLsE3bdX8N1712/Rh+oK8JpK0BAoGBAKcL\nLJOZKGz+HZXkRlMm/bIKGDfVNiQudXfZQ9nU6FZFyIx2DPNfqbgFlRKhJ90WHGzR\ngrbO1rrBlStfChUxSFbAXfcjU1g/O8I9uzU7t6P+WXsz10Ip9DTNWsY2MANLxyRw\nBw7GNgErtPtX2LVFaAniPzUm/fstoAqbiqdq7ilBAoGAUvlcT93QPtLPF0XAR5p5\nV1WeiXX70hmJ25rzm1hkwu9/FFQ3wWmbMi8EvuBh/gm8fi5GoZxEqD9dG81k57Ve\n2j9tXcsbrSwntmlxpy0QHZ5X8N3I0U8IjKpHYIWRSXtZghQx3y80Hg/7xwg7tvuA\nVXg/knHr4ZwAvn6kxpItHmg=\n-----END PRIVATE KEY-----\n",
  "client_email": "akash-637@my-project-todo-356103.iam.gserviceaccount.com",
  "client_id": "108860656092351028718",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/akash-637%40my-project-todo-356103.iam.gserviceaccount.com"
}

  ''';

  // set up & connect to the spreadsheet
  static final _spreadsheetId = '1nZpMpLLSoqyfljyVqDgklM08BsJ52viZUetTk3aoLkc';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _worksheet;

  // some variables to keep track of..
  static int numberOfTransactions = 0;
  static List<List<dynamic>> currentTransactions = [];
  static bool loading = true;

  // initialise the spreadsheet!
  Future init() async {
    final ss = await _gsheets.spreadsheet(_spreadsheetId);
    _worksheet = ss.worksheetByTitle('Worksheet1');
    countRows();
  }

  // count the number of notes
  static Future countRows() async {
    while ((await _worksheet!.values
            .value(column: 1, row: numberOfTransactions + 1)) !=
        '') {
      numberOfTransactions++;
    }
    // now we know how many notes to load, now let's load them!
    loadTransactions();
  }

  // load existing notes from the spreadsheet
  static Future loadTransactions() async {
    if (_worksheet == null) return;

    for (int i = 1; i < numberOfTransactions; i++) {
      final String transactionName =
          await _worksheet!.values.value(column: 1, row: i + 1);
      final String transactionAmount =
          await _worksheet!.values.value(column: 2, row: i + 1);
      final String transactionType =
          await _worksheet!.values.value(column: 3, row: i + 1);
      final String transactionCat =
          await _worksheet!.values.value(column: 4, row: i + 1);
      final String transactionDate =
          await _worksheet!.values.value(column: 5, row: i + 1);

      if (currentTransactions.length < numberOfTransactions) {
        currentTransactions.add([
          transactionName,
          transactionAmount,
          transactionType,
          transactionCat,
          transactionDate
        ]);
      }
    }
    print(currentTransactions);
    // this will stop the circular loading indicator
    loading = false;
  }

  // insert a new transaction
  static Future insert(
    String name,
    String amount,
    bool _isIncome,
    String dropdownvalue,
    String datetime,
  ) async {
    if (_worksheet == null) return;
    numberOfTransactions++;
    currentTransactions.add([
      name,
      amount,
      _isIncome == true ? 'income' : 'expense',
      dropdownvalue,
      datetime,
    ]);
    await _worksheet!.values.appendRow([
      name,
      amount,
      _isIncome == true ? 'income' : 'expense',
      dropdownvalue,
      datetime,
    ]);
  }

  // CALCULATE THE TOTAL INCOME!
  static double calculateIncome() {
    double totalIncome = 0;
    for (int i = 0; i < currentTransactions.length; i++) {
      if (currentTransactions[i][2] == 'income') {
        totalIncome += double.parse(currentTransactions[i][1]);
      }
    }
    return totalIncome;
  }

  // CALCULATE THE TOTAL EXPENSE!
  static double calculateExpense() {
    double totalExpense = 0;
    for (int i = 0; i < currentTransactions.length; i++) {
      if (currentTransactions[i][2] == 'expense') {
        totalExpense += double.parse(currentTransactions[i][1]);
      }
    }
    return totalExpense;
  }
}
