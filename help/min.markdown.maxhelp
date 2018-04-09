{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 0,
			"revision" : 0,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"rect" : [ 218.0, 112.0, 603.0, 619.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Lato Light",
		"gridonopen" : 1,
		"gridsize" : [ 5.0, 5.0 ],
		"gridsnaponopen" : 2,
		"objectsnaponopen" : 0,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 2,
		"toptoolbarpinned" : 2,
		"righttoolbarpinned" : 2,
		"bottomtoolbarpinned" : 2,
		"toolbars_unpinned_last_save" : 15,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "tap",
		"subpatcher_template" : "tap.template",
		"boxes" : [ 			{
				"box" : 				{
					"border" : 0,
					"fontface" : 0,
					"fontname" : "Lato Light",
					"fontsize" : 16.0,
					"id" : "obj-4",
					"linkbold" : 1,
					"linkcolor" : [ 0.501961, 0.0, 0.25098, 1.0 ],
					"linkunderline" : 0,
					"maxclass" : "markup",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 80.0, 295.0, 430.0, 285.0 ],
					"presentation_rect" : [ 80.0, 295.0, 430.0, 285.0 ],
					"text" : "<h1 id='toc_0'>Min-API</h1>\n\n<br/>This folder contains the support files you will need to compile an external object written in C++ using a high-level declarative application programming interface. It is distributed as a part of the <a href='https://github.com/Cycling74/min-devkit'>Min-DevKit Package</a>. Please refer to that package for additional documentation and best practices.<br/>\n\n<h2 id='toc_1'>Overview of Contents</h2>\n\n<ul>\n<li><code>include</code> : header files</li>\n<li><code>doc</code> : documentation</li>\n<li><code>script</code> : resources to be included and used by CMake</li>\n<li><code>test</code> : supporting code and resources for unit testing</li>\n<li><code>max-api</code> : a git submodule that provides the low-level bindings to the Max application</li>\n</ul>\n\n<h2 id='toc_2'>License</h2>\n\n<br/>Use of this Max-API distribution is governed by the MIT License as stated in the accompanying <code>License.md</code> file.<br/>\n"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.501961, 0.0, 0.25098, 1.0 ],
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 80.0, 241.0, 245.0, 23.0 ],
					"presentation_rect" : [ 80.0, 241.0, 245.0, 23.0 ],
					"style" : "",
					"text" : "min.markdown"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 80.0, 75.0, 71.0, 23.0 ],
					"presentation_rect" : [ 80.0, 75.0, 71.0, 23.0 ],
					"style" : "",
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 80.0, 107.0, 116.0, 23.0 ],
					"presentation_rect" : [ 80.0, 107.0, 116.0, 23.0 ],
					"style" : "",
					"text" : "path min-devkit"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 80.0, 143.0, 150.0, 23.0 ],
					"presentation_rect" : [ 80.0, 143.0, 150.0, 23.0 ],
					"saved_object_attributes" : 					{
						"filename" : "min-package-list.js",
						"parameter_enable" : 0
					}
,
					"style" : "",
					"text" : "js min-package-list.js"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-35",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 80.0, 179.0, 188.0, 23.0 ],
					"presentation_rect" : [ 80.0, 179.0, 188.0, 23.0 ],
					"style" : "",
					"text" : "combine path /min-api/readme.md"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 80.0, 211.0, 100.0, 23.0 ],
					"presentation_rect" : [ 80.0, 211.0, 100.0, 23.0 ],
					"style" : "",
					"text" : "prepend read"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-3", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"source" : [ "obj-5", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "min-package-list.js",
				"bootpath" : "~/Materials/min-devkit/javascript",
				"patcherrelativepath" : "../javascript",
				"type" : "TEXT",
				"implicit" : 1
			}
, 			{
				"name" : "min.markdown.mxo",
				"type" : "iLaX"
			}
 ],
		"autosave" : 0,
		"styles" : [ 			{
				"name" : "tap",
				"default" : 				{
					"fontname" : [ "Lato Light" ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
 ],
		"bgfillcolor_type" : "gradient",
		"bgfillcolor_color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
		"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
		"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
		"bgfillcolor_angle" : 270.0,
		"bgfillcolor_proportion" : 0.39
	}

}
