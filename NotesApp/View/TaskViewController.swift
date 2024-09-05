//
//  ViewController.swift
//  NotesApp
//
//  Created by Melania Dababi on 9/2/24.
//

import UIKit

protocol TaskViewOutput: AnyObject {
    func selectCreateTask()
}

protocol TaskViewInput: AnyObject {
    var output: TaskViewOutput { get }
}

final class TaskMainViewController: UIViewController, TaskViewInput {
    var output: TaskViewOutput?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

