//
//  ConfirmationViewController.swift
//  Pizza builder
//
//  Created by Dante Solorio on 1/7/16.
//  Copyright © 2016 Dante Solorio. All rights reserved.
//

import UIKit

class ConfirmationViewController: UIViewController{
    
    @IBOutlet weak var nextButton: UIBarButtonItem!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var masaTypeLabel: UILabel!
    @IBOutlet weak var quesoTypeLabel: UILabel!
    @IBOutlet weak var ingredientesLabel: UILabel!
    
    var ingredients: [String] = []
    var quesoType: String!
    var masaType: String!
    var pizzaSize: String!
    
    var lastSelectedIndexPath: NSIndexPath!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Confirmar orden..."
        
        updateOrderLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: General funtions
    
    func updateOrderLabels(){

        let string = ingredients.joinWithSeparator("\u{0085}")
        self.ingredientesLabel.text = string
        
        self.sizeLabel.text = pizzaSize
        self.masaTypeLabel.text = masaType
        self.quesoTypeLabel.text = quesoType
    }
    
    
    // MARK: Actions
    
    @IBAction func nextAction(sender:AnyObject){
        print("Confirm order!")
        self.performSegueWithIdentifier("pizzaSegue", sender: self)
        let alert = UIAlertController(title: "Correcto", message: "Tu pizza ha sido enviada para preparación!", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "pizzaSegue"{
           
            
        }
    }

}
