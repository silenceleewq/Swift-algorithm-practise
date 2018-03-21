
//
//  BinarySearchTree.swift
//  BinarySearchTreeTwo
//
//  Created by lirenqiang on 21/12/2017.
//  Copyright © 2017 李仁强. All rights reserved.
//

import Foundation

class BinarySearchTree <T: Comparable> {
    private(set) public var value: T
    private(set) public var parent: BinarySearchTree?
    private(set) public var left: BinarySearchTree?
    private(set) public var right: BinarySearchTree?
    
    public convenience init(array: [T]) {
        precondition(array.count > 0)
        self.init(array.first!)
        for v in array.dropFirst() {
            insert(v)
        }
    }
    
    public init(_ value: T) {
        self.value = value
    }
//    - isRoot BOOL
    public var isRoot: Bool {
        return parent == nil
    }
//    - isLeaf BOOL
    public var isLeaf: Bool {
        return (left == nil) && (right == nil)
    }
//    - isLeftChild BOOL
    public var isLeftChild: Bool {
        return parent?.left === self
    }
//    - isRightChild BOOL
    public var isRightChild: Bool {
        return parent?.right === self
    }
//    - hasLeftChild BOOL
    public var hesLeftChild: Bool {
        return left != nil
    }
//    - hasRightChild BOOL
    public var hasRightChild: Bool {
        return right != nil
    }
//    - hasAnyChild BOOL
    public var hasAnyChild: Bool {
        return (left != nil) || (right != nil)
    }
//    - hasBothChildren BOOL
    public var hasBothChildren: Bool {
        return (left != nil) && (right != nil)
    }
    
    public var count: Int {
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
}

extension BinarySearchTree {
    public func insert(_ value: T) {
        if value < self.value {
            if let left = self.left {
                left.insert(value)
            } else {
                left = BinarySearchTree(value)
                left?.parent = self
            }
        } else {
            if let right = self.right {
                right.insert(value)
            } else {
                right = BinarySearchTree(value)
                right?.parent = self
            }
        }
    }
}

extension BinarySearchTree: CustomStringConvertible {
    
    var description: String {
        var s = ""
        
        if let left = left {
            s += "(\(left.description)) <- "
        }
        
        s += "\(self.value)"
        
        if let right = right {
            s += " -> (\(right.description))"
        }
        
        return s
    }
}

extension BinarySearchTree {
    public func search(_ value: T) -> BinarySearchTree? {
        if value < self.value {
            return self.left?.search(value)
        } else if value > self.value {
            return self.right?.search(value)
        } else {
            return self
        }
    }
    
    public func searchIterator(_ value: T) -> BinarySearchTree? {
        var node: BinarySearchTree? = self
        
        while let n = node {
            if value < n.value {
                node = n.left
            } else if value > n.value {
                node = n.right
            } else {
                return node
            }
        }
        return nil
    }
}

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

extension BinarySearchTree {
    public func map(formula: (T) -> T) -> [T] {
        var a = [T]()
        if let left = left { a += left.map(formula: formula) }
        a.append(formula(value))
        if let right = right { a += right.map(formula: formula) }
        return a
    }
}





















