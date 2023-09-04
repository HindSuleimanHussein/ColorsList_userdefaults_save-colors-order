//  ColorsVC.swift
//  ColorsTask
//
//  Created by Foothill on 13/08/2023.
//

import UIKit

class ColorsViewController: UIViewController {
    
    struct Conts{
        struct NIB{
            static let colorTableViewCell = "ColorTableViewCell"
        }
        
        struct userDefaults{
            static let userDefaultsKey = "ReorderedColors"
        }
        
        struct editButtonText{
            static let doneText = "Done"
            static let editText = "Edit"
        }
    }
    
    private var colors: [ColorModel] = []
    @IBOutlet weak var ViewColor: UIView!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var editBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addColors()
        loadReorderedColors()
        colorTableViewCell()
        fixingDescriptionTextView()
    }
    
    func addColors() {
        colors = ColorsStruct.allColors
    }
    
    func colorTableViewCell(){
        let nib = UINib(nibName: Conts.NIB.colorTableViewCell, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Conts.NIB.colorTableViewCell)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isEditing = false
    }
    
    func fixingDescriptionTextView(){
        descriptionTextView.textContainerInset = UIEdgeInsets(top: 0, left: 20.0, bottom: 0, right: 40.0)
    }
    
    func getCurrentColorOrder() -> [String] {
        return colors.map { $0.id }
    }
    
    //Functions to save the user's reorder
     // Function to save the reordered colors
    func saveReorderedColors() {
        do {
            // Use JSONEncoder to encode the current order of color IDs to Data
            let encoder = JSONEncoder()
            let orderedColorIDs = getCurrentColorOrder()
            let encodedData = try encoder.encode(orderedColorIDs)

            // Save the encoded data to UserDefaults
            UserDefaults.standard.set(encodedData, forKey: Conts.userDefaults.userDefaultsKey)
        } catch {
            print("Error encoding color order: \(error.localizedDescription)")
        }
    }

     
     // Function to load the reordered colors
    func loadReorderedColors() {
        if let encodedData = UserDefaults.standard.data(forKey: Conts.userDefaults.userDefaultsKey) {
            do {
                // Use JSONDecoder to decode the ordered color IDs from Data
                let decoder = JSONDecoder()
                let orderedColorIDs = try decoder.decode([String].self, from: encodedData)

                // Reorder the colors based on the loaded order of IDs
                colors.sort { (color1, color2) -> Bool in
                    guard let index1 = orderedColorIDs.firstIndex(of: color1.id),
                          let index2 = orderedColorIDs.firstIndex(of: color2.id) else {
                        return false // Handle missing IDs gracefully
                    }
                    return index1 < index2
                }

                tableView.reloadData()
            } catch {
                print("Error decoding color order: \(error.localizedDescription)")
            }
        }
    }


    
    @IBAction func edit(_ sender: Any) {
        tableView.isEditing = !tableView.isEditing
        
        switch tableView.isEditing {
        case true:
            editBarButton.title = Conts.editButtonText.doneText
        case false:
            editBarButton.title = Conts.editButtonText.editText
        }
        
    }
}


extension ColorsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Conts.NIB.colorTableViewCell, for: indexPath) as! ColorTableViewCell
        
        // Configure the cell based on the color object
        let color = colors[indexPath.row]
        cell.myLabel.text = color.name
        cell.detailTextLabel?.text = color.description
        cell.backgroundColor = UIColor(named: color.colorName)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get the selected color
        let selectedColor = colors[indexPath.row]
        
        // Update ViewColor with the selected color
        ViewColor.backgroundColor = UIColor(named: selectedColor.colorName)
        
        // Show the description of the selected color
        let description = selectedColor.description
        descriptionTextView.text = description // Update the label's text
        
        
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
    
    // removes the delete button that shows by default
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
}

