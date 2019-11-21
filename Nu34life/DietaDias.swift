
import UIKit

var Dias = ["Lunes","Martes","Miercoles","Jueves","Viernes","Sabado","Dimingo"]
var myDia = 0

class DietaDias: UIViewController {
    @IBOutlet weak var TableDias: UITableView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableDias.delegate = self
        TableDias.dataSource = self
    }
    


}

extension DietaDias: UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Dias.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let dia = Dias[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDias") as! TableViewCellHorarios
        cell.setDias(dia: dia)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myDia = indexPath.row
        performSegue(withIdentifier: "segueDias", sender: self)
    }
}

