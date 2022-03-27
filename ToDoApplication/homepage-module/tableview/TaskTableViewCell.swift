//
//  TaskTableViewCell.swift
//  ToDoApplication
//
//  Created by Sezer Özaltun on 27.03.2022.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var taskNote: UILabel!
    @IBOutlet weak var taskTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
