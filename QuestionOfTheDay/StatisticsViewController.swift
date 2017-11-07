//
//  StatisticsViewController.swift
//  QuestionOfTheDay
//
//  Created by Aditya S T P on 11/4/17.
//

import UIKit

class StatisticsViewController: UIViewController {

    @IBOutlet weak var qotdStLBL: UILabel!
    @IBOutlet weak var option0StLBL: UILabel!
    @IBOutlet weak var option1StLBL: UILabel!
    @IBOutlet weak var option2StLBL: UILabel!
    
    @IBOutlet weak var option0perLBL: UILabel!
    @IBOutlet weak var option1perLBL: UILabel!
    @IBOutlet weak var option2perLBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        option0perLBL.text = String(format: "%.1f %%", Statistician().findPercentage()[0])
        option1perLBL.text = String(format: "%.1f %%", Statistician().findPercentage()[1])
        option2perLBL.text = String(format: "%.1f %%", Statistician().findPercentage()[2])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
