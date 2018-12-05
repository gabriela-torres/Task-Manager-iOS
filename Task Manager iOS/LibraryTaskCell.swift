//
//  LibraryTaskCell.swift
//  Task Manager iOS
//
//  Created by Gabriela Torres on 11/28/18.
//  Copyright © 2018 Gabriela Torres. All rights reserved.
//

import UIKit

class LibraryTaskCell: UITableViewCell {
    
    @IBOutlet weak var TaskTitleLabel: UILabel!
    @IBOutlet weak var PriorityLabel: UILabel!
    @IBOutlet weak var DueDateLabel: UILabel!
    @IBOutlet weak var CompletionView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(task: Tasks) {
        
        TaskTitleLabel.text = task.taskTitle
        
        //Setting the priority 
        PriorityLabel.text = task.priority.rawValue
        
        switch task.completion {
        case .complete:
            // Hide dueDate
            DueDateLabel.isHidden = true
            //Set view to green
            CompletionView.backgroundColor = .green
            
        case .incomplete(let date):
            //Show due date
            DueDateLabel.isHidden = false
            //Error set red
            CompletionView.backgroundColor = .red
            //Set dueDate to formatted date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            DueDateLabel.text = dateFormatter.string(from: date)
        }
    }
}
