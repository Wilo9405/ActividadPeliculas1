//
//  ViewController.swift
//  ActividadPeliculas1
//
//  Created by Wilson Perez on 17/11/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var viewTable: UITableView!
    
    var peliculas = [Pelicula]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        viewTable.delegate = self
        viewTable.dataSource = self
        
        let pelicula1 = Pelicula(nombre: "Cadena Perpetua", foto: "cadena_perpetua", titulo: "Descripcion", descripcion: "Dos hombres encarcelados establecen una fuerte amistad a lo largo de los años, encontrando consuelo y redención eventual a través de actos de decencia común." )
        let pelicula2 = Pelicula(nombre: "El Pianista", foto: "el_pianista", titulo: "Descripcion", descripcion: "Narra la historia real de Władysław Szpilman, un pianista judío-polaco que lucha por sobrevivir durante la ocupación nazi en la Segunda Guerra Mundial, utilizando su talento y resiliencia en medio del horror.")
        let pelicula3 = Pelicula(nombre: "La lista de Schindler",foto: "la_lista_de_schindler", titulo: "Descripcion", descripcion: "En la Polonia ocupada por los alemanes durante la Segunda Guerra Mundial, Oskar Schindler se preocupa gradualmente por su fuerza laboral judía después de presenciar su persecución por parte de los nazis." )
        let pelicula4 = Pelicula(nombre: "La milla verde",foto: "la_milla_verde", titulo: "Descripcion", descripcion: "Las vidas de los guardias en el corredor de la muerte se ven afectadas por uno de sus reclusos: un hombre negro acusado de asesinato infantil y violación, pero que tiene un don misterioso.")
        let pelicula5 = Pelicula(nombre: "La vida es bella",foto: "la_vida_es_bella", titulo: "Descripcion", descripcion: "Un padre judío-italiano que utiliza su imaginación y humor para proteger a su hijo de los horrores de un campo de concentración nazi, transformando la tragedia en un juego para mantener viva la esperanza.")
        let pelicula6 = Pelicula(nombre: "Matrix", foto: "matrix", titulo: "Descripcion",descripcion:"Un hacker informático aprende de rebeldes misteriosos sobre la verdadera naturaleza de su realidad y su papel en la guerra contra sus controladores.")
        
        peliculas.append(pelicula1)
        peliculas.append(pelicula2)
        peliculas.append(pelicula3)
        peliculas.append(pelicula4)
        peliculas.append(pelicula5)
        peliculas.append(pelicula6)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        peliculas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        let cellList = peliculas[indexPath.row]
        cell.textLabel?.text = cellList.nombre
        
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.masksToBounds = true
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
            cell.layer.borderWidth = 1
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOffset = CGSize(width: 0, height: 2)
            cell.layer.shadowRadius = 4
            cell.layer.shadowOpacity = 0.2
            cell.layer.masksToBounds = false
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // No es necesario usar el 'sender', ya que se pasará el objeto en 'prepare'
        performSegue(withIdentifier: "enviar", sender: peliculas[indexPath.row])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "enviar" {
            if let peliculaSeleccionada = sender as? Pelicula {
                let destino = segue.destination as? DetalleViewController
                destino?.datosLista = peliculaSeleccionada
            }
        }
    }
}

