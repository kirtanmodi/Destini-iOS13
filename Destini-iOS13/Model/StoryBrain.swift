//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

    let story = [
        Story(title: "You see a fork in the road.", choice1: "Take a left.", choice2: "Take a right."),
        Story(title: "You see a tiger.", choice1: "Shout for help.", choice2: "Play dead."),
        Story(title: "You find a treasure chest", choice1: "Open it.", choice2: "Check for traps."),
        Story(title: "You encounter a friendly wizard.", choice1: "Ask for a spell.", choice2: "Ignore him."),
        Story(title: "You come across a river.", choice1: "Build a raft.", choice2: "Swim across."),
        Story(title: "You see a castle in the distance.", choice1: "Approach the castle.", choice2: "Continue on your path.")
    ]

     // Dictionary mapping the user's position to the next steps in the story.
    var storyMap: [Int: [Int]] = [
        0: [1, 2],
        1: [3, 4],
        2: [5, 6],
        3: [7, 8],
        4: [9, 10],
        5: [11, 12]
    ]
