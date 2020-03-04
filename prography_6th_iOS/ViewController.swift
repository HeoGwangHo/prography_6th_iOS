//
//  ViewController.swift
//  prography_6th_iOS
//
//  Created by Gwang_Ho on 03/03/2020.
//  Copyright © 2020 Gwang-Ho Heo. All rights reserved.
//

import UIKit

class viewController: UIViewController {
    @IBOutlet var tfkeyWord: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tableViewController = segue.destination as! TableViewController
        if segue.identifier == "btnNext" {
            tableViewController.keyWord = tfkeyWord.text!
        }
    }
    
}
