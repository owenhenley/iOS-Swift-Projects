//
//  MealTableViewController.swift
//  Food Tracker
//
//  Created by Owen Henley on 6/27/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    
    var meals = [Meal]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleMeals()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals.count
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
    
    private func loadSampleMeals() {
        
        let photo1 = UIImage(named: "meal1")
        let photo2 = UIImage(named: "meal2")
        let photo3 = UIImage(named: "meal3")
        let photo4 = UIImage(named: "meal4")
        let photo5 = UIImage(named: "meal5")
        let photo6 = UIImage(named: "meal6")
        let photo7 = UIImage(named: "meal7")
        let photo8 = UIImage(named: "meal8")
        
        guard let meal1 = Meal(name: "Shrimp Starter", photo: photo1 , rating: 5)
            else {
                fatalError("Unable to instantiate meal1")
        }
        guard let meal2 = Meal(name: "Flower Power", photo: photo2, rating: 3)
            else {
                fatalError("Unable to instantiate meal2")
        }
        guard let meal3 = Meal(name: "Calamari", photo: photo3, rating: 4)
            else {
                fatalError("Unable to instantiate meal3")
        }
        guard let meal4 = Meal(name: "The Farmer", photo: photo4, rating: 4)
            else {
                fatalError("Unable to instantiate meal4")
        }
        guard let meal5 = Meal(name: "BBQ Pork Chop", photo: photo5, rating: 5)
            else {
                fatalError("Unable to instantiate meal5")
        }
        guard let meal6 = Meal(name: "You Tell Me...", photo: photo6, rating: 2)
            else {
                fatalError("Unable to instantiate meal6")
        }
        guard let meal7 = Meal(name: "Toffee Crumble", photo: photo7, rating: 5)
            else {
                fatalError("Unable to instantiate meal7")
        }
        guard let meal8 = Meal(name: "Sliced Apple", photo: photo8, rating: 3)
            else {
                fatalError("Unable to instantiate meal8")
        }
        
        meals += [meal1, meal2, meal3, meal4, meal5, meal6, meal7, meal8]
        
    }

}
