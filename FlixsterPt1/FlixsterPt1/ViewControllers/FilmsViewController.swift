//
//  FilmsViewController.swift
//  FlixsterPt1
//
//  Created by Giuliana Russi on 2/3/24.
//
import UIKit
import Nuke
import Foundation
 
class FilmsViewController: UIViewController, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmCell", for: indexPath) as! FilmCell
        let film = films[indexPath.row]
        cell.configure(with: film)
        
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var films: [Film] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=c33fdfe9461c416434667a9bc80b2e93")!
        
        let request = URLRequest(url: url)
        
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in

            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }

            guard let data = data else {
                print("❌ Data is nil")
                return
            }
         
            do {
                let decoder = JSONDecoder()
                
                let response = try decoder.decode(FilmsResponse.self, from: data)
                let films = response.results
                
                DispatchQueue.main.async {
                    
                    self?.films = films
                    
                    self?.tableView.reloadData()
                    
                }
            } catch {
                print("❌ Error parsing JSON: \(error.localizedDescription)")
            }
        }

        task.resume()
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ListDetails",
        let cell = sender as? UITableViewCell,
        let indexPath = tableView.indexPath(for: cell),
        let filmsDetailsViewController = segue.destination as? FilmsDetailsViewController {
            let film = films[indexPath.row]
            filmsDetailsViewController.film = film
        }
           
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }

}
