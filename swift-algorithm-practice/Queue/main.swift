//
//  main.swift
//  Queue
//
//  Created by lirenqiang on 2017/10/23.
//  Copyright © 2017年 李仁强. All rights reserved.
//

import Foundation

var queue = Queue<Int>()

if let i = queue.deQueue() {
    print(i)
}

queue.enQueue(10)

if let i = queue.deQueue() {
    print(i)
}

queue.enQueue(20)
queue.enQueue(30)

if queue.isEmpty{
    print("queue 为空")
} else {
    print("queue不为空")
}

print(queue.front)
