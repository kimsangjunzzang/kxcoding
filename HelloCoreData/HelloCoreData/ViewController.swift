//
//  ViewController.swift
//  HelloCoreData
//
//  Created by 김상준 on 8/14/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var context: NSManagedObjectContext {
        guard let app = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        return app.persistentContainer.viewContext
    }
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var ageField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func createEntity(_ sender: Any) {
        guard let name = nameField.text else { return }
        guard let val = ageField.text, let age = Int(val) else { return }
        
        let newEntity = NSEntityDescription.insertNewObject(forEntityName: "Person", into: context)
        newEntity.setValue(name, forKey: "name")
        newEntity.setValue(age, forKey: "age")
        
        if context.hasChanges {
            do {
                try context.save()
                print("Saved")
                
                nameField.text = ""
                ageField.text = ""
            } catch {
                print(error)
            }
            
        }
        
    }
    @IBAction func readEntity(_ sender: Any) {
        
    }
    
    @IBAction func updateEntity(_ sender: Any) {
        
    }
    @IBAction func deleteEntity(_ sender: Any) {
        
    }
}

