//
//  main.swift
//  BinarySearchTree
//
//  Created by lirenqiang on 2017/10/31.
//  Copyright © 2017年 李仁强. All rights reserved.
//

import Foundation


//MARK: - basic Tree Test
let tree = TreeNode<String>(value: "beverages")

let hotNode = TreeNode<String>(value: "hot")
let coldNode = TreeNode<String>(value: "cold")

let teaNode = TreeNode<String>(value: "tea")
let coffeeNode = TreeNode<String>(value: "coffee")
let chocolateNode = TreeNode<String>(value: "cocoa")

let blackTeaNode = TreeNode<String>(value: "black")
let greenTeaNode = TreeNode<String>(value: "green")
let chaiTeaNode = TreeNode<String>(value: "chai")

let sodaNode = TreeNode<String>(value: "soda")
let milkNode = TreeNode<String>(value: "milk")

let gingerAleNode = TreeNode<String>(value: "ginger ale")
let bitterLemonNode = TreeNode<String>(value: "bitter lemon")

tree.addChild(hotNode)
tree.addChild(coldNode)

hotNode.addChild(teaNode)
hotNode.addChild(coffeeNode)
hotNode.addChild(chocolateNode)

coldNode.addChild(sodaNode)
coldNode.addChild(milkNode)

teaNode.addChild(blackTeaNode)
teaNode.addChild(greenTeaNode)
teaNode.addChild(chaiTeaNode)

sodaNode.addChild(gingerAleNode)
sodaNode.addChild(bitterLemonNode)


//print(tree)

if let n = tree.search("cocoa") {
    
    print(n.value)
}

//MARK: - Binary Tree Search Test  ---  Class Version
let binaryTree = BinarySearchTree(array: [7, 2, 5, 10, 9, 1])

print(binaryTree)
print(binaryTree.search(value: 3))

//MARK: - Test Binary Tree Search Function
print(binaryTree.searchByLoops(value: 5) ?? 0)
print(binaryTree.searchByLoops(value: 2) ?? 0)
print(binaryTree.searchByLoops(value: 7) ?? 0)
print(binaryTree.searchByLoops(value: 6) ?? 0)

// conclusion
/*
 in Swift, that is conveniently done with optional chaining;
 when you write left?.search(value) it automatically returns nil if left is nil. There is no need to explicitly check for this with an if statement.
 */

//binaryTree.traverseInOrder { (value) in
//    print(value)
//}

let ba = binaryTree.toArray()
print(ba)



















