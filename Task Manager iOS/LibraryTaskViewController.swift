//
//  LibraryTaskViewController.swift
//  Task Manager iOS
//
//  Created by Gabriela Torres on 11/28/18.
//  Copyright © 2018 Gabriela Torres. All rights reserved.
//

import UIKit

class LibraryTaskViewController: UIViewController {

    @IBOutlet weak var TableView: UITableView!
    
    let library = LibraryTasks.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
