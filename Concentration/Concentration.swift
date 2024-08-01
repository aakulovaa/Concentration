//
//  Concentration.swift
//  Concentration
//
//  Created by Ann Akulova on 16.10.2023.
//

import Foundation

struct Concentration{
    private (set) var cards = [Card]()
    //private var numberOfCards: Int //
    private (set) var points = 0
        
    private (set) var theInitialSideOfTheCards = false
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        set {
            for index in cards.indices{
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func ReplayView(){
        for index in cards.indices{
            cards[index].isFaceUp = false
            cards[index].isMatched = false
        }
        points = 0
    }
    
    mutating func TheSideOfTheCardsForHelpButton(){
        theInitialSideOfTheCards = true
    }
    
    
    mutating func chooseCard(at index: Int){
        assert(cards.indices.contains(index), "Concentration.chooseCard(at:\(index)): choosen index not in the card")
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                if cards[matchIndex] == cards[index]{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    
                    points += 1
                }else{
                    if points > 1{
                        points -= 2
                    }
                }
                cards[index].isFaceUp = true
            }else{
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
        mutating func MixingCards(){
            var mixingArray = [Card]()
                    for _ in 0..<cards.count {
                        mixingArray.append(cards.remove(at: cards.count.arc4random))
                    }
                    cards = mixingArray
            for index in cards.indices{
                cards[index].isFaceUp = false
            }
    }
    
    init(numberOfPairsOfCards: Int){
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): tou must at least one pair of cards")
        //numberOfCards = numberOfPairsOfCards * 2
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
       // for i in numberOfCards..<numberOfButtons{
        //    cards[i].isMatched = true
        //}
        MixingCards()
    }
}

extension Collection{
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}
