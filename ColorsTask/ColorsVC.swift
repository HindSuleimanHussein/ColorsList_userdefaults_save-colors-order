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
    
    enum Cells {
        static let colorCell = "ColorCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addColors()
        
    }
    
    func addColors() {
        colors = Colors.allColors
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.colorCell) else {
            return UITableViewCell()
        }
        
        // Configure the cell based on the color object
        let color = colors[indexPath.row]
        cell.textLabel?.text = color.name
        cell.detailTextLabel?.text = color.description
        cell.backgroundColor = color.getUIColor() // Set the background color based on value
    
        
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

