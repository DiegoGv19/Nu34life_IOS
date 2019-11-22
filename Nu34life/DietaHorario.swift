
import UIKit
var Horas = ["Mañana","MedioDia","Tarde","Lonche","Cena"]
var myHoras = 0

class DietaHorario: UIViewController {

    @IBOutlet weak var TableHoras: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableHoras.delegate = self
        TableHoras.dataSource = self
    }
    

}
	
extension DietaHorario: UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Horas.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let hora = Horas[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellHoras") as! TableViewCellHoras
        cell.setHoras(hora: hora)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myHoras = indexPath.row
        performSegue(withIdentifier: "segueHoras", sender: self)
    }
}

