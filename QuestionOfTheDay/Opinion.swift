//
//  Opinion.swift
//  QuestionOfTheDay
//
//  Created by Srimat Tirumala Pallerlamudi,Aditya on 11/4/17.
//  Copyright © 2017 Srimat Tirumala Pallerlamudi,Aditya. All rights reserved.

import Foundation

@objcMembers
class Opinion : NSObject {
    var question:QuestionOfTheDay
    var answer:Int
    var objectId:String?
    
    init(question:QuestionOfTheDay, answer:Int) {
        self.question = question
        self.answer = answer
    }
    
//    override init() {
//        super.init()
//    }
}
