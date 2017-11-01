//
//  BinarySearchTree.swift
//  BinarySearchTree
//
//  Created by lirenqiang on 2017/10/31.
//  Copyright © 2017年 李仁强. All rights reserved.
//

import Cocoa

class BinarySearchTree<T: Comparable> {
    fileprivate(set) public var value: T
    fileprivate(set) public var parent: BinarySearchTree?
    fileprivate(set) public var left: BinarySearchTree?
    fileprivate(set) public var right: BinarySearchTree?
    
    //initial
    public init(value: T) {
        self.value = value
    }
    
    public convenience init (array: [T]) {
        precondition(array.count > 0)
        self.init(value: array.first!)
        for v in array.dropFirst() {
            insert(value: v)
        }
    }
    
    public var isRoot: Bool {
        return parent == nil
    }
    
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    public var isLeftChild: Bool {
        return parent?.left === self
    }
    
    public var isRightChild: Bool {
        return parent?.right === self
    }
    
    public var hasLeftChild: Bool {
        return left != nil
    }
    
    public var hasRightChild: Bool {
        return right != nil
    }
    
    public var hasAnyChild: Bool {
        return hasLeftChild || hasRightChild
    }
    
    public var hasBothChild: Bool {
        return hasLeftChild && hasRightChild
    }
    
    public var count: Int {
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
    
    public func insert(value: T) {
        if value < self.value {
            if let left = left {
                left.insert(value: value)
            } else {
                //这里应该用left,因为走到这一步说明该结点的left并没有子节点
                left = BinarySearchTree(value: value)
                left?.parent = self
            }
        } else {
            if let right = right {
                right.insert(value: value)
            } else {
                //这里应该用right,因为走到这一步说明该结点的right并没有子节点
                right = BinarySearchTree(value: value)
                right?.parent = self
            }
        }
    }
    
    public func search(value: T) -> BinarySearchTree? {
        if value < self.value {
            return left?.search(value: value)
        } else if value > self.value {
            return right?.search(value: value)
        } else {
            return self
        }
    }
    
    public func searchByLoops(value: T) -> BinarySearchTree? {
        var node: BinarySearchTree? = self
        while let n = node {
            if value  < n.value {
                node = n.left
            } else if value > n.value {
                node = n.right
            } else {
                return node
            }
        }
        return nil
    }
    
    public func toArray() -> [T] {
        //当调用某个有返回值的函数时,如果只有一行代码
        //那么该行代码的值会作为返回值直接返回,即便不写return.
        return map { $0 }
    }
    
    
}

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        var s = ""
        if let left = left {
            s += "(\(left.description)) <-"
        }
        s += "\(value)"
        if let right = right {
            s += " -> (\(right.description))"
        }
        return s
    }
}

//MARK: - Traversal
extension BinarySearchTree {
    public func traverseInOrder(process: (T) -> Void) {
        left?.traverseInOrder(process: process)
        process(value)
        right?.traverseInOrder(process: process)
    }
    
    public func traversePreOrder(process: (T) -> Void) {
        process(value)
        left?.traversePreOrder(process: process)
        right?.traversePreOrder(process: process)
    }
    
    public func traversePostOrder(process: (T) -> Void) {
        left?.traversePostOrder(process: process)
        right?.traversePostOrder(process: process)
        process(value)
    }
}

// map() and filter()
extension BinarySearchTree {
    public func map(formula: (T) -> T) -> [T] {
        var a = [T]()
        
        if let left = left { a += left.map(formula: formula)}
        a.append(formula(value))
        if let right = right { a += right.map(formula: formula)}
        return a
    }
}

//MARK: - Deleting items
extension BinarySearchTree {
    
    @discardableResult public func remove() -> BinarySearchTree? {
        let replacement: BinarySearchTree?
        
        //Replacement for current node can be either biggest one on the left
        //smallest one on the right, whichever is not nil
        if let right = right {
            replacement = right.minimum()
        } else if let left = left {
            replacement = left.maximum()
        } else {
            replacement = nil
        }
        //当replacement为nil的时候,那么remove方法就不会再执行了.
        replacement?.remove()
        
        //place the replacement on current node's position
        replacement?.right = right
        replacement?.left = left
        right?.parent = replacement
        left?.parent = replacement
        reconnectParentToNode(node: replacement)
        
        //The current node is no longer part of the tree, so clear it up
        parent = nil
        left = nil
        right = nil
        
        return replacement
    }
    
    private func reconnectParentToNode(node: BinarySearchTree?) {
        if let parent = parent {
            if isLeftChild {
                parent.left = node
            } else {
                parent.right = node
            }
        }
        node?.parent = parent
    }
}

//MARK: - Searching
extension BinarySearchTree {
    
    //mine code
//    func minimum() -> BinarySearchTree {
//        var node: BinarySearchTree? = self
//        while node != nil {
//            node = node?.left
//        }
//        return node!
//    }
    
    //others code
    func minimum() -> BinarySearchTree {
        var node = self
        while let next = node.left {
            node = next
        }
        return node
    }
    
    //mine code
//    func maximum() -> BinarySearchTree {
//        var node: BinarySearchTree? = self
//        while node != nil {
//            node = node?.right
//        }
//        return node!
//    }

    // other code
    func maximum() -> BinarySearchTree {
        var node = self
        while let next = node.left {
            node = next
        }
        return node
    }
}


















