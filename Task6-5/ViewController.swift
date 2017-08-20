//
//  ViewController.swift
//  Task6-5
//
//  Created by 🍋 on 16/7/23.
//  Copyright © 2016年 🍋. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var contentTextView: UITextView!

    fileprivate var content:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentTextView.text = content
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setContent(_ str:String) {
        self.content = str
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
