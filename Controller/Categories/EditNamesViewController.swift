//
//  EditNamesViewController.swift
//  romance
//
//  Created by Rita de Cássia Vasconcelos do Nascimento on 16/10/19.
//  Copyright © 2019 Rita de Cássia Vasconcelos do Nascimento. All rights reserved.
//

import UIKit
import CoreData

class EditNamesViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var name1textfield: UITextField!
    @IBOutlet weak var name2textfield: UITextField!
    @IBOutlet weak var name1Label: UILabel!
    @IBOutlet weak var name2Label: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.name1textfield.delegate = self
        self.name2textfield.delegate = self
        
    }
    

    @IBAction func saveNamesButton(_ sender: Any) {
        if (name1textfield.text?.count)! > 0 && (name2textfield.text?.count)! > 0  {
            //name1Label.text = name1textfield.text
            name2Label.text = name2textfield.text
            createData()
            retrieveData()
    }
   
        
}
    func createData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let userEntity = NSEntityDescription.entity(forEntityName: "Users", in: managedContext)!
        
        
        let user = NSManagedObject(entity: userEntity, insertInto: managedContext)
        user.setValue(name1textfield.text, forKey: "name1")
        user.setValue(name2textfield.text, forKey: "name2")
        
        do {
            try managedContext.save()
        }
        catch let error as NSError{
            print("Não deu pra salvar .\(error), \(error.userInfo)")
        }
    }
    
    func retrieveData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        do{
            let result = try managedContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject]{
                name1Label.text = (data.value(forKey: "name1") as! String)
                //print(data.value(forKey: "name1") as! String)
                print(data.value(forKey: "name2") as! String)
                
            }
        }catch {
            print("Falhou")
        }
        
        
    }
    
    func updateData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "name1 = %@", "rita1")
        do{
            let test = try managedContext.fetch(fetchRequest)
            let objectUpdate = test[0] as! NSManagedObject
            
            objectUpdate.setValue("Mateus", forKey: "name1")
            do{
                try managedContext.save()
            }
            catch{
                print(error)
            }
        }
        catch{
            print(error)
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        name1textfield.resignFirstResponder()
        name2textfield.resignFirstResponder()
        
        return true
    }
}
