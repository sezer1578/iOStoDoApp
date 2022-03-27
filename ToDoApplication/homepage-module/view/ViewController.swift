//
//  ViewController.swift
//  ToDoApplication
//
//  Created by Sezer Özaltun on 27.03.2022.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var totalTask: UILabel!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var taskTableView: UITableView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    private let floatingButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor(named: "mainColor")
        let image = UIImage(systemName: "plus" , withConfiguration: UIImage.SymbolConfiguration(pointSize: 32,weight: .medium))
        button.tintColor = .white
        button.setImage(image, for: .normal)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.3
        //Corner Radius
        button.layer.cornerRadius = 30
        return button
    }()
    
    var taskList = [Task]()
    
    var homePagePresenter : ViewToPresenterHomePage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showUI()
        view.addSubview(floatingButton)
        floatingButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        //delegate
        searchBar.delegate = self
        taskTableView.delegate = self
        taskTableView.dataSource = self
        
        copyDatabase()
        
        
        
        HomePageRouter.createModue(ref: self)
       
    }
    override func viewWillAppear(_ animated: Bool) {
        //when return homepage, this code runs
        homePagePresenter?.loadAllTask()
        totalTask.text = "Total Task: \(taskList.count)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let task = sender as? Task
            let goToVC = segue.destination as! TaskDetailVC
            goToVC.task = task
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        floatingButton.frame = CGRect(x: view.frame.size.width - 80,
                                      y: view.frame.size.height - 100,
                                      width: 60, height: 60)
    }
    @objc private func didTapButton(){
        print("tıklandı")
        performSegue(withIdentifier: "toAddTask", sender: nil)
    }
    func showUI(){
        
        //TopView UI
        topView.layer.cornerRadius = 100
        topView.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMinYCorner]
        topView.layer.shadowRadius = 10
        topView.layer.shadowOpacity = 1.0
        topView.layer.shadowOffset = CGSize(width: 3, height: 3)
        topView.layer.shadowColor = UIColor(named: "mainColor")?.cgColor
        
        //Bottom View UI
        bottomView.layer.cornerRadius = 50
        bottomView.layer.maskedCorners = [.layerMaxXMinYCorner]
    }
    
    func copyDatabase(){
        let bundlePath = Bundle.main.path(forResource: "task", ofType: ".sqlite")
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyPath = URL(fileURLWithPath: targetPath).appendingPathComponent("task.sqlite")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: copyPath.path) {
            print("Database already exist")
        }else{
            do {
                try fileManager.copyItem(atPath: bundlePath!, toPath: copyPath.path)
            }catch{}
        }
        
        
    }
}
extension ViewController : PresenterToViewHomePage {
    func sendDataToView(taskList: Array<Task>) {
        self.taskList = taskList
        self.taskTableView.reloadData()
    }
}

extension ViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        homePagePresenter?.search(word: searchText)
    }
}
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = taskList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskTableViewCell
        cell.taskTitle.text = "\(task.taskTitle!)"
        cell.taskNote.text = "\(task.taskNote!)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = taskList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: task)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: ""){(contextualAction,view,bool) in
            let task = self.taskList[indexPath.row]
            
            let alert = UIAlertController(title: "Delete", message: "Are you sure delete \(task.taskTitle!) note ?", preferredStyle: .alert)
            self.present(alert,animated: true)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel){action in
        
            }
            alert.addAction(cancelAction)
            
            let yesAction = UIAlertAction(title: "Yes", style: .destructive){action in
                self.homePagePresenter?.delete(taskId: task.taskId!)
                self.totalTask.text = "Total Task: \(self.taskList.count)"
            }
            alert.addAction(yesAction)
        }
        deleteAction.image = UIImage(systemName: "trash")
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
