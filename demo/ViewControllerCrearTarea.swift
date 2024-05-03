//
//  ViewControllerCrearTarea.swift
//  demo
//
//  Created by lucas on 29/04/24.
//

import UIKit

class ViewControllerCrearTarea: UIViewController {

    var anteriorVC = ViewController()
    
    @IBOutlet weak var swictimportante: UISwitch!
    @IBOutlet weak var txtNombreTaREA: UITextField!
    
    @IBAction func agregar(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let tarea = Tarea(context: context)
        tarea.nombre = txtNombreTaREA.text!
        tarea.importante = swictimportante.isOn
        
        do {
            try context.save() // Guardar los cambios en Core Data
            navigationController?.popViewController(animated: true)
        } catch {
            print("Error al guardar la tarea: \(error.localizedDescription)")
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

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
