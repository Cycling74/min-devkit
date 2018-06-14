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
		"rect" : [ 177.0, 125.0, 640.0, 480.0 ],
		"bgcolor" : [ 0.133333, 0.133333, 0.133333, 1.0 ],
		"editing_bgcolor" : [ 0.133333, 0.133333, 0.133333, 1.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Ableton Sans Light Regular",
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
		"style" : "tap-dark",
		"subpatcher_template" : "tap.template.dark",
		"boxes" : [ 			{
				"box" : 				{
					"clickjump" : 1,
					"defaultvalue" : 0.0,
					"fontsize" : 10.0,
					"id" : "obj-5",
					"knobcolor" : [ 0.7, 0.7, 0.7, 1.0 ],
					"label" : "audio",
					"maxclass" : "min.meter~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offset" : [ 10.0, 6.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 370.0, 175.0, 205.0, 15.0 ],
					"presentation_rect" : [ 370.0, 175.0, 205.0, 15.0 ],
					"range" : [ -1.0, 1.0 ],
					"showvalue" : 1,
					"style" : "",
					"tracking" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 226.0, 198.0, 99.0, 23.0 ],
					"presentation_rect" : [ 226.0, 198.0, 99.0, 23.0 ],
					"style" : "",
					"text" : "scale~ -1. 1. 0. 1."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-3",
					"local" : 1,
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 245.0, 335.0, 45.0, 45.0 ],
					"presentation_rect" : [ 245.0, 335.0, 45.0, 45.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 225.0, 130.0, 62.0, 23.0 ],
					"presentation_rect" : [ 225.0, 130.0, 62.0, 23.0 ],
					"style" : "",
					"text" : "cycle~ 0.1"
				}

			}
, 			{
				"box" : 				{
					"clickjump" : 1,
					"defaultvalue" : 0.0,
					"id" : "obj-1",
					"knobcolor" : [ 0.7, 0.7, 0.7, 1.0 ],
					"label" : "",
					"maxclass" : "min.meter~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offset" : [ 10.0, 10.0 ],
					"outlettype" : [ "" ],
					"patching_rect" : [ 180.0, 260.0, 140.0, 24.0 ],
					"presentation_rect" : [ 180.0, 260.0, 140.0, 24.0 ],
					"range" : [ 0.0, 1.0 ],
					"showvalue" : 1,
					"style" : "",
					"tracking" : 0
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"order" : 1,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-5", 0 ],
					"order" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
 ],
		"dependency_cache" : [ 			{
				"name" : "min.meter~.mxo",
				"type" : "iLaX"
			}
 ],
		"autosave" : 0,
		"styles" : [ 			{
				"name" : "tap-dark",
				"default" : 				{
					"editing_bgcolor" : [ 0.133333, 0.133333, 0.133333, 1.0 ],
					"fontname" : [ "Ableton Sans Light Regular" ],
					"locked_bgcolor" : [ 0.133333, 0.133333, 0.133333, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
 ],
		"locked_bgcolor" : [ 0.133333, 0.133333, 0.133333, 1.0 ],
		"bgfillcolor_type" : "gradient",
		"bgfillcolor_color1" : [ 0.301961, 0.301961, 0.301961, 1 ],
		"bgfillcolor_color2" : [ 0.2, 0.2, 0.2, 1 ],
		"bgfillcolor_color" : [ 0.2, 0.2, 0.2, 1 ]
	}

}
