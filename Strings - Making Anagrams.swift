//https://www.hackerrank.com/challenges/ctci-making-anagrams/problem
import Foundation;

func lettersCount(for string: String) -> [Character: Int] {
    var result = [Character: Int]()
    for letter in string.characters {
        if result.keys.contains(letter) {
            result[letter]! += 1
        } else {
            result[letter] = 1
        }
    }
    return result
}

func calculateDifference(first: [Character: Int], second: [Character: Int]) -> Int {
    return first.reduce(0) { (result, tuple: (key: Character, value: Int)) -> Int in
        if let value2 = second[tuple.key] {
            if tuple.value > value2 {
                return result + tuple.value - value2
            }
        } else {
            return result + tuple.value
        }
        return result
    }
}

let a = readLine()!
let b = readLine()!

var lettersCountForA = lettersCount(for: a)
var lettersCountForB = lettersCount(for: b)

let ans1 = calculateDifference(first: lettersCountForA, second: lettersCountForB)
let ans2 = calculateDifference(first: lettersCountForB, second: lettersCountForA)

print(ans1 + ans2)
