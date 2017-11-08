//
//  VoteViewController.swift
//  QuestionOfTheDay
//
//  Created by Srimat Tirumala Pallerlamudi,Aditya on 11/4/17.
//  Copyright © 2017 Srimat Tirumala Pallerlamudi,Aditya. All rights reserved.

import UIKit

class VoteViewController: UIViewController {
    
    var qotd:QuestionOfTheDay!
    
    @IBOutlet weak var qotdLBL: UILabel!
    
    @IBOutlet weak var option0LBL: UILabel!
    @IBOutlet weak var option1LBL: UILabel!
    @IBOutlet weak var option2LBL: UILabel!
    
    @IBAction func option0BTN(_ sender: Any) {
        let op0:Opinion = Opinion(answer: 0)
        statistician.saveOpinion(op0)
    }
    
    @IBAction func option1BTN(_ sender: Any) {
        let op1:Opinion = Opinion(answer: 1)
        statistician.saveOpinion(op1)
    }
    
    @IBAction func option2BTN(_ sender: Any) {
        let op2:Opinion = Opinion(answer: 2)
        statistician.saveOpinion(op2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

//        let giveQotd = QuestionOfTheDay(question: "Who is the Prime minister of the Australia?", answer0: "Malcom Turnbull", answer1: "Tony Abbott", answer2: "Julia Gillard")
//        statistician.dataStoreQuestionOfTheDay?.save(giveQotd)

        qotdLBL?.text = statistician.fetchQuestionOfTheDay().question
        option0LBL?.text = statistician.fetchQuestionOfTheDay().answer0
        option1LBL?.text = statistician.fetchQuestionOfTheDay().answer1
        option2LBL?.text = statistician.fetchQuestionOfTheDay().answer2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        qotd = statistician.fetchQuestionOfTheDay()
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
