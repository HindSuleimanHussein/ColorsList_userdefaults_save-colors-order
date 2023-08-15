//  ColorsVC.swift
//  ColorsTask
//
//  Created by Foothill on 13/08/2023.
//

import UIKit

class ColorsVC: UIViewController {
    
    var colors: [UIColor] = []
    var expandedIndexPath: IndexPath?  // To keep track of the expanded cell
    
    enum Cells {
        static let colorCell = "ColorCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRandomColors()
    }
    
    func addRandomColors() {
        for _ in 0..<50 {
            colors.append(.random())
        }
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
        cell.backgroundColor = colors[indexPath.row]
        
        if let expandedIndexPath = expandedIndexPath, expandedIndexPath == indexPath {
            // Handle expanded state
            // You can customize the cell to show additional content here
        } else {
            // Handle collapsed state
            // Reset the cell to its default state
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if expandedIndexPath == indexPath {
            expandedIndexPath = nil  // Collapse the selected cell
        } else {
            expandedIndexPath = indexPath  // Expand the selected cell
        }
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let expandedIndexPath = expandedIndexPath, expandedIndexPath == indexPath {
            // Return the height for the expanded state
            return 100  // Adjust this value as needed
        } else {
            // Return the height for the collapsed state
            return 44  // Default cell height
        }
    }
}


