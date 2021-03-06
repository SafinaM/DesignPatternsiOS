//
//    File.swift
//    RWBlueLibrary
//
//    Created by LinuxPlus on 3/26/18.
//    Copyright © 2018 Razeware LLC. All rights reserved.
//

import Foundation

final class LibraryAPI
{
	static let shared = LibraryAPI()
	
	private init() {
	}
	private let persistencyManager = PersistencyManager()
	private let httpClient = HTTPClient()
	private let isOnline = false
	
	func getAlbums() -> [Album] {
		return persistencyManager.getAlbums()
	}
	
	func addAlbum(_ album: Album, at index: Int) {
		persistencyManager.addAlbum(album, at: index)
		if isOnline {
			httpClient.postRequest("/api/addAlbum", body: album.description)
		}
	}
	
	func deleteAlbum(at index: Int) {
		persistencyManager.deleteAlbum(at: index)
		if isOnline {
			httpClient.postRequest("/api/deleteAlbum", body: "\(index)")
		}
	}
}
