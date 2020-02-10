on adding folder items to theAttachedFolder after receiving theNewItems
	addImages(theAttachedFolder)
	delay 3
	tell application "Finder" to delete theNewItems
end adding folder items to


on run
	set importFolder to choose folder
	addImages(importFolder)
end run


to addImages(dir)
	set extensionList to {"jpg", "png", "tiff"}
	set imageList to {}
	set albumName to "photoImport"
	
	tell application "Finder" to set theFiles to every file of dir whose name extension is in extensionList
	
	repeat with i from 1 to number of items in theFiles
		set this_item to item i of theFiles as alias
		set the end of imageList to this_item
	end repeat
	
	tell application "Photos"
		import imageList into container albumName skip check duplicates yes
	end tell
end addImages