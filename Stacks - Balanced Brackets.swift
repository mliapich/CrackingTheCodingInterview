import Foundation

let leftBrackets = NSOrderedSet(array: ["{","[", "("].map { Character($0) })
let rightBrackets = NSOrderedSet(array: ["}", "]", ")"].map { Character($0) })
let n = Int(readLine()!)!

func isBalanced(_ brackets: String) -> Bool {
    var stack = [Character]()
    for bracket in brackets.characters {
        if leftBrackets.contains(bracket) {
            stack.append(bracket)
        } else {
            guard let lastBracket = stack.popLast() else { return false }
            if leftBrackets.index(of: lastBracket) != rightBrackets.index(of: bracket) {
                return false
            }
        }
    }
    return stack.isEmpty
}

for i in 0..<n {
    let brackets = readLine()!
    isBalanced(brackets) ? print("YES") : print("NO")
}
