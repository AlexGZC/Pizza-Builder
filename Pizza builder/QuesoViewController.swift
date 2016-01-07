//
//  QuesoViewController.swift
//  Pizza builder
//
//  Created by Dante Solorio on 1/6/16.
//  Copyright © 2016 Dante Solorio. All rights reserved.
//

import UIKit

class QuesoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    var masaType: String!
    var pizzaSize: String!
    
    let quesoType = ["Mozarela", "Cheddar", "Parmesano", "Sin Queso"]
    
    var lastSelectedIndexPath: NSIndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.enabled = false
        print("Masa type: \(masaType)")
        self.title = masaType
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Table view delegates
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = quesoType[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quesoType.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        nextButton.enabled = true
        if((lastSelectedIndexPath) != nil) {
            
            let lastCell = tableView.cellForRowAtIndexPath(lastSelectedIndexPath)
            lastCell?.accessoryType = .None
        }
        
        let currentCell = tableView.cellForRowAtIndexPath(indexPath)
        currentCell?.accessoryType =  .Checkmark
        
        lastSelectedIndexPath = indexPath;
        
        
        
    }
    
    // MARK: Actions
    
    @IBAction func nextAction(sender:AnyObject){
        self.performSegueWithIdentifier("chooseIngredientes", sender: self)
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "chooseIngredientes"{
            let destinationVC = segue.destinationViewController as! IngredientesViewController
            destinationVC.quesoType = quesoType[lastSelectedIndexPath.row]
            destinationVC.pizzaSize = self.pizzaSize
            destinationVC.masaType = self.masaType
            
        }
    }
    

}
