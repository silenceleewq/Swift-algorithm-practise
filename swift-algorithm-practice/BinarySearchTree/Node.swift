//
//  Node.swift
//  BinarySearchTree
//
//  Created by lirenqiang on 2017/10/31.
//  Copyright © 2017年 李仁强. All rights reserved.
//

import Cocoa

public class TreeNode <T> {
    
    public var value: T //value 这个变量有在init方法中初始化.
    
    public weak var parent: TreeNode?
    public var children = [TreeNode<T>]()
    public init (value: T) {
        self.value = value
    }
    
    public func addChild(_ node: TreeNode<T>) {
        children.append(node)
        node.parent = self
    }
    
}

extension TreeNode: CustomStringConvertible {
    //这里用了一个递归的写法
    //description内部嵌套description
    public var description: String {
        var s = "\(value)"
        if !children.isEmpty {
            s += "{"+children.map {$0.description}.joined(separator: ",") + "}"
        }
        return s
    }
}

extension TreeNode where T: Equatable {
    func search(_ value: T) -> TreeNode? {
        if value == self.value {
            return self
        }
        for child in children {
            if let found = child.search(value) {
                return found
            }
        }
        return nil
    }
}















