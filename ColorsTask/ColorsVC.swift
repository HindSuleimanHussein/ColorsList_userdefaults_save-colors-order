//  ColorsVC.swift
//  ColorsTask
//
//  Created by Foothill on 13/08/2023.
//

import UIKit

struct Color {
    var value: Int
    var name: String
    var description: String
    var isExpanded: Bool
    
    func getUIColor() -> UIColor {
        let red = CGFloat((value >> 16) & 0xFF) / 255.0
        let green = CGFloat((value >> 8) & 0xFF) / 255.0
        let blue = CGFloat(value & 0xFF) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

class ColorsVC: UIViewController {
    
    var colors: [Color] = []
    var expandedCellIndex: Int? = nil

    
    let red = Color(value: 0xFF0000, name: "Red", description: "The color Red belongs to the color family of warm hues. It is of high brightness and saturation. The color red corresponds to the hex code #FF0000 in the additive color space RGB (red, green, blue). Specifically, it corresponds to 100% red, 0% green, and 0% blue.", isExpanded: false)
    let green = Color(value: 0x00FF00, name: "Green", description: "The color Green belongs to the color family of cool hues. It is of medium brightness and high saturation. The color green corresponds to the hex code #00FF00 in the additive color space RGB (red, green, blue). More precisely, it corresponds to 0% red, 100% green, and 0% blue.", isExpanded: false)
    let blue = Color(value: 0x0000FF, name: "Blue", description: "The color Blue belongs to the color family of cool hues. It is of medium brightness and high saturation. The color blue corresponds to the hex code #0000FF in the additive color space RGB (red, green, blue). To be specific, it corresponds to 0% red, 0% green, and 100% blue", isExpanded: false)
    let purple = Color(value: 0x800080, name: "Purple", description: "The color Purple belongs to the color family of cool hues. It is a medium-dark color with a high level of saturation. Purple corresponds to the hex code #800080 in the additive color space RGB (red, green, blue). Specifically, it consists of 50% red, 0% green, and 50% blue.", isExpanded: false)

    
    
    enum Cells {
        static let colorCell = "ColorCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomColors()
        
        
    }
    
    func addRandomColors() {
        colors.append(red)
        colors.append(green)
        colors.append(blue)
        colors.append(purple)
    }
}

extension ColorsVC: UITableViewDelegate, UITableViewDataSource {
    
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
        
        if indexPath.row == expandedCellIndex {
            // This cell is expanded, set its height to an expanded value
            cell.frame.size.height = 100  // Adjust this value as needed
        } else {
            // This cell is not expanded, set its height to the default value
            cell.frame.size.height = 44  // Default cell height
        }
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Check if this cell is already expanded
        if colors[indexPath.row].isExpanded {
            // If it's expanded, close it
            colors[indexPath.row].isExpanded = false
            expandedCellIndex = nil
        } else {
            // If it's not expanded, close the previously expanded cell (if any)
            if let previouslyExpandedIndex = expandedCellIndex {
                colors[previouslyExpandedIndex].isExpanded = false
            }
            
            // Expand the selected cell
            colors[indexPath.row].isExpanded = true
            expandedCellIndex = indexPath.row
        }
        
        // Reload the selected row and the previously expanded row (if any) with animation
        tableView.reloadRows(at: [indexPath], with: .automatic)
        if let previouslyExpandedIndex = expandedCellIndex, previouslyExpandedIndex != indexPath.row {
            tableView.reloadRows(at: [IndexPath(row: previouslyExpandedIndex, section: 0)], with: .automatic)
        }
    }



    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Adjust the row height based on the expansion state
        if colors[indexPath.row].isExpanded {
            return 100  // Adjust this value as needed
        } else {
            return 44  // Default cell height
        }
    }
}

