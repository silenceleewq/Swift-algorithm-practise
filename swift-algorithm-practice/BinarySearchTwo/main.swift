//
//  main.swift
//  BinarySearchTwo
//
//  Created by lirenqiang on 2017/12/13.
//  Copyright © 2017年 李仁强. All rights reserved.
//

import Foundation

/**
 Binary Search
 */

func BinarySearch<T: Comparable> (_ array: [T], _ key: T, _ range: Range<Int>) -> Int? {
    if range.lowerBound >= range.upperBound { return nil }
    
    let mid = range.lowerBound + (range.upperBound - range.lowerBound) / 2
    
    if key > array[mid] {
        return BinarySearch(array, key,mid+1..<range.upperBound)
    } else if key < array[mid] {
        return BinarySearch(array, key, range.lowerBound..<mid)
    } else {
        return mid
    }
}

func BinarySearchIteration<T: Comparable> (_ array: [T],_ key: T, _ range: Range<Int>) -> Int? {
    
    var lower = range.lowerBound
    var upper = range.upperBound
    
    while lower < upper {
        let mid = lower + (upper - lower) / 2
        if key < array[mid] {
            upper = mid
        } else if key > array[mid] {
            lower = mid+1
        } else {
            return mid
        }
    }
    return nil;
}


let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]
//let numbers = [2, 3, 5]
//let index = BinarySearch(numbers, 5, 0..<numbers.count)
let index = BinarySearchIteration(numbers, 5, 0..<numbers.count)
print(index)


