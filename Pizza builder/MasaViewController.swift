//
//  MasaViewController.swift
//  Pizza builder
//
//  Created by Dante Solorio on 1/6/16.
//  Copyright © 2016 Dante Solorio. All rights reserved.
//

import UIKit

class MasaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: UIBarButtonItem!
    var pizzaSize: String!
    
    let masaType = ["Delgada", "Crujiente", "Gruesa"]
    var lastSelectedIndexPath: NSIndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.enabled = false
        print("Pizza size \(pizzaSize)")
        self.title = pizzaSize
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
        
        cell.textLabel?.text = masaType[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return masaType.count
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
        self.performSegueWithIdentifier("chooseQueso", sender: self)
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "chooseQueso"{
            let destinationVC = segue.destinationViewController as! QuesoViewController
            destinationVC.masaType = masaType[lastSelectedIndexPath.row]
            destinationVC.pizzaSize = self.pizzaSize
        }
    }
    

}
