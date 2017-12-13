//
//  main.swift
//  QueueTwo
//
//  Created by lirenqiang on 2017/12/12.
//  Copyright © 2017年 李仁强. All rights reserved.
//

import Foundation

var q = Queue<Int>()
print(q.count) //0
print(q.isEmpty) //true
print(q.front) //nil

q.enqueue(e: 10)
q.enqueue(e: 11)
q.enqueue(e: 12)

print(q.count) //3
print(q.isEmpty) //false
print(q.front) //10

print(q.dequeue()) //10
print(q.dequeue()) //11

print(q.count) //1
print(q.isEmpty) // false
print(q.front) //12


