//
//  TodoDetailViewController.swift
//  ToDoDemo
//
//  Created by Alex Jiang on 6/4/18.
//  Copyright © 2018 Junliang Jiang. All rights reserved.
//

import RxSwift
import UIKit


class TodoDetailViewController: UITableViewController {
    fileprivate let todoSubject = PublishSubject<TodoItem>()
    var todo: Observable<TodoItem> {
        return todoSubject.asObserver()
    }
    var todoItem: TodoItem = TodoItem()

    @IBOutlet weak var todoName: UITextField!
    @IBOutlet weak var isFinished: UISwitch!
    @IBOutlet weak var doneBarBtn: UIBarButtonItem!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        todoName.text = todoItem.name
        isFinished.isOn = todoItem.isFinished

        todoName.becomeFirstResponder()
    }
    
    @IBAction func cancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func done() {
        todoItem.name = todoName.text ?? ""
        todoItem.isFinished = isFinished.isOn
        todoSubject.onNext(todoItem)
        todoSubject.onCompleted()
        
        dismiss(animated: true, completion: nil)
    }
}

extension TodoDetailViewController {
    override func tableView(_ tableView: UITableView,
                            willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}

extension TodoDetailViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let oldText = textField.text! as NSString
        let newText = oldText.replacingCharacters(in: range, with: string) as NSString
        
        doneBarBtn.isEnabled = newText.length > 0
        
        return true
    }
}
