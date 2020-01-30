//
//  DataFetcher.swift
//  App101
//
//  Created by Mert Tuzer on 30.01.2020.
//  Copyright © 2020 Mert Tuzer. All rights reserved.
//

import UIKit

class DataFetcher {
    func fetchData<T: Codable>(urlString: String, completion: @escaping (T) -> Void) {
        let decoder = JSONDecoder()
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: urlString)!) {(data, _, error) in
            guard error == nil else {
                print("XXX")
                return
            }
            if let data = data {
                guard let decodedData = try? decoder.decode(T.self, from: data) else {
                    return
                }
                completion(decodedData)
            }
        }.resume()
    }
}
