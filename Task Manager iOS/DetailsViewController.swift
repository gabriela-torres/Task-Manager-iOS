//
//  DetailsViewController.swift
//  Task Manager iOS
//
//  Created by Gabriela Torres on 11/30/18.
//  Copyright © 2018 Gabriela Torres. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var TaskTitleLabel: UILabel!
    @IBOutlet weak var DetailsTextView: UITextView!
    
    var name = String()
    var details = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TaskTitleLabel.text = name
        DetailsTextView.text = details
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
