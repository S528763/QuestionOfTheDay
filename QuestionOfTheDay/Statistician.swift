//
//  Statistician.swift
//  QuestionOfTheDay
//
//  Created by Srimat Tirumala Pallerlamudi,Aditya on 11/4/17.
//

import Foundation



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
        dataStoreQuestionOfTheDay.find({results in print(results)}, error: {
            (fault : Fault?) -> () in
            print("Server reported an error: \(String(describing: fault))")
            })
        return (dataStoreQuestionOfTheDay?.find() as! [QuestionOfTheDay])[0]
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
    
   
}


