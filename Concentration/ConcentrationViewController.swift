//
//  ConcentrationViewController.swift
//  Concentration
//
//  Created by Ann Akulova on 14.10.2023.
//

import UIKit

class ConcentrationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ChangeTheme()
        updateViewFromModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupTheme()
    }
    func setupTheme(){
        self.view.backgroundColor = Theme.currentTheme.backgroundColor
        flipCountLabel.textColor = Theme.currentTheme.textColor
        pointsCountLabel.textColor = Theme.currentTheme.textColor
        
    }
    
    
    @IBAction func ReplayTheGameButton(_ sender: UIButton) {
        game.ReplayView()
        game.MixingCards()
        updateViewFromModel()
        flipCount = 0
        ChangeTheme()
    }
    
    
    @IBAction func GoToFirst(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }

   
    
    @IBAction func HelpingButton(_ sender: UIButton) {
        if !game.theInitialSideOfTheCards{
            game.TheSideOfTheCardsForHelpButton()
            updateViewForHelping()
            let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false){timer in self.updateViewFromModel()
                timer.invalidate()
            }
        }
    }
    
    @IBAction func MixCardsButton(_ sender: UIButton) {
        game.MixingCards()
        updateViewFromModel()
    }
    
    //var numberOfCards = 24
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairesOfCards)
    
    private struct Complications{
        var name: String
        var countCards: Int
    }
    
    
    
    private var complicationTheme: [Complications] = [
        Complications(name: "Light", countCards: 8),
        Complications(name: "Middle", countCards: 12),
        Complications(name: "Hard", countCards: 24)
    ]
    var changeIndex = 0 {
        didSet{
               print(changeIndex)
               for index in cardButtons.indices{
                   if index > changeIndex{
                       cardButtons[index-1].isHidden=true
                   }else{
                       cardButtons[index-1].isHidden=false
                   }
               }
           }
       }
    private func ChangeComplication(){
        switch (ComplicationViewController.Complication){
        case "Light":
            changeIndex = 8
        case "Middle":
            changeIndex = 16
        case "Hard":
            changeIndex = 24
        default:
            break
        }
    }

    
    private (set) var flipCount: Int = 0 {
        didSet{
            updateFlipCountLabel()
        }
    }
    
    private func updateFlipCountLabel(){
        let attributes: [NSAttributedString.Key: Any] = [
            .strokeWidth: 5.0,
            .strokeColor: #colorLiteral(red: 0.9522178769, green: 0.9689554572, blue: 0.49538517, alpha: 1)
        ]
        let attributedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
        flipCountLabel.attributedText = attributedString
    }
    
    private (set) var pointsCount: Int = 0 {
        didSet{
            updatePointCountLabel()
        }
    }
    
    private func updatePointCountLabel(){
        let attributes: [NSAttributedString.Key: Any] = [
            .strokeWidth: 5.0,
            .strokeColor: #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        ]
        let attributedString = NSAttributedString(string: "Points: \(game.points)", attributes: attributes)
        pointsCountLabel.attributedText = attributedString
    }
    
    
    var numberOfPairesOfCards: Int{
            return (cardButtons.count + 1) / 2
    }

    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet private weak var flipCountLabel: UILabel!{
        didSet{
            updateFlipCountLabel()
        }
    }
    
    @IBOutlet private weak var pointsCountLabel: UILabel!{
        didSet{
            updatePointCountLabel()
        }
    }
    
    
   private var emojiChoices = "🦄🐷🦊🌸🍑🐼⚾️⏰🐴🍀🥥🚀"
    
    private struct Themes{
        var name: String
        var emojis: String
    }
    
    private var emojiThemes: [Themes] = [
        Themes(name: "Eat", emojis: "🍊🍇🥭🥥🍐🥑🍓🥝🍒🥐🥩🌶️"),
        Themes(name: "Car", emojis: "🚕🚗🚌🏎️🚑🚔🚙🚎🚒🛻🚛🚜"),
        Themes(name: "Nature", emojis: "🌵🌳🌲🪵🌴🍀🌼🌷🪻🌸🌻🪴")
    ]
    
       
      var themeIndex = 0{
           didSet{
               print(themeIndex, emojiThemes[themeIndex].name)
               emojiChoices = emojiThemes[themeIndex].emojis
               emoji = [Card: String]()
           }
       }
    
   
    private func ChangeTheme(){
        switch (ComplicationViewController.NameTheme){
        case "Eat":
            themeIndex = 0
        case "Car":
            themeIndex = 1
        case "Nature":
            themeIndex = 2
        case "Random":
            themeIndex = emojiThemes.count.arc4random
        default:
            break
        }
    }
    
   public var emoji = [Card: String]()

    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("choosen card was not in  cardButtons")
        }
    }

    private func updateViewFromModel(){
        if cardButtons != nil {
            for index in cardButtons.indices{
                let button = cardButtons[index]
                let card = game.cards[index]
                
                if card.isFaceUp{
                    button.setTitle(emoji(for: card), for: UIControl.State.normal)
                    button.backgroundColor = #colorLiteral(red: 0.9675136209, green: 1, blue: 0.956012547, alpha: 1)
                }else{
                    button.setTitle(" ", for: UIControl.State.normal)
                    button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9999999404, green: 1, blue: 1, alpha: 0): #colorLiteral(red: 0.9522178769, green: 0.9689554572, blue: 0.49538517, alpha: 1)
                }
            }
            
        }
        updatePointCountLabel()
    }
    
    private func updateViewForHelping(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if !card.isMatched{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.9675136209, green: 1, blue: 0.956012547, alpha: 1)
            }
        }
    }
    
    private func emoji(for card: Card) -> String{
        if emoji[card] == nil, emojiChoices.count > 0{
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        return emoji[card] ?? "?"
    }
    
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
