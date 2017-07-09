import Foundation

class Queue<T> {
    var firstStack = [T]()
    var secondStack = [T]()
    
    func enqueue(_ element: T) {
        firstStack.append(element)
    }
    
    func dequeue() -> T? {
        transferStack()
        return secondStack.popLast()
    }
    
    func peak() -> T? {
        transferStack()
        return secondStack.last
    }
    
    private func transferStack() {
        if secondStack.isEmpty {
            secondStack.append(contentsOf: firstStack.reversed())
            firstStack.removeAll()
        }
    }
}

enum Operation: Int {
    case enqueue = 1
    case dequeue = 2
    case peak = 3
}

let queue = Queue<Int>()
let q = Int(readLine()!)!
for i in 0..<q {
    let query = readLine()!.components(separatedBy: " ").flatMap { Int($0) }
    guard let operation = Operation(rawValue: query.first!) else { continue }
    switch operation {
    case .enqueue:
        let newElement = query.last!
        queue.enqueue(newElement)
    case .dequeue:
        _ = queue.dequeue()
    case .peak:
        print(queue.peak()!)
    }
}
