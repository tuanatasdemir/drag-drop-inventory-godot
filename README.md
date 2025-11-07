# Godot Simya Mini-Oyunu (Alchemy Prototype)

Bu projenin temel amacı, hazır kod blokları veya tutorial'lar olmadan, temel yazılım prensiplerini (OOP, State Machines, Event-Driven Programming) Godot'un node tabanlı yapısına entegre ederek sıfırdan bir oyun döngüsü kurmaktır.

##  Teknik Kazanımlar ve Kullanılan Yapılar

Proje geliştirme sürecinde aşağıdaki teknik konseptler GDScript ve Godot API'si ile uygulanmıştır:

### 1\. Finite State Machine (Sonlu Durum Makinesi)

Simya masasının (Crafting Table) mantığı, `enum` yapıları kullanılarak bir durum makinesi olarak tasarlanmıştır. Bu, masanın hangi malzemeleri aldığını ve ne zaman üretim yapması gerektiğini yönetir.

```gdscript
enum STATE {
    BOS,
    POTION1,
    POTION2
}
```

### 2\. Custom Drag & Drop Sistemi

Godot'un hazır sürükle-bırak fonksiyonları yerine, daha fazla kontrol imkanı sağlayan manuel bir sistem geliştirilmiştir.

  * `_on_input_event`: Tıklama algılama ve sürüklemeyi başlatma.
  * `_unhandled_input`: Global giriş takibi ile nesneyi herhangi bir yere bırakabilme (drop).
  * `Signal` (Sinyaller): Nesneler arası haberleşme.

### 3\. Runtime Object Instantiation (Çalışma Zamanında Nesne Üretimi)

Üretim başarılı olduğunda, hafızadaki bir sahne kalıbından (`PackedScene`) yeni bir nesne türetilerek (`.instantiate()`) oyun dünyasına dinamik olarak eklenmektedir.

### 4\. Node Communication & Groups

Nesnelerin birbirini tanıması için kırılgan (hard-coded) isim kontrolleri yerine, ölçeklenebilir bir yapı olan Godot **Groups** sistemi kullanılmıştır (örn: `"drop_target"` grubu).

### 5\. Asenkron UI Geri Bildirimi

Kullanıcı deneyimini iyileştirmek için `await` ve `Timer` kullanılarak zaman ayarlı UI elementleri (Tutorial yazısı, başarı mesajları) oluşturulmuştur.

