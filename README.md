# **FT_PRİNTF**

## **PROJENİN AMACI**

ft_printf, C programlama dilinde formatlı metin ve değişkenleri yazdırmak için kullanılan bir fonksiyondur. Standart printf fonksiyonuna benzer şekilde çalışır, ancak kendi kütüphanenizde yeniden yazmanız gereken bir fonksiyondur.

Bu projeyi yaparken variadic fonksiyon ile va_list, va_start, va_arg ve va_end makroları öğrenmeniz ve projede kullanmanız gerekmektedir.

Fonksiyonunuzu yazarken yapmanız gereken dönüşümler hakkında kısa açıklamalar:

+ %c tek bir karakter yazdırır.
+ %s bir karakter dizisi yazdırır.
+ %p Void * pointer argümanını hexadecimal biçiminde yazdırır.
+ %d 10 tabanında decimal sayı yazdırır.
+ %i 10 tabanında integer yazdırır.
+ %u 10 tabanında işaretsiz decimal sayı yazdırır.
+ %x hexadecimal sayıyı (16 tabanında) küçük harfler ile yazdırır.
+ %X hexadecimal sayıyı (16 tabanında) büyük harfler ile yazdırır.
+ %% yüzde işareti yazdırır.

## **KAZANIMLAR**

### **Variadic Functions Nedir?**
Variadic fonksiyonlar, C programlamasında bir değişken sayıda bağımsız değişken alan işlevlerdir. Bu tür işlevler, programın esnekliğini artırır. Bir sabit bağımsız değişken alır ve ardından isteğe bağlı olarak birçok bağımsız değişken geçilebilir. Variadic fonksiyon en az bir sabit değişken içerir ve ardından son parametre olarak üç nokta (…) kullanılır. Genel sözdizimi şu şekildedir:

int function_name(data_type variable_name, ...);

**Variadic Functions Nasıl Tanımlanır?**
C dilinde bir variadic function, argüman listesinin sonunda ‘...’ kullanılarak tanımlanır. Ayrıca, bu fonksiyonlar stdarg.h başlık dosyasını kullanarak va_list, va_start, va_arg ve va_end makrolarını içerir.

**Variadic fonksiyonların avantajları:**

+	Kod tekrarını azaltır: Farklı sayıda argümanla aynı işlemi gerçekleştirmek için birden fazla fonksiyon yazmak yerine tek bir variadic fonksiyon kullanılabilir.
+	Kodu daha esnek hale getirir: Variadic fonksiyonlar, farklı sayıda argümanla çalışabilme özelliği sayesinde kodun daha esnek hale getirilmesini sağlar.
+	Daha okunabilir kod sağlar: Variadic fonksiyonlar, kodun daha okunabilir ve anlaşılır olmasını sağlayabilir.

**Variadic fonksiyonların dezavantajları:**
+	Daha karmaşık kod: Variadic fonksiyonlar, standart fonksiyonlara kıyasla daha karmaşık olabilir ve anlaşılması zor olabilir.
+	Performans sorunu: Bazı durumlarda, variadic fonksiyonlar standart fonksiyonlara kıyasla daha yavaş olabilir.

Variadic fonksiyonlar, birçok programlama dilinde güçlü bir araçtır. Bu araçları doğru şekilde kullanarak kodunuzu daha esnek, okunabilir ve tekrarlanabilir hale getirebilirsiniz.

Not: Variadic fonksiyonları kullanırken, fonksiyonun nasıl çalıştığını ve argümanların nasıl işlendiğini anladığınızdan emin olun. Ayrıca, variadic fonksiyonların bazı durumlarda performans sorunlarına yol açabileceğini unutmayın.

### **va_list türü, va_start, va_arg, ve va_end Makroları**

Variadic fonksiyonlarda geçilen argümanların değerlerine, stdarg.h başlık dosyası içinde tanımlanan makrolar aracılığıyla erişebilirsiniz.

**va_list türü:** variadic function argümanlarını tutan bir türdür. Bu tür, argümanların işlenmesi için kullanılır. ( va_list args; )

**va_start makrosu:** va_list değişkenini başlatır. Bu makro, variadic function'ın sabit argümanından sonraki ilk argümanı işaret eder. va_start kullanılırken, va_list değişkeni ve sabit argümanın adı belirtilir. ( va_start(args, format); )

**va_arg makrosu:** va_list içindeki bir sonraki argümanı belirtilen türde alır. Her çağrıldığında, sıradaki argümanı döndürür ve iç göstergede bir sonraki argümana geçer.
( int num = va_arg(args, int); )

**va_copy makrosu:** Bu, variadic işlev argümanlarının bir kopyasını oluşturur.
va_copy(va_list dest, va_list src);

**va_end makrosu:** va_list değişkenini sonlandırır. Bu makro, variadic function'ın argüman listesinin sonlandığını belirtir ve va_list değişkenini temizler. ( va_end(args); )

Örnek variadic fonksiyonları:

Toplama işlemi yapan AddNumbers fonksiyonu:
```c
#include <stdarg.h>
#include <stdio.h>
int AddNumbers(int n, ...) {
    int Sum = 0;
    va_list ptr;
    va_start(ptr, n);
    for (int i = 0; i < n; i++)
        Sum += va_arg(ptr, int);
    va_end(ptr);
    return Sum;
}
int main() {
    printf("1 + 2 = %d\n", AddNumbers(2, 1, 2));
    printf("3 + 4 + 5 = %d\n", AddNumbers(3, 3, 4, 5));
    printf("6 + 7 + 8 + 9 = %d\n", AddNumbers(4, 6, 7, 8, 9));
    return 0;
}
```
Çıktı:
- 1 + 2 = 3
- 3 + 4 + 5 = 12
- 6 + 7 + 8 + 9 = 30

En büyük sayıyı bulan LargestNumber fonksiyonu:
```c
#include <stdarg.h>
#include <stdio.h>
int LargestNumber(int n, ...) {
    va_list ptr;
    va_start(ptr, n);
    int max = va_arg(ptr, int);
    for (int i = 0; i < n - 1; i++) {
        int temp = va_arg(ptr, int);
        max = temp > max ? temp : max;
    }
    va_end(ptr);
    return max;
}
int main() {
    printf("%d\n", LargestNumber(2, 1, 2));
    printf("%d\n", LargestNumber(3, 3, 4, 5));
    printf("%d\n", LargestNumber(4, 6, 7, 8, 9));
    return 0;
}
```

Çıktı:
- 2
- 5
- 9

### **Return (int)**

Printf fonksiyonda return değer olarak integer bir sayı değeri döner. Bu yazdırılacak karakter sayısına eşitir. Hata durumunda -1 döner.

### **Recursive fonksiyon**

Recursive fonksiyonlar, kendi kendini çağıran fonksiyonlardır. Bu tür fonksiyonlar, bir problemi daha küçük alt problemlere ayırarak çözer ve genellikle bir veya daha fazla temel durum (base case) içerir. Temel durum, recursive çağrıları durdurmak için kullanılan koşuldur.

Recursive fonksiyonlar, özellikle doğal olarak kendini tekrarlayan problemlerde kullanışlıdır. Örneğin, faktöriyel hesaplama, Fibonacci dizisi, ve çeşitli algoritmalar gibi.

Basit Bir Örnek: Faktöriyel Fonksiyonu (Recursive):

Faktöriyel hesaplaması, bir sayının faktöriyelini hesaplamak için yaygın olarak kullanılan bir recursive örnektir. n! (n faktöriyel), n'den 1'e kadar olan tüm pozitif tam sayıların çarpımıdır. Örneğin, 5! = 5 * 4 * 3 * 2 * 1.
```c
#include <stdio.h>
int factorial(int n) {
    if (n == 0) { // Base case: 0! = 1
        return 1;
    } else { // Recursive case: n! = n * (n-1)!
        return n * factorial(n - 1);
    }
}
int main() {
    int num = 5;
    printf("Factorial of %d is %d\n", num, factorial(num));
    return 0;
}
```
