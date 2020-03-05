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
    var dataStructure: MovieResponse?
    var bookArray: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        guard let BaseURL = URL(string: "https://yts.mx/api/v2/list_movies.json") else {
            bookArray.append(Movie(title: "ERROR_1", rating: 1.1))
            return
        }
        
        URLSession.shared.dataTask(with: BaseURL){ data, responds, error in
            guard error == nil else {
                self.bookArray.append(Movie(title: "ERROR_2", rating: 2.2))
                return
            }
            guard let resData = data else { return }
            do {
                self.dataStructure = try JSONDecoder().decode(MovieResponse.self, from: resData)
            } catch {
                self.bookArray.append(Movie(title: "ERROR_3", rating: 3.3))
            }
            DispatchQueue.main.async(execute: {
                if let list = self.dataStructure?.data?.movies{
                    for movie in list {
                        print(movie)
                        if(movie.rating! > (self.keyWord as NSString).doubleValue){
                            self.bookArray.append(movie)
                        }
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
        return bookArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookList", for: indexPath) as! TableViewCellController

        cell.textLabel?.text = bookArray[indexPath.row].title
        cell.detailTextLabel?.text = bookArray[indexPath.row].rating?.debugDescription

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
