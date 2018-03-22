//
//  Stack.swift
//  StackFour
//
//  Created by lirenqiang on 21/03/2018.
//  Copyright © 2018 李仁强. All rights reserved.
//

import Foundation

public struct Stack <E> {
    
    fileprivate var array = [E]()
    
    public mutating func push(element: E) {
        array.append(element)
    }
    
    public mutating func pop() -> E? {

        return array.popLast()
    }
    
    public var count: Int {
        return array.count
    }

    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var top: E? {
        return array.last
    }
}

/**
 
 ///stack is empty
 //    public func isEmpty() -> Bool {
 //        return array.isEmpty
 //    }
 
 summarize:
    since `top` can be a var, why `isEmpty` can't be a var?
    it's my fault, I make it as func, it's var in the source code.
 */


