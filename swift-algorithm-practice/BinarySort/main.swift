//
//  main.swift
//  BinarySort
//
//  Created by lirenqiang on 2017/10/31.
//  Copyright © 2017年 李仁强. All rights reserved.
//

import Foundation

//recursive version
func binarySort<T: Comparable> (_ array: [T], _ key: T, _ range: Range<Int>) -> Int?
{
    print("binary sort")
    if range.lowerBound >= range.upperBound {
        return nil
    } else {
        let mid = range.lowerBound + (range.upperBound - range.lowerBound)/2
        
        if array[mid] > key {
            return binarySort(array, key, 0..<mid)
        } else if array [mid] < key {
            return binarySort(array, key, mid+1..<range.upperBound)
        } else {
            return mid
        }
    }
}

let array = [1, 2, 3, 4, 5, 6]
let index = binarySort(array, 7, 0..<array.count)
print(index)

//linear version
func binarySortLinear <T:  Comparable> (_ array: [T], _ key: T) -> Int?
{
    var lower = 0
    var upper = array.count
    
    while lower < upper {
        let mid = lower + (upper-lower)/2
        if array[mid] == key {
            return mid
        } else if array[mid] > key {
            upper  = mid
        } else {
            lower = mid + 1
        }
    }
    return nil
}
let linearIdx = binarySortLinear(array, 7)
print(linearIdx)

//这里的低坐标要小于高坐标,不然会导致在计算中值(索引)后,用中值去数组中取值时,导致越界问题.
// 计算中间索引的时候,也不能使用 (upper + lower) / 2 这样在处理较大的数组时,可能会导致数据溢出.



































