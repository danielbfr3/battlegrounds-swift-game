//
//  Character.swift
//  battlegrounds
//
//  Created by Daniel Boga on 06/05/16.
//  Copyright © 2016 Daniel Boga. All rights reserved.
//

import Foundation

class Character {
    
    private var _name: String = ""
    private var _hp: Int = 100
    private var _attackPower = 10

    var name: String {
        get {
            return _name
        }
    }
    
    var hp: Int {
        get {
            return _hp
        }
    }
    
    var attackPower: Int {
        return _attackPower
    }
    
    var isAlive: Bool {
        if hp > 0 {
            return true
        } else {
            return false
        }
    }
    
    init(name: String) {
        self._name = name
    }
    
    func ressurect() {
        _hp = 100
    }
    
    func recieveAttack(attackPower: Int) {
        _hp -= attackPower
    }
}