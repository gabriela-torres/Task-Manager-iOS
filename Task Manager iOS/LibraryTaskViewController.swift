//
//  LibraryTaskViewController.swift
//  Task Manager iOS
//
//  Created by Gabriela Torres on 11/28/18.
//  Copyright © 2018 Gabriela Torres. All rights reserved.
//

import UIKit
import DZNEmptyDataSet

class LibraryTaskViewController: UIViewController {

    @IBOutlet weak var TableView: UITableView!
    
    
    let library = LibraryTasks.sharedInstance
    
    
    override func  viewDidLoad() {
        super.viewDidLoad()
        
        
        self.TableView.emptyDataSetSource = self;
        self.TableView.emptyDataSetDelegate = self;
        
        TableView.tableFooterView = UIView()
        
        TableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        TableView.reloadData()
    }
    //Moving the task information from library screen to DetailsViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowTaskInfo" {
            
            let indexPath = self.TableView!.indexPathsForSelectedRows!.first!
            let task = library.task[indexPath.row]
            let vc = segue.destination as! DetailsViewController
            vc.details = task.details
            vc.name = task.taskTitle
            
        }
    }
    
    
}

//Creates table view
extension LibraryTaskViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return library.task.count
    }
    
    //Creating a new cell based on info added
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! LibraryTaskCell
        
        let task = library.task[indexPath.row]
        cell.setup(task: task)
        
        return cell
    }
    
    //Marking task as incomplete
    func incomplete(at indexPath: IndexPath) {
        let task = self.library.task[indexPath.row]
        
        let calendar = Calendar(identifier: .gregorian)
        let dueDate = calendar.date(byAdding: .day, value: 7, to: Date())!
        
        task.completion = .incomplete(dueDate: dueDate)
        (TableView.cellForRow(at: indexPath) as! LibraryTaskCell).setup(task: task)
    }
    
    //Marking task as complete
    func complete(at indexPath: IndexPath) {
        let task = self.library.task[indexPath.row]
        task.completion = .complete
        (TableView.cellForRow(at: indexPath) as! LibraryTaskCell).setup(task: task)
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //Deleting Tasks
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
            LibraryTasks.sharedInstance.task.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
        }
        
        let task = library.task[indexPath.row]
        
        //Can swipe left on a cell to mark it as completed/incomplete or delete it
        switch task.completion {
        case .complete:
            let markIncompleteAction = UITableViewRowAction(style: .normal, title: "Incomplete?") { _, indexPath in
                
                self.incomplete(at: indexPath)
                
            }
            
            return [deleteAction, markIncompleteAction]
            
        case .incomplete:
            let markCompleteAction = UITableViewRowAction(style: .normal, title: "Complete?") { _, indexPath in
                self.complete(at: indexPath)
            }
            
            return [deleteAction, markCompleteAction]
            
        }
    }
}

//Shows a special screen when there are no cells
extension LibraryTaskViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    
    func title(forEmptyDataSet scrollView: UIScrollView?) -> NSAttributedString? {
        let text = "You have no tasks."
        
        let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18.0), NSAttributedString.Key.foregroundColor: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha:1.0)]
        
        return NSAttributedString(string: text, attributes: attributes)
    }
    func description(forEmptyDataSet scrollView: UIScrollView?) -> NSAttributedString? {
        let text = "Add some tasks."
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineBreakMode = .byWordWrapping
        paragraph.alignment = .center
        
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14.0), NSAttributedString.Key.foregroundColor: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha:1.0), NSAttributedString.Key.paragraphStyle: paragraph]
        
        return NSAttributedString(string: text, attributes: attributes)
    }
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView?, for state: UIControl.State) -> NSAttributedString? {
        let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17.0)]
        
        return NSAttributedString(string: "Add Tasks", attributes: attributes)
    }
    
//    func backgroundColor(forEmptyDataSet scrollView: UIScrollView?) -> UIColor? {
//        return UIColor(red: 146/255, green: 245/255, blue: 255/255, alpha:1.0)
//    }
    
    //Sends user to add a task when the button on empty library is pressed
    func emptyDataSet(_ scrollView: UIScrollView!, didTap button: UIButton!) {
        performSegue(withIdentifier: "taskToCreate", sender: self)
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
