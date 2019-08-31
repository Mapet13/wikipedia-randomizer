import 'package:test/test.dart';

import 'utils/mockHttpFetcherUtilities.dart';

main() {

  test('Returns correct output when receives a valid HTTP response', () async {
    var fetchedPage = 'fetchedPage';
    var utilities = MockHttpFetcherUtilities();
    var page = await utilities.getPageWithValidResponse(fetchedPage);

    expect(page.body, fetchedPage);
  });

  test('Throws an error when receives an invalid HTTP response', () async {
    var utilities = MockHttpFetcherUtilities();
    var expectedException = Exception('Http status code: 400').toString();

    utilities.getPageWithErrorResponse()
      .then((page)    { fail('Exception not thrown'); })
      .catchError((e) { expect(e.toString(), expectedException); });
  });
  
}
