//
//  Router.swift
//  NotesApp
//
//  Created by Melania Dababi on 9/3/24.
//

import UIKit

protocol TaskRouterInput: AnyObject {
    func openMainScreen()
}

final class TaskRouter: TaskRouterInput {}
