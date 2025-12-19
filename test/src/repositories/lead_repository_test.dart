import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taraz_package_sample/src/core/models/paginated_response_model.dart';
import 'package:taraz_package_sample/taraz_package_sample.dart';

class MockLeadDataSource extends Mock implements LeadDatasource {}

void main() {
  late MockLeadDataSource leadDataSource;
  late LeadRepository leadRepository;

  setUp(() {
    leadDataSource = MockLeadDataSource();
    leadRepository = LeadRepository(leadDataSource);
  });

  group('LeadRepository', () {
    test('should return list of VMLead when api call is successful', () async {
      final response = {
        'message': {
          'text': 'string',
          'type': 'string',
          'code': 0
        },
        'data': {
          'totalItemsCount': 0,
          'pageSize': 0,
          'totalPagesCount': 0,
          'pageIndex': 0,
          'next': true,
          'previous': true,
          'items': [
            {
              'publicId': '3fa85f64-5717-4562-b3fc-2c963f66afa6',
              'processId': '3fa85f64-5717-4562-b3fc-2c963f66afa6',
              'processName': 'string',
              'processStepId': '3fa85f64-5717-4562-b3fc-2c963f66afa6',
              'processStepName': 'string',
              'processStepOrder': 0,
              'processCategoryName': 'string',
              'processCategoryId': '3fa85f64-5717-4562-b3fc-2c963f66afa6',
              'successStatus': 0,
              'title': 'string',
              'emoji': 'string',
              'probabilityOfSuccess': 0,
              'createdDate': '2025-12-19T15:24:18.310Z',
              'processStepsCount': 0,
              'activitiesCount': 0,
              'activitySuccessCount': 0,
              'employee': {
                'id': 'string',
                'firstName': 'string',
                'lastName': 'string',
                'definitiveName': 'string',
                'gender': 0,
                'userName': 'string',
                'email': 'string',
                'imageUrl': 'string'
              },
              'person': {
                'publicId': '3fa85f64-5717-4562-b3fc-2c963f66afa6',
                'firstName': 'string',
                'lastName': 'string',
                'companyName': 'string',
                'prefixName': 'string',
                'definitiveName': 'string',
                'legalType': {
                  'id': 0,
                  'name': 'string'
                },
                'gender': 0,
                'country': {
                  'id': 0,
                  'name': 'string',
                  'code': 'string'
                },
                'state': {
                  'id': 0,
                  'countryId': 0,
                  'name': 'string'
                },
                'city': {
                  'id': 0,
                  'stateId': 0,
                  'name': 'string'
                },
                'howKnow': {
                  'id': 0,
                  'publicId': '3fa85f64-5717-4562-b3fc-2c963f66afa6',
                  'name': 'string',
                  'description': 'string',
                  'companyId': 0
                },
                'industry': {
                  'id': 0,
                  'name': 'string',
                  'description': 'string'
                },
                'birthdate': '2025-12-19',
                'nationalCode': 'string',
                'address': 'string',
                'zipCode': 'string',
                'imageUrl': 'string',
                'leadsCount': 0,
                'leadsInProgressCount': 0,
                'leadsSuccessfulCount': 0,
                'leadsUnsuccessfulCount': 0,
                'opportunitiesCount': 0,
                'opportunitiesInProgressCount': 0,
                'opportunitiesSuccessfulCount': 0,
                'opportunitiesUnsuccessfulCount': 0,
                'pointsInTheCustomerClub': 0,
                'goodAmountOfMoney': 0,
                'totalPurchaseAmount': 0,
                'accountBalance': 0,
                'lastPurchase': 0,
                'averageLeadSuccessRate': 0,
                'averageOpportunitySuccessRate': 0,
                'contacts': [
                  {
                    'contactValue': 'string',
                    'contactTypeId': 0,
                    'contactTypeName': 'string',
                    'contactTypeTitle': 'string'
                  }
                ],
                'contactCategories': [
                  {
                    'publicId': '3fa85f64-5717-4562-b3fc-2c963f66afa6',
                    'title': 'string',
                    'description': 'string',
                    'color': 0,
                    'icon': {
                      'id': 0,
                      'name': 'string',
                      'imageURL': 'string'
                    }
                  }
                ],
                'personAdditionalFields': [
                  {
                    'publicId': '3fa85f64-5717-4562-b3fc-2c963f66afa6',
                    'title': 'string',
                    'value': 'string',
                    'fieldType': 'string'
                  }
                ]
              },
              'lastOpinion': 'string',
              'tags': [
                {
                  'id': 0,
                  'name': 'string',
                  'description': 'string',
                  'color': 0
                }
              ]
            }
          ]
        },
        'statusCode': 0
      };

      when(() => leadDataSource.getList()).thenAnswer((invocation) async => response);

      final result = await leadRepository.getList();

      expect(result, isA<PaginatedResponse<VMLead>>());
      expect(result?.items.length, 1);
      expect(result?.items.first.title, 'string');
      expect(result?.items.first.successStatus, LeadStatus.inProgress);

      verify(() => leadDataSource.getList()).called(1);
      verifyNoMoreInteractions(leadDataSource);
    });
  });


}
