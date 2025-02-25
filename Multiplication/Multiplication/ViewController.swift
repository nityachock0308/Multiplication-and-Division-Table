//
//  ViewController.swift
//  Multiplication
//
//  Created by Chockalingam, Nitya on 08/10/2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Number of rows in each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    // Number of sections in the table view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    
    var userGuess = -1 // User's input value
    
    // Configures each cell of the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let aCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        var content = UIListContentConfiguration.cell()
        
        // Section 0: Multiplication
        if indexPath.section == 0 {
            content.text =  "\(userGuess) x \(indexPath.row+1) =  \(userGuess * (indexPath.row+1))"

    
            aCell.contentConfiguration = content
            
        }
        else { // Section 1: Division
            
            let rowText = Double(userGuess) / Double(indexPath.row+1)
            let formatted = String(format: "%.4f", rowText)
            
            content.text = "\(userGuess) / \(indexPath.row) = \(formatted)"
    
            aCell.contentConfiguration = content
            
        }
        
                
        return aCell
    }
    
    
    @IBOutlet weak var EnterField: UITextField!
    @IBOutlet weak var Table: UITableView!
    
    // Action for the "Go" button
    @IBAction func GoButton(_ sender: Any) {
        userGuess = Int(EnterField.text!) ?? 0 // Get user input, default to 0 if conversion fails
        Table.reloadData()
        Table.isHidden = false
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Table.isHidden = true // Hide table initially
        // Do any additional setup after loading the view.
    }


}

