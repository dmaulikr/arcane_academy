//
//  Protocol.swift
//  Arcane Academy
//
//  Created by Patrick Gleeson on 23/09/2016.
//  Copyright © 2016 Patrick Gleeson. All rights reserved.
//
import ArcanaSwift
import ThinginessSwift

protocol Level {
    func availableWordDefinitions() -> [WordData]
    func tomes() -> [Tome]
    func things() -> [SpellableThing]
    func challengeText() -> String
    func challengeMet() -> Bool
    func availableWords() -> [String]
}

extension Level {
    func availableWordDefinitions() -> [WordData] {
        let allWordDefinitions = tomes().map { tome in
            return tome.definitions()
        }
        let flattenedWordDefinitions = allWordDefinitions.flatten()

        return flattenedWordDefinitions.filter { wordData in
            return availableWords().contains(wordData.word)
        }
    }
}
