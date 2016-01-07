//
//  IngredientesViewController.swift
//  Pizza builder
//
//  Created by Dante Solorio on 1/7/16.
//  Copyright © 2016 Dante Solorio. All rights reserved.
//

import UIKit

class IngredientesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    
    var quesoType: String!
    var masaType: String!
    var pizzaSize: String!
    
    let ingredients = ["Jamón", "Pepperoni", "Pavo", "Salchicha", "Aceituna", "Cebolla", "Pimiento", "Piña", "Anchoa"]
    var ingredientsSelected: [String] = []
    
    var lastSelectedIndexPath: NSIndexPath!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.enabled = false
        print("Queso type: \(quesoType)")
        self.title = quesoType
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
        
        cell.textLabel?.text = ingredients[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        nextButton.enabled = true
        /*
        if((lastSelectedIndexPath) != nil) {
            
            let lastCell = tableView.cellForRowAtIndexPath(lastSelectedIndexPath)
            lastCell?.accessoryType = .None
        }
        
        let currentCell = tableView.cellForRowAtIndexPath(indexPath)
        currentCell?.accessoryType =  .Checkmark
        
        lastSelectedIndexPath = indexPath;
        */
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.accessoryType = .Checkmark
        let actualIngredient = (cell?.textLabel?.text)! as String
        //print("Actual: \(actualIngredient)")
        
        if ingredientsSelected.count > 0{
            if ingredientsSelected.count < 5{
                if ingredientsSelected.contains(actualIngredient){
                    //print("igual")
                    if ingredientsSelected.contains(actualIngredient){
                        let indexOf = ingredientsSelected.indexOf(actualIngredient)
                        ingredientsSelected.removeAtIndex(indexOf!)
                    }
                    cell?.accessoryType = .None
                }else{
                    ingredientsSelected.append(actualIngredient)
                }
            }else{
                //print("More than 5")
                if ingredientsSelected.contains(actualIngredient){
                    let indexOf = ingredientsSelected.indexOf(actualIngredient)
                    ingredientsSelected.removeAtIndex(indexOf!)
                }
                cell?.accessoryType = .None
            }
        }else{
            ingredientsSelected.append(actualIngredient)
        }
        //print("Tienes \(ingredientsSelected.count)")
        //print("Tus ingredientes \(ingredientsSelected)")
        
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {

    }
    
    // MARK: Actions
    
    @IBAction func nextAction(sender:AnyObject){
        self.performSegueWithIdentifier("confirmationSegue", sender: self)
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "confirmationSegue"{
            let destinationVC = segue.destinationViewController as! ConfirmationViewController
            destinationVC.ingredients = ingredientsSelected
            destinationVC.masaType = self.masaType
            destinationVC.quesoType = self.quesoType
            destinationVC.pizzaSize = self.pizzaSize
        }
    }
}
