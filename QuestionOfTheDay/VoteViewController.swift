//
//  VoteViewController.swift
//  QuestionOfTheDay
//
//  Created by Srimat Tirumala Pallerlamudi,Aditya on 11/4/17.
//  Copyright © 2017 Srimat Tirumala Pallerlamudi,Aditya. All rights reserved.

import UIKit

class VoteViewController: UIViewController {
    let statistician = Statistician()
    
   
    
    @IBOutlet weak var qotdLBL: UILabel!
    
    @IBOutlet weak var option0LBL: UILabel!
    @IBOutlet weak var option1LBL: UILabel!
    @IBOutlet weak var option2LBL: UILabel!
    
    @IBAction func option0BTN(_ sender: Any) {
      //  qotdLBL.text = Statistician().fetchQuestionOfTheDay()
        statistician.saveOpinion(["answer":0])
    }
    
    @IBAction func option1BTN(_ sender: Any) {
        statistician.saveOpinion(["answer":1])
    }
    
    @IBAction func option2BTN(_ sender: Any) {
        statistician.saveOpinion(["answer":2])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("mayday")
        let qotd = QuestionOfTheDay(question: "Who is the Prime minister of the Australia?", answer0: "Malcom Turnbull", answer1: "Derko Hyuvosky", answer2: "Garrell Maertfo")
        statistician.dataStoreQuestionOfTheDay?.save(qotd,
                                       response: {
                                        (result) -> () in
                                        print("Object is saved in Backendless. Please check in the console.")
        },
                                       error: {
                                        (fault : Fault?) -> () in
                                        print("Server reported an error: \(String(describing: fault))")
        })
        let results = statistician.fetchQuestionOfTheDay()
        print(results)
        //qotdLBL.text = statistician.dataStoreQuestionOfTheDay?.find() as! [QuestionOfTheDay]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    func findQotdAsync() -> QuestionOfTheDay {
//
//        let queryBuilder = DataQueryBuilder()
//        queryBuilder!.setWhereClause("question LIKE '%\("what")%'")
//        let so = Statistician()
//        let qotd = so.dataStoreQuestionOfTheDay.find(queryBuilder)
//        return qotd
//
//
//
//    }
    
    
}
