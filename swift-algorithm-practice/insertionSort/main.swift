//
//  main.swift
//  insertionSort
//
//  Created by lirenqiang on 2017/10/30.
//  Copyright © 2017年 李仁强. All rights reserved.
//

import Foundation

let arr = [3, 1, 2, 5, 7]

/// more generic
func insertionSortGeneric <T> (_ array: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
    var a = array
    for x in 1..<a.count {
        var y = x
        let temp = a[y]
        while y > 0 && isOrderedBefore(temp, a[y-1]) {
            a[y] = a[y-1]
            y -= 1
        }
        a[y] = temp
    }
    return a
}

let genericArr = insertionSortGeneric(arr) {
    return $0 > $1
    
}
print(genericArr)


