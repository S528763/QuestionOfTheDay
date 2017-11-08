//
//  Statistician.swift
//  QuestionOfTheDay
//
//  Created by Srimat Tirumala Pallerlamudi,Aditya on 11/4/17.
//

import Foundation

let statistician = Statistician()

class Statistician {
    
    let APPLICATION_ID = "32A3AC4A-394B-2170-FF91-2FDD735AE700"
    let API_KEY = "1E19DC14-C691-0C4B-FFF8-4898EB54BF00"
    let SERVER_URL = "https://api.backendless.com"
    let backendless = Backendless.sharedInstance()!
    var dataStoreQuestionOfTheDay:IDataStore!
    var dataStoreOpinion:IDataStore!
    
    init(){
        backendless.hostURL = SERVER_URL
        backendless.initApp(APPLICATION_ID, apiKey: API_KEY)
        dataStoreQuestionOfTheDay = backendless.data.of(QuestionOfTheDay.ofClass())
        dataStoreOpinion = backendless.data.of(Opinion.ofClass())
    }
    
    func findPercentage() -> [Double] {
        let queryBuilder = DataQueryBuilder()
        let numAnswers = dataStoreOpinion.getObjectCount() as! Double
        let ans0per, ans1per, ans2per:Double
        ans0per = 100 * Double(truncating: (dataStoreOpinion?.getObjectCount(queryBuilder?.setWhereClause("answer = 0")))!)/numAnswers
        ans1per = 100 * Double(truncating: (dataStoreOpinion?.getObjectCount(queryBuilder?.setWhereClause("answer = 1")))!)/numAnswers
        ans2per = 100 * Double(truncating: (dataStoreOpinion?.getObjectCount(queryBuilder?.setWhereClause("answer = 2")))!)/numAnswers
        return [ans0per,ans1per,ans2per]
    }
    
    func fetchQuestionOfTheDay() -> QuestionOfTheDay {
        let qotdDetails = statistician.dataStoreQuestionOfTheDay.find(byId: "3409DDC8-E602-D346-FFA4-81C1D1DE6B00") as! QuestionOfTheDay
        return qotdDetails
    }
    
    func saveOpinion(_ opinion: Opinion) {
        dataStoreOpinion?.save(opinion) as! Opinion
    }
    
    
}


