import Foundation

func readArrayOfInts() -> [Int] {
    return readLine()!.components(separatedBy: CharacterSet.whitespaces).map {Int($0)!}
}

func leftRotation(_ array: [Int], by rotation: Int) -> [Int] {
    var result = Array<Int>(repeating: 0, count: array.count)
    let size = array.count
    result[(size - rotation)..<size] = array[0..<rotation]
    result[0..<(size-rotation)] = array[rotation..<size]
    return result
}

assert(leftRotation([1,2,3], by: 1) == [2, 3, 1])
assert(leftRotation([1,2,3], by: 3) == [1, 2, 3])

let rotation = readArrayOfInts()[1]
let numbers = readArrayOfInts()

print(leftRotation(numbers, by: rotation).map {String($0)}.joined(separator: " "))
