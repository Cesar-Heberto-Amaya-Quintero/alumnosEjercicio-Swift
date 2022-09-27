//
//  AlumnosController.swift
//  alumnos
//
//  Created by Alumno on 9/22/22.
//  Copyright © 2022 Alumno. All rights reserved.
//

import UIKit

class AlumnosController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tvAlumno: UITableView!
    
     var alumnos: [Alumno] = []
     var materias1: [Materia] = []
     var materias2: [Materia] = []
     var materias3: [Materia] = []
    
    //Establecer la altura de la celda
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 71
    }
    
    //Numero de secciones de mi tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Numero de filas por sección
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alumnos.count
    }
    
    //Construye cada celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaAlumno") as? CeldaAlumnoController
        celda?.lblNombre.text = alumnos[indexPath.row].nombre
        celda?.lblMatricula.text = alumnos[indexPath.row].matricula
        celda?.lblCarrera.text = alumnos[indexPath.row].carrera
        return celda!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destino = segue.destination as! DetallesAlumnoController
        destino.alumno = alumnos[tvAlumno.indexPathForSelectedRow!.row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        materias1.append(Materia(nombre: "Español", codigo: "ESP1"))
        materias1.append(Materia(nombre: "Matematicas", codigo: "MAT2"))
        
        materias2.append(Materia(nombre: "Ciencias", codigo: "CIE3"))
        materias2.append(Materia(nombre: "Fisica", codigo: "FIS5"))
        
        materias3.append(Materia(nombre: "Historia", codigo: "HIST4"))
        materias3.append(Materia(nombre: "Programación", codigo: "PRO6"))
        
        // Do any additional setup after loading the view.
        alumnos.append(Alumno(nombre: "Cesar", matricula: "199112", carrera: "IPM", edad: 20, materias: materias1))
        alumnos.append(Alumno(nombre: "German", matricula: "199137", carrera: "IPM", edad: 21, materias: materias2))
        alumnos.append(Alumno(nombre: "Ale", matricula: "209004", carrera: "IPM", edad: 21,materias: materias3))

    }
    
    
}
