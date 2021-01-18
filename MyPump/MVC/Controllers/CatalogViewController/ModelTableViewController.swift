//
//  ModelTableViewController.swift
//  MyPump
//
//  Created by Александр Майко on 13.01.2021.
//

import UIKit

class ModelTableViewController: UITableViewController {
    var modelsDownloaded: [String]=[]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func getBrinkmannModels() {
        NetworkManager.FetchModels(ref: Constants.FirebaseRef.brinkmannModelsRef) { (models) -> Void in
            DispatchQueue.main.async {
                self.modelsDownloaded = models
                self.tableView.reloadData()
            }
        }
    }

    func getPutzmeristerModels() {
        NetworkManager.FetchModels(ref: Constants.FirebaseRef.putzmeisterModelsRef) { (models) -> Void in
            DispatchQueue.main.async {
                self.modelsDownloaded = models
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return modelsDownloaded.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //        let modelNameString = modelsDownloaded?.marks?[indexPath.row] ?? ""
        //     cell.markNameLabel.text = modelNameString
        //     cell.markImage.image = UIImage(named:"\(modelNameString)")
        cell.textLabel?.text = modelsDownloaded[indexPath.row]

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
