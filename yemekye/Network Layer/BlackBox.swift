//
//  BlackBox.swift
//  yemekye
//
//  Created by Arsalan Wahid Asghar on 12/23/17.
//  Copyright © 2017 Arsalan Wahid Asghar. All rights reserved.
//

import Foundation



func performUIupdatesOnMain(update: @escaping () -> Void ){
    
    DispatchQueue.main.async {
        update()
    }
    
    
}
