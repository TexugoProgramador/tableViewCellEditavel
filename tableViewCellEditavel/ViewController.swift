//
//  ViewController.swift
//  tableViewCellEditavel
//
//  Created by Humberto Puccinelli on 13/04/2018.
//  Copyright © 2018 Humberto Puccinelli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var botaoEditar: UIButton!
    @IBOutlet weak var tabelaDados: UITableView!
    
    var dados = ["linhas 1","linhas 2","linhas 3", "linha 4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabelaDados.dataSource = self
        tabelaDados.delegate = self
        
        botaoEditar.tintColor = UIColor.white
        botaoEditar.backgroundColor = UIColor.red
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func editarTabela(_ sender: UIButton) {
        
        tabelaDados.isEditing = !tabelaDados.isEditing
        let titulo = (tabelaDados.isEditing) ? "feito" : "editar"
        botaoEditar.setTitle(titulo, for: .normal)
        
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dados.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        celula.textLabel?.text = dados[indexPath.row]
        
        return celula
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let temp = dados[sourceIndexPath.row]
        dados.remove(at: sourceIndexPath.row)
        dados.insert(temp, at: destinationIndexPath.row)
    }
    
}

