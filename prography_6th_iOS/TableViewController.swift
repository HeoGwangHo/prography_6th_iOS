//
//  TableViewController.swift
//  prography_6th_iOS
//
//  Created by Gwang_Ho on 03/03/2020.
//  Copyright © 2020 Gwang-Ho Heo. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var keyWord: String = ""
//    var dataStructure: MovieResponse?
//    var movieAtrray: [Movie] = []
    var dataStructure: BookResponse?
    var bookArray: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        guard let BaseURL = URL(string:/*"https://yts.mx/api/v2/list_movies.json"*/"https://api.itbook.store/1.0/search/mongodb") else {
//            movieAtrray.append(Movie(title: "ERROR_1", rating: 1.1))
            bookArray.append(Book(title: "ERROR_1", price: "1.1"))
            return
        }
        
        URLSession.shared.dataTask(with: BaseURL){ data, responds, error in
            guard error == nil else {
//                self.movieAtrray.append(Movie(title: "ERROR_2", rating: 2.2))
                self.bookArray.append(Book(title: "ERROR_2", price: "2.2"))
                return
            }
            guard let resData = data else { return }
            do {
                self.dataStructure = try JSONDecoder().decode(/*MovieResponse*/BookResponse.self, from: resData)
            } catch {
//                self.movieAtrray.append(Movie(title: "ERROR_3", rating: 3.3))
                self.bookArray.append(Book(title: "ERROR_3", price: "3.3"))
            }
            DispatchQueue.main.async(execute: {
                if let list = self.dataStructure?.books/*data?.movies*/{
                    for movie in list {
//                        self.movieAtrray.append(movie)
                        self.bookArray.append(movie)
//                        if(movie.rating! > (self.keyWord as NSString).doubleValue){
//                            self.movieAtrray.append(movie)
//                        }
                    }
                }
                self.tableView.reloadData()
            })
        }.resume()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bookArray.count//movieAtrray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = bookArray[indexPath.row].title//movieAtrray[indexPath.row].title
        cell.detailTextLabel?.text = bookArray[indexPath.row].price//movieAtrray[indexPath.row].rating?.description

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailViewController
        let sender: UITableViewCell = sender as! UITableViewCell
        
        if segue.identifier == "cellDetail" {
            detailViewController.detailTitle = sender.textLabel!.text!
            detailViewController.detailRating = sender.detailTextLabel!.text!
        }
        
    }

}
