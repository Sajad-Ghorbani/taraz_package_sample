# 📦 taraz_package_sample

این ریپازیتوری یک **پکیج نمونه (Reference Package)** برای پروژه ERP ماژولار «تراز» است و به‌عنوان الگوی رسمی تیم فرانت‌اند برای توسعه feature packageها استفاده می‌شود.

هدف این پکیج، نمایش یک ساختار **واقعی، تست‌پذیر و قابل استفاده در پروژه آنلاین API‑Driven** با Flutter + GetX است؛

---

## 🎯 هدف اصلی

* داشتن یک الگوی واحد برای ساخت feature packageها
* مشخص بودن جای هر مسئولیت (Model / DataSource / Repository / Controller)
* تست‌پذیری Repositoryها با mock
* سادگی (No Over Engineering)
* سازگار با GetX + getIt

---

## 🧱 ساختار پروژه

```
lib/
 ├─ src/
 │   ├─ core/
 │   │   ├─ enums/
 │   │   ├─ helpers/
 │   │   ├─ models/
 │   │   └─ routes/
 │   │       ├─ lead_navigation.dart
 │   │       └─ lead_routes.dart
 │   │
 │   ├─ data/
 │   │   ├─ data_sources/
 │   │   │   ├─ lead_data_source.dart
 │   │   │   └─ lead_data_source_impl.dart
 │   │   │
 │   │   ├─ models/
 │   │   │   └─ lead_model.dart
 │   │   │
 │   │   └─ repositories/
 │   │       └─ lead_repository.dart
 │   │
 │   ├─ presentation/
 │   │   ├─ bindings/
 │   │   ├─ dialogs/
 │   │   ├─ lead/
 │   │   ├─ leads/
 │   │   │   ├─ controllers/
 │   │   │   └─ leads_screen.dart
 │   │   └─ widgets/
 │   │
 │   ├─ screens.dart
 │   └─ injection_container.dart
 │
 ├─ taraz_package_sample.dart
 └─ test/
```

---

## 🧩 توضیح لایه‌ها

### 🔹 core/

شامل موارد **مشترک و قابل استفاده مجدد** در کل پکیج:

* `enums/` : enumهای عمومی
* `helpers/` : helperها و utilityها
* `models/` : مدل‌های گلوبال مثل Pagination
* `routes/` : تعریف route و navigation مربوط به feature

> هر چیزی که وابسته به feature خاص نیست، در core قرار می‌گیرد.

---

### 🔹 data/

لایه ارتباط با دیتا (API):

#### data_sources/

* تعریف contract درخواست‌ها به سرور
* شامل interface و implementation

```dart
abstract class LeadDataSource {
  Future<dynamic> getLeads();
}
```

Implementation:

```dart
class LeadDataSourceImpl implements LeadDataSource {
  final Dio dio;

  LeadDataSourceImpl(this.dio);

  @override
  Future<dynamic> getLeads() async {
    final response =  await  _dio.get(Api.getLeads);
    return response.data;
  }
}
```

---

#### models/

* DTOهای ساده
* بدون logic
* دارای `fromJson` / `toJson` / `copyWith`

---

#### repositories/

* دریافت داده ها و تبدیل به مدل خروجی در این لایه انجام می‌شود
* لایه‌ای که تست می‌شود
* نمایش دیالوگ و یا اسنک بار در این لایه انجام می‌شود

```dart
class LeadRepository {
  final LeadDatasource _leadDatasource;

  LeadRepository(this._leadDatasource);

  Future<PaginatedResponse<VMLead>?> getList() async {
    final response = await _leadDatasource.getList();
    final apiResult = BaseResponse.fromJson(response);
    AppUtils.checkMessage(message: apiResult.message ?? ResponseMessage());
    return PaginatedResponse.fromJson(apiResult.data, (json) => VMLead.fromJson(json));
  }

  Future<BaseResponse?> create(VMLead body) async {
    final response = await _leadDatasource.create(body.toJson());
    final apiResult = BaseResponse.fromJson(response);
    AppUtils.checkMessage(message: apiResult.message ?? ResponseMessage());
    return apiResult;
  }
}
```

---

### 🔹 presentation/

شامل UI و state management با GetX:

* `controllers/` : GetX Controllerها
* `screens/` : صفحات
* `bindings/` : اتصال DI به GetX
* `dialogs/` و `widgets/` : اجزای UI

Controller نمونه:

```dart
class LeadsController extends GetxController {
  final LeadRepository repository;

  LeadsController(this.repository);
}
```

---

## 🧪 تست‌نویسی

در این معماری:

✅ فقط **Repositoryها تست می‌شوند**

چرا؟

* DataSource فقط API call است
* Controller فقط state UI است
* Repository contract دیتا را تضمین می‌کند

### ابزار تست

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  mocktail:
```

### مثال تست Repository

```
test/src/data/repositories/lead_repository_test.dart
```

سناریوها:

* success response
* error from datasource

---

## 📦 Pagination (مدل گلوبال)

تمام APIهای لیستی در بک‌اند تراز دارای pagination هستند.

مدل مشترک:

```dart
class PaginatedResponse<T> {
  final int totalItemsCount;
  final int pageSize;
  final int totalPagesCount;
  final int pageIndex;
  final bool next;
  final bool previous;
  final List<T> items;

  const PaginatedResponse({
    required this.totalItemsCount,
    required this.pageSize,
    required this.totalPagesCount,
    required this.pageIndex,
    required this.next,
    required this.previous,
    required this.items,
  });

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return PaginatedResponse<T>(
      totalItemsCount: json['totalItemsCount'] ?? 0,
      pageSize: json['pageSize'] ?? 0,
      totalPagesCount: json['totalPagesCount'] ?? 0,
      pageIndex: json['pageIndex'] ?? 0,
      next: json['next'] ?? false,
      previous: json['previous'] ?? false,
      items: (json['items'] as List<dynamic>? ?? [])
          .map((e) => fromJsonT(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson(
    Map<String, dynamic> Function(T) toJsonT,
  ) {
    return {
      'totalItemsCount': totalItemsCount,
      'pageSize': pageSize,
      'totalPagesCount': totalPagesCount,
      'pageIndex': pageIndex,
      'next': next,
      'previous': previous,
      'items': items.map(toJsonT).toList(),
    };
  }

  PaginatedResponse<T> copyWith({
    int? totalItemsCount,
    int? pageSize,
    int? totalPagesCount,
    int? pageIndex,
    bool? next,
    bool? previous,
    List<T>? items,
  }) {
    return PaginatedResponse<T>(
      totalItemsCount: totalItemsCount ?? this.totalItemsCount,
      pageSize: pageSize ?? this.pageSize,
      totalPagesCount: totalPagesCount ?? this.totalPagesCount,
      pageIndex: pageIndex ?? this.pageIndex,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      items: items ?? this.items,
    );
  }
}
```

---

## 💉 Dependency Injection

DI در فایل زیر انجام می‌شود:

```
lib/src/injection_container.dart
```

* getIt برای ساخت objectها
* Bindings برای اتصال به GetX
* تست‌ها بدون getIt نوشته می‌شوند

---

## ✅ قوانین تحویل Feature

هر feature جدید باید:

✔️ از همین ساختار پیروی کند
✔️ Repository داشته باشد
✔️ تست Repository داشته باشد
✔️ DataSource interface + impl داشته باشد
✔️ از مدل Pagination مشترک استفاده کند

---

## 🧠 جمع‌بندی

این پکیج نمونه:

* الگوی رسمی تیم فرانت تراز است
* برای پروژه آنلاین API‑Driven طراحی شده
* تست‌پذیر، ساده و قابل توسعه است

> اگر feature شما نیاز به business logic پیچیده داشت، آن feature **استثناء** محسوب می‌شود، نه قاعده.
