//
//  QueueSimple.swift
//  Queue
//
//  Created by lirenqiang on 2017/10/23.
//  Copyright © 2017年 李仁强. All rights reserved.
//

public struct Queue<T> {
    fileprivate var array = [T]()
    
    public var count: Int {
        return array.count
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public mutating func enQueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func deQueue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    public var front: T? {
        return array.first
        
    }
}
