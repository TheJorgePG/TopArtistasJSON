//
//  ViewController.swift
//  TopArtistasJSON
//
//  Created by Usuario on 25/01/2020.
//  Copyright © 2020 net.azarquiel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var result: Result?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        jsonDecoding()
    }
    
    func jsonDecoding() {
        let  urlTxt="http://ws.audioscrobbler.com/2.0/?method=geo.gettopartists&country=spain&api_key=75365753feac96e4d7120af58de20fd8&format=json"
        guard let url = URL(string: urlTxt) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else {return}
                do {
                    self.result =  try JSONDecoder().decode(Result.self, from: data)
                    //self.pintaCurrent()
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch let jsonErr {
                    print("Error serializing json", jsonErr)
                }
        }.resume()
    }
    
    //Metodos del TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let n = result?.datos?.artista?.count{
            return n
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaID", for: indexPath) as! MiCelda
        let artistas = result?.datos?.artista![indexPath.row]
        //Datos TableView
        DispatchQueue.main.async {
            //Foto
            let url = URL(string: (artistas?.imagen![1].foto)!)
            let data = try? Data(contentsOf: url!)
            celda.ivIcoCelda.image = UIImage(data: data!)
            //Resto de datos
            guard let nombre = artistas?.nombre else {return}
            celda.lbNombreCelda.text = nombre
            guard let listeners = artistas?.listeners else {return}
            celda.lbListenersCelda.text = listeners
            guard let webArtista = artistas?.sitioWeb else {return}
            celda.lbWebCelda.text = webArtista
        }
        return celda
    }
    
    // Vistas

}

