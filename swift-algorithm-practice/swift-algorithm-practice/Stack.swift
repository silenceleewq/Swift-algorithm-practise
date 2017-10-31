//
//  Stack.swift
//  swift-algorithm-practice
//
//  Created by lirenqiang on 2017/9/26.
//  Copyright © 2017年 李仁强. All rights reserved.
//

public struct Stack<T> {
    fileprivate var container = [T]()
    
    public var count: Int {
        return container.count
    }
    
    public var isEmpty: Bool {
        return container.isEmpty
    }
    
    public mutating func push(_ e: T) {
        container.append(e)
    }
    
    public mutating func pop() -> T? {
        if isEmpty {
            return nil
        } else {
            return container.popLast()
        }
    }
    
    public var top: T? {
        return container.last
    }
}

extension Stack: Sequence {
    public func makeIterator() -> AnyIterator<T> {
        var curr = self
        return AnyIterator {
            return curr.pop()
        }
    }
}


