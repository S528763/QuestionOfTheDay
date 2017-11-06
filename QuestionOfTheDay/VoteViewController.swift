//
//  VoteViewController.swift
//  QuestionOfTheDay
//
//  Created by Srimat Tirumala Pallerlamudi,Aditya on 11/4/17.
//  Copyright © 2017 Srimat Tirumala Pallerlamudi,Aditya. All rights reserved.

import UIKit

class VoteViewController: UIViewController {
    
    let APPLICATION_ID = "32A3AC4A-394B-2170-FF91-2FDD735AE700"
    let API_KEY = "1E19DC14-C691-0C4B-FFF8-4898EB54BF00"
    let SERVER_URL = "https://api.backendless.com"
    let backendless = Backendless.sharedInstance()!
    
    
    @IBOutlet weak var qotdLBL: UILabel!
    
    @IBOutlet weak var option0LBL: UILabel!
    @IBOutlet weak var option1LBL: UILabel!
    @IBOutlet weak var option2LBL: UILabel!
    
    @IBAction func option0BTN(_ sender: Any) {
        qotdLBL.text = Statistician().fetchQuestionOfTheDay()
    }
    
    @IBAction func option1BTN(_ sender: Any) {
    }
    
    @IBAction func option2BTN(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        backendless.hostURL = SERVER_URL
        backendless.initApp(APPLICATION_ID, apiKey: API_KEY)

        //        dataStoreOpinion = backendless.data.ofTable("Opinion")
        
        // Saving test object in the test table
        let testObject = ["question" : "Hello2"];
        //  let testo = "question"
        let dataStore = backendless.data.ofTable("TestTable")
        
       // qotdLBL.text = "\(findQotdAsync())"
        qotdLBL.text = Statistician.init().dataStoreQuestionOfTheDay as? String
        
       
        
        dataStore?.save(testObject,
                        response: {
                            (result) -> () in
                            print("Object is saved in Backendless. Please check in the console.")
        },
                        error: {
                            (fault : Fault?) -> () in
                            print("Server reported an error: \(String(describing: fault))")
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    func findQotdAsync() -> String {
//
//
//    }
    
    
}
