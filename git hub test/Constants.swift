//
//  Constants.swift
//  git hub test
//
//  Created by Пользователь on 04.11.2020.
//

import Foundation

struct Constants {
    
    static var API_KEY = "[AIzaSyCxxJuMhov9vU_v0fmUH582iFG6a-3xgDE]"
    static var PLAYLIST_ID = "PLBCF2DAC6FFB574DE"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet%2CcontentDetails&maxResults=25&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY) "
    
}
