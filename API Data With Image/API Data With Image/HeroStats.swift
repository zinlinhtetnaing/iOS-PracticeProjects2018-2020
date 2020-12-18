//
//  Heros.swift
//  API Data With Image
//
//  Created by Zin Lin Htet Naing on 9/4/18.
//  Copyright © 2018 Zin Lin Htet Naing. All rights reserved.
//

import Foundation

struct HeroStats:Decodable{
    
    let localized_name:String
    let primary_attr:String
    let attack_type:String
    let legs:Int
    let img:String
    
}

