//
//  HomeVideoModel.swift
//  onetwo
//
//  Created by Alex Provarenko on 14.10.2022.
//


import UIKit

struct Video {
    let videoName: String
    let videoFileFormat: String
    
    static func fetchVideo() -> [Video] {
        let v1 = Video(videoName: "lifeHaks1", videoFileFormat: "mp4")
        let v2 = Video(videoName: "lifeHaks2", videoFileFormat: "mp4")
        let v3 = Video(videoName: "lifeHaks3", videoFileFormat: "mp4")
        let v4 = Video(videoName: "lifeHaks4", videoFileFormat: "mp4")

        return [v1,v2,v3,v4]
    }
}

