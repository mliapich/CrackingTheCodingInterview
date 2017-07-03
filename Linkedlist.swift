
import Foundation

class Node<T: Equatable> {
    var next: Node?
    let data: T
    
    init(data: T) {
        self.data = data
    }
}

class LinkedList<T: Equatable>: Sequence {
    var head: Node<T>?
    
    func append(data: T) {
        guard let _ = head else {
            head = Node(data: data)
            return
        }
        tail()?.next = Node(data: data)
    }
    
    func prepend(data: T) {
        let newHead = Node(data: data)
        newHead.next = head
        head = newHead
    }
    
    func deleteNode(with value: T) {
        guard var current = head else { return }
        if current.data == value {
            head = current.next
            return
        }
        while let next = current.next {
            if next.data == value {
                current.next = next.next
                return
            }
            current = next
        }
    }
    
    func makeIterator() -> LinkedListIterator<T> {
        return LinkedListIterator<T>(head)
    }
    
    private func tail() -> Node<T>? {
        var current = head
        for node in self {
            current = node
        }
        return current
    }
}

class LinkedListIterator<T: Equatable>: IteratorProtocol {
    var currentNode: Node<T>?
    
    init(_ node: Node<T>?) {
        currentNode = node
    }
    
    func next() -> Node<T>? {
        let next = currentNode
        currentNode = currentNode?.next
        return next
    }
}
