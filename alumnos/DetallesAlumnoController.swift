//
//  DetallesAlumnoController.swift
//  alumnos
//
//  Created by Alumno on 9/27/22.
//  Copyright © 2022 Alumno. All rights reserved.
//

import UIKit

class DetallesAlumnoController : UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var lblEdad: UILabel!
    @IBOutlet weak var lblMatricula: UILabel!
    @IBOutlet weak var lblCarrera: UILabel!
    
    var alumno : Alumno?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if alumno != nil {
            self.title = alumno!.nombre
            lblMatricula.text = alumno!.matricula
            lblEdad.text = "\(alumno!.edad)"
            lblCarrera.text = alumno!.carrera
            
            
        } else {
            self.title = "Detalles de Alumno"
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        47
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        alumno!.materias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaMateria") as? CeldaMateriaController
        celda?.lblMateria.text = alumno!.materias[indexPath.row].nombre
        celda?.lblCodigo.text = alumno!.materias[indexPath.row].codigo
        return celda!
    }
    
    
}
