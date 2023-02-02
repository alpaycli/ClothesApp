//
//  FileManager.swift
//  ClothesApp
//
//  Created by Alpay Calalli on 05.01.23.
//

import Foundation

extension FileManager{
    static var documentsDirectory: URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
