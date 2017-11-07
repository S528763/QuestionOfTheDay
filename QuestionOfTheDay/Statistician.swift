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
        let queryBuilder = DataQueryBuilder()
        let numAnswers = dataStoreOpinion.getObjectCount() as! Double
        let ans0per, ans1per, ans2per:Double
        ans0per = 100 * Double(truncating: (dataStoreOpinion?.getObjectCount(queryBuilder?.setWhereClause("answer = 0")))!)/numAnswers
        ans1per = 100 * Double(truncating: (dataStoreOpinion?.getObjectCount(queryBuilder?.setWhereClause("answer = 1")))!)/numAnswers
        ans2per = 100 * Double(truncating: (dataStoreOpinion?.getObjectCount(queryBuilder?.setWhereClause("answer = 2")))!)/numAnswers
        return [ans0per,ans1per,ans2per]
    }
    
    func fetchQuestionOfTheDay() -> String {
        return dataStoreQuestionOfTheDay?.find() as! String
    }
    
    func saveOpinion(_ ans:[String:Int]) {
        
        dataStoreOpinion?.save(ans,
                        response: {
                            (result) -> () in
                            print("Object is saved in Backendless for \(ans). Please check in the console.")
        },
                        error: {
                            (fault : Fault?) -> () in
                            print("Server reported an error: \(String(describing: fault))")
        })
    }
    
    init(){
        dataStoreQuestionOfTheDay = vVC.backendless.data.ofTable("QuestionOfTheDay")
        dataStoreOpinion = vVC.backendless.data.ofTable("Opinion")
    }
}


