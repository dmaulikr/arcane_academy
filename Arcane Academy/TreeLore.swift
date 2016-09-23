//
//  TreeLore.swift
//  Arcane Academy
//
//  Created by Patrick Gleeson on 23/09/2016.
//  Copyright © 2016 Patrick Gleeson. All rights reserved.
//
import ArcanaSwift
import ThinginessSwift

class TreeLore : Tome {
    override func registerWords() {
        typeWords["arboria"] = (description: "All trees", action: {
            return ThingRegistry.sharedInstance.thingsOfType("Tree")
        })

        selectorWords["minimis"] = (description: "that are small", action: { (initialSet) -> ThingSet in
            return initialSet.matching(["size":"small"])
        })

        selectorWords["medimal"] = (description: "that are medium sized", action: { (initialSet) -> ThingSet in
            return initialSet.matching(["size":"medium"])
        })

        actionWords["gorgal"] = (description: "change size to", action: { (initialSet, refinements) -> () in
            if let sizeModifier = refinements["size"] {
                initialSet.updateAll(["size":sizeModifier])
            }
        })
        refinementWords["grandis"] = (description: "large", action: ["size":"large"])
    }
}
