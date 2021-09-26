//
//  DownloadResource.swift
//  OnDemand resources
//
//  Created by Thiago on 26/09/21.
//

import Foundation

class DownloadResource{
    func start(resourceTag: String) {
   
        ODRManager().makeRequest(tag: resourceTag, onSuccess: {
            print("SUCCESS!")
        }, onFailure: { (error) in
            print("FAILED!", error)
        })
    }
    
}

