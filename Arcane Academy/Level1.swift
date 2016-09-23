//
//  Level1.swift
//  Arcane Academy
//
//  Created by Patrick Gleeson on 23/09/2016.
//  Copyright © 2016 Patrick Gleeson. All rights reserved.
//
import ArcanaSwift
import ThinginessSwift

class Level1: Level {

    private let myTomes:[Tome]
    private let myThings: [SpellableThing]
    private let myChallengeText: String
    private let myAvailableWords: [String]

    init() {
        myTomes = [TreeLore()]
        myChallengeText = "Make all the trees large"
        myAvailableWords = ["arboria", "minimis", "medimal", "gorgal", "grandis"]
        myThings = [Tree(attributes: ["size":"small"]),
                    Tree(attributes: ["size":"medium"]),
                    Tree(attributes: ["size":"large"])]
    }

    func tomes() -> [Tome] {
        return myTomes
    }

    func things() -> [SpellableThing] {
        return myThings
    }

    func availableWords() -> [String] {
        return myAvailableWords
    }

    func challengeText() -> String {
        return myChallengeText
    }

    func challengeMet() -> Bool {
        let largeThingCount:Int = ThingRegistry.sharedInstance.thingsOfType("Tree").matching(["size":"large"]).count
        let allThingCount:Int = ThingRegistry.sharedInstance.thingsOfType("Tree").count
        return  (largeThingCount == allThingCount)
    }

}
