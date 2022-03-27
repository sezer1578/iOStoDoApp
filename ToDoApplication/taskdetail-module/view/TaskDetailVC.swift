//
//  TaskDetailVC.swift
//  ToDoApplication
//
//  Created by Sezer Özaltun on 27.03.2022.
//

import UIKit

class TaskDetailVC: UIViewController {

    @IBOutlet weak var taskNote: UITextField!
    @IBOutlet weak var taskTitle: UITextField!
    @IBOutlet weak var topView: UIView!
    
    private let floatingButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        button.layer.masksToBounds = true
        
        button.backgroundColor = UIColor(named: "mainColor")
        let image = UIImage(systemName: "pencil" , withConfiguration: UIImage.SymbolConfiguration(pointSize: 32,weight: .medium))
        button.tintColor = .white
        button.setImage(image, for: .normal)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.3
        //Corner Radius
        button.layer.cornerRadius = 30
        return button
    }()
    
    var task: Task?
    
    var taskDetailPresenter : ViewToPresenterTaskDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let t = task {
            taskTitle.text = t.taskTitle
            taskNote.text = t.taskNote
            
        }
        showUI()
        view.addSubview(floatingButton)
        floatingButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        TaskDetailRouter.createModule(ref: self)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        floatingButton.frame = CGRect(x: view.frame.size.width - 80,
                                      y: view.frame.size.height - 100,
                                      width: 60, height: 60)
    }
    //update button
    @objc private func didTapButton(){
        if let taskTitle = taskTitle.text, let taskNote = taskNote.text, let t = task {
            taskDetailPresenter?.update(taskId: t.taskId!, taskTitle: taskTitle, taskNote: taskNote)
        }
        navigationController?.popToRootViewController(animated: true)
    }
   
    
    func showUI(){
        
        //TopView UI
        topView.layer.cornerRadius = 100
        topView.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMinYCorner]
        topView.layer.shadowRadius = 10
        topView.layer.shadowOpacity = 1.0
        topView.layer.shadowOffset = CGSize(width: 3, height: 3)
        topView.layer.shadowColor = UIColor(named: "mainColor")?.cgColor
    }
    

}
