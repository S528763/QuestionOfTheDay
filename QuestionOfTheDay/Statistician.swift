//
//  Statistician.swift
//  QuestionOfTheDay
//
//  Created by Srimat Tirumala Pallerlamudi,Aditya on 11/4/17.
//

import Foundation

class Statistician {
    
    var dataStoreQuestionOfTheDay:IDataStore!
    var dataStoreOpinion:IDataStore!
    
    let vVC = VoteViewController()
    
    func findPercentage() -> [Double] {
        return [0.0]
    }
    
    func fetchQuestionOfTheDay() -> String {
        print(QuestionOfTheDay().question!)
        return QuestionOfTheDay().question!
    }
    
    func saveOpinion() {
        
    }
    
    init(){
        dataStoreQuestionOfTheDay = vVC.backendless.data.ofTable("QuestionOfTheDay")
        dataStoreOpinion = vVC.backendless.data.ofTable("Opinion")
    }
}


