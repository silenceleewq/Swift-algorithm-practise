//
//  Stack.swift
//  swift-algorithm-practice
//
//  Created by lirenqiang on 2017/9/26.
//  Copyright © 2017年 李仁强. All rights reserved.
//

public struct Stack<T> {
    fileprivate var container = [T]()
    
    public func count() -> Int {
        return container.count
    }
    
    public func isEmpty() -> Bool {
        return container.isEmpty
    }
    
    public mutating func push(_ e: T) {
        container.append(e)
    }
    
    public mutating func pop() -> T? {
        return container.popLast()
    }
    
    public func top() -> T? {
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


