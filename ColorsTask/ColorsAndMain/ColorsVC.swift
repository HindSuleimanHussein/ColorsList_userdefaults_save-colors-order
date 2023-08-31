//  ColorsVC.swift
//  ColorsTask
//
//  Created by Foothill on 13/08/2023.
//

import UIKit

class ColorsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var colors: [Color] = []
    var expandedCellIndex: Int? = nil
    @IBOutlet weak var ViewColor: UIView!
    @IBOutlet weak var colorDescriptionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    enum Cells {
        static let colorCell = "ColorCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addColors()
        
        let nib = UINib(nibName: "ColorTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ColorTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func addColors() {
        colors = Colors.allColors
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "ColorTableViewCell", for: indexPath) as! ColorTableViewCell

        // Configure the cell based on the color object
       /* let color = colors[indexPath.row]
        cell.textLabel?.text = color.name
        cell.detailTextLabel?.text = color.description
        cell.backgroundColor = color.getUIColor() // Set the background color based on value*/
        
        let color = colors[indexPath.row]
        cell.myLabel.text = color.name
        cell.detailTextLabel?.text = color.description
        cell.backgroundColor = color.getUIColor()
        
    
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get the selected color
        let selectedColor = colors[indexPath.row]
        
        // Update ViewColor with the selected color
        ViewColor.backgroundColor = selectedColor.getUIColor()
        
        // Show the description of the selected color
        let description = selectedColor.description
        colorDescriptionLabel.text = description // Update the label's text
        colorDescriptionLabel.textColor = UIColor.black
        
    }
}

