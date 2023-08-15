
import Foundation

/*:
 ## Упражнение - приведение типов и их контроль

 Создайте коллекцию типа [Any], включающую несколько вещественных чисел, целых, строк и булевых значений.  Распечатайте содержимое коллекции.
 */

let otherArray: [Any] = [true, 10.0, 22, "Some String"]

/*:
 Пройдите по всем элементам коллекции.  Для каждого целого, напечайте "Целое число " и его значение.  Повторите то же самое для вещественных чисел, строк и булевых значений.
 */
for element in otherArray {
    if element is Bool {
        print("\(element) - булево значение")
    } else if element is Int {
        print("\(element) - целое число")
    } else if element is String {
        print("\(element) - строка")
    } else if element is Double {
        print("\(element) - значение добл")
    } else {
        print("значение не установлено")
    }
}

/*:
 Создайте словарь [String : Any], где все значения — это смесь вещественных и целых чисел, строк и булевых значений.  Выведите крассиво на консоль пары ключ/значения для всех элементов коллекции.
 */

let someDictinary: [String: Any] = ["1": 34, "2": false, "3": true, "4": 12.4, "5": "6", "7": "102"]
someDictinary.forEach { (key: String, value: Any) in
    print("ключ - \(key), значение - \(value)")
}

/*:
 Создайте переменную `total` типа `Double`, равную 0.  Переберите все значения словаря, и добавьте значение каждого целого и вещественного числа к значению вашей переменной.  Для каждой строки добавьте 1.  Для каждого булева значения, добавьте 2, в случае, если значение равно `true`, либо вычтите 3, если оно `false`.  Напечатайте значение `total`.
 */
var total: Double = 0
someDictinary.forEach { (_: String, value: Any) in
    switch value {
    case let someInt as Int:
        total += Double(someInt)
    case let someDouble as Double:
        total += someDouble
    case let someString as String:
        total += 1
    case let trueDouble as Bool where trueDouble == true:
        total += 2
    case let falseDouble as Bool where falseDouble == false:
        total -= 3
    default:
        break
    }
}

print(total)

/*:
 Обнулите переменную `total` и снова пройдите по всей коллекции, прибавляя к ней все целые и вещественные числа.  Для каждой строки, встретившейся на пути, попробуйте сконвертировать её в число, и добавьте это значение к общему.  Игнорируйте булевы значения.  Распечатайте итог.
 */

total = 0.0
print(total)
for (_, value) in someDictinary {
    switch value {
    case let someInt as Int:
        total += Double(someInt)
    case let someDouble as Double:
        total += someDouble
    case let someString as String:
        if let value = Double(someString) {
            total += value
        }
        continue
    default:
        break
    }
}

print(total)
