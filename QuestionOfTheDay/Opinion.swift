//
//  Opinion.swift
//  QuestionOfTheDay
//
//  Created by Srimat Tirumala Pallerlamudi,Aditya on 11/4/17.
//

import Foundation

class Opinion {
    var question:QuestionOfTheDay
    var answer:Int
    var objectId:String?
    
    init(question:QuestionOfTheDay, answer:Int) {
        self.question = question
        self.answer = answer
    }
}
