import 'dart:developer';

import 'package:google_sheets_api_example/src/comman/config/routes.dart';
import 'package:google_sheets_api_example/src/comman/models/create_sheet_dto.dart';
import 'package:google_sheets_api_example/src/comman/models/sheet_row.dart';
import 'package:gsheets/gsheets.dart';

const _credentials = r'''{
  "type": "service_account",
  "project_id": "mezan-299309",
  "private_key_id": "004ab9f0d9aab7a02f86dd9ae54411f8bed80f04",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCnGWlXM+7YzRRf\nrbaC2R36DallYgVRJ+xAvtgX1yx3KPbcom9E6XrtRM4IomLMBQmnkokUyukP5yS6\n4Z6cTn7zWzvKbWgG3E2D5XdxLgkoGvm1OFMyxzelvKTibXE6AfYr2EMMIMByZdy1\n3foZVqaSB8KRGx8RiUWfMYPU+D/GnkXknosZoPqOgWogu9iyo8is/br+BifaIBmE\nBPYkHKfHm7SKaBsHfLyhOrdPBdxV8LprYBb+YfEe2FIpBhs1C8ZloF/u5kVG9J0l\nRlXJFWsHCqhik8TCaIo4C/f27m1xUhJgNg59nWJIf8+2+nsqtGEW/AHX2JPlcgf6\nulG8+wF5AgMBAAECggEAEh3U0E/ou3/pj3GIpgFW6Q1J4jxpPeoliMQALv6E20L5\nV8SzKl4jdh3FdkVvz3WU3UKLgvH4aIFbl7jeLs1qYWVQ81KfCo5gR5Ztd5uBgeQB\n0npht9HGSF1uZX+u3NaJW2nSJBqZbtW5Iw0m4FAnFVJKz5toiAjRX+/4/nIvTO/f\nY9NhVAzCeotGZPgr8hb9qqjIq7ZffF+q4rGPrwlTJM3c+aN2K2VNWfUvYrEINBzj\niaIYUG8ceU+2/2eZQEIq2HPc/7LEG9s6QIOHlbaiOz74uW5Lz1VP1AwkQ1At3cUu\nj393gCM6h/3A4gCmLtxGYUXKwh1WgwDXbUGuoCrIUQKBgQDQa75fuGFnzCr2019p\nJTp8Gz2U1Q2VMrKOLjup7LvkEwWQWpJjfkmp9TuqauSTvUG6vRy34pjb6z34u2go\n9K0TowL2sAClq8TwosYniSlNj3UXG3k3kqXmIkPkkfcdGpNI85Ko2131NhucwxTa\nwyND+27iPrZD/yF7uUOugXBE8QKBgQDNPs4atb8v66PwB88g2dqQswsQaYGoA84u\n0m0gVFO4T6Mmuzl72+MhCcBpFJeSHhUWEB9RPH5ZLX08WAutG5nHFvzII7eNwiYH\nFk8NLgWCMfkpcgy0AyEihm++a+Y1AhRpVl8PFpTz9hNojNyZX8Eq9YaAgZcPSrFA\nnRlz5C3lCQKBgBDHW8Ag+9Z7XUoZoii40oiDOOXucPV961n+5ta7NDUcQupoIDja\nRdvk3jTN/jDWn6AE8XbsSxoJSifoDm6dpAFcsjRh3ut3dJdaw1ETfbu8vNRrZcrP\nh4OLZqPUDGzPYuQQl9H4Nwwymu531gn2g7RJXZfhLJM0yuFG/Ofji8JBAoGAKycA\nSGdb+iROBIJvzxVeububIOk95GhgakG9xeVU8NR1lggZLuxtVZ3qQW2d7I+8mTXs\nj7TrT66bvRs54TyDWXOA1EeGKRzfx++t0TSS3evJ2ifredGKnuqrBdtDvHNifT82\nn0J9MMnVDM9I9kpGn9SdYdldPE7U86PUHSSlbZkCgYBUeCY7N74MgyHWOfYLHl/3\nyK9AVy9m5uHU/RlUlGGqg8HglSap3HAMzIPf7wk06U6q1qkIdqd0iX6WNwDKVEm0\n5yddMf9pDMUm+P5NeNq1G3sgGLYVga00HozI65mdmqHOkBMiYi7CGUkvVnBnlA2Q\nNlLQZ1LSOvsR9JQHRvpnzQ==\n-----END PRIVATE KEY-----\n",
  "client_email": "sheets-api@mezan-299309.iam.gserviceaccount.com",
  "client_id": "105002815034160666713",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/sheets-api%40mezan-299309.iam.gserviceaccount.com"
}
''';

class SheetService {
  SheetService._();

  static Future<List<SheetRow>> findMany() async {
    throw UnimplementedError();
  }

  static Future<void> createOne(CreateSheetDto dto) async {
    // init GSheets
    final gsheets = GSheets(_credentials);
    // fetch spreadsheet by its id
    final ss = await gsheets.spreadsheet(AppRoutes.spreadSheetId);

    // get worksheet by its title
    var sheet = ss.worksheetByTitle('Sheet1');
    final index = sheet!.rowCount + 1;
    await sheet.values.insertValue(
      dto.name,
      column: 1,
      row: index,
    );
    await sheet.values.insertValue(
      dto.email,
      column: 2,
      row: index,
    );
    await sheet.values.insertValue(
      dto.mobile,
      column: 3,
      row: index,
    );
    await sheet.values.insertValue(
      dto.modelNumber,
      column: 4,
      row: index,
    );
    await sheet.values.insertValue(
      dto.putchaseDate.microsecondsSinceEpoch,
      column: 5,
      row: index,
    );
  }

  static Future<void> deleteOne(SheetRow row) async {
    throw UnimplementedError();
  }

  static Future<void> updateOne(SheetRow row) async {
    throw UnimplementedError();
  }
}
