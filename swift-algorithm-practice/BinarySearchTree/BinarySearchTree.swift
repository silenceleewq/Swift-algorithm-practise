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
    
    ///left subNode
    fileprivate(set) public var left: BinarySearchTree?
    
    /// right subNode
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

//MARK: - Adding items
extension BinarySearchTree {
    
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
    
    
    /*
     Deletes a node from the tree.
     Returns the node that has replae this removed one (or nil if this was a leaf node)
     */
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
//        if let left = left {
//            replacement = left.maximum()
//        } else if let right = right {
//            replacement = right.minimum()
//        } else {
//            replacement = nil
//        }
        print("remove---self: \(self.value) --- replacement: \(replacement?.value)")
        //当replacement为nil的时候,那么remove方法就不会再执行了.
        replacement?.remove()
        
        //place the replacement on current node's position
        replacement?.right = self.right
        replacement?.left = self.left
        self.right?.parent = replacement
        self.left?.parent = replacement
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
        while let next = node.right {
            node = next
        }
        return node
    }
}

//MARK: - Depth and Height

extension BinarySearchTree {
    //the height of a node is the distance to the lowest leaf.
    public func height() -> Int {
        if isLeaf {
            return 0
        } else {
            return 1 + max(left?.height() ?? 0, right?.height() ?? 0)
        }
    }
    
    //the depth of a node is the distance to the root.
    public func depth() -> Int {
        var node = self
        var edges = 0;
        while let parent = node.parent {
            node = parent
            edges += 1
        }
        return edges
    }
}

//MARK: - Predecessor and successor
extension BinarySearchTree {
    public func predecessor() -> BinarySearchTree <T>? {
        
        if let left = left {
            return left.maximum()
        } else {
            var node = self //因为self是不可修改的,所以需要用一个var修饰的node去引用self
            while let parent = node.parent {
                if parent.value < value { //parent.value <value 这种情况下,node即self是处在right上.
                    return parent
                }
                node = parent //如果程序走到这一步,那么说明该结点是在left位置上,因为left位置的结点值永远小于parent的值
            }
            return nil //如果走到这里,即没有parent,那么它也就不存在什么prodecessor.
        }
    }
    
    public func successor() -> BinarySearchTree<T>? {
        
        if let right = right {
            //如果该node有right subNode那么右子树最小值就是当前结点的successor
            //因为一个结点的右子树所有的结点都比该结点的值大,所以右子树的最小值就是该结点的successor.
            return right.minimum()
            
        } else {
            //同理 predecessor
            var node = self
            while let parent = node.parent {
                if value < parent.value {
                    return parent
                }
                node = parent
            }
            return nil
        }
    }
}

/*Is this binary tree a valid binary search tree?*/
extension BinarySearchTree {
    
    //check whether a tree is a valid binary search tree.
    public func isBST(minValue: T, maxValue: T) -> Bool {
        if value < minValue || value > maxValue {return false}
        let leftBST = left?.isBST(minValue: minValue, maxValue: value) ?? true
        let rightBST = right?.isBST(minValue: value, maxValue: maxValue) ?? true
        return leftBST && rightBST
    }
    
}














