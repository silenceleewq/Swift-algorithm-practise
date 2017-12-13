//
//  main.swift
//  SortTwo
//
//  Created by lirenqiang on 2017/12/12.
//  Copyright © 2017年 李仁强. All rights reserved.
//

import Foundation

func InsertionSort(array: [Int]) -> [Int] {
    var a = array
    
    for i in 1..<a.count {
        let temp = a[i]
        var y = i
        while y > 0 && temp < a[y-1] {
            a[y] = a[y-1]
            y -= 1
        }
        a[y] = temp
    }
    return a
}

func InsertionSortGeneric <T>(_ array: [T], _ isOrderd: (T, T)->Bool) -> [T] {
    var a = array
    
    for i in 1..<a.count {
        let temp = a[i]
        var y = i
        while y > 0 && isOrderd(temp, a[y-1]) {
            a[y] = a[y-1]
            y -= 1
        }
        a[y] = temp
    }
    
    return a
}

let arr = [10, 5, 2, 1, 8, 9]

let sorted = InsertionSortGeneric(arr, <)
print(sorted)



