//
//  ViewControllerTareaCompletada..swift
//  demo
//
//  Created by lucas on 29/04/24.
//

import UIKit

class ViewControllerTareaCompletada_: UIViewController {
    
    var anteriorVC = ViewController()
    
    @IBAction func completarTarea(_ sender: Any) {
        anteriorVC.tareas.remove(at: anteriorVC.indexSeleccionado)
        anteriorVC.tableview.reloadData()
        navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var TareaLabel: UILabel!
    
    var tarea = Tarea()
    override func viewDidLoad() {
        super.viewDidLoad()
        if tarea.importante {
            TareaLabel.text = "🥵\(tarea.nombre!)"
        }else{
            TareaLabel.text = tarea.nombre!
        }

        // Do any additional setup after loading the view.
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
