//
//  main.swift
//  swift-algorithm-practice
//
//  Created by lirenqiang on 2017/9/26.
//  Copyright © 2017年 李仁强. All rights reserved.
//

import Foundation

var s :Stack = Stack<Int>();

//s.push(10)
//s.push(20)
//s.push(30)
//
//print(s.isEmpty())
//s.makeIterator()


var arr = [1, 2, 3, 4, 5]
//let arrIterator = AnyIterator{return arr.count > 0 ? arr.remove(at: arr.count-1) : nil}
//print(arrIterator)
//for i in arrIterator {
//    print(i)
//}
//print(arr)
//for i in arrIterator {
//    print(i)
//}

var curr = arr
let curr2 = arr
var str = "1w"

withUnsafePointer(to: &arr) { (p) in
    print(p)
    print(type(of: p))
}

withUnsafePointer(to: &curr) {(p) in
    print(p)
    print(type(of: p))
}
