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
    @IBOutlet weak var editBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addColors()
        loadReorderedColors()
        
        
        let nib = UINib(nibName: "ColorTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ColorTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isEditing = false
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
    
    //Functions that reorder and remove cells
    //Allows reordering of cells
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
            return true
    }

    // Allows cell to be reorders to another place
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = colors[sourceIndexPath.row] // let the item equal to the index that is going to be reordered in colors
        colors.remove(at: sourceIndexPath.row) // the chosen index will be removed
        colors.insert(item, at: destinationIndexPath.row) // and reordered in the destination that the user chose
        
        saveReorderedColors() // save colors after being reordered
    }

    
    //Functions to save the user's reorder
    let userDefaultsKey = "ReorderedColors"

    // Function to save the reordered colors
        func saveReorderedColors() {
            do {
                // Use JSONEncoder to encode the colors array to Data
                let encoder = JSONEncoder()
                let encodedData = try encoder.encode(colors)
                
                // Save the encoded data to UserDefaults
                UserDefaults.standard.set(encodedData, forKey: userDefaultsKey)
            } catch {
                print("Error encoding colors: \(error.localizedDescription)")
            }
        }
    
    // Function to load the reordered colors
        func loadReorderedColors(){
            if let encodedData = UserDefaults.standard.data(forKey: userDefaultsKey){
                do {
                    // Use JSONDecoder to decode the colors array from Data
                    let decoder = JSONDecoder()
                    let decodedColors = try decoder.decode([Color].self, from: encodedData)
                    self.colors = decodedColors
                    tableView.reloadData()
                } catch {
                    print("Error decoding colors: \(error.localizedDescription)")
                }
            }
        }
    
    // removes the delete button that shows by default
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    @IBAction func edit(_ sender: Any) {
        tableView.isEditing = !tableView.isEditing

        switch tableView.isEditing {
        case true:
            editBarButton.title = "Done"
        case false:
            editBarButton.title = "Edit"
        }
    }
 
}

