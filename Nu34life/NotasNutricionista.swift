//
//  NotasNutricionista.swift
//  Nu34life
//
//  Created by Diego Guevara on 11/18/19.
//  Copyright © 2019 Diego Guevara. All rights reserved.
//

import UIKit
import CoreData
	
let appDelegate = UIApplication.shared.delegate as? AppDelegate
	
class NotasNutricionista: UIViewController {
    @IBOutlet weak var tv: UITableView!

    var taskArray = [Task]()
    
    let cellid = "CellId"

   
    override func viewDidLoad() {
        super.viewDidLoad()
        callDelegates()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchdata()
        tv.reloadData()
    }
    
    func fetchdata(){
        fetchData{
            (done) in
            if done{
                if taskArray.count > 0{
                    tv.isHidden = false
                }else{
                    tv.isHidden = true
                }
            }
        }
    }
    func callDelegates(){
        tv.delegate = self
        tv.dataSource = self
        tv.isHidden = true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension NotasNutricionista: UITableViewDataSource,UITableViewDelegate{
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return taskArray.count
}
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as! TableViewCell
    let task = taskArray[indexPath.row]
    cell.txtDescripcion.text = task.taskDescription
    return cell
    
    }
    private func tableView(_ tableView: UITableView, editingStyleForRowsAt indexPath: IndexPath)-> [UITableViewCell.EditingStyle]?{
        return .none
        
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath)-> [UITableViewRowAction]?{
        let deleteActio = UITableViewRowAction(style: .destructive,title: "Delete"){
            (action,indexPath) in self.deleteData(indexPath: indexPath)
            self.fetchdata()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        return	[deleteActio]
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath)-> Bool{
    return true
    }
    
    
}

extension NotasNutricionista{
    func fetchData(completion: (_ finished:Bool)->() ){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
        do{
            taskArray = try managedContext.fetch(request) as! [Task]
            print("Data fetched, no issues")
            completion(true)

        }catch{
            print("Unable to fetch data: ",error)
            completion(false)
        }
    }
    
    func deleteData(indexPath: IndexPath){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return
        }
        managedContext.delete(taskArray[indexPath.row])
        
        do{
            try managedContext.save()
            print("Data Deleted")
            
        }catch{
            print("Failed to deleted data: ",error.localizedDescription)
            
        }
    }
}
	


