//
//  NewTaskViewController.swift
//  Task Manager iOS
//
//  Created by Gabriela Torres on 11/28/18.
//  Copyright © 2018 Gabriela Torres. All rights reserved.
//

import UIKit

class NewTaskViewController: UIViewController {

    @IBOutlet weak var TitleTextField: UITextField!
    @IBOutlet weak var PrioritySegmentedControl: UISegmentedControl!
    @IBOutlet weak var TaskDetails: UITextView!
    
    
    @IBAction func SaveButtonTapped(_ sender: Any) {
        guard
            let title = TitleTextField.text, !title.isEmpty,
            let details = TaskDetails.text, !details.isEmpty
            else {
                //Error message will pop up if the user doesn't fill in all sections
                let errorAlert = UIAlertController(title: "Error", message: "Please fill in all section.", preferredStyle: .alert)
                let errorAction = UIAlertAction(title: "OKay", style: UIAlertAction.Style.default)
                errorAlert.addAction(errorAction)
                self.present(errorAlert, animated: true, completion: nil)
                return
        }
        saveTask()
    }
    
    //Shows options for priority
    let segments: [(title: String, priority: Tasks.Priority)] =
        [("Yes", .priority),
         ("No", .notPriority)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        
        PrioritySegmentedControl.removeAllSegments()
        
        for (index, segment) in segments.enumerated() {
            PrioritySegmentedControl.insertSegment(withTitle: segment.title, at: index, animated: false)
        }
        
        PrioritySegmentedControl.selectedSegmentIndex = 0;
        
    }
    
    
    func saveTask() {
        guard let title = TitleTextField.text else { return
            
        }
        guard let details = TaskDetails.text else { return
            
        }
        let priority = segments[PrioritySegmentedControl.selectedSegmentIndex].priority
        
        let task = Tasks(taskTitle: title, details: details, priority: priority)
        
        
        LibraryTasks.sharedInstance.task.append(task)
        self.navigationController?.popViewController(animated: true)
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
