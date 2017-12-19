
inlets = 1;
outlets = 1;


function bang() {
	var p = new Packages;
	var paths = p.getsubpaths("source", 1);
 
	if (typeof(paths) == "string")
		look_for_min(paths);
	else {
		for (var i=0; i<paths.length; ++i) {
			look_for_min(paths[i]);
		}
	}	
}


function look_for_min(path) {
	var f = new Folder(path);
	while (!f.end) {
		if (f.filename.search("min-api") != -1)
            outlet(0, path);
		f.next();
	}
	f.close();
}


function path(package_name) {
	var p = new Packages;
	var paths = p.getsubpaths("source", 1);

	if (typeof(paths) == "string")
		outlet(0, paths);
	else {
		for (var i=0; i<paths.length; ++i) {
            if ( paths[i].indexOf(package_name) !== -1 ) {
                outlet(0, paths[i]);
            }
		}
	}
}
