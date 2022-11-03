//
//  ViewController.swift
//  MyMusic
//
//  Created by Rustem Manafov on 03.11.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var songs = [Song]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSong()
        tableView.delegate = self
        tableView.dataSource = self
    }
    

    private func configureSong() {
        songs.append(Song(name: "So am i",
                     albumName: "So",
                     artistName: "Ava",
                     imageName: "cover1",
                     trackName: "song1"))
        songs.append(Song(name: "Iscal nasel",
                     albumName: "Nasel",
                     artistName: "Jah Khalib",
                     imageName: "cover2",
                     trackName: "song2"))
        songs.append(Song(name: "Lost on you",
                     albumName: "Lost",
                     artistName: "Lp",
                     imageName: "cover3",
                     trackName: "song3"))
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "player") as? PlayerViewController else {
            return
        }
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}

struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
}
