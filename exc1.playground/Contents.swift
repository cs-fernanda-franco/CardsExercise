//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Toy {
    
    enum Kind {
        case ball
        case zombie
        case bone
        case mouse
    }
    
    enum Sound {
        case squeak
        case bell
    }
    
    let kind: Kind
    let color: String
    let sound: Sound?
    
    init(kind: Kind, color: String, sound: Sound? = nil) {
        self.kind = kind
        self.color = color
        self.sound = sound
    }

}

class Pet {
    
    enum Kind {
        case dog
        case cat
        case guineaPig
    }
    
    let name: String
    let kind: Kind
    let favoriteToy: Toy?
    
    init(name: String, kind: Kind, favoriteToy: Toy? = nil) {
        self.name = name
        self.kind = kind
        self.favoriteToy = favoriteToy
    }
}

class Person {
    let pet: Pet?
    
    init(pet: Pet? = nil) {
        self.pet = pet
    }
}

let janie = Person(pet: Pet(name: "Delia", kind: .dog, favoriteToy: Toy(kind: .ball, color: "Purple", sound: .bell)))

let tammy = Person(pet: Pet(name: "Evil Cat Overlord", kind: .cat, favoriteToy: Toy(kind: .mouse, color: "Orange")))

let felipe = Person()

if let sound = tammy.pet?.favoriteToy?.sound {
    print("sound: \(sound)")
} else {
    print("sound")
}

let team = [janie, felipe, tammy]

let petNames = team.map { $0.pet?.name }







