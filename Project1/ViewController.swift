//
//  ViewController.swift
//  Project1
//
//  Created by Will Kembel on 3/23/24.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictureNames: [String] = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // load up picture names from filesystem
        //
        let fileManager = FileManager.default
        let pathToFiles = Bundle.main.resourcePath!
        let fileNames = try! fileManager.contentsOfDirectory(atPath: pathToFiles)
        
        for fileName in fileNames {
            // all pictures of interest have 'nssl' at beginning of name
            if fileName.hasPrefix("nssl") {
                pictureNames.append(fileName)
            }
        }
        
        print(pictureNames)
    }
    
    // number of rows == number of pictures
    //
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictureNames.count
    }
    
    // load selectable cells with image names
    //
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictureNames[indexPath.row]
        return cell
    }
    
    // load imageview when a cell is selected
    //
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImageName = pictureNames[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
        
        
        
        // instantiate view controller
        
        // set its image property
        
        // push onto navigation controller stack
    }

}

