//
//  String+Extensions.swift
//  FetchScreeningProject
//
//  Created by Dhrushit Raval on 8/26/24.
//

import Foundation

extension String {
    var lines: [String] {
        return self.components(separatedBy: .newlines)
    }
}
