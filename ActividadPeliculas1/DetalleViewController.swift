//
//  DetalleViewController.swift
//  ActividadPeliculas1
//
//  Created by Wilson Perez on 17/11/24.
//

import UIKit

class DetalleViewController: UIViewController {

    @IBOutlet weak var foto: UIImageView!
    @IBOutlet weak var titulo: UITextView!
    @IBOutlet weak var descripcion: UITextView!
    
    var datosLista: Pelicula?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let pelicula = datosLista {
            foto.image = UIImage(named: pelicula.foto)
            title = pelicula.nombre
                
            titulo.text = pelicula.titulo
            descripcion.text = pelicula.descripcion
        }
        foto.layer.cornerRadius = 20
        foto.clipsToBounds = true
    }

}
