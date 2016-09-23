//
//  LevelController.swift
//  Arcane Academy
//
//  Created by Patrick Gleeson on 23/09/2016.
//  Copyright © 2016 Patrick Gleeson. All rights reserved.
//

import ArcanaSwift

class LevelController {
    private let level: Level
    private let demon: Demon
    private var chosenWordList: [ChosenWord]
    private var notifier: (String)->()
    private var wordChoiceCounter: Int

    init(levelNumber: Int, notifier: (String)->()) {
        switch levelNumber {
        default:
            level = Level1();
        }
        self.notifier = notifier
        chosenWordList = []
        demon = Demon(tomes: level.tomes())
        wordChoiceCounter = 0
    }

    func things() -> [SpellableThing] {
        return level.things()
    }

    func challengeText() -> String {
        return level.challengeText()
    }

    func challengeMet() -> Bool {
        return level.challengeMet()
    }

    func availableWordDefinitions() -> [WordData] {
        return level.availableWordDefinitions()
    }

    func chosenWords() -> [ChosenWord] {
        return chosenWordList
    }

    func chooseWord(word: String) {
        if level.availableWords().contains(word) {
            chosenWordList.append(ChosenWord(id: wordChoiceCounter, word: word))
            wordChoiceCounter += 1
        } else {
            notifier("'\(word)' is not an available word")
        }
    }

    func unchooseWord(toDelete: ChosenWord) {
        chosenWordList = chosenWordList.filter() { $0.id != toDelete.id }
    }

    func castSpell() {
        if demon.cast(spell()) {
            notifier("Your spell is cast!")
            chosenWordList = []
        } else {
            notifier("That spell makes no sense!")
        }
    }

    private func spell() -> String {
        let wordArray = chosenWordList.map { chosenWord in
            chosenWord.word
        }
        return wordArray.joinWithSeparator(" ")
    }



}
