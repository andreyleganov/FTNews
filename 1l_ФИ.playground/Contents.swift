import Foundation

// MARK: - Квадратное уравнение

let a: Float = 3
let b: Float = -14
let c: Float = -5

var d = pow(b, 2) - (4 * a * c)

switch d {
case _ where d >= 0:
    let x1 = (-b + sqrt(d)) / (2 * a)
    let x2 = (-b - sqrt(d)) / (2 * a)
    print("x1 = \(x1), x2 = \(x2)")
case _ where d == 0:
    let x = -b / (2 * a)
    print("x = \(x)")
default:
    print("x = nil")
}

// MARK: - Площадь, периметр и гипотенуза треугольника

let ab: Float = 6
let ac: Float = 6

let s = (ab * ac) / 2
print("Площадь треугольника равна \(s)")

let bc = sqrt(pow(ab,2) + pow(ac, 2))
print("Гипотенуза треугольника равна \(bc)")

let p = ab + ac + bc
print("Периметр треугольника равен \(p)")

// MARK: - Cумма вклада через 5 лет

var invest: Double = 5
let percentByYear: Double = 1
var yearsCount: Int = 5

while yearsCount > 0 {
    invest = invest + (invest * percentByYear)
    yearsCount -= 1
}

print("Cумма вклада через 5 лет будет \(invest)")

