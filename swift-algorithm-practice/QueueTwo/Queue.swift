//
//  Queue.swift
//  QueueTwo
//
//  Created by lirenqiang on 2017/12/12.
//  Copyright © 2017年 李仁强. All rights reserved.
//

import Foundation

/**
 variety: isEmpty, count, front
 
 Func: enqueue, dequeue
 */

struct Queue<T> {
    
    fileprivate var array = [T]()
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    var front: T? { 
        return array.first
    }
    
    public mutating func enqueue(e: T) {
        array.append(e)
    }
    
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
}

























