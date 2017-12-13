//
//  main.swift
//  StackTwo
//
//  Created by lirenqiang on 2017/12/12.
//  Copyright © 2017年 李仁强. All rights reserved.
//

import Foundation

var s = Stack<Int>()
print(s.count)
print(s.isEmpty)
print(s.top)
s.push(e: 10)
s.push(e: 11)
s.push(e: 12)
print(s.count)
print(s.isEmpty)
print(s.top)
print(s.pop())
print(s.pop())

print(s.count)
print(s.isEmpty)
print(s.top)

