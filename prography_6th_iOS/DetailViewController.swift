//
//  DetailViewController.swift
//  prography_6th_iOS
//
//  Created by Gwang_Ho on 04/03/2020.
//  Copyright © 2020 Gwang-Ho Heo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblRating: UILabel!
    
    var detailTitle: String = ""
    var detailRating: String = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lblTitle.text = detailTitle
        lblRating.text = detailRating
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
