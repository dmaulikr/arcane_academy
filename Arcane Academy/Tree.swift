//
//  Tree.swift
//  Arcane Academy
//
//  Created by Patrick Gleeson on 23/09/2016.
//  Copyright © 2016 Patrick Gleeson. All rights reserved.
//

class Tree :SpellableThing {
    override func description() -> String {
        if let size = attribute("size") {
            return "a \(size) tree"
        } else {
            return "a tree"
        }
    }
}
