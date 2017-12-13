//
//  Stack.swift
//  StackTwo
//
//  Created by lirenqiang on 2017/12/12.
//  Copyright © 2017年 李仁强. All rights reserved.
//

import Foundation

/**
 variety: isEmpty, count, top
 Func: push, pop,
 */
public struct Stack <T> {
    fileprivate var array = [T]()
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    public mutating func push(e: T) {
        array.append(e)
    }
    
    public mutating func pop() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.remove(at: count-1)
        }
    }
    
    var top: T? {
        return array.last
    }
    
}


