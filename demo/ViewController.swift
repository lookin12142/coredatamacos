//
//  ViewController.swift
//  CoreData
//
//  Created by lucas on 29/04/24.
//

import UIKit
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBAction func agregartarea(_ sender: Any) {
        performSegue(withIdentifier: "agregarsegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexSeleccionado = indexPath.row
        let tarea = tareas[indexPath.row]
        performSegue(withIdentifier: "tareaSeleccionadaSegue", sender: tarea)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tareas.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let tarea = tareas[indexPath.row]
        if tarea.importante {
            cell.textLabel?.text = "😀\(tarea.nombre!)"
        }
        else{
            cell.textLabel?.text = "💀\(tarea.nombre!)"
        }
        return cell
    }
/*    func crearTareas() -> [Tarea]{
        let tarea1 = Tarea()
        tarea1.nombre = "Estudiar para el examem"
        tarea1.importante = false
        
        let tarea2 = Tarea()
        tarea2.nombre = "   Hacer laboratorios"
        tarea2.importante = true
        
        let tarea3 = Tarea()
        tarea3.nombre = "Estudiar para subir"
        tarea3.importante = false
        
        return [tarea1,tarea2,tarea3]
        
        
        
    }
 */

    @IBOutlet weak var tableview: UITableView!
    
    var tareas:[Tarea] = []
    var indexSeleccionado = 0

  /*  override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        
        tareas = crearTareas()
    }
   */
    func obtenertareas() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            tareas = try context.fetch(Tarea.fetchRequest()) as! [Tarea]
        } catch {
            print("Error al leer las tareas de Core Data: \(error.localizedDescription)")
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        obtenertareas()
        tableview.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
    if(segue.identifier == "tareaSeleccionadaSegue"){
        let siguienteVC = segue.destination as!
        ViewControllerTareaCompletada_
        siguienteVC.tarea = sender as! Tarea
        siguienteVC.anteriorVC = self
        
    }
    }
}

