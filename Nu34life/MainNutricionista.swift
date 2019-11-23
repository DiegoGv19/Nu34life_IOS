
import UIKit
import Alamofire
import SwiftyJSON
var pacientes: [Paciente] = []

var myIndex = 0

class MainNutricionista: UIViewController {
    @IBOutlet weak var TablePaciente: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pacientes = []
        CargarPacientes()
        TablePaciente.delegate = self
        TablePaciente.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    private func CargarPacientes(){
        
        let delegado = UIApplication.shared.delegate as! AppDelegate
        let url = delegado.urlServicio + "/nutritionists/patients/" + IdNutricionista
        
            request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
                .responseJSON(completionHandler: {
                    (data) in
                    switch(data.result){
                    case .success( _):
                        let jsons = try! JSON(data: data.data!)
                        jsons.array?.forEach({ (json) in
                            let pacientenew = Paciente(name:json["name"].stringValue,lastName:json["lastName"].stringValue,id:json["id"].stringValue,email:json["email"].stringValue,password:json["password"].stringValue,birthdate: "")
                            pacientes.append(pacientenew)
    
                        })
                        self.TablePaciente.reloadData()
                    case .failure(let error):
                        print(error)
                    }
                })
    }


}

extension MainNutricionista: UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pacientes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let paciente = pacientes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PacienteCell") as! TablePaciente
        cell.setPaciente(paciente: paciente)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "seguePaciente", sender: self)
    }
}

