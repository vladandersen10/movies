//
//  ImagesService.swift
//  Movies
//
//  Created by Vladislav on 02.12.2022.
//

import UIKit

protocol ImagesServiceable {
    func originalImage(_ path: String?) -> URL?
    func smallImage(_ path: String?) -> URL?
}

struct ImagesService {

    private let imagesConfiguration: Configuration.Images

    init(imagesConfiguration: Configuration.Images = UIApplication.configuration.images) {
        self.imagesConfiguration = imagesConfiguration
    }
}

// MARK: - ImagesServiceable

extension ImagesService: ImagesServiceable {
    func originalImage(_ path: String?) -> URL? {
        imagesConfiguration.originalHost.appendingPath(path)
    }
    
    func smallImage(_ path: String?) -> URL? {
        imagesConfiguration.smallHost.appendingPath(path)
    }
}

private extension URL {
    func appendingPath(_ path: String?) -> URL? {
        guard let path = path else {
            return nil
        }

        var url = self
        url.appendPathComponent(path)
        
        return url
    }
}
