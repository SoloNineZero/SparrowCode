//
//  EmojiTableViewController.swift
//  SparrowCode
//
//  Created by Игорь Солодянкин on 24.01.2023.
//

import UIKit
import AudioToolbox

class EmojiTableViewController: UITableViewController {
    
    var objects = [
        Emoji(emoji: "🐇", name: "Rabbit", description: "Why do you need a rabbit paw? Take the whole!"),
        Emoji(emoji: "🍀", name: "Clover", description: "May he bring good luck"),
        Emoji(emoji: "🌹", name: "Rose flower", description: "Take it as a gift"),
        Emoji(emoji: "⭐️", name: "Star", description: "Time to make a wish"),
        Emoji(emoji: "🍕", name: "Pizza", description: "Time to pizza"),
        Emoji(emoji: "🐇", name: "Rabbit", description: "Why do you need a rabbit paw? Take the whole!"),
        Emoji(emoji: "🍀", name: "Clover", description: "May he bring good luck"),
        Emoji(emoji: "🌹", name: "Rose flower", description: "Take it as a gift"),
        Emoji(emoji: "⭐️", name: "Star", description: "Time to make a wish"),
        Emoji(emoji: "🍕", name: "Pizza", description: "Time to pizza"),
        Emoji(emoji: "🐇", name: "Rabbit", description: "Why do you need a rabbit paw? Take the whole!"),
        Emoji(emoji: "🍀", name: "Clover", description: "May he bring good luck"),
        Emoji(emoji: "🌹", name: "Rose flower", description: "Take it as a gift"),
        Emoji(emoji: "⭐️", name: "Star", description: "Time to make a wish"),
        Emoji(emoji: "🍕", name: "Pizza", description: "Time to pizza"),
        Emoji(emoji: "🐇", name: "Rabbit", description: "Why do you need a rabbit paw? Take the whole!"),
        Emoji(emoji: "🍀", name: "Clover", description: "May he bring good luck"),
        Emoji(emoji: "🌹", name: "Rose flower", description: "Take it as a gift"),
        Emoji(emoji: "⭐️", name: "Star", description: "Time to make a wish"),
        Emoji(emoji: "🍕", name: "Pizza", description: "Time to pizza")
    ]
    
    
    override func viewDidLoad() {
        title = "Emoji"
    }
    
    @IBAction func mixButton(_ sender: UIBarButtonItem) {
        objects.shuffle()
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "emojiCell", for: indexPath) as! EmojiTableViewCell
        let object = objects[indexPath.row]
        cell.set(object: object)
        cell.accessoryType = .none
        
        return cell
    }
    
    // выбор ячейки
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AudioServicesPlaySystemSoundWithCompletion(SystemSoundID (kSystemSoundID_Vibrate)) {}
        tableView.deselectRow(at: indexPath, animated: true)
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
    
    
    // анимация появления ячеек
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: 0)
        UIView.animate(withDuration: 1, delay: 0.1 * Double(indexPath.row), usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: cell.contentView.frame.height)
        })
        UIView.animate(withDuration: 0.5, delay: 0.2 * Double(indexPath.row), options: .curveEaseInOut, animations: {
        cell.alpha = 1
        })
    }
    
}
