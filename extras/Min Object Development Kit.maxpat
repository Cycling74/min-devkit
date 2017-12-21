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
		"rect" : [ 43.0, 128.0, 1094.0, 606.0 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"default_fontsize" : 13.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"showrootpatcherontab" : 0,
		"showontab" : 0,
		"boxes" : [ 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-3",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 0,
							"revision" : 0,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 26.0, 1094.0, 580.0 ],
						"bgcolor" : [ 0.960784, 0.960784, 0.960784, 1.0 ],
						"editing_bgcolor" : [ 0.960784, 0.960784, 0.960784, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 16.0,
						"default_fontface" : 0,
						"default_fontname" : "Lato Light",
						"gridonopen" : 1,
						"gridsize" : [ 4.0, 4.0 ],
						"gridsnaponopen" : 2,
						"objectsnaponopen" : 0,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"id" : "obj-18",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 912.0, 204.0, 100.0, 100.0 ],
									"presentation_rect" : [ 912.0, 204.0, 100.0, 100.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"color" : [ 1.0, 1.0, 1.0, 1.0 ],
									"id" : "obj-14",
									"maxclass" : "jweb",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 0.0, 0.0, 852.0, 580.0 ],
									"presentation_rect" : [ 0.0, 0.0, 852.0, 580.0 ],
									"rendermode" : 0,
									"url" : "http://cycling74.github.io/min-devkit/"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-13",
									"linecount" : 3,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 888.0, 136.0, 150.0, 64.0 ],
									"presentation_linecount" : 3,
									"presentation_rect" : [ 888.0, 136.0, 150.0, 64.0 ],
									"style" : "",
									"text" : "Open the documentation site in your web browser"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"linecount" : 4,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 868.0, 352.0, 188.0, 85.0 ],
									"presentation_linecount" : 4,
									"presentation_rect" : [ 868.0, 352.0, 188.0, 85.0 ],
									"style" : "",
									"text" : ";\rmax launchbrowser http://cycling74.github.io/min-devkit/"
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"fontface" : 0,
									"fontname" : "Lato Light",
									"fontsize" : 16.0,
									"id" : "obj-9",
									"ignoreclick" : 1,
									"justification" : 2,
									"linkbold" : 1,
									"linkcolor" : [ 0.501961, 0.0, 0.25098, 1.0 ],
									"linkunderline" : 0,
									"maxclass" : "markup",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 880.0, 16.0, 186.0, 66.0 ],
									"presentation_rect" : [ 880.0, 16.0, 186.0, 66.0 ],
									"text" : "<a>Min</a><br/> Create packages and code objects for Max using C++"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"source" : [ "obj-18", 0 ]
								}

							}
 ],
						"bgfillcolor_type" : "gradient",
						"bgfillcolor_color1" : [ 0.454902, 0.462745, 0.482353, 1.0 ],
						"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"bgfillcolor_angle" : 270.0,
						"bgfillcolor_proportion" : 0.39
					}
,
					"patching_rect" : [ 86.0, 231.0, 107.0, 23.0 ],
					"presentation_rect" : [ 86.0, 231.0, 107.0, 23.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"fontname" : "Lato Light",
						"fontsize" : 16.0,
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p Documentation",
					"varname" : "basic_tab[6]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 0,
							"revision" : 0,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 26.0, 1094.0, 580.0 ],
						"bgcolor" : [ 0.960784, 0.960784, 0.960784, 1.0 ],
						"editing_bgcolor" : [ 0.960784, 0.960784, 0.960784, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 16.0,
						"default_fontface" : 0,
						"default_fontname" : "Lato Light",
						"gridonopen" : 1,
						"gridsize" : [ 4.0, 4.0 ],
						"gridsnaponopen" : 2,
						"objectsnaponopen" : 0,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"border" : 0,
									"fontface" : 0,
									"fontname" : "Lato Light",
									"fontsize" : 16.0,
									"id" : "obj-9",
									"ignoreclick" : 1,
									"justification" : 2,
									"linkbold" : 1,
									"linkcolor" : [ 0.501961, 0.0, 0.25098, 1.0 ],
									"linkunderline" : 0,
									"maxclass" : "markup",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 880.0, 16.0, 186.0, 66.0 ],
									"presentation_rect" : [ 880.0, 16.0, 186.0, 66.0 ],
									"text" : "<a>Min</a><br/> Create packages and code objects for Max using C++"
								}

							}
 ],
						"lines" : [  ],
						"bgfillcolor_type" : "gradient",
						"bgfillcolor_color1" : [ 0.454902, 0.462745, 0.482353, 1.0 ],
						"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"bgfillcolor_angle" : 270.0,
						"bgfillcolor_proportion" : 0.39
					}
,
					"patching_rect" : [ 118.0, 268.0, 68.0, 23.0 ],
					"presentation_rect" : [ 118.0, 268.0, 68.0, 23.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"fontname" : "Lato Light",
						"fontsize" : 16.0,
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p Tutorials",
					"varname" : "basic_tab[5]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 0,
							"revision" : 0,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 26.0, 1094.0, 580.0 ],
						"bgcolor" : [ 0.960784, 0.960784, 0.960784, 1.0 ],
						"editing_bgcolor" : [ 0.960784, 0.960784, 0.960784, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 16.0,
						"default_fontface" : 0,
						"default_fontname" : "Lato Light",
						"gridonopen" : 1,
						"gridsize" : [ 4.0, 4.0 ],
						"gridsnaponopen" : 2,
						"objectsnaponopen" : 0,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"border" : 0,
									"fontface" : 0,
									"fontname" : "Lato Light",
									"fontsize" : 16.0,
									"id" : "obj-9",
									"ignoreclick" : 1,
									"justification" : 2,
									"linkbold" : 1,
									"linkcolor" : [ 0.501961, 0.0, 0.25098, 1.0 ],
									"linkunderline" : 0,
									"maxclass" : "markup",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 880.0, 16.0, 186.0, 66.0 ],
									"presentation_rect" : [ 880.0, 16.0, 186.0, 66.0 ],
									"text" : "<a>Min</a><br/> Create packages and code objects for Max using C++"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-3",
									"linecount" : 2,
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 260.0, 387.0, 177.0, 47.0 ],
									"presentation_linecount" : 2,
									"presentation_rect" : [ 260.0, 387.0, 177.0, 47.0 ],
									"style" : "",
									"text" : ";\rmax launchbrowser $1"
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"fontface" : 0,
									"fontname" : "Lato Light",
									"fontsize" : 24.0,
									"id" : "obj-1",
									"linkbold" : 1,
									"linkcolor" : [ 0.501961, 0.0, 0.25098, 1.0 ],
									"maxclass" : "markup",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 200.0, 224.0, 504.0, 188.0 ],
									"presentation_rect" : [ 200.0, 224.0, 504.0, 188.0 ],
									"text" : "Take control of the underlying technology stack yourself: <a href=\"https://github.com/Cycling74/min-devkit\">use Github</a> and the detailed instructions in the <b>ReadMe</b> there to get started."
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-3", 0 ],
									"hidden" : 1,
									"source" : [ "obj-1", 0 ]
								}

							}
 ],
						"bgfillcolor_type" : "gradient",
						"bgfillcolor_color1" : [ 0.454902, 0.462745, 0.482353, 1.0 ],
						"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"bgfillcolor_angle" : 270.0,
						"bgfillcolor_proportion" : 0.39
					}
,
					"patching_rect" : [ 148.0, 310.0, 114.0, 23.0 ],
					"presentation_rect" : [ 148.0, 310.0, 114.0, 23.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"fontname" : "Lato Light",
						"fontsize" : 16.0,
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p \"Pro Workflows\"",
					"varname" : "basic_tab[4]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 0,
							"revision" : 0,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 43.0, 154.0, 1094.0, 580.0 ],
						"bgcolor" : [ 0.960784, 0.960784, 0.960784, 1.0 ],
						"editing_bgcolor" : [ 0.960784, 0.960784, 0.960784, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 16.0,
						"default_fontface" : 0,
						"default_fontname" : "Lato Light",
						"gridonopen" : 1,
						"gridsize" : [ 4.0, 4.0 ],
						"gridsnaponopen" : 2,
						"objectsnaponopen" : 0,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 264.0, 520.0, 66.0, 23.0 ],
									"presentation_rect" : [ 264.0, 520.0, 66.0, 23.0 ],
									"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
									"style" : "",
									"text" : "thispatcher"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-13",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 108.0, 520.0, 155.0, 23.0 ],
									"presentation_linecount" : 2,
									"presentation_rect" : [ 108.0, 520.0, 155.0, 23.0 ],
									"style" : "",
									"text" : "setactivetab \"Compile Code\""
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"fontface" : 0,
									"fontname" : "Lato Light",
									"fontsize" : 16.0,
									"id" : "obj-42",
									"maxclass" : "markup",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 664.0, 280.0, 216.0, 72.0 ],
									"presentation_rect" : [ 664.0, 280.0, 216.0, 72.0 ],
									"text" : "<b>Name your object</b>."
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"fontface" : 0,
									"fontname" : "Lato Light",
									"fontsize" : 16.0,
									"id" : "obj-41",
									"maxclass" : "markup",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 716.0, 176.0, 216.0, 72.0 ],
									"presentation_rect" : [ 716.0, 176.0, 216.0, 72.0 ],
									"text" : "<b>Select the package</b> to which your new object will be added."
								}

							}
, 							{
								"box" : 								{
									"data" : [ 7348, "png", "IBkSG0fBZn....PCIgDQRA...LI..DveHX....PSTrOV....DLmPIQEBHf.B7g.YHB..brVRDEDU3wY6cuGdbTdd1.+99cWcx1R1xFaYsIf4PAKygj.DBmRhgxAaC1RpWgbnDngzz3BzlHe.BI4KsJtMMAvXaouRaBGBIDZCWIzuhjroHCzRcaIP9Rg.IfQBrIPAjjsAe.Irkr188o+gzr6nUZk1UZmY2Q6yu+5clc1YdLW27NuZ1YdG.kRoTJkRoTJkRoTJkRoTSQMO2kWwlp3xmattNTdCiudzJoj0YlwLtHe8Xp7M9VX56Fo94Ijq0XjOoecLU9KeKLMSQtECYEhPMLMME8iCxlOlkUcnhKa2jrLQD6QNRey8qefm3P9wwV4e7kdlBUTYeKRVF..IMkVxLuP+33p7WddXZKUU2wCh+jQdT0S0McjmGlLF1HIK185nnCBe5HOcLS2Q0qrlhX3WjjgbudQjAi1UOyd83YNhWd7U9KOsmohLE8WkbPB.fjEwpl+46kGak+yyBSaIRceDHxUkpOOjwnmpaZFOKLY.+NjLkmFUnNH7oa7jvTyQp6BH4UNdaCANuUiytHu33qxM7ndl3eyDtEjksjHG6G0aN9pbgrdXZyQp8RI4EkVGb8RDLsRVOLEJM5UJNcbSSqjUCS297uhEBfWvJ1GSrRmhHSz0Q5BazuuMXTdFO+G5s4pq+9ngeQ..qU1Jo7FhvEQhEI.GOg8hZnq190dccn7dg8giwwEuEwc2PWstsj9be4NWP487iSwbJwaczA6bL9bwGpAkOvSCSMV8JmAH9f.C86wcf2ouemWd7T4VdZXZ1.035pfu6MfcD0KOdpbKOMLEBlk3ZwW1KOVpbOucLSzbpNMEQ1omdrT4bd8.vi2yDgn8LMMmuElhAqFlllyyBSMikWB.NY..QD6g.5vqNVp7CdVXJ57CUiq6xxWaCcusC6UGKU9AOKLEJTQmgqEeQu53nxe3ciYxfSOdaQzvTA.OKLQjHLYo1yTg.uqmIAen3GDq7a8riiJugmbWCrkYW2bngGK.fUjAdpdZar9AdUSy3I8LYJieXm1D3kdHfXdwwQkewSBSVZiGlffWvKNFp7OdRXhHQOSBzvTgBuILQ9Qh2Vvy6EGCU9mrdXZ03rKR.NMmksGQzdlJPj0CSm5BhrDCYI..hHu9ZOTqGLaeLT4mx9mlKbnyz0R5ScRAjrdXhPhGlDHZXp.hGL.bdVNsrwjmK6u+U4qx1gIBf3+kbCFUOMWgjrZX5NhT+ISxxA.DQ1ys7ts0U1b+qxukUCSgg8rbs3ylM22p7eY2SyIlyNQac7REZxtgIh3gIq1yTAmrYXhDH9o4hQMLUnIqEl1z7W0IQxYC.XEYe2TWs9lYq8sJXHqElLE4Z7R5o3JHk0BSTXhI6TQzvTAnr2XlbM3aA3+NqseUAFYqvjN3aU1ILM7U9d1..hH6UG7cgorRXJrHtmb30SwUfJqDlHSL3aQDMLUfJaMlo3gIRsmoBUS4vzvSJ7IF78Q6WCSEnlxgoYW0pVBImI.fHxaut2Y6cO0KKUPzTNLYBEJw3kfNdoBYS8wLI3bbZRve0Td+oBrlxgIRIdXxp+kbEzlRgogdfKS7nfeDRMLU.aJElpo5pOCWOvku12rqVd2rSYoBhlRgIJgheJNHPGuTAtoTXxXXhvD0wKUnapN.7D+lbV8ujqP2jNLsIbdkggmsSDQr8OnUeZTJvMoCSgiT0YRxv..BPG2x61VuYuxREDMoCSVW21ITusSTXJDlLLwfuE8ujSgoz.vSbOLwXwzdlTStvTyyc4U.fEC.HhDc+688z4sR0jKLYKpjyJ96dWAu3FvN5OqVUp.oIUXxDJw0WRz6rR0vlTgIw8schN3a0vlbC.20CbYLDU6YRAfIQX56M6qrRCMmDvPujc5n6t02XSJ.LIBSkLyPw6Uh.+l6FO6fY2RRETkwgIiXzInB0XJyGyjNAUnRgLNLQ3JLoSPEJWxnvzlp3xmKIOA..Qj9e4tdqWxaJKUPTFElBMyRbM6vI5fuUiPFdZtD+kbhnmhSMRYTXhlDuWTHfdmUpFgLqmIQRbZNpWV.0Hk1gosL65lCIOQ..Qji9Rc81un2UVpfnzNLIkNh2KJ+Vcv2pjk1gISHiq2vk56EE0nk1gI55kRH.02ibpQICF.dhWWp1X5yHmZzRqvzFq5xlI.ctmuiY2yd+MdaYoBhRqvTwRomAIc11NVOdli3g0jJfJ8NMmqWu7Bf9jnnFSo6Xlh+RblPzvjZLktgI28Lo+kbpwzDFl9z.g.vo6r7gA0dlTioILLctUuxSljkALz77sNUCpRkILLEhg9vtV7E7vZQEvMggIBDOLIPzvjJkRivD+PIVRzKVoJkRm+ZtyvoAsPCSpTZbCS2ZkW5rI4wALz8vz964Puh+TVpfnwMLUbokc5tV7k2.1QTOtdTAXiaXhhwUXRz4T.03Z7CSFdZNsEg5yHmZbM9gogmmuA.HEMLoFWSzeMW7vzQiY0Gf.03JkgogeTvqB.PD4v27d15q6aUkJPJkgINyRVhSaQPm.P7kJREXkxvTHXhGlHwK6OkiJHabFyDqwok.oC+nXTAaoLLI.mhSaB1o+TNpfrTOlIHK1oczAGTCSpIzXFlZDKMLRLuBHuWX9p9aYoBhFyvzbmekKx06Rt2dCcusC6ukkJHZLCS1vxumSaBrK+qbTAYiYXxvDgIQCSpzzXFlDYnwKMzBX29V0nBzFyvDIN9DKXecepVTAbo3RCviOdqnxq6GEhJ3KUWmoi2ow.RrW2WpDUf2nBS217psbRNWfgl33+Z66eYO9eYoBhFUXJbHd7wWPva.8tEPklFUXJTXtn3KP759YwnB1FUXRrxGv0hukOVKp.tQElLjwCShHus+VNpfrQ2yDDWgIzk+VNpfrQeoAHiDuogZOSpz1nBSD3CjnsUCSpz1XcQKiGlNZringIUZaDgoFwoVrqKXYzadOO99xMkkJHZDgoJl6ILeWK9NPufkpLvHBSgKMzBbs3d84ZQEvMxwLYkpbsj9axoxHiHLIHzw3ZQc7RpLxHCSzNWWKse+tXTAalQt.iGlDAZXRkQF4XlHqz0BZXRkQRZLSHdXRD6A7+xQEjkzU.WpvoEI50uKFUv1HBST3rbZa0vjJCkzXljxi2LlFlTYlj+gdiGlLZOSpLTRgIVpSqX1X862EiJXK4dlhGlFLVHMLoxHIGlJwoQ3A6WCSpLRJCS1xjA74ZQEvkbXh4jpPMsPxgI8lgSMokxvTe1ip8RoxHoyaBSkJsjxdllgc1ZOSpLRx20.5XlTSZo7zbkJ5XlTYljtqAjAcZOXIgK1+KGUPVx2ok84zTrr7Qs0J03H4Sy8dNMJRfFlTYjQN.bIwschMjFlTYlQNlIW2CSgzdlTYnjuz.ttg3RbK7pToij9q4RDlDi1yjJyj78.d7AfSXpbTasRMNFYXRP2waJiXV2UolPI8WykXNrjfZXRkQRZLStlCKo1yjJyLxdlhEy0jHu1yjJyLhvzAJJwo4DfHidyUpTaDgoMz81NrHxAA.LjkbGUuxiYr+ZJ0nMV2BJwOUGsgOww3yUpwzX8FJ3ki+ggjS0WqFUf1ne2oHxK4zlBOM+sbTAYi90cg0lHLQQCSpz1nBSVXdoDKo8LoReiJLcvdNvqJhbT..Rdb217pU+AeUokQEl1.1QT.zoyxEWh4z80JREXMlOcJBvy6zlPt.+qbTAYicXRv+oqE+D9TsnB3FyvTLDMdXhfWHzYGEUZXLCS2T2aqCqH6C.fjGyVVX803ukkJHJkOQuD3+J9FQ8TcpIVJCSh0F+TcBwmzeJGUPVJCSVZ2gSaBrhFwRC6OkjJnJkgo008190hH8..Px4N6ppP6cRMtFuI6KA.OhyBgBY9C79xQEjM9ybbB1ZhlrdnWh.03XbCS6u6CrcQjdA.LjevlV3J+n9SYoBhF2vzFvN5W.ZyYYZBeUdeIoBplvIHUaL6C5Zwqa03rKxCqGU.1DFld58zV6hUdS..RtfSKxwpCDWMllvvzCADSnbONKK.Wu2VRpfpzZd.efAjenHRT..C4EeGUuR82pSMJoUX5Vd215BHwkInHD5q6YUjJvJseCEXA1X7EH+7MO+5OIOohTAVocXZsc0xSKh73..jLLBiuk2UVpfnL7cmh7si2j3ZzdmTtkQgoF5p0egXkm.Xndmjhvs5MkkJHJyeqNEK1egHh..XHuplhT2kj0qJUfTFGlZXua8Y.vCjXM7+qduNo.ljuu4FXvidKVYnISUC4oN2HU9UytkkJHJzj4K83G9U6aEkWyQI4xFdUWvkLyS7m9388pGJKVap.lI8aByWpq27u0JxNA.HY4EYJ59gd+NUPaRGlta7rCBazqKwOyhYoMsvZWS1qzTAMSpSy4n89dktV9rVbXRtT..PtzkMyZ9m2dec7NYkpSEnLkegOuytequiHxyA.PxRIw+XiXokN0KMUPyTNLMzo6rWqUjA..LFdlyMRk24TuzTAMSoSy4n895beKu7ZdGRtR..RdVKeVK9sauuNetrw9WELjU+quZNR82OI+i..rhLf0Z+3qqm19uylGCU9qo7o4bKZW8b8hHu.vPyi3gLl+oMV0ksfr4wPk+JqFlVOdlifAwmxYhomjKp3PyXqMV8JmQ173nxOkUCS..MruV1s0hqVDIF..o4iUIC8SazCNVp7KYkAfmrs2WG6ZYybw6wXhOf7ZJq7EOu16syG0KNdp7CdRXB.X6804ytrxqoLR9wA.H4Ga4ku32u8d67W3UGSUtkmEl..Zu2N9WW9rpYwj7zA.H4kurxqYOs2aG5eg2zPd83XDzc+WmUFwb8ze+VhT204wGWUNfmOn3FP6CLv.xprh7L..jjFveXSQp8y40Gak+x2tkQ1xrqaNbF7eyX3YB.HhDUD6mYMc21C6W0fxa4a+45q8PsdvCSbYhHuHvPOPBjledSUW2U6W0fxa462LaMsfUUECEZGzvEC.HhXgfangta4t86ZQkc46WHw0r2stGIVrkJh7aA.HogFdWMGo90420hJ6xSuz.oR6u+q79WFOtelo3vWL4PukxI4xVV40f16sicLQeeU9obRXB.3wFX2G4hKdw+rPgvEPxiG.fjWzxKulpKu2NdzcNzDzpJ.Im+..rIbdkENRU++HMqvYch0ts8iXe1Mz81Nbtr1TYlbVOSNdL7VQOtdm0Oe9kW9IPxOD..IOkx.urULySn016aWZfJfHm2yjKroH082Xn4a3rBQjWCV6pZnm11YtrvTom7ovD..ZJR8WOAtSRFB.vJx6IV74VaOsn2wA44x6tGiVSWs7CDf5EQ5C.vPVgwfs0zBqcs45ZSM9x65YxwlVPcmQ3vbqjbQNqyZs2G6dfarAz9.4xZSM1xaCS..MuvkOeXJ8gI4E5rNQje0fP9T2TWs9l4xZSMZ47+ZtwS68sqCet8Z9GJaVy6XI4GA.fje.BbMW9LN4mc6u+q76x00nJg75dlbqopq+OmDaljEA.HhDyB7MVaWsrwI56p7GAlvD.vlqdUWXHF5gHY0NqSrRaG9vCdceiC8HGHWVap.VXB.XyGyxpNTwk8PIMNp2vFy9YW6dZ6WlKqsBc40iYZrr8Cu69Ntdm4CL+xqXVj77A.H4bH4WXEkWy62duc7z45ZrPUfqmI21RjZq0.yOljU5rNwZ2FjA9ianm12Wtr1JDEnCS..abgWwhJ1T7Oijmqy5DQ5AB9BMzcKOVtr1JzD3NMWxd79d0Ccb8Ny6e9yphY.fymCYV.3ZV9rVbEmaeg922A1WrbccVHHv2yjaMWc8WNHteRtPm0IV44sBt501SKubtr1JDj28ayMUzP2s7Xv1+GRr1s4rNZ3GwXvy0b00sFLM6+4Ieyz1+i6vWjyMRx3SIhVQdRHQut0z819exk01zUSaCS..MuvZOUXLO.IOKm0M7jg+WcMc0x8mCKsoklVGl..VMN6hNsp+f+kf7a3bORA.HhzhDM10ul8t08jKquoSl1Glbz7BV04gvg9Ij7jcVmXsuqk3Oasc05OKWVaSWTvDl..Zr5UNiJQ3amD2HIi+ucQr+yRT6Mp8RM0TPElbr4pV0uenPgtO223ch09tBvWcMc25OMWVaAYEjgI.faad0VdokX1HI+ScudqU1ZrAF7FV+9ej2NWUaAUErgIGMEotKgf2qyCBJ.fHxgfH2TCc258l6prfmB9vD.PiyeoypxvUdqIOVJqHOYrAis50uustqbY8ETngIWZp55+3DxOjFyo3rNQjiXAZ7WzUKa9g.zeiuwgFlRRiXokVYjJ+1DX8jL9qKVqU90VwtZ8MtPpogoTn4H0dl.l608UOen41b4N2+fG7asg8si9xk0W9n.+sfhWo8d6rmys2ptuRmUIuO.tPRVDIMj77JikdsKqhSY2au2N6LWWm4SzdlRCarpUcBEGJz2206jX.LzE6r+Ajuxs7ts0Utp1xmngoLPSUW2USxsPx3ubgrh7dD1u496psu+F.r4x5KWSCSYnu2ruxJKalEc6D3KMxeRF4WJQis50r2s9axk0WtjFllj1b008IBQbWjlk3rtge4Wu4nc0y2d83YNRNr7xIzAfOIs8957+4b6Mz8TV4yKp.bACMUTSCIuPS4y5pW1rVbGauuN2cttN8SZOSYA2Qj5Okh.tKRdQtWuH1G7nwN7Zt48736MGUZ9JMLkE0TjZ+hT3FowLOm0Ihb.QjadMc258go4S5qZXJKanoAnR1Lo4ZbudQj+CKrqdsc01z1qMkFl7HaNRsWpA7GXn4jbVmUjA.v26.c8JeuMfcdzbX44IzvjGZS37JKTjp9KH3M4LU.A.HhzQLQV855t0+ybY8ksogIevlVPcmQnv7tMjmmy5DQD.4dsuO9Zq8PsdvbY8ksngIeRi.l4Fo1aPf46ZHqvY8hH8.fFZnqV944vxKqPCS9raad0FozRL2II+CbudQjGQjn2XP9ADUCS4Hao55p2PdmNuHh..DQ5yJ1+OGr61tyf3uymFlxgZdtKuBojR+tj3FHY748AQjeYznxWd86s0eatr9xTZXJOvVhT+4a.tGRdZNqSDYPHxsgtG36DTl2y0eat7.au2Ndqiq2YdOKn7JNpcnaDuvjLDI+jn7vW0kOqS942deuRd+7dt1yTdlsDo1Eaf4dH4mvYchHV.4uc+RruY97qMMMLkehMGo9qW.t0jtLB6JlD65VW2a8oxkEWpngo7XMO2k+AQokdWj7JbVmHhUDooXcumuU918LkFlB.1Rj5tNCXSjb1NqSrRmhD8ZWSOa6WkKqM2zAfG.r8d674urhNoGvDlKwYJAhjGCn4Kthxqgk2aG+W4CuSi0dlBXZp559RC+PMTty5DQ9kxQG7ZWy67HuZtr1zvT.zVppti2Dh+jj9K95yB4qr1tZ8GmqpKMLEP0Hfoxpq6lH4eMIK1Y8hXePz+.WeC6u82yuqIMLEvso4eke3vEE9AS5oj42EyZ+L987hvzp4A7BQqeeOxKreI1GUD683rNRdBgLlmpoH0ci9Ysn8LMMRyKr1qBFy8Px43rNQrO39G7fq1OlnMzvzzLadAW4IFJbQOTRydKuXrnCV2516i7Zd4wVCSSC0LVdIHRoM6d95TDY+wf8ytttZ6I7piqFllFqoH0+EHvOv4U9gHRLQvZVS2sbmdwwSCSSy0zBW44PS3GNo6nysr+tZ4lx12MmZXp.PSKXUUgvgZIomNlGFc0+eX17FuSCSEH1DNuxBGYgO.I+TNqyJxSdfAOPsYq+ROMLUXgMUc82twvaxYEhX++Gsuirh0+dO19mx67o5NPE7zT0080LFys4rrHxyYee4RlpOLnZXp.UyUW+pAw224ohQD4Wg96+RmJ+ld5OmRApF5tk6Vf8OYnGSc.RdNnzR2ViXokNQe2TQCSEvVSWs8irB9ScEn9DyMxb9Gwj7LV5cZYAts2WGO2JJuldclVpI4RVV4Kt316sy+0LceogIEZu2Nd5kMqEWAIOefg5gZYUrjc1ducryLY+nmlSA.fCzcq2rXsaK9JD4d2z7W0uWlrOzvjB..a.vhAF3yKhrK..CYEgCa9Ie5L3rWZXRE2PWV.6mQD4n..zXN+Odj5aHc+95XlTiP681YOKeVK1RxKY3UcAWbwmx8+DGoydmnuq1yjZTNP2G71EQdQ..RVdoEa1T578zvjZT1.1QTq09m4rLM7y0bU0dwSz2SCSpwzZ6os+CQr+CwWQHdqSz2QCSpTp+AjaQDoe..RyGayUU6UNdauFlTozvuTF+9NKGJjYCi21qgI03RhF61DQNL..IO6lW3pVdp1VMLoFWqYuacOhH+.mkEFJkOXmZXRMgXT92m3NK.WYSUuxiar1NMLolPMruV1M.dL..RZHB8kGqsSCSpzh00o5.4mcr1FMLoRKltG3QEQ5E.fjmbyKr1ScTai+WVpfnFP6CHh7nNKKj0m71ngIU5ixCGu4v2YltogIU5Kp7jtV5il785jFlTosgulSuA..ImwEDotyv8mqgIUlQvyjnMOG2ejFlTYDR7htZeRt+LMLoxHhcnSyA.PAKx8mogIUFwhDgIAXD+rJZXRkYLXONMIv7F4GoTYhXLwjCFQwt+HMLoxHGM5POFTCqD2elFlTYDZh5ddvbD4GMLoxHEUT33uy6fHiXtbRCSpLhIpTY7EHOvH9LeuZTAZwHi+WvI.ZXRM4EJDNdm1Dxa59yzvjJCYh+SnHBGw6hEMLoxTmtSCQvq39CzvjJSclNMD6fOu6OPCSpz1lWvUdhj7X..DQNz516i76b+4ZXRk1LgB6dlP4o.fLhO2eKGUPFIbl.vfE3eO4OWCSpzxpwYWD.WQh0HOdxaiFlTokZh7AVpy69WQj2Xsc05ym71ngIUZw.i6mh2VG6sQol.MhkVJA9zwWQzXO3XscZXRMglajJqkjyF.PDYWMr2s9Li01ogI0DSf6Y8jGHUalFlTiqlme8mDF9RBHhDC82+8kpsUCSpwWQX0jj..hf+kF1e6uUp1TMLoRoFwRKEh7kbV1Zs203s8ZXRkRUV8b97zXlG.fHxqcn8z1iNdauFlToDIc+R34uaC.1TtwPCSpTnoH0cIj7L..DQ56HGoue3D8czvjZLQv04zV.9Qe8C7DGZh9NZXRMJCOeUtB..QDKGDMmNeOMLoFMiYcNWN..z5vScyS7WyCKIU.TSKXUUI.WSh0H2Q59cC6EEjJ3hgL+4jrD..wZe5F5t0eQ59c0dlTwsIbdkAfavYYQPZ8FvzgFlTwYVXU+QtuHkGnmVe3I56Lhuu2TVp.HZLH9EozJ1lmnKRYxzwLo..PyUW+kQxk..XE48N5QwOJS2GZOSpgIeEWKbe2x611D9pmOYZXRgMtvqXQf7J..DQjXCF6uaxrezvjBEwh9xjz..H.ae86aq6ZxrezvTAtFwRCSx+XmkEQF26YowiFlJvM2HyYEjrZ..QjtNX2GbaS18kFlJzQy0lXA4mrArinS1ckFlJfcqUdoyFhrp3qvJo7IOIcngoBXkU5LVIIKE.vZkecC8z1NmJ6OMLUHyDptDKH+SS4c2TcGnBlZDKMLDY4NKSQZYptO0vTAp4DoxygjkC.Hh75S0SwAngoBVTjDyBbBdxwYSSaZXp.EAOWm1BwNxF6SMLU3J9rlKhM3ylM1gZXp.zVlccygFdr..hH8+T64Qd4rw9UCSEfLyfteQMuqGBHVVY+lM1Ip.FwdBIZiWab1xLhFlJHY1mqEFyYAtICNwahZ5nlqt95r.K3k69M+w2Md1Ay00iRoTdi+WPn4WKnIfwvz.....PRE4DQtJDXBB" ],
									"embed" : 1,
									"id" : "obj-39",
									"maxclass" : "fpic",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "jit_matrix" ],
									"patching_rect" : [ 100.0, 5.0, 147.0, 383.0 ],
									"presentation_rect" : [ 100.0, 5.0, 147.0, 383.0 ]
								}

							}
, 							{
								"box" : 								{
									"data" : [ 1044, "png", "IBkSG0fBZn....PCIgDQRA...zB...vLHX....v.FGXb....DLmPIQEBHf.B7g.YHB..CrbRDEDUnEX6X9EZaVEFF+447805ZVaVajklDmayAtoVPD+ybAG1Kz1IqsK6JAgoWnfLQvVjJJCgP8eCmNa5M57BUPYJnH1V2fN2MJBBhdgW4racLbBMyU0Ii1o01783EsIKMI8KoqMeoWjeWky46kb9Ex4bdee+.pRUpRUpRUpRAHNfIQ3N2Xk1C2vj6D9CFqER6CVIjoTIOossXT.7HuU3NuyJfOkD4IM.hRRZA6C441ThTPoA.ngOv.g55g7XeJIVfzG1e6A.wVu5Ssd83E9GVEkEHjku51AIY5wj71aJxdeTuWK2YARSxcja.T3kiiVWi2oTwI2+5ila.zvaLP3F61i7ojHizwALhX6ELJxW3v9aOfmYUQHiz9CFqECo+BEDIaztdeun2ok6jQZiU96mygmt+lis4xqNkFlr9Pd6myFRVqwhuZ4WohyUOHR2kddVUjd2..bv00QS.XaEK3UKo2M..9pybuYmTwMVMjd2F.PzD0Uiktr.NMDFCPiAwo8F8JL1..jLpj9K.Ml.OCkFCjcPx6F.P.Go6wG74qjhlMD.H95as99l3alL6GjHTrcarLGG.vQZhYRM0M8b+9ImpRHYtX..xUX.fKcggFQRmC.vPt9ZsVaOdsbKFKZYm8A33.8RYMUuyeKSEGWqU96FenORR+Bvbox84y907FsbGWk9y.RI4bfziowr+Dg6psxuVtSQ6JomjC+ER5yyLAsd+JcEekTqTynY2ujtH.fgbC10W2PUxFCJIo6M4w9CA7DRxA.fzry.2PfODyekoWyRZQ6O7ddFKi0.oG6337oL4zOV2XDOMCo0RI3SL4ne+tpea9I4bulAxVPC16rMtwu7ql9r+S4Qw7YIIM.vHSN5I2UC2x5R2DLI2ro1Z1W69t4e5DSc5ysxqX9bMumbfHw5EfGJc0gRRR3suBQ7CL9f+4Jmh4yx5fThPw1MM7CHYvzyIo+VPuxLotxQJW0prrO8mHXWMSaq2ijcj87R5R.5ckR8N8j7Xme4tNYyJ1UVIhr2NovaRCWPGPRR.3aEvmLKzw6c7g9sk6ZshdO6Sh6plaMzFdbCwyRiYqEJFImSIguFT+PpY4Od4KdlQ6C+7+sTVmxUxA1ej8zEg4oHvCRR6EKv4SXcdHbVPkDfSLWmR7eEQJJUCg90tSN7GC.UNkNCuQysErFyZeXRzI.teRV20x2ibRsutSN7QA73zvwQqqooHMdeTb6f3d.vc.fMQxhVNQES5BQbba01P3srEKXsIRFh.WOj7ChqCBVfbF4fS0yEF7nX9sGUoJtv+ukWdzvoyzHJ.....jTQNQjqBAlf" ],
									"embed" : 1,
									"id" : "obj-37",
									"maxclass" : "fpic",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "jit_matrix" ],
									"patching_rect" : [ 296.0, 4.0, 45.0, 51.0 ],
									"presentation_rect" : [ 296.0, 4.0, 45.0, 51.0 ]
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-28",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 80.0, 520.0, 24.0, 24.0 ],
									"presentation_rect" : [ 80.0, 520.0, 24.0, 24.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-24",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 500.0, 404.0, 172.0, 23.0 ],
									"presentation_rect" : [ 500.0, 404.0, 172.0, 23.0 ],
									"style" : "",
									"text" : "join"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-21",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 500.0, 120.0, 41.0, 28.0 ],
									"presentation_rect" : [ 500.0, 120.0, 41.0, 28.0 ],
									"style" : "",
									"text" : "sel 1"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-18",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 500.0, 88.0, 49.0, 28.0 ],
									"presentation_rect" : [ 500.0, 88.0, 49.0, 28.0 ],
									"style" : "",
									"text" : "active"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-14",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "clear" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 8,
											"minor" : 0,
											"revision" : 0,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"rect" : [ 59.0, 104.0, 640.0, 480.0 ],
										"bglocked" : 0,
										"openinpresentation" : 0,
										"default_fontsize" : 12.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 1,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 1,
										"objectsnaponopen" : 1,
										"statusbarvisible" : 2,
										"toolbarvisible" : 1,
										"lefttoolbarpinned" : 0,
										"toptoolbarpinned" : 0,
										"righttoolbarpinned" : 0,
										"bottomtoolbarpinned" : 0,
										"toolbars_unpinned_last_save" : 0,
										"tallnewobj" : 0,
										"boxanimatetime" : 200,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"description" : "",
										"digest" : "",
										"tags" : "",
										"style" : "",
										"subpatcher_template" : "",
										"boxes" : [ 											{
												"box" : 												{
													"fontsize" : 12.0,
													"id" : "obj-12",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 21.0, 365.0, 94.0, 22.0 ],
													"presentation_rect" : [ 21.0, 365.0, 94.0, 22.0 ],
													"style" : "",
													"text" : "prepend symbol"
												}

											}
, 											{
												"box" : 												{
													"fontsize" : 12.0,
													"id" : "obj-11",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 21.0, 320.0, 129.0, 22.0 ],
													"presentation_rect" : [ 21.0, 320.0, 129.0, 22.0 ],
													"style" : "",
													"text" : "v current-min-package"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-10",
													"maxclass" : "button",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 28.0, 98.0, 24.0, 24.0 ],
													"presentation_rect" : [ 28.0, 98.0, 24.0, 24.0 ],
													"style" : ""
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-6",
													"index" : 1,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 28.0, 61.0, 30.0, 30.0 ],
													"presentation_rect" : [ 28.0, 61.0, 30.0, 30.0 ],
													"style" : ""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-9",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "int" ],
													"patching_rect" : [ 147.5, 202.0, 128.0, 22.0 ],
													"presentation_rect" : [ 147.5, 202.0, 128.0, 22.0 ],
													"style" : "",
													"text" : "conformpath max boot"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-5",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 5,
													"outlettype" : [ "", "", "", "", "" ],
													"patching_rect" : [ 143.0, 264.0, 151.0, 22.0 ],
													"presentation_rect" : [ 143.0, 264.0, 151.0, 22.0 ],
													"style" : "",
													"text" : "regexp /.*/ @substitute %0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-1",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 5,
													"outlettype" : [ "", "", "", "", "" ],
													"patching_rect" : [ 143.0, 234.0, 175.0, 22.0 ],
													"presentation_rect" : [ 143.0, 234.0, 175.0, 22.0 ],
													"style" : "",
													"text" : "regexp /source @substitute %0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-7",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "bang", "clear" ],
													"patching_rect" : [ 28.0, 132.0, 473.0, 22.0 ],
													"presentation_rect" : [ 28.0, 132.0, 473.0, 22.0 ],
													"style" : "",
													"text" : "t b b clear"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-4",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 163.5, 306.0, 96.0, 22.0 ],
													"presentation_rect" : [ 163.5, 306.0, 96.0, 22.0 ],
													"style" : "",
													"text" : "prepend append"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-2",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 147.5, 173.0, 120.0, 22.0 ],
													"presentation_rect" : [ 147.5, 173.0, 120.0, 22.0 ],
													"saved_object_attributes" : 													{
														"filename" : "min-package-list.js",
														"parameter_enable" : 0
													}
,
													"style" : "",
													"text" : "js min-package-list.js"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-39",
													"index" : 1,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 196.5, 421.0, 30.0, 30.0 ],
													"presentation_rect" : [ 196.5, 421.0, 30.0, 30.0 ],
													"style" : ""
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-5", 0 ],
													"source" : [ "obj-1", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-7", 0 ],
													"source" : [ "obj-10", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-12", 0 ],
													"source" : [ "obj-11", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-39", 0 ],
													"source" : [ "obj-12", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 0 ],
													"source" : [ "obj-2", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-39", 0 ],
													"source" : [ "obj-4", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-4", 0 ],
													"source" : [ "obj-5", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-10", 0 ],
													"source" : [ "obj-6", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-11", 0 ],
													"source" : [ "obj-7", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-2", 0 ],
													"source" : [ "obj-7", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-39", 0 ],
													"source" : [ "obj-7", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-1", 0 ],
													"source" : [ "obj-9", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 500.0, 152.0, 28.0, 28.0 ],
									"presentation_rect" : [ 500.0, 152.0, 28.0, 28.0 ],
									"saved_object_attributes" : 									{
										"description" : "",
										"digest" : "",
										"globalpatchername" : "",
										"style" : "",
										"tags" : ""
									}
,
									"style" : "",
									"text" : "p"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"items" : "<empty>",
									"maxclass" : "umenu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 500.0, 184.0, 184.0, 28.0 ],
									"presentation_rect" : [ 500.0, 184.0, 184.0, 28.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"fontface" : 0,
									"fontname" : "Lato Light",
									"fontsize" : 16.0,
									"id" : "obj-11",
									"linkbold" : 1,
									"linkcolor" : [ 0.501961, 0.0, 0.25098, 1.0 ],
									"linkunderline" : 0,
									"maxclass" : "markup",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 80.0, 396.0, 336.0, 116.0 ],
									"presentation_rect" : [ 80.0, 396.0, 336.0, 116.0 ],
									"text" : "Once you've created your object, the project will be generated and opened automatically in your IDE (Xcode or Visual Studio). \n<br/><br/>\nYou can always <a href=\"Compile Code\">regenerate or compile it again</a> in the future in the \"Compile Code\" tab.\n\n"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 500.0, 472.0, 66.0, 23.0 ],
									"presentation_rect" : [ 500.0, 472.0, 66.0, 23.0 ],
									"style" : "",
									"text" : "min.project"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-40",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 8,
											"minor" : 0,
											"revision" : 0,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"rect" : [ 59.0, 104.0, 640.0, 480.0 ],
										"bglocked" : 0,
										"openinpresentation" : 0,
										"default_fontsize" : 12.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 1,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 1,
										"objectsnaponopen" : 1,
										"statusbarvisible" : 2,
										"toolbarvisible" : 1,
										"lefttoolbarpinned" : 0,
										"toptoolbarpinned" : 0,
										"righttoolbarpinned" : 0,
										"bottomtoolbarpinned" : 0,
										"toolbars_unpinned_last_save" : 0,
										"tallnewobj" : 0,
										"boxanimatetime" : 200,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"description" : "",
										"digest" : "",
										"tags" : "",
										"style" : "",
										"subpatcher_template" : "",
										"boxes" : [ 											{
												"box" : 												{
													"id" : "obj-6",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 500.0, 194.0, 77.0, 22.0 ],
													"presentation_rect" : [ 500.0, 194.0, 77.0, 22.0 ],
													"style" : "",
													"text" : "route symbol"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-5",
													"maxclass" : "button",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 205.0, 124.0, 24.0, 24.0 ],
													"presentation_rect" : [ 205.0, 124.0, 24.0, 24.0 ],
													"style" : ""
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-2",
													"index" : 1,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 409.0, 47.0, 30.0, 30.0 ],
													"presentation_rect" : [ 409.0, 47.0, 30.0, 30.0 ],
													"style" : ""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-35",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 205.0, 340.0, 173.0, 22.0 ],
													"presentation_rect" : [ 205.0, 340.0, 173.0, 22.0 ],
													"style" : "",
													"text" : "combine path / package_name"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-29",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 5,
													"outlettype" : [ "", "", "", "", "" ],
													"patching_rect" : [ 205.0, 288.0, 233.0, 22.0 ],
													"presentation_rect" : [ 205.0, 288.0, 233.0, 22.0 ],
													"style" : "",
													"text" : "regexp /min-devkit/extras/ @substitute %0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-27",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "int" ],
													"patching_rect" : [ 205.0, 230.0, 166.0, 28.0 ],
													"presentation_rect" : [ 205.0, 230.0, 166.0, 28.0 ],
													"style" : "",
													"text" : "conformpath max boot"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-26",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 205.0, 158.0, 39.0, 28.0 ],
													"presentation_rect" : [ 205.0, 158.0, 39.0, 28.0 ],
													"style" : "",
													"text" : "path"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-18",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 205.0, 194.0, 85.0, 28.0 ],
													"presentation_rect" : [ 205.0, 194.0, 85.0, 28.0 ],
													"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
													"style" : "",
													"text" : "thispatcher"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-39",
													"index" : 1,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 50.0, 378.0, 30.0, 30.0 ],
													"presentation_rect" : [ 50.0, 378.0, 30.0, 30.0 ],
													"style" : ""
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-27", 0 ],
													"source" : [ "obj-18", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-5", 0 ],
													"order" : 1,
													"source" : [ "obj-2", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-6", 0 ],
													"order" : 0,
													"source" : [ "obj-2", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-18", 0 ],
													"source" : [ "obj-26", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-29", 0 ],
													"source" : [ "obj-27", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-35", 0 ],
													"source" : [ "obj-29", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-39", 0 ],
													"source" : [ "obj-35", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-26", 0 ],
													"source" : [ "obj-5", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-35", 2 ],
													"source" : [ "obj-6", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-35", 2 ],
													"source" : [ "obj-6", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 416.0, 304.0, 24.0, 23.0 ],
									"presentation_rect" : [ 416.0, 304.0, 24.0, 23.0 ],
									"saved_object_attributes" : 									{
										"description" : "",
										"digest" : "",
										"globalpatchername" : "",
										"style" : "",
										"tags" : ""
									}
,
									"style" : "",
									"text" : "p"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"patching_rect" : [ 500.0, 372.0, 138.0, 23.0 ],
									"presentation_rect" : [ 500.0, 372.0, 138.0, 23.0 ],
									"style" : "",
									"text" : "dialog New Object Name"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 500.0, 248.0, 92.0, 92.0 ],
									"presentation_rect" : [ 500.0, 248.0, 92.0, 92.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-5",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 500.0, 440.0, 112.0, 23.0 ],
									"presentation_rect" : [ 500.0, 440.0, 112.0, 23.0 ],
									"style" : "",
									"text" : "create_object $2 $1"
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"fontface" : 0,
									"fontname" : "Lato Light",
									"fontsize" : 16.0,
									"id" : "obj-9",
									"ignoreclick" : 1,
									"justification" : 2,
									"linkbold" : 1,
									"linkcolor" : [ 0.501961, 0.0, 0.25098, 1.0 ],
									"linkunderline" : 0,
									"maxclass" : "markup",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 880.0, 16.0, 186.0, 66.0 ],
									"presentation_rect" : [ 880.0, 16.0, 186.0, 66.0 ],
									"text" : "<a>Min</a><br/> Create packages and code objects for Max using C++"
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"fontface" : 0,
									"fontname" : "Lato Light",
									"fontsize" : 16.0,
									"id" : "obj-16",
									"maxclass" : "markup",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 168.0, 52.0, 296.0, 128.0 ],
									"presentation_rect" : [ 168.0, 52.0, 296.0, 128.0 ],
									"text" : "Creating objects begins with creating a Package to house them. <b>If you haven't yet created a package</b>, go back and do so now. Then come back to add objects to the package.\n\n"
								}

							}
, 							{
								"box" : 								{
									"angle" : 270.0,
									"bgcolor" : [ 0.290196, 0.309804, 0.301961, 0.0 ],
									"border" : 1,
									"bordercolor" : [ 0.32549, 0.345098, 0.372549, 1.0 ],
									"id" : "obj-8",
									"maxclass" : "panel",
									"mode" : 0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 148.0, 4.0, 332.0, 160.0 ],
									"presentation_rect" : [ 148.0, 4.0, 332.0, 160.0 ],
									"proportion" : 0.39,
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 0.658824, 0.14902, 1.0 ],
									"fontname" : "Arial Bold",
									"hint" : "",
									"id" : "obj-93",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 632.0, 280.0, 20.0, 20.0 ],
									"presentation_rect" : [ 632.0, 280.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"style" : "",
									"text" : "2",
									"textcolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 0.658824, 0.14902, 1.0 ],
									"fontname" : "Arial Bold",
									"hint" : "",
									"id" : "obj-31",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 688.0, 188.0, 20.0, 20.0 ],
									"presentation_rect" : [ 688.0, 188.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"style" : "",
									"text" : "1",
									"textcolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"hidden" : 1,
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-2", 0 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"hidden" : 1,
									"source" : [ "obj-13", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"hidden" : 1,
									"source" : [ "obj-14", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-21", 0 ],
									"hidden" : 1,
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 0 ],
									"source" : [ "obj-2", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"hidden" : 1,
									"source" : [ "obj-21", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"source" : [ "obj-24", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 0 ],
									"hidden" : 1,
									"source" : [ "obj-28", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"source" : [ "obj-40", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-24", 1 ],
									"source" : [ "obj-6", 1 ]
								}

							}
 ],
						"bgfillcolor_type" : "gradient",
						"bgfillcolor_color1" : [ 0.454902, 0.462745, 0.482353, 1.0 ],
						"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"bgfillcolor_angle" : 270.0,
						"bgfillcolor_proportion" : 0.39
					}
,
					"patching_rect" : [ 65.0, 191.0, 129.0, 23.0 ],
					"presentation_rect" : [ 65.0, 191.0, 129.0, 23.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"fontname" : "Lato Light",
						"fontsize" : 16.0,
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p \"Create an Object\"",
					"varname" : "basic_tab[3]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 0,
							"revision" : 0,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 26.0, 1094.0, 580.0 ],
						"bgcolor" : [ 0.960784, 0.960784, 0.960784, 1.0 ],
						"editing_bgcolor" : [ 0.960784, 0.960784, 0.960784, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 16.0,
						"default_fontface" : 0,
						"default_fontname" : "Lato Light",
						"gridonopen" : 1,
						"gridsize" : [ 4.0, 4.0 ],
						"gridsnaponopen" : 2,
						"objectsnaponopen" : 0,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-6",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 192.0, 408.0, 76.0, 23.0 ],
									"presentation_rect" : [ 192.0, 408.0, 76.0, 23.0 ],
									"style" : "",
									"text" : "route symbol"
								}

							}
, 							{
								"box" : 								{
									"data" : [ 8560, "png", "IBkSG0fBZn....PCIgDQRA..AzE..DvVHX....fcQ2kp....DLmPIQEBHf.B7g.YHB..f.PRDEDU3wY6cmGccVcduG+2y9niFrrrsjGz.DHgB1FGH2vnsgPnoI.B7XtMzlodSS5PZ5jMXnIs21pkyckQiAql6s4dyPaRGRZSHIdBhbfzTmlfcbBPnPLxFBTS.IKaPBaIaqgy4849G1miNQVxZ5LXez2OqEq0d+N9.X+Sasemj...........................lPtuYtpY0bMMNiBcc..TLJLzEXUp2sJqreiBQw..Tr6zCck8AjY+VEhhA.nXmkYmMMuU7FBwK4Ib289Sl7W4t6XaOegpv..JF8KMRWqjvGPRxLyJMVLFsK.PVV5P2lzhJUtduYrNBcA.xxRG5VScW7JsPX1o5alcwM2vpttBSYA.TbZvoWHXefSe01+i7Xs..Tzyjj1XMK67Jo73GvLKVlqzcuK0Vu0uF0ReElxC.n3RPRJVYk79FZfqjjYV0dcks77eYA.TbJHIYl89GoMvLlhA.frkv8U2JeylYW7HtElt06o9kOm7XMA.TzJDrg6BnMHyr3wUr2U9pf..JlEjYuiQcqXJF..xJBlYUNZajY1Uee0s5KMeTP..EyNsW3Mi3FFbFsK.vjzXNz0k8daZbr8..3zURxjIeeJXgfrf6QWZHD6tjjbOpcI+i4dvbEEBxByXF27rzQ+NcVnKZ.fyU8K8pcrIcikWcCU+pAyJSRpuD8T6c2wCcnBSoA.T74WZ5BVu1YulzOJU+3wp7Vy+kD.PwqSaNZc4aMituy7Xs..Tz6zBcSH80b2cIIS5s8waX0y9z2M..LQbZgt2Uaa4W3t1kjjYVISS51y+kE.Pwog8V.yrnuR51R+w4uxA.n31vF51ae5eHx8iJIYl852T8q3lxukE.PwogMz8C+JasaI82kpuYwVadqh..JhMhOgYQIF3y3tGcpt258V2Ju57TMA.TzZDCcuyC8.Omb80kN4mj8XgvmJ+UV..EmNiuKERjH4eo69.RRlY+ZMW2JZL+TV..EmNigtq6va6YkqO+facrOcS5FKImWU..EoF02ZXdxjeT28iIIYlc4UW+r9yx8kE.PwoQMzcsGZac3QQ+UoWfY+02WCqbA4zpB.nH0X58iaWGbqM6dzdjjBlUVP1Wf2st..ieiofy0KE4IS76L3EUK7lptgU+WMZ6G..9kEartgsbrm4PMV0BjY1a4TK5MeyUM+GYGcuumKGUa..EcFWSQPWsskOlG4eWIIyrPPguxmZ1qrgbSoA.T7YbE5tdon9iN161cuMIofYys7xBeyMpkTQto7..JtLtuXX2cGOzgR596zcOojjY1hi0PseUtvZ..itw7b5loczy9dgaspEdXyrkIIYlsvxm9BmSK8z5ClcKO.fhKSnPWIoV5t0exsT0BqvL6MIIYlcs2xzWv.szy99OxdkG.PwkIbnqjTKc252swpV3kXlc4RRlYu0aY5KruV5o0eP1o7..JtLoBckjVb2gsWwzm80YlcQRRlYusFqZgIZo6VYDu..CwjNzcm5vIWbUW78WgB2fY1EJcx2HYMV0B8V5t0cN4KQ.fhGS5PWIoc1y9GXwkW68WQn72TFAuukaopEN6E2cq6XmRd137..bttrRnqjzNO9A5ewS+h+ZkK6ZLy9UjN4sSVEUsvKawcW6V2oNPhr04B.3bUV19.1jVTo0T+7+Grf8alZYtGsmj826puyWdGsmsOe..mKIqG5l531bCqdilY2QpE3t+RIihV8cdvs9SxQmS.fy5k0ldggpktacGMV07eYI6lMyBlYyPl89tkJWvg2QO66QyUmW.fylkqFoaZapgU8VMYeMyrZRsrH2+mGH4w9f2cGOzwx0me.fyljyCckjt24srKJDK98GB1UjZYt6Oahj58rtN17dxG0..vYCxYSuPl1wwdltVbO09kqnpxp0L6pjjLypIX58eaUsPe5c25ObubakAfo.xKizMSap9U8tMy9aMylYpk4t+nIR3u+0cns7j465A.HeJuG5JIsg5tsKrzPo+ilY2Ppk4tOfK8w5ps8+IVu1a+Eh5B.HWqfD5JI0jTXVMr50Ej9nlYkmZ4dTz9cS+gqsss7cKT0F.PtRAKzMk6qgUtffBeQyrqOyk6Q9+h5q26dMc1xKVnpM.frsBdnqzIG0a0Mrp+.S1GyLaVoVt69wk6anSk7Su9129wKj0H.P1vYEgtoro4shZUIw1Xvr2SlK2c+kjze8OnsM+k+5RIKPkGPdSypwxRNGulnRqnpfmX5w7RpxkWoapzf6kDYg3A2KwMkzLKgG4I8fOfI6XdRumfotU+8eT0oN7ZTK8Un+2GLnypBcS4dqeU2PLy1jY1Ul4xc2aMJR+OuiCt4uYgp1.lL1nVREg5p60JoWqLc9A4mmL0fjcdRpVIMGIMayromsNmt6GQRGRx6Pt8ht7etY1yEkzetjwzO+tZaK+hr04BityJCckRMkCq78YJ7wLypOy04t+nQJ5idGss0sVnpOfQRS0u7oMKK17CxluIMeW9BbYWrI85LypsPWeCk69qJo+SI++TtdBOYzd55Pa6oVuTTgt1JFcVanaJMU+xmV0J1ZMy9yx7d6URJJxebon+Wqs8stYwCWAxyZR2X4yr9pVTvJ4xkqKyLsHIsHIcglYSp+tk69.R5UjT2tqdLScKodb4CHYCXxGvkkvjh4tWhYVL4JtLMcIe5RpJIalRZtlYwm.m+i3R6JH8Cib8u2U6cs60qcxqm0rfy5CcSYiy3lqojJq3iHy9iLylVlqy8nmVxtmNaa++SbO9hbgOdCqd1SySdkRgqvL8FkrqPRWhY135o57j2O59KXt87R5W3xayL6khTzKEkLbPyG3kikH4KulNa4nYoR213Lt4p8JKcdw8Rp0C50J2uHyzE4tcQloEl46EkyPc+ptzCaRe6j8ehuMulVm3NmIzMkMT6MMu3gJuayze3oG95sI2+aRbrS74W2Q+NcVnpQbtslqowYn3kdUJXWqL6ZjzUm5KhxXg69.x0y4R6WR6yk1ev09cKwy2U6a+EOa6Wau4ZZ778RK6MHydCVvtR490al0vHs8t6QR5G3x+WGH4wu+6tiG5P4wx8bdmyE5lRy003bUnr6Tx9PCcZGb2Ogj+O4IS72r1NdfmpPUi3re2tTrkL2kcYkTR7EKok3lVrIsPyrvnsut6Qx8mUl8jtzSZQQ+LIs2e1Aeom4yoGcfbe0m6rgZWwqKtE65sftAI0nY1ELbam6dR4564VzWrq1d1uI+llityYCcSo4ZZbFQkW9GLHs1g6mN6t+u6J5+G+ABHIcO0u74D2hsTWZoR1RLoqYrbmB3t2qjdB49iG45mF41iqNN3StNs6SjGJ6BtlqakKRgPiRZYR5FGtoUwc+kkqubjE84ui1159x+U44FNmOzMklzhJcV0cwuyPHrlgdqlIk5OP3+8Ql+E4OPL0PSRgpm2JtLURrqyjVpjVpY1kLZ6m6dB45ojo8H2+wIRj3GezC2yOiKjzIsgZuo4UZrJ+0c4+llraXn+VAt6tjdvnnnO8cbvs98KPk4YsJZBcyz8V+Jt9XgRVib+salUxPWuGEsKI6Kchd64e8iz0CejBQMhruOY0usYVV4UtDS55LyVpjVhYVUi19E49KJocK46Vt8iR19AezoJifcxZi0rryKd4we+tzu6vMu2tGsGORe50dvs7ME2gQRpHMzMk6cN2R8wJshOfj98F9+.geB4ZKQVzW8Ua6Yagoe3bKaZNK6RTowuNS55zI+mEMZyEaj68IWOpIsK28ckr+D6dcc9.uT9ohKd0jTnl5VwMqPrOnjV4vL52mvk9KWaaad6EnR7rFE0gtozjTn55VUiVP+NR1xMyJcnai6dWR98qj9W8GzwV+973Fe1kMT6MUYophqUgvRbokZlVpY1bFs8yc+kboconnGwh7c04g94OF+v0bqMMmkcIVowWmjdeY9FDTRJx8caIi9KVSGa86UfJuBtoDgtY5i2vpmcEdz6wT32NyOePYJx8CaReK45azY6c8uwb4k2Y2S8KeAwrXKIHaIx0hkoKeztmXc2SHomvkdDonGQdzir1129KjmpYLDmZteWij9SG5Eqzcey8mL4cd2crsmu.UdELS4BcyzlpcYWlEK96RRuKyrW2vsMt6c5ROfEEs0dGP63C+Jas67bYVz6SO2aqtxhG+ZjqqUlsXcx6nfYMZ6mGE8JRZWtzt7H8HuZH4d3sQ2Ye1Ps2z7hGqx+bI8gBlUVpk6t2qbsgNUhO4To++1T5P2LceMr5kZRuKS5Wejtwvc26WReO201SX56bWss48mmKyy4cO0u74DSwtJS5pLytZW5ZBlc9i19cpaH+mRmJjMgzt3+9etk6ogU8Zh615koe6LeLoc2OPj6ev6n8sriBY8kuPn6oyZtgUsTI6cnSF.Or2T3RRdj+KjzC6xeXkL56t1CssNxek4Y+1Pc21EVRnj+aAEdit7qzjcEmo+6Ylb2Oj65GI46NJJZ2Cjv9w7aYTbXi0t5qsjX9mwrv0l4x8H+uO539cdGGYKuZgp1xGHzcTbu0u7qLlhsRW1JGo4.NE28mxk1s6ZOQIFXO69vOvSMU3BxcO0u74D2K40qfVjbcYxzkKoKerLEARRt6GSROl69O1L6GEkz2yczwV9uxoEMJzrM0vJ+skBepfYyM0Bc2aWx+fqossrsBXskSQn63v8zvpdMwksbIcyR5sLzG+3gxc+3R9i4t1iL+obEZUGye5yE+I4expeayrrJp70YV3RL2mub+RbYWhYZ9ik6hfTR8jc4t9IxhdzjIrextOzV16Tge3DNc2S8KeNwUIeFKXuyLWtG4+sc1dWqa8Zm8VnpsbEBcmftcoXWWsq7pCwBuMW9MYxV5vcqnMbb26PROs69S6l87l6uj69K5QIewXGJ4KkueS++waX0ydZIGndEB06tUevr5cyNOy0EJSuVcxWUgmwe.yv4TWDxmPROgGE83lm7w5pidZk6FDLTMW+pWkL8Yy7cms69Spnn24ZN3V2agr1x1HzMKoo5W9zlkGtZEBK1jtVS5ZGqye4P4t+xR5fR9qJYGwkdUy0QbyOh45HRpOWVByTxHWILKJgGojAYtLUlLuLoPYxUYRdYtYkKWS2LUsKUiIUsbuZcxWoeyZ3dp8Fm06wjzSKo8FI8TJROUn+deR9nhhwiOwLWV0UTY7OWvr2QpkcxWdU5OdMss4+tBXokUQnaNzll2Jp0JIbsR1UHWWpLcoRZ9lYUTnqswqSMUIGvc6Yk7mwcse2idlXCLv9WSms7RhGwSjkbe0u5eufoly7umDEE8Y2a6u3ZNW+s2lDgt4cMIEldsq3BiagKUxWfEBuFY146Q94YlNeI0vjcjmiWm5anU6tT6lT6xU6xTadjefH4GHl5+.q4fsb37YMgo1N0a0r+EyrKO0xb2+g8MP+ui+rC+fGrPVaSVD5dVlljBUN2aadkZwlWTrvLiYZVdjMSKDMSovrjzLboRM4k3thYlJQtUhLEykLSpe2UuRdexTeRVexUeRpGSQc4t0kGrtjh5LQxSz0yzQmcULL5AT7YiZIUTRC08ELyd2oVl6daIihV0cdvs9SJj01jAgt.3rZapgUsNS1mJ0iAt69wRlL527N6XqOPgt1lHHzE.m0aSMrp2pI6qk564l6dRW5Odsss4+uE5Za7ZT+jj..Tns111x2c.ok5t+bRRlYwBl8YatgU8IJz013EizE.my3ju4xl11x7QH1c+y0Yaa9Cc11G7yQx35yGM.PgzCcrm6XKd5WxWoBOb4lYKPRxL6pJupEdwU0cqaYumCbqKRnK.NmxN6Y+CTUOs90ufoufKzL6MJIYl8FtfpV3ku3tCeqcpCeV8iTNgt.3bN6Uxaom8skFm9BmqY10HIYlcoUT0ruxE2c39OaN3kPW.bNqV5o0GrwoufJMytdIIyr4WQUy9xVb209M1oNvYkywKgt.3bZszy9dnFm9BiYlciRmZDuSu74WUOst4yFmiWBcAv47ZomV+dMV0BmVFi38xtfoufKrkd12VJz01PQnK.JJzR2s9vMV0BqwN42YOYl8FukoufpZom88cJz0VlHzE.EMZo6V2QiUsv5MytJIIyrk13zWPmszy91Sgt1RgmHM.TLw6rsM+gb2+FoWhYap45W8pJf0zuDBcAPQk0KE0Yac8dih7GQRxLKHSekMV6pu1QaeyGHzE.EcVu1YuIThU4t+rRRlYSqjXZaan1U75Jz0Fgt.nnzc091e4DCj7VO0m+JYlMu3gXeilzMVdgrtHzE.EsV2g21yFIsxH26SRJDrqnlFp9+cgrl3tW..E01Q2s9h2RkK3vgfsbIIyrq7lqZAGXGcuueZgnd3U6H.lRXSMr5+gfY+VRm7qLbhAFXoq6vOvSjuqCldA.LkPWdh+.28mRRxLqhRhG+9atlFmQ9tNHzE.SIr9129wiTz6vcuaIIyrK1Kqr6KeWGD5BfoLti1159hj+6kpeHD9.aptUca4yZf4zE.S4zb8q9qZA6cJcxOq6G+XCbY+4G4A5JebtYjt.XJmDG63+Qt6GTRxLqgJpL9mIectIzE.S4rti9c5Tx+8S0OX16YS0ux2d93byzK.forZt9U8krP38II4t2du8EsfO7qr0tykmSFoK.lxJ53Zst6sIIYlUe4kFZJWeNIzE.SYcGGYKupqn0kdAl9Suu5V8klKOmD5BfozVaaa8eIxi1ojjYV7fob5EUiPW.LkWxD5OwcOojjEr2Zy0sx2Qt5bQnK.lxacGZKOoj9+jdAgvFyUuBHIzE.PRQGyaxc+PRRlYWPMMT8eXt37vq1Q..Isi91WuMV0BNtY1xjjboqbwkW6mcmG+.8mMOOLRW.fSoq1dluf69+kjTvr4N63Uu1r84fPW.fSY8Zu8GIe8o56Rq6SLykUc17bPnK.PFdj11x+nG46SRxLaVSqx32U173SnK.PF95RIiLOymLs0rwYby0jsN9D5B.LD2Qaa4q4t+jRRlYUVxzm1GJacrIzE.3z4xi9TYz+OoY0XYYiCLgt..CiNa+H+qQt+hRRlY050W16MabbIzE.XXrdsyDl7lSu.ytSkEdc3RnK.vH3Dm3Xe9TeHKClsnMU2pt0I6wjPW.fQvGoqG9Ht6e9T8MytiI6wjPW.fynjMm5MPlL8Vu24srKZxbzHzE.3LXssu8WPt+skjLyrPrR9.SliGgt..ihHouXp1lYu+aeR7xBiPW.fQwq19qt8L+js+lZXU21D8XQnK.vnX8ZmIboub5E31u6D8XQnK.vXQ+CjdJFjoa6SO2aqtIxggPW.fwf09xOvy3t+8kjLyJorRhe6SjiCgt..iUt9mS21zuwD4PPnK.vXz.Jw2L88rqrqei0rrya7dLHzE.XL5tZe6urb88jN48rarxhOt+TsSnK.v3PjzWKiti6oXfPW.fwgjJw2xcOgjjYZoMWSim+3Y+IzE.Xb3tZe6urzfSwfWV4qd7r+D5B.LN4ReyTsMyGWOcZD5B.LNMPT+e6A6Y+pMoar7w59RnK.v3zcevG7.t6sJIYlUwrpeV23XceIzE.XhI8ncClFyeQIHzE.XBv8jCNECNgt..4TV6C78c2OtjjEByer9EkfPW.fIf0nV5Sm5VGSRJVrR90FK6Ggt..SPt7zgtxraXrrOD5B.LAkLo8ejQWBcA.xkNZGc8XomWWydcik25XD5B.LAsdsyDRZ2o5Gq7Xi5ncIzE.Xxv8zSwf4ABcA.xkRZ9OHcGazmWWBcA.lDRl7D6ZvulD50ugZuoJOSaOgt..SB2cGOzwjzSKIYlEhEJ+Mdl1dBcA.l7drTMhovUdl1PBcA.ljbevPWI6JNSaKgt..SRtG83o6XhQ5B.jKE5u+ep6teptKpY0XYi31lmpI.fhVqoyVNpj94RRlYwSVWoW9HssD5B.jE3tO3ESKDdCiz1QnK.PVfY1OKcG2W3HscD5B.jEDIeeoZ6xHzE.HWJZfDslpsIeAiz1QnK.P1vgek8m9NXvrK52WWU7gayHzE.HKXcZ2mPRufjjYVIyu95+UFtsiPW.frDOi40MlhMryqKgt..YMV5P2fzvNutD5B.jkXt+LYz80NbaCgt..YM1KLXS6BFtsfPW.frEK5ExnGgt..4RGSgzgtNgt..4V+Ess4WI0mj8fYy3SV8aalCcaHzE.Hax0uHUy3wq7zFsKgt..YSlROECl4D5B.jikQnqc9CckD5B.jc0QpFwB1bG5JIzE.Hax8CmpYjz7F5pIzE.HqZvPWyEizE.H2Jb3L5PnK.PNkEMXnqQnK.PtUu8yHcA.xa5TYF5NGIYYtZBcA.xhViZoO28djjLyh2bMMVUlqmPW.fruilpQBEiPW.fbJWcmtYYFgt..4T1fgtk3hPW.fbIWCF5F4LRW.fbKW8jpYr.yoK.PNkkwzKHEM8LWGgt..YeCdgzr.izE.HmJioWPxqLyUQnK.P1l4CLXSqzLWEgt..YYtq9S2wT7LWGgt..YYAyRORW4Ngt..4RtO3zK3lQnK.PNEizE.HOJiQ5JFoK.PtkmwHcMFoK.Ptk4dhA6vHcA.xabIOy9D5B.jkEIK8mnGSNgt..4RgeouKZFgt..4RQtm4GiRBcA.JTHzE.HKyBJV5NtRl45HzE.HKybUZFcFHy0QnK.PVVTl2atY9FGSD5B.j0Ezfiz0Egt..4Tt6oCcMyHzE.HWxrLlSWWLmt..4RtrxS21i5My0QnK.PVlIMsTscYGOy0QnK.PVmmNz0jcrLWCgt..YcV5O65tDizE.HGK8HcCJIgt..4Vd5Q5lzBL8B..4VVUoaYp6LWCgt..YeyLUCOQhil4JHzE.H6aFoZzaIwORlqfPW.fruzizsu15hPW.fbkMT6MUoYVLII28iudsyDYtdBcA.xhhRTwLyn6QF55IzE.HKprRRVSp1tTWCc8D5B.jEYV7YmtszqLz0SnK.PVTjzrynKgt..4RASyIitD5B.jikdjttzKOzURnK.P1UlgtLRW.fbJyqMcSoCMzUSnK.PVkMXnaTxNF5ZIzE.H6JcnqBFgt..4X0kpQu8IBcA.xUtcoXRm7VFyc2O9qbDlSW.fbkqYt21bMyRkq9JC8kciDgt..YMkFK7ZR2w0KNbaCgt..YItJ40LXa8KFtsgPW.frDyT5PWiPW.fbKShQ5B.ju3xyXjtQD5B.jSY1EjpYRYuvvsID5B.jkj4zKXQL8B..4LMoarDIUujj6dzS2wK9RC21QnK.PVP00WUCY7fQzwmSO5.C21QnK.PVPjrAevHjOrSsfDgt..YElhk9hn4ivEQShPW.frhf7zgtizCFwI2N..Lo4lcwoa654FosiPW.frB+RR2R9yLRaEgt..YAlrACcSlfPW.fbklpe4SyLqAII28A10gdfCLRaKgt..SRUmbv4yUt+7ecojiz1RnK.vjUHjdpEjYi3TKHQnK.vjmkw74JQnK.Pt0f24B5LbmKHQnK.vjlkw8nq41ydl1VBcA.l7ROR29iRxHcA.xUZZt23zMyR8Jcr+8zw1Fw26BRD5B.LoTS7Ylw74pm6Lc6hIQnK.vjhGEd8Yz8oGssmPW.fIiftrzsc8Ti9lC.fILSCF5FY9Oaz1dBcA.lbRG55IiXjt..4JMM2ab5R5BjN4K5lV6ns8OZ6Cgt..SPyJLyWuYlcpt6aj9XTlIBcA.lfrfMttHZRD5B.LwYYD5ZD5B.jSY9361EShPW.fINKiP2DD5B.jy7waX0y1LqNII28i24g27yOV1OBcA.l.pLJiQ4J8zqWJZrreD5B.LA3J5JS218mXrteD5B.LQDBWU51ldzw7tkSJF.fhbl7ziz0RD8Xi08iPW.fwoMT6MUojs.II28jINzgY5E..xUhGp7JLyRket20ocehw59RnK.v3TlWDM49XdpEjHzE.XbKXYbQzzX+hnIQnK.vDQ5Q5lTi8KhlDgt..iKaTKoBIcoRRt6QIi58mNd1eBcA.FGBMT2azLKljjK05c2wCcrw09maJK.fhSgLtHZlFeWDsSt+..Xryy3hn4iuKhlDgt..iOlujTMcY+jw6tSnK.vXz8MyUMKIagRm7CQYx1OHizE.HWITQzRx3CQ4Oc77jnk9XjkqI.fhVtEVZFc20D4XPnK.vXjYV5PWWQD5B.jqzjTvkVbp9CDkfPW.fbkpqcYKJX1Ljjb2a+tO3CdfIxwgPW.fw.ODOi4y0mPixUhPW.fwjfzj9hncpiC..FU1fgtI8I1EQShPW.fQ0mXlKqZIk5yyS+Go8iNtenHRgPW.fQQ4UDOyGJhGe8Zm8NQOVD5B.LJBA8lR01mDymqDgt..iE2XpFdj9OlLGHBcA.NCN0WJhqIU+f5kPW.fbkPs0tXyrRkjhbeuq4fsb3I0wK6TV..EmrXV5oVvb+6OYOdD5B.bFXRu4Tscy24j83QnK.vH32WWUbkwShVe8IFoK.Ptxqugy+ZLypPRJxi94e3WYqsMYOlD5B.LBbW+pC1QS5oVPhPW.fQjI6WKcG29dYiiIgt..CilUikISWep98MPz+V133RnK.vvHYswudyrxkjb2aMaLetRD5B.LrBgP5oVvc8cyZG2r0AB.nnhYu0TMcWYkoVPRpjr0AB.nXQy0z3LjzUKI4tG06IFHqbQzjXjt..mFu7xeylYoFT5i+mejGnqr0wlPW.fgvjtozcbOqM0BRD5B.b5bcKoZlz7uS17PSnK.PF1Pc21EZAK02CsiGqs9mTu+bGJBcA.xPoVo2xf87ctF0ReYyiOgt..Yx7zgtta6Hae3IzE.3TtcoXRCd+4lPIHzE.HWYo0uhkXlMSII28W3tZe6slsOGD5B.bJwTrLmO2r9nbkHzE.XPlt0TM8HQnK.Ptxll2JpURWkjj69.V+88P4hyCgt..RxKIbqlY1o59CWSmsbzbw4gPW..IYxVVp1QROXt57PnK.lx6Te0eu4T8CQQOPt5bQnK.lxaQMb9u4fYSXTqaO..P.ajDQAQ0PRxc+4VyA25dyUmKBcAvTdlzJxn61ykmKBcA.jkNzMoh1Vt7LQnK.lRaS0trKyL6hjjhb+ns11Ksyb44iPW.LklEK9pR21029yoGcfb44iPW.LU2pS0HRZK45SFgt.XJqlqowy2LK0GfxA5q2dxY2etoPnK.l5prxd6Yz6e6iz0Cejb8ojPW.L0kY+2S0LJx+V4iSIgt.XJolqqw4JoaPRxcOxhh1b937RnK.lZxJ+salE6T89Aq8Paqi7wokPW.LU0smtk62e95jRnK.lxo45ZbtxzaQRxc26se+ajuN2D5BfobbqrUl4TK7geks1V95bSnK.l5ws9xn2WpPUF..SUXMW+JeOaptU+dkjMpaM.....FE++ghzrprf84LR.....PRE4DQtJDXBB" ],
									"embed" : 1,
									"id" : "obj-2",
									"maxclass" : "fpic",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "jit_matrix" ],
									"patching_rect" : [ 392.0, 8.0, 349.0, 347.0 ],
									"presentation_rect" : [ 392.0, 8.0, 349.0, 347.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 192.0, 440.0, 125.0, 23.0 ],
									"presentation_rect" : [ 192.0, 440.0, 125.0, 23.0 ],
									"style" : "",
									"text" : "v current-min-package"
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"fontface" : 0,
									"fontname" : "Lato Light",
									"fontsize" : 16.0,
									"id" : "obj-1",
									"maxclass" : "markup",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 552.0, 360.0, 312.0, 72.0 ],
									"presentation_rect" : [ 552.0, 360.0, 312.0, 72.0 ],
									"text" : "Once you have created your package, <b>you can then add new objects to the package</b> which you will code in C++."
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 80.0, 472.0, 66.0, 23.0 ],
									"presentation_rect" : [ 80.0, 472.0, 66.0, 23.0 ],
									"style" : "",
									"text" : "min.project"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-40",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 8,
											"minor" : 0,
											"revision" : 0,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"rect" : [ 59.0, 104.0, 640.0, 480.0 ],
										"bglocked" : 0,
										"openinpresentation" : 0,
										"default_fontsize" : 12.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 1,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 1,
										"objectsnaponopen" : 1,
										"statusbarvisible" : 2,
										"toolbarvisible" : 1,
										"lefttoolbarpinned" : 0,
										"toptoolbarpinned" : 0,
										"righttoolbarpinned" : 0,
										"bottomtoolbarpinned" : 0,
										"toolbars_unpinned_last_save" : 0,
										"tallnewobj" : 0,
										"boxanimatetime" : 200,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"description" : "",
										"digest" : "",
										"tags" : "",
										"style" : "",
										"subpatcher_template" : "",
										"boxes" : [ 											{
												"box" : 												{
													"id" : "obj-7",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 205.0, 316.0, 57.0, 22.0 ],
													"presentation_rect" : [ 205.0, 316.0, 57.0, 22.0 ],
													"style" : "",
													"text" : "tosymbol"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-6",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 500.0, 194.0, 77.0, 22.0 ],
													"presentation_rect" : [ 500.0, 194.0, 77.0, 22.0 ],
													"style" : "",
													"text" : "route symbol"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-5",
													"maxclass" : "button",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 205.0, 124.0, 24.0, 24.0 ],
													"presentation_rect" : [ 205.0, 124.0, 24.0, 24.0 ],
													"style" : ""
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-2",
													"index" : 1,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 409.0, 47.0, 30.0, 30.0 ],
													"presentation_rect" : [ 409.0, 47.0, 30.0, 30.0 ],
													"style" : ""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-35",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 205.0, 345.0, 173.0, 22.0 ],
													"presentation_rect" : [ 205.0, 345.0, 173.0, 22.0 ],
													"style" : "",
													"text" : "combine path / package_name"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-29",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 5,
													"outlettype" : [ "", "", "", "", "" ],
													"patching_rect" : [ 205.0, 288.0, 233.0, 22.0 ],
													"presentation_rect" : [ 205.0, 288.0, 233.0, 22.0 ],
													"style" : "",
													"text" : "regexp /min-devkit/extras/ @substitute %0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-27",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "int" ],
													"patching_rect" : [ 205.0, 230.0, 128.0, 22.0 ],
													"presentation_rect" : [ 205.0, 230.0, 128.0, 22.0 ],
													"style" : "",
													"text" : "conformpath max boot"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-26",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 205.0, 158.0, 32.0, 22.0 ],
													"presentation_rect" : [ 205.0, 158.0, 32.0, 22.0 ],
													"style" : "",
													"text" : "path"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-18",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 205.0, 194.0, 67.0, 22.0 ],
													"presentation_rect" : [ 205.0, 194.0, 67.0, 22.0 ],
													"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
													"style" : "",
													"text" : "thispatcher"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-39",
													"index" : 1,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 50.0, 378.0, 30.0, 30.0 ],
													"presentation_rect" : [ 50.0, 378.0, 30.0, 30.0 ],
													"style" : ""
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-27", 0 ],
													"source" : [ "obj-18", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-5", 0 ],
													"order" : 1,
													"source" : [ "obj-2", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-6", 0 ],
													"order" : 0,
													"source" : [ "obj-2", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-18", 0 ],
													"source" : [ "obj-26", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-29", 0 ],
													"source" : [ "obj-27", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-7", 0 ],
													"source" : [ "obj-29", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-39", 0 ],
													"source" : [ "obj-35", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-26", 0 ],
													"source" : [ "obj-5", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-35", 2 ],
													"source" : [ "obj-6", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-35", 2 ],
													"source" : [ "obj-6", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-35", 0 ],
													"source" : [ "obj-7", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 80.0, 408.0, 24.0, 23.0 ],
									"presentation_rect" : [ 80.0, 408.0, 24.0, 23.0 ],
									"saved_object_attributes" : 									{
										"description" : "",
										"digest" : "",
										"globalpatchername" : "",
										"style" : "",
										"tags" : ""
									}
,
									"style" : "",
									"text" : "p"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-8",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"patching_rect" : [ 80.0, 372.0, 145.0, 23.0 ],
									"presentation_rect" : [ 80.0, 372.0, 145.0, 23.0 ],
									"style" : "",
									"text" : "dialog New Package Name"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 80.0, 192.0, 92.0, 92.0 ],
									"presentation_rect" : [ 80.0, 192.0, 92.0, 92.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"fontface" : 0,
									"fontname" : "Lato Light",
									"fontsize" : 16.0,
									"id" : "obj-16",
									"maxclass" : "markup",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 204.0, 172.0, 388.0, 160.0 ],
									"presentation_rect" : [ 204.0, 172.0, 388.0, 160.0 ],
									"text" : "Creating objects begins with creating a Package to house them. <b>Click the button to create a new Package</b>. Give it a name, and then press enter.\n<br/><br/>\nA new Package with that name will be created in your Packages folder. The folder will be opened for you when it is done being created.\n\n"
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"fontface" : 0,
									"fontname" : "Lato Light",
									"fontsize" : 16.0,
									"id" : "obj-9",
									"ignoreclick" : 1,
									"justification" : 2,
									"linkbold" : 1,
									"linkcolor" : [ 0.501961, 0.0, 0.25098, 1.0 ],
									"linkunderline" : 0,
									"maxclass" : "markup",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 880.0, 16.0, 186.0, 66.0 ],
									"presentation_rect" : [ 880.0, 16.0, 186.0, 66.0 ],
									"text" : "<a>Min</a><br/> Create packages and code objects for Max using C++"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-5",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 80.0, 440.0, 106.0, 23.0 ],
									"presentation_rect" : [ 80.0, 440.0, 106.0, 23.0 ],
									"style" : "",
									"text" : "create_package $1"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-8", 0 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"source" : [ "obj-40", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"source" : [ "obj-6", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"source" : [ "obj-6", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-40", 0 ],
									"order" : 1,
									"source" : [ "obj-8", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"order" : 0,
									"source" : [ "obj-8", 0 ]
								}

							}
 ],
						"bgfillcolor_type" : "gradient",
						"bgfillcolor_color1" : [ 0.454902, 0.462745, 0.482353, 1.0 ],
						"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"bgfillcolor_angle" : 270.0,
						"bgfillcolor_proportion" : 0.39
					}
,
					"patching_rect" : [ 38.0, 157.0, 135.0, 23.0 ],
					"presentation_rect" : [ 38.0, 157.0, 135.0, 23.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"fontname" : "Lato Light",
						"fontsize" : 16.0,
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p \"Create a Package\"",
					"varname" : "basic_tab[2]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 0,
							"revision" : 0,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 26.0, 1094.0, 580.0 ],
						"bgcolor" : [ 0.960784, 0.960784, 0.960784, 1.0 ],
						"editing_bgcolor" : [ 0.960784, 0.960784, 0.960784, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 16.0,
						"default_fontface" : 0,
						"default_fontname" : "Lato Light",
						"gridonopen" : 1,
						"gridsize" : [ 4.0, 4.0 ],
						"gridsnaponopen" : 2,
						"objectsnaponopen" : 0,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-21",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 48.0, 64.0, 41.0, 28.0 ],
									"presentation_rect" : [ 48.0, 64.0, 41.0, 28.0 ],
									"style" : "",
									"text" : "sel 1"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-18",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 48.0, 32.0, 49.0, 28.0 ],
									"presentation_rect" : [ 48.0, 32.0, 49.0, 28.0 ],
									"style" : "",
									"text" : "active"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-13",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 704.0, 84.0, 66.0, 23.0 ],
									"presentation_rect" : [ 704.0, 84.0, 66.0, 23.0 ],
									"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
									"style" : "",
									"text" : "thispatcher"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-4",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "front" ],
									"patching_rect" : [ 704.0, 56.0, 41.0, 23.0 ],
									"presentation_rect" : [ 704.0, 56.0, 41.0, 23.0 ],
									"style" : "",
									"text" : "t front"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Lato Light",
									"fontsize" : 12.0,
									"hidden" : 1,
									"id" : "obj-3",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 704.0, 28.0, 157.0, 23.0 ],
									"presentation_rect" : [ 704.0, 28.0, 157.0, 23.0 ],
									"style" : "",
									"text" : "r min-launcher-compile-code"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-11",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 884.0, 440.0, 125.0, 23.0 ],
									"presentation_rect" : [ 884.0, 440.0, 125.0, 23.0 ],
									"style" : "",
									"text" : "v current-min-package"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 140.0, 156.0, 125.0, 23.0 ],
									"presentation_rect" : [ 140.0, 156.0, 125.0, 23.0 ],
									"style" : "",
									"text" : "v current-min-package"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "clear" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 8,
											"minor" : 0,
											"revision" : 0,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"rect" : [ 59.0, 104.0, 640.0, 480.0 ],
										"bglocked" : 0,
										"openinpresentation" : 0,
										"default_fontsize" : 12.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 1,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 1,
										"objectsnaponopen" : 1,
										"statusbarvisible" : 2,
										"toolbarvisible" : 1,
										"lefttoolbarpinned" : 0,
										"toptoolbarpinned" : 0,
										"righttoolbarpinned" : 0,
										"bottomtoolbarpinned" : 0,
										"toolbars_unpinned_last_save" : 0,
										"tallnewobj" : 0,
										"boxanimatetime" : 200,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"description" : "",
										"digest" : "",
										"tags" : "",
										"style" : "",
										"subpatcher_template" : "",
										"boxes" : [ 											{
												"box" : 												{
													"id" : "obj-3",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 21.5, 276.0, 94.0, 22.0 ],
													"presentation_rect" : [ 21.5, 276.0, 94.0, 22.0 ],
													"style" : "",
													"text" : "prepend symbol"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-14",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 268.0, 30.0, 58.0, 22.0 ],
													"presentation_rect" : [ 268.0, 30.0, 58.0, 22.0 ],
													"style" : "",
													"text" : "loadbang"
												}

											}
, 											{
												"box" : 												{
													"fontsize" : 12.0,
													"id" : "obj-13",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 268.0, 86.0, 129.0, 22.0 ],
													"presentation_rect" : [ 268.0, 86.0, 129.0, 22.0 ],
													"style" : "",
													"text" : "v current-min-package"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-12",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 268.0, 58.0, 63.0, 22.0 ],
													"presentation_rect" : [ 268.0, 58.0, 63.0, 22.0 ],
													"style" : "",
													"text" : "min-devkit"
												}

											}
, 											{
												"box" : 												{
													"fontsize" : 12.0,
													"id" : "obj-11",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 15.0, 173.0, 129.0, 22.0 ],
													"presentation_rect" : [ 15.0, 173.0, 129.0, 22.0 ],
													"style" : "",
													"text" : "v current-min-package"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-10",
													"index" : 1,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 28.0, 46.0, 30.0, 30.0 ],
													"presentation_rect" : [ 28.0, 46.0, 30.0, 30.0 ],
													"style" : ""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-8",
													"maxclass" : "button",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 28.0, 93.0, 24.0, 24.0 ],
													"presentation_rect" : [ 28.0, 93.0, 24.0, 24.0 ],
													"style" : ""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-9",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 2,
													"outlettype" : [ "", "int" ],
													"patching_rect" : [ 147.5, 202.0, 128.0, 22.0 ],
													"presentation_rect" : [ 147.5, 202.0, 128.0, 22.0 ],
													"style" : "",
													"text" : "conformpath max boot"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-5",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 5,
													"outlettype" : [ "", "", "", "", "" ],
													"patching_rect" : [ 143.0, 264.0, 151.0, 22.0 ],
													"presentation_rect" : [ 143.0, 264.0, 151.0, 22.0 ],
													"style" : "",
													"text" : "regexp /.*/ @substitute %0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-1",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 5,
													"outlettype" : [ "", "", "", "", "" ],
													"patching_rect" : [ 143.0, 234.0, 175.0, 22.0 ],
													"presentation_rect" : [ 143.0, 234.0, 175.0, 22.0 ],
													"style" : "",
													"text" : "regexp /source @substitute %0"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-7",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "bang", "clear" ],
													"patching_rect" : [ 28.0, 132.0, 473.0, 22.0 ],
													"presentation_rect" : [ 28.0, 132.0, 473.0, 22.0 ],
													"style" : "",
													"text" : "t b b clear"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-4",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 163.5, 306.0, 96.0, 22.0 ],
													"presentation_rect" : [ 163.5, 306.0, 96.0, 22.0 ],
													"style" : "",
													"text" : "prepend append"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-2",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 147.5, 173.0, 120.0, 22.0 ],
													"presentation_rect" : [ 147.5, 173.0, 120.0, 22.0 ],
													"saved_object_attributes" : 													{
														"filename" : "min-package-list.js",
														"parameter_enable" : 0
													}
,
													"style" : "",
													"text" : "js min-package-list.js"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-39",
													"index" : 1,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 196.5, 421.0, 30.0, 30.0 ],
													"presentation_rect" : [ 196.5, 421.0, 30.0, 30.0 ],
													"style" : ""
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-5", 0 ],
													"source" : [ "obj-1", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-8", 0 ],
													"source" : [ "obj-10", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-3", 0 ],
													"source" : [ "obj-11", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-13", 0 ],
													"source" : [ "obj-12", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-12", 0 ],
													"source" : [ "obj-14", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 0 ],
													"source" : [ "obj-2", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-39", 0 ],
													"source" : [ "obj-3", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-39", 0 ],
													"source" : [ "obj-4", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-4", 0 ],
													"source" : [ "obj-5", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-11", 0 ],
													"source" : [ "obj-7", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-2", 0 ],
													"source" : [ "obj-7", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-39", 0 ],
													"source" : [ "obj-7", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-7", 0 ],
													"source" : [ "obj-8", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-1", 0 ],
													"source" : [ "obj-9", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 108.0, 56.0, 28.0, 28.0 ],
									"presentation_rect" : [ 108.0, 56.0, 28.0, 28.0 ],
									"saved_object_attributes" : 									{
										"description" : "",
										"digest" : "",
										"globalpatchername" : "",
										"style" : "",
										"tags" : ""
									}
,
									"style" : "",
									"text" : "p"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-6",
									"items" : "<empty>",
									"maxclass" : "umenu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 108.0, 88.0, 192.0, 28.0 ],
									"presentation_rect" : [ 108.0, 88.0, 192.0, 28.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"fontface" : 0,
									"fontname" : "Lato Light",
									"fontsize" : 16.0,
									"id" : "obj-8",
									"maxclass" : "markup",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 352.0, 92.0, 328.0, 168.0 ],
									"presentation_rect" : [ 352.0, 92.0, 328.0, 168.0 ],
									"text" : "<b>First choose the Package</b> with which you are working. \n<br/><br/>\nBy default this is the Min-DevKit. However, <b>You may choose any Min-based package</b> that you have installed which includes source code. This includes your own self-created packages."
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-1",
									"maxclass" : "live.line",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 76.0, 296.0, 628.0, 12.0 ],
									"presentation_rect" : [ 76.0, 296.0, 628.0, 12.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-52",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 76.0, 360.0, 28.0, 28.0 ],
									"presentation_rect" : [ 76.0, 360.0, 28.0, 28.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-44",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 884.0, 468.0, 75.0, 23.0 ],
									"presentation_rect" : [ 884.0, 468.0, 75.0, 23.0 ],
									"style" : "",
									"text" : "min.project"
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"fontface" : 0,
									"fontname" : "Lato Light",
									"fontsize" : 16.0,
									"id" : "obj-43",
									"maxclass" : "markup",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 804.0, 156.0, 244.0, 208.0 ],
									"presentation_rect" : [ 804.0, 156.0, 244.0, 208.0 ],
									"text" : "Alternatively, you may generate a meta-project that contains all of the projects in the Min-DevKit.\n<br/><br/>\nIt will take a few moments to generate a project for your IDE (Xcode or Visual Studio). Once again, your IDE will open automatically when it is ready."
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-42",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 136.0, 448.0, 71.0, 23.0 ],
									"presentation_rect" : [ 136.0, 448.0, 71.0, 23.0 ],
									"style" : "",
									"text" : "generate $1"
								}

							}
, 							{
								"box" : 								{
									"hidden" : 1,
									"id" : "obj-40",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 8,
											"minor" : 0,
											"revision" : 0,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"rect" : [ 59.0, 104.0, 640.0, 480.0 ],
										"bglocked" : 0,
										"openinpresentation" : 0,
										"default_fontsize" : 12.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 1,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 1,
										"objectsnaponopen" : 1,
										"statusbarvisible" : 2,
										"toolbarvisible" : 1,
										"lefttoolbarpinned" : 0,
										"toptoolbarpinned" : 0,
										"righttoolbarpinned" : 0,
										"bottomtoolbarpinned" : 0,
										"toolbars_unpinned_last_save" : 0,
										"tallnewobj" : 0,
										"boxanimatetime" : 200,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"description" : "",
										"digest" : "",
										"tags" : "",
										"style" : "",
										"subpatcher_template" : "",
										"boxes" : [ 											{
												"box" : 												{
													"id" : "obj-6",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 227.5, 217.0, 79.0, 22.0 ],
													"presentation_rect" : [ 227.5, 217.0, 79.0, 22.0 ],
													"style" : "",
													"text" : "prepend path"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-5",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 227.5, 244.0, 120.0, 22.0 ],
													"presentation_rect" : [ 227.5, 244.0, 120.0, 22.0 ],
													"saved_object_attributes" : 													{
														"filename" : "min-package-list.js",
														"parameter_enable" : 0
													}
,
													"style" : "",
													"text" : "js min-package-list.js"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-4",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "" ],
													"patching_rect" : [ 50.0, 288.0, 98.0, 22.0 ],
													"presentation_rect" : [ 50.0, 288.0, 98.0, 22.0 ],
													"style" : "",
													"text" : "select min-devkit"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-2",
													"index" : 1,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 152.0, 63.0, 30.0, 30.0 ],
													"presentation_rect" : [ 152.0, 63.0, 30.0, 30.0 ],
													"style" : ""
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-3",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 50.0, 341.0, 109.0, 22.0 ],
													"presentation_rect" : [ 50.0, 341.0, 109.0, 22.0 ],
													"style" : "",
													"text" : "set min.hello-world"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-1",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 50.0, 315.0, 31.0, 22.0 ],
													"presentation_rect" : [ 50.0, 315.0, 31.0, 22.0 ],
													"style" : "",
													"text" : "qlim"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-36",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 205.0, 330.0, 109.0, 28.0 ],
													"presentation_rect" : [ 205.0, 330.0, 109.0, 28.0 ],
													"style" : "",
													"text" : "prepend prefix"
												}

											}
, 											{
												"box" : 												{
													"id" : "obj-35",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "", "" ],
													"patching_rect" : [ 205.0, 294.0, 129.0, 22.0 ],
													"presentation_rect" : [ 205.0, 294.0, 129.0, 22.0 ],
													"style" : "",
													"text" : "combine path /projects"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-39",
													"index" : 1,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 50.0, 378.0, 30.0, 30.0 ],
													"presentation_rect" : [ 50.0, 378.0, 30.0, 30.0 ],
													"style" : ""
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-3", 0 ],
													"source" : [ "obj-1", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-4", 0 ],
													"order" : 1,
													"source" : [ "obj-2", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-6", 0 ],
													"order" : 0,
													"source" : [ "obj-2", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-39", 0 ],
													"source" : [ "obj-3", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-36", 0 ],
													"source" : [ "obj-35", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-39", 0 ],
													"source" : [ "obj-36", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-1", 0 ],
													"source" : [ "obj-4", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-35", 0 ],
													"source" : [ "obj-5", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-5", 0 ],
													"source" : [ "obj-6", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 108.0, 328.0, 28.0, 28.0 ],
									"presentation_rect" : [ 108.0, 328.0, 28.0, 28.0 ],
									"saved_object_attributes" : 									{
										"description" : "",
										"digest" : "",
										"globalpatchername" : "",
										"style" : "",
										"tags" : ""
									}
,
									"style" : "",
									"text" : "p"
								}

							}
, 							{
								"box" : 								{
									"autopopulate" : 1,
									"id" : "obj-14",
									"items" : "zooooomyy.hello-world",
									"maxclass" : "umenu",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "int", "", "" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 108.0, 360.0, 192.0, 28.0 ],
									"prefix" : "Macintosh HD:/Users/tim/Documents/Max/Max 8/Packages/zooooomyy/source/projects/",
									"presentation_rect" : [ 108.0, 360.0, 192.0, 28.0 ],
									"style" : "",
									"types" : "fold"
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-12",
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 884.0, 364.0, 59.0, 59.0 ],
									"presentation_rect" : [ 884.0, 364.0, 59.0, 59.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 136.0, 476.0, 75.0, 23.0 ],
									"presentation_rect" : [ 136.0, 476.0, 75.0, 23.0 ],
									"style" : "",
									"text" : "min.project"
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"fontface" : 0,
									"fontname" : "Lato Light",
									"fontsize" : 16.0,
									"id" : "obj-16",
									"maxclass" : "markup",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 352.0, 364.0, 312.0, 144.0 ],
									"presentation_rect" : [ 352.0, 364.0, 312.0, 144.0 ],
									"text" : "<b>Choose an object</b> you would like to build from its source code.<br/><br/>\nIt will take a few moments to generate a project for your IDE (Xcode or Visual Studio). Once a project is generated, <b>your IDE will open automatically</b>."
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"fontface" : 0,
									"fontname" : "Lato Light",
									"fontsize" : 16.0,
									"id" : "obj-9",
									"ignoreclick" : 1,
									"justification" : 2,
									"linkbold" : 1,
									"linkcolor" : [ 0.501961, 0.0, 0.25098, 1.0 ],
									"linkunderline" : 0,
									"maxclass" : "markup",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 880.0, 16.0, 186.0, 66.0 ],
									"presentation_rect" : [ 880.0, 16.0, 186.0, 66.0 ],
									"text" : "<a>Min</a><br/> Create packages and code objects for Max using C++"
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 0.658824, 0.14902, 1.0 ],
									"fontname" : "Arial Bold",
									"hint" : "",
									"id" : "obj-93",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 320.0, 364.0, 20.0, 20.0 ],
									"presentation_rect" : [ 320.0, 364.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"style" : "",
									"text" : "2",
									"textcolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"background" : 1,
									"bgcolor" : [ 1.0, 0.658824, 0.14902, 1.0 ],
									"fontname" : "Arial Bold",
									"hint" : "",
									"id" : "obj-31",
									"ignoreclick" : 1,
									"legacytextcolor" : 1,
									"maxclass" : "textbutton",
									"numinlets" : 1,
									"numoutlets" : 3,
									"outlettype" : [ "", "", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 320.0, 92.0, 20.0, 20.0 ],
									"presentation_rect" : [ 320.0, 92.0, 20.0, 20.0 ],
									"rounded" : 60.0,
									"style" : "",
									"text" : "1",
									"textcolor" : [ 0.2, 0.2, 0.2, 1.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-44", 0 ],
									"source" : [ "obj-11", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 0 ],
									"source" : [ "obj-12", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-42", 0 ],
									"source" : [ "obj-14", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-21", 0 ],
									"hidden" : 1,
									"source" : [ "obj-18", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-5", 0 ],
									"hidden" : 1,
									"source" : [ "obj-21", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-4", 0 ],
									"hidden" : 1,
									"source" : [ "obj-3", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-13", 0 ],
									"hidden" : 1,
									"source" : [ "obj-4", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"hidden" : 1,
									"source" : [ "obj-40", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-10", 0 ],
									"source" : [ "obj-42", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-6", 0 ],
									"hidden" : 1,
									"source" : [ "obj-5", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-14", 0 ],
									"source" : [ "obj-52", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-40", 0 ],
									"hidden" : 1,
									"order" : 1,
									"source" : [ "obj-6", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-7", 0 ],
									"order" : 0,
									"source" : [ "obj-6", 1 ]
								}

							}
 ],
						"bgfillcolor_type" : "gradient",
						"bgfillcolor_color1" : [ 0.454902, 0.462745, 0.482353, 1.0 ],
						"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"bgfillcolor_angle" : 270.0,
						"bgfillcolor_proportion" : 0.39
					}
,
					"patching_rect" : [ 23.0, 120.0, 117.0, 23.0 ],
					"presentation_rect" : [ 23.0, 120.0, 117.0, 23.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"fontname" : "Lato Light",
						"fontsize" : 16.0,
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p \"Compile Code\"",
					"varname" : "basic_tab[1]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Arial",
					"fontsize" : 13.0,
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 0,
							"revision" : 0,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 26.0, 1094.0, 580.0 ],
						"bgcolor" : [ 0.960784, 0.960784, 0.960784, 1.0 ],
						"editing_bgcolor" : [ 0.960784, 0.960784, 0.960784, 1.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 16.0,
						"default_fontface" : 0,
						"default_fontname" : "Lato Light",
						"gridonopen" : 1,
						"gridsize" : [ 4.0, 4.0 ],
						"gridsnaponopen" : 2,
						"objectsnaponopen" : 0,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"showontab" : 1,
						"boxes" : [ 							{
								"box" : 								{
									"data" : [ 7922, "png", "IBkSG0fBZn....PCIgDQRA..BvE....rHX....f1E.KX....DLmPIQEBHf.B7g.YHB..djZRDEDU3wY6cuGcbUceu.+628L5gkkeIiszHCXiAK4vqbSLsPZBwYEJ1F7KQdSo2lljancUV25G.gzlappSyM4x0XrUek1zaRZd0rRRoXYro1wjlPBMPRiABPHV1XvFHZrkwxXaIYaoY1eu+gzPDF+TdjFqQe+rVZIc1mybN+l0xV56b16ydCXlYlYlYlYlYlYlYlYlYlYlYlYlYlYlYlYlYlYlYlYlYlYlYlYlYlYlYlYlYlYlML2Jq4FmZgtFLyLyLqXR3XanjPo2SSSpgKtPTLlYlYlUL50E3popl2XIvBTI3iWnJHyLyLyJ175BboxK+lHY4D3ibqXVkTnJJyLyLyJl75BbQfaF.fjS9xp8BtoBSIYlYlYVwkWKvUS0LuIAfe2WaOB2ZgnfLyLyLqXyu4NbEJ8CPxDu11Du6UMoEdIEhhxLyLyrhI8qKEC2b+2AIYxjAeWtLyLyL6rT.30l6s9cN1cJx+vFwkV5PdUYlYlYVQj..PorjODI4aXmjSZ70NCO34MyLyL6rPucoH4MehN.B9GMjUMlYlYlUDhMUyhtTlHwu7Dc.RRp6dpeouxF19PYgYlYlYVwhvI6taAz6fmGkThG77lYlYlM.EDwIMvE..I7fm2LyLyrAnPfgS4BUMIOuwmpt26PQAYlYlYVwlvo9P56.om44MyLyLaf3zNvEIeWqt1EU+fYwXlYlYVwnjJFWg.5lDcinJiIR7YA.jT2PwOp.5JFQ2gf5t6t4gJzErYlYlYC27FlrSaJUCakAVO.fhZtKI8Z+dC8kkYlYlYEOdCconf1vqsA0BGRqFyLyLyJB8FBbwnVe+15lZ7LXbdYlYlYl8F8FBS8H6Yc+HI0F..ImRUUunYOzWVlYlYlU73MD356BjU.e6eyQvO7PZEYlYlYVQlia2ERgu5uYC9AW0XmSUCYUjYlYlYEYNtAtVR50tEI8yA.HY4gJq3iMzVVlYlYlU73DNf3Eh+886fVpWKEMyLyLaf4DF3Z+s9beSI0J..Iqc7opyikKyLyLyF.NgAtVAd1tEz81uC7S2DlWYCMkkYlYlYEONoywV6WY+BRZ2..LvK.0V9sMzTVlYlYlU73jF3ZEoWeW.wOa+Z5S2TMyaRCx0jYlYlYEUNkyh7+xV+0eQEUK..jb7hk8+YvurLyLyLq3woLv0WDaomHzRxsMI+Hqt5E+tFTqJyLyLyJhbZsNItrzMuIo3+F..IISf+eMlZAUL3VZlYlYlUb3zdgo9n8zysIo8C.DX3hqBIV0fWYYlYlYVwiDmtG3l6Z6cL2QWW5PHbS..j7plSk0+K1TGsr0AuxyLyLyrg+3Y5KXMoV72NDBe...Is+rY54pVdaa34y+klYlYlYEGNs6RwbTW3ORR6B.fjSHQxRteOdtLyLyL6D6LNv0xNPyuZ1X78EkNJ..IuxpBk7OiAvcKyLyLyrQBNsGCW82l5nkVugwLyVI4hA.HvkMuwLyQswCs0GJ+VdlYlYlM72.JvE.vFOzVeh4NlYNdRdM..j7sO2Jm491XGa8mk+JOyLyLyF9a.G3B.3pOzV27nFyLeyjbl80zML2QW2KroNZ4WjGpMyLyLyJJbFOFt5uU.DaWYtkXT+DfdmTTCgvWdMS4ld+4mxyLyLyrg+xKCz8UOtEO9PE7Gv.+uA.HorR5OXooa9eIeb9MyLyLa3ryp6vUNK6.M+pcG6btQomE.fjIH4WuoZa3ilON+lYlYlMbVdIvE.vctmM2FiG4cIomF.fjAR9kZJUC+Y4qqgYlYlYCGcVMn4OVarimqq24Xl42oDfqij0B.PxqatUNyIMlN15ldV.kOudlYlYlMbvfxjU5cOwEMlxKMb+LvqKWaRZSG9vc7A+j6+gNvfw0zLyLyryUMnM6v2HtzRqJUceUF3GJWaRweUOfMbGst1sMXccMyLyL6bMC1KGObMoV7eYHD9Kx0PT5fPw+vkldc2+f701LyLyryIjWGCWGOariV9gycL00B.mOIKgjkQF9fyqxYNlqtivO7gwdyNXWClYlYlUHMjsfSupIM+2bxRJ4eijSOWaR5wiH96srVWWKCU0gYlYlYC0xaSKDmJ29d2vuH1olULpGHWaj7sFP3wWcpF93CU0gYlYlYC0FxtCW82pSsn+z.C2MIKOWaQoMlA5VuiVa9kJD0jYlYlYCVJHAt..V0jW7UjLI+Vj7xx0ljND.tqkz5Z+GfmytLyLyrhDEr.W..MhYWdU0NgOG.VBIest2TR+Xksm+jktmM7LEvxyLyLyr7hBZfqbZZxK7ZPxvWlL7lx0ljxHf+Vdjiz3RZeiGrPVelYlYlc13bh.W..Mg4UlRU1mljeBRVRt1kzdhPexWs0l+Zq.HVHqQyLyLyFHNmIvUNqtlFdSAh+l9ur.A.HoeQT5tVV5l2Tgp1LyLyLaf3bt.W4rlobSueHcuAxyu+sqn99YQlOwxSu9GuPUalYlYlcl3b1.W..qr5qezkFp3NA4sSxJy0tjD.VaD5yrrVa9IKfknYlYlYmRmSG3Jm0L4EVMSD9KA4+CRlLW68E7pYf3mYIsttmn.VhlYlYlcBMrHvUNqt1EUefI9qfz6ijutZWROXLqV4x1Sy+vBT4YlYlY1w0vp.W4rlpm+kyjk9WbBBdskHzJ+Is17+52EvKL1lYlYVA2vx.W4rlpm+kiPxOMIee8ehSE.PR6TRegtH+R+4st18UnpQyLyLyFVG3JmllTCWLRhkChOBIGU+2mjNB.9NYxh+taeOq8mUfJQyL6zRi.ALoYWQkgRqHIpnh.UEYApf.UDfp.gPIQgDTHgBHIeseVIoXBQljHlHJjH.F.PVPlABYAQFAjkJlQDYYD89cxLJhrQEOBA6LJ1EQlNyH0khI67muu00k6w.yN6TTD3Jm6I0BNujL4sAfaKPNoic+RZK.3KE6Teqkcfle0g9JzLqXVSXdkcjIV5DSlfSLI04IxpHwD.w3kv3A33I03f3XAwXkv3HQk.nB.Tg.pHPVVg98wwST5nDnKAzIE5DDcBfWU.sSf1AT6Qv1CR6OJ1NjZOFyreURx1U1tZ+N2yl6rP+dvrBohp.W4zDlWYwZJ8CFB71HC+1G6968tdo6WJ9U1e5G366YvdyrS.dOoVvDSFUMwDIpIDC0vfpAh0HhZ.zjH3DAv4AfI1+ouF60qu.aogTZPtaHjlDoiRogPZFT5i1Slzct2GrM+6jshQEkAt5ulR0vr.vsAhaljker6WQ8Rf3aEg9VdN8xrQNZByqLLoxO+XPWPf3B.44KfoPho.fo.fZAP08epnYnfjh.3vBnKBzEf5BfcAft.PWRnaRjE.YgPFPjs2tIrutGTJi.yxdaOBfDPJIISHojDn2tcTHgH5cagjjHg.FE68tsMZbLe+XGmrChu+yBf1.vKCxchXbmhXmHhcRnc1Ni6bEoWeWCE0hY4SE8AtxY0iawiOLZdy.3iRxq53cLRZq.3aot64aszWYCaensBMyxmZbRytxIDpbZLQxKBBSCfSUDSk.SE.WH.l7w9TNe1RR8.f88a9RuhDdU.7pAx8GEdUJc.PdPDiGDgvA6g3PkbjizUlLwtN3AOZWq.O7Qxm0T9RSXdkkYrwQqJG0nS.UQPgJExVEYhIHfpfTU.bB.pJRVkfl.AqB.UAfIPxJxW0RTZuDXmR5EH4NAvNgvN5Vc2xct6G7EAfxWWKyxWFwD3p+V0jW7UjLI+HB32+3MVu..TTOIHt+LYz8e6s07SOTWilYmbuefD+1UuvKrjDgoKwoGnltDlNIuH.bQj77xGWGIse.saAtaJrGQraJsaQtaEQaDYdkXT6KQlruxRZeiGLebMKF0XpETQUYRlRIQJDXJEylJPlBBoDQJBlB.oPucM6.9uMIoCCfsAxsgn1JPrkrBszSOnk6Zeq6P4s2PlcFZDYfqbZDyN4DpY7ygAby.rgSz3uHp3Nf38Sp6u8Va9w73KvrgF8NdLKe5gftDHbwB7R.wESfKA.S6ro69jTF.zJ.dIH7RB3kAvKSE+0wP3WSk4WyzY1yRvFOZ958icpcqXVkTWsmeMAEuvDfSCLLMALMJLMPLM.bgjrzAx4VRoAPKPZqBbqLFepdBwm9NRu9WIO9VvriqQzAt5uUgqYTIlRpEPoaF.2vwa7dA.nXbefbSPwGrGD2j+Oplc14VwrJ4MU6Tld.rN.NCIcIDbFfXF.3BFnicnnzQozt.4Kfd6xocIncEQbWINZO65QZeio8TcvvOMBDFaUyOEKKLsDfSiLbQBXZ.nN.TOIm7Y54TR6VPOEEeZQ7zDwmp8VOvu5b0t20FdxAtNNZbRytxITZU2.U7lD37Cji83cbRJJfeFA92ypre+Cj9f+zUfGNyPc8Z145ZDHTYM23ETBSTGIqCHTm.pCPyffSijINSOm8sVplFPOO.edA77HhcDY1Wnmt4KbW6acogGKOi3r5ws3wixU8fn9PHTOflI.qW.WxYxTtgjxJfVHziCgsjEXKGHyq9DqXuObGCl0uU7xAtNEZDWZoiul5ttPP2D.uQRNkSzwJoN.vCqX76in99KssG3og+E91HHe9wM+ITQYg5UxD0y9tiCn2uOiSzcM9joumXsWD.OmjdNR9bPXGJ1yNxtm8siaGO1gyyuErhTMBDF2jm+zXnj5IhyjgvkAfqD.W1o6.5uumfzsIfsPfGGQrkizS7w8XCyNc3.WmgV0jl+aNYxRtQPci.7scx9j488jz7HJF+wQfe7A18AdReGvrg6tULqRpKUpKtDjrdAUO5sabpW.0chdHTNY56Oh8RPX6.Xa.Z6h74Dha+Ua84dgUfms679aBy5Si.gwNoEN8PhDWIC3JHvUfdChcwmNcmce+62mA.OVD5QAzitrVW21f+v11wvAtNK74G27mP4iN4bH3uKAtt9d5nNgjTGP3w.wOVJ6iptB+WdFu2NW0Zl7BqVAVOXn9.P8.pdPVO58I.7LdvpKo1.PK.XaRZa.Z6wn11A1yA2gGqL14ZZL0Bpnpr7JQRNKnvr.wr.vkd57u8kT6.5mJfGMB8nGnmC7XtqHMG3JOZkUuvKJYHwua.35Dw69T8o86aLnzBj9of7mlUY9oGH8gdJeWvrgJMNoYWYUkLtYDAqi.00a2.x5APcjbbmomOI0E.1tjZgfsHgsAjokibzirsO49enCj+eGX1PmFwrKe7UOt2bHQ3sBfYAfqB.W9oZLH12SD6V.vCqnd3ibzN+O8+eXjGG3ZvCWcMMLy.w0BpqEfWKIm5o5E02xewSCfGW.OgxFeh3dZ6o7XUwFnZDyt7ppYbSORVGHmQ.ZF.bFn2PU0dld956CJ7hBpE.1BQrkr.sDAa4NZs4WFtqTrQPVY0W+nShJ9sBA91DvaCDWyowG1NBfmD.OLDd3t5pmeze1A1v9GZpXqPwAtFBcO0t3KHov0BveGRb0.3MSxRNUut9F3vaU.OIDdFP7LJqdlksml2E7ebyPu+R+fpX5IRnKgjWbeAptj9957GHSsBR5.n2wTUKDrkHYKnmLsjss8tc+A.L6DqoI0vEqD8F9hDuC.bEmr+OXe+N9eNj1bVfu2VS+xO1WDaomgtJ1FJ3.WEPMhYW93qcBukfzUCvqFDW8oZbf0eR5PB3WBfmAw3yBvVxlMtsGauOvK34WnhN7tm3hRUVogoKEmdfb5hb5DX5n2A2aMCjSpj5FP6P.aiBaC.aKJsMFUKKssGXO422BlMxTui22DWaPg2IHlM.dKmrtgr2w6q9g.360Cxt46H8525PVwZCZbfqyw74G27mPYkGdKIRDdq.7s.f2J5sqeNsuCE8sdtsCHrM06iv71fhszS1La6Sr2Gb2CZEuMf0HPnpplWsYKqjoFPXpDbpfXpB5hnvzD4TOSlCg5u99zy6B.au2fUZ6PwsirI19ir20tSGN2rgV28DWzXJsjv6fALaB7t.vUcJBfsKIrdprqG6tmefW8CFdxAtFFXkUe8iNYhQekAgqPDWdeO1xW9.YshSRcJfcQncAgcAfcJpcwLZmYicuqk+JaZ2vcSYdUiX1IqppQUSrjRmBXXJfwyOvvT.zE.fK.fWH.p8rbYpoaHsSPrCA9bRwmihOWl.ets05K8Bt6IL6bWqdbKd7bT35XfWO.tdRN8SzwJoNAvlkz5i8bjGb4uxlROzUo1YCG3ZXr0L4EVMRFtbHd4DZlfL2DMYsCzE+09Fz9unfZkhoEwtgTZIsaRkNa1vtUhrouizqeeXDbvraEypjKdhSYRkVFmbPbxPpZEvjoP0.XxhrZJTCHpE.S5rYw3MGI8J.3EfvyKpmmBOe1X74yxr6nic+fujWiOMq3v8N44O8PxRlCgtd.dcmnmX39d.V1hjteQceKq000xPboZmAbfqhP8dGwpXFAv5DTtY765.Xcjb74iqQeca4dAv9.v9AP6P89cA0NI2eDpcpX6JxCRjsydPnyRD5Z+5fch89vcUnBHbqXVkbYUMoQojkLprBigI0XYLwXQBM1fvX.CiERiUDiifUAxpPTUIfpHQU.nJRNl7YM02u3rM.7hBXWTXW.ZWh7EP1d149icrSOO9X1HOMhYmrppG20hPX9.XALv5OQGqjdFHceYxh661aq4mdHrLsSCNv0HLqdbKd7wRyL0jIKYZQDmZfgoAnoBvoBoowPXhCU0hjNL.5D.cAnNAXO.HCfxHwLfpGJlADY.PFAkgfQAEfXfDIDP.PAJFDQB.EHPB.VF.JG.iR.kSoQgdWZYF0.cwP9r38YD8FlpUH7xB5WCfWVRubP3kPL7hXuG4k83xvL6TYUSZgWRxjgE.xEBfq8D8jtqXbah39Hz2cIsttmXHtLsiCG3xdcVY0W+nSxQegRYSkHvTfLEDqADo.PM.JE.qgjSnPWqER8MQFtO.zFDZCD6Q.swW+Om9HcGS+y2251iGX5lY4aMU07FqJqrEPh2K.m2IZMgTJ9q.32r6rY+Wty87.uvPccZ8xAtrAjlv7JCUgIojkTkXnJPVEolfHqhPSnecE2D.0XAXE.Xz86qJxGiqoAh95Nzi.fCKnCAwCBpCRgCAxCBoCBxCBfCBf1y00nDIZu6X11Ksmd12RZeiGrPT6lY1wSioVPESPItAFv6EfK3DMrGhQ8S.02Lix9ctizq+UFpqyQxbfKqfYU3ZFkRcdiVJN5jnzJXLaIwDJIigRBIXBDYIJnjRHohJYhPHoPLPDhfJpHxRDifIhYYLlHKxBFhhHa1H5FRGNQLyQXL6g6orjGQwid3e1d17Q7caxLqXVSXdkgZKaNB78SfahjUdrGijx.oMJnu7yl9Wud+jLO3yAtLyLyJR0XpETwDXXQT7V.4bOdi4KI0lD9ZYPlujmjUG73.WlYlYi.74psgIVAv6mP2B.e6Gug0QLpeBI9Rs2y9+N9IiN+xAtLyLyFgYkUuvKpzPhOB.9CYfWvwt+nzAAvWMix72665U9gCbYlYlMBUi.gppYgyQgDeLBrHRV5wdLJpGJB828SR27C3w.6.mCbYlYlY3dRsfyKoB+2Yfebxva5X2ujdQH7OzIwW7Ou00tuBQMNblCbYlYlYuN2a0K7cmHQ31.3hO1EVaI0kD9Jwr8buKusM77EpZb3FG3xLyLyNttmZW7EjT3OhjebRN49uOIEEv+V1rXk29dV6OqPUiCW3.WlYlY1IUi3RKcB0T2GfArLR9VO18KoeT1rw+uKeOqaCEh5a3.G3xLyLyNscuUuv2cHQh6LPNuiceR5wgvmYIoW65.fJ.k24rbfKyLyL6L1Zpd9WNCIuCP96crSnpR5WDi3yrrcu16GN3E.bfKyLyL6rvcOwEUaYkxamj+wG6BnsjdZDielkr60ceXDdvKG3xLyLyNqsxpu9IWZnh6.j+Ijbz8eeRZKYQ7St7VW2CUnpuBMG3xLyLyxatmTK37JgItc.dajbL8eeJpueVE+jKe2q6mWnpuBEG3xLyLyx6V0XmSUIqbT2I.WBIGUt1kj.4+pNZ2epk9JaX6ExZbnjCbYlYlYCZt6ItnZKurPi.3iRxj4ZWR8.g+5CejN9q9j6+gNPArDGR3.WlYlY1ft6o1FpqDxOKjdej70xeHo1fzmp8zM+kWAPrPViClbfKyLyLaHy8VyhtpDgvpH46r+sGi5I.ve5RSu1Go.UZCpbfKyLyLaHWS01vG..qjjWX+aWJ9MP7nKeI6di6s.UZCJRbpODyLyLyxu13g15u75Oz3+GCioxtAvUmaxSkjWIXxO17pr98swNZ4IKvkYdiuCWlYlYVAUSUMuyGkU9JYfen92tj9QwH9iW1tW6upPUa4KNvkYlYlcNglR0vb.wWfjSOWaRpaH84+koe4+2eQrkdJj02YCG3xLyLyNmwpv0LpD0V8mlf2Q+WiFUTOoxl8Cuz1dfmpPVeCTNvkYlYlcNm0T87ubDJ4eLD3uSt1jT2RZE+moa9t+t.YKj02YJG3xLyLyNWEaJ0hWBH+bu9Yq93OqGk8CeGoW+VKjE2YBG3xLyLyNm18TaC0kD3qFHulbsIoCKfkuzVW6+Pgr1Nc4.WlYlY147d+.IdGoV7cHxUDHKKW6QEatKvO1edqqceEx56TwAtLyLyrgMVS0y+xYhR9lj7Jy0VT5kiJ6GZ4oef+yBYscx3I9TyLyLaXiM141a6FNzz9JXLIGKIuZ..RNVB9GL2wLyiroCs0GsPWiGO9NbYlYlYCKslZV7MRhuFCgIlqsnhMyibz+fkz9FOXgr1NVNvkYlYlMrUSUMuyWkU9290M8QDiaCR2zR185d1BYs0etKEMyLyrgs13getCd0cT8Wq7JKqRR91..H4DA4G9FpblO6F6XqsTnqQ.eGtLyLyrhDMkZQ2BX3eJ2b1k50+qklt4OWgt1bfKyLyLqnQSoZXV.39YfWPt1hRe8ms0W5iUHWKFcfKyLyLqnxJq95mboIF82kjuybsondnizc78bW6acGpPTSdLbYlYlYEU1bmOemW3gF82bRiYrUSxYA.PxomLAuw4T1TadScsiNFpqIeGtLyLyrhVMUaCeJR9YyssjdwXDyaY6ds+pgx5vAtLyLyrhZqo1F9vD3ehjk..Ho8iLYuwkz1C7XCU0fCbYlYlYE8ZJUCyAD+qjbL..R5PR3FWZ509HCEWeG3xLyLyFQnoZWzaAHrQRNY..I0IxFW3R1y59AC1WaG3xLyLyFw3dRsfYVBS9ePxT..R5vRYW7RS+.adv755.WlYlY1HJq47l+LPok7eDHOe.fnzQUD2zx18Z+2GrtlNvkYlYlMhyJqdgWToIR7CH4TA58NckUZtKOcy+3AiqmCbYlYlYiHslTK3BIS9CH4zA.jzAhPuqk0ZyOY99Z4.WlYlY1HV26jm+zSjrjGoeioq1T287NV5qrgsmOuNg74IyLyLyrgSVdaa34U1dlij1O..ImLKsjMuppl+TxmWGG3xLyLyFQao6YCOCxj8FkTm..jbpIKujMz3jlck4qqgCbYlYlYi3sj1dfGCBuGI0M..IeySnjw+MZLOkUxKd0lYlYlAfM1wV2wbGS8ubfrA..RNyxGyLKeiGZqOzY641AtLyLyLqOa5Ps7jyaLyrBR91A.H46XtiYl6biGZq+hylyq6RQyLyLy5m1acs+YJp0kaaB7EWSMK325r4b5.WlYlYl0Oq.H1dl8eKR5o..HYoLj7au5ws3wOPOmNvkYlYlYGiUr2GtitylsAI8p..j7hBile4A54yigKyLyLyNN1bma6UmWk0sMxvGD.fjuo4TYc6eSczxO8L8b4.WlYlYlcBrwNZYqyaL0OARdM..D75lSkWxCtoN1V5yjyi6RQyLyLyNIZu0s+Ijz+EPuimqDL4WqQbokdlbNbfKyLyLyNIVAd1tylomOjj5..fjWVU0VWimImCG3xLyLyrSgk21FddAcW8qoOQSoZXVmtudG3xLyLyrSCKs0l+BQoe...ISBh+4S2tVzAtLyLyL6zi5Ia1OV+Vjqu7IjZF2woyKjCt0kYlYlYEWZJ0h+exP3uF.PRcIk4Mszzq+EOYuFeGtLyLyL6LP6oa9uKF0S..PxJHSdumpWiCbYlYlY1YfU.DEwsIIA.Px26pqYQuyS1qwAtLyLyL6LzxZcsOJ.9541lgvcexNdG3xLyLyrA.oLeZIcD.f.40r5ZZ38bhNVG3xLyLyrAfkld8unD9ayscHf+RbBdfDcfKyLyLyFfx1YWedIcH..RdEqN0hW7w63bfKyLyLyFft8C98ZW.+841NP9oNdGmCbYlYlY1Ygdx148JoCC.Pxq5dSsv29wdLNvkYlYlYmEty8r41.z2H21AD9SO1iwAtLyLyL6rTlL3uI2OSx2yZl7Bqt+62AtLyLyL6rzs2VyOsj9Q.8svVmL762+86.WlYlYlkGDg9Ju1Fh2R+2mCbYlYlYVdP2GU22qMQnF3a4dm77mdt84.WlYlYlkGbW6acGRBaN21Lj75y8yNvkYlYlY4KD22u4GYmExRwLyLyrhVqolF98aJ0htkS8QZlYlYlYlYlYlMbw+e.mL1gSr.2B4N.....IUjSD4pPfIH" ],
									"embed" : 1,
									"id" : "obj-17",
									"maxclass" : "fpic",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "jit_matrix" ],
									"patching_rect" : [ 264.0, 0.0, 604.0, 176.0 ],
									"presentation_rect" : [ 264.0, 0.0, 604.0, 176.0 ]
								}

							}
, 							{
								"box" : 								{
									"data" : [ 6008, "png", "IBkSG0fBZn....PCIgDQRA..APH....rHX....vCgjA2....DLmPIQEBHf.B7g.YHB..W7RRDEDU3wY6cmGcbUceG.+626aFI4MIa4EoQ1Xa.GaCtjBwD1RJzDJ1JfsjMINIEBjTBkSZgVgsqCI8jTUmdRoodSpIooIgTZVomRCwVFCx3z13DnPf.sIkMyR.AnMuHYaIYqkYt+5eHMBgrrsj0LySKe+bN5n4ceu489Iaq4qe2289d.hHhHhHhHhHhHhHhHhHhHhHhHhHhHhHhHhHhHhHhHoDapvqcdgcMHhHRlkq+Mr4XqXwY4x5uMLJFQDQBOmPfPTF4l.v0us7JcpgP8HhHRHo+ABD.eBRlCmDtgvnfDQDIb7NBD1VAkdUjbt..D7SGNkjHhHgg2QffywaN4qI46YaEU5El4KIQDQBC8FHrEbYSvH9v8ak5rDDQjwI5MPvEqvU4Hy8ctZdCUhhyNSWThHhj481ABzto9uRRluUTVqNyVRhHhDFb..ULqUV..W1.sADtaIyVRhHhDF59LDb7FHYvIYatZMykEQjw95NPftSn6hRhjtntr9TYpBRDQjvgaqErxk3b7hNUaDA9i59ahHhLVkKHH3lOcaDIm2VKpjqNSTPhHhDNb.3FGLaXf4zbRPDQFCyQxYOX1PiX02cdW2zR2EjHhHgiS3tc5IcCIydBSL5f5rIDQDYzmH9DIVGnyCfDflmF2BcLG..e73+YHHnE36dc.7MB45UDQjzjSXjCUYQq5YI4R..LKw6or5p5+IyWVhHhjoMPcYTM89JyM2LWoHhHRX5DCDLq2tExCulgxhHx3DmPffA16YH3na9YzpQDQjPyIFHX3k5yhmeFrVDQDIDcBABIb3Y6yhWPFrVDQDIDcBABsT21eEyriC.PxhzjQSDQFe3DBD1HfG.uPxkyYBA5rDDQjwAF3YprY+eIeIc72IiUMhHhDZF3.A91WGABbgYrpQDQjPy.FH381Sl70F36KyUNhHhDVF3.gF1+SYl0E..ANOcgkEQjw9Fv.g0im33.3Y..HIyNmfqHiVUhHhjwcRu8Wal8X8tQApaiDQjw5NEABr2.ApqifHhLl2IMPf9D8FHX.W5lJ3ZlTlojDQDILbRCDty8uyFMy9M.c+zRKRvDt5LWYIhHRl1o7QnoAaWu8F5ttze4HhHRX4TFH3MeuABFv0l9KGQDQBKmx.gGu9c9DlYMA.3HmSEyZku6LSYIhHRl1oLP39AR.X6N4xLHPcajHhLF0oLP...1aecD.vGM8UJhHhDlNsABs2Ipp2mOBNdgUVXI5onlHhLFzoMP3tNTUsXlsy29c3twzZEIhHRn3z2kQ.vn8C6yh2..X5obDQDIrLnBDdg5p8gSNZiH47qH1pzsxBQDYLlAUfv2BOcWvr+sjKShaJ8URhHhDFFTAB..If+GzmEuw+to8GjWZndDQDIjLnCDVW867wRduMhjSZB4Lo+nzWYIhHRl1fNP..va3q06Bj2NzEWVDQFyXnEHTeC+.yrlA.H4BpnvR+PomxRDQjLsgTfv5wSbbyv2I4xzg6H0WRhHhDFFRAB..c4S7OZl46dIV7VKXkKIUWThHhj4MjCD1Pi670.PU..jjNm6uJkWUhHhjwMjCD..hm.2cxWSxOhNKAQDYzuyn.g0231eRya+T..R5BbAewTaYIhHRl1YTf..f27+M8t.wZzcAUQDYzsy3.g01PU+byr8.z8YI.pqkfHhLZ1Ybf..P7D3Kz6BDezsVXIW7vthDQDITLrBDVeia+IMy+..cOhiBbtsjZJKQDQxzFVAB..w6xeWlYcA.PxqrhXkr5geYIhHRl1vNPX8GXmuBf8OlbYR211BtrILb2uhHhjYMrCD..NVaw2n2rC..Px4EIVge9Tw9UDQjLmTRfvm+H6pYB74RtrQ7Y2VQkrnTw9VDQjLiTRf..PY0s860a1S..3Hy1AdOP2drEQjQMRYAB.vRD2ts29BL6d+UDaU2dJb+KhHRZTPpbm8Hssu8W7jWTDRdU8zzUd0S5b9Q6o0W9HoxiiHhHodoxyP...MW+K+kMydN..RN4rbY88JOMbbDQDI0Jk+A0aDOemwSfawLKNP2yMg7isp6JUebDQDI0Jk1kQI8Hs8h09glxhII+.8zzUtrIsvGd2stu5RGGOQDQF9RackyiV21+xdu8eC.PxnAN28UY9Ema553IhHxvSZKP39ARzkOwmva1QA.H4BPN47cSWGOQDQFdRKcYTR6osW5vEm648pDXM..jbwKexK53U259drz4wUDQjgtzZf..P0s7hOewSYw4QxKuml9fKahuqGc2s8RuV59XKhHxfWFY3f1TcM+YMy+n..jLHHH39qXFW26JSbrEQDYvIiDHrQr23I5r8OpYVc..jLeFMxCd24ccSKSb7EQD4zKiMgwV2A2c8vPIlYGC.fN2Bm3jh9.2FVZzLUMHhHxIWFcFDWV8a+o8dbSlYF..I+8WRQy46BcSvSDQBco8Kpb+s6VewWn3Iu3NH4e...Iufhmxhld0sruGNSWKhHh71x3AB..U25K9nKexKdlj7R..H4kr7orXTcKu3dCi5QDQjPJP..n5VewGt3ornERxK.n6tOZ4SYQsVcK66wCqZRDQFOKzBD..laKStpYLkbeujbA..jbYJTPDQBGgZfvSi58W5jWvOYBv89H47A5NTn3orn1ptk88eGl0lHhLdSnFH..r2VeottzIuf6u+gBKexKpqpace+hvs5DQjwOB8.AfSZnvUu7or3oVcKu3iDtUmHhL9vHpw+e4wVwDymQ1NIuljs4M662bcMeKaD6MdXVahHxXcinBD..JGmeV4O6E8CRdGRE.vaV0czg+idWGppVByZSDQFKaDWf..P4.t7iU5WmN2mIYalYOam9NWwFZ3gpILqMQDYrpQjABIUYrR+qoyUdxkMy1Ohmnzx1+NehvrtDQjwhFQGH..TYrRtQituiiLa..yr1AvsWVca+eNjKMQDYLkQ7AB..UVToWgAtcG4LS1l2r6g009cTFptivr1DQjwJFUDH..roBV4YmUPv1I46NYalYOcm9N+v55JHhHCeYza+0CGanwc9ZMYwubuYe+jsQxklkKq+2Jl8pWyo58JhHxo2nlyPnupnnR+SI31HYVIay7181T7l+y23A1aqgYsIhHiVMpLP..XaETxk5Bb+HRdNIayL6kim.eh0231exvr1DQjQiFQbqq3Lwtaae09AxZg2aj.bVIutBjb5Nha4CM4EM4Ks0B+E6E0nY2rHhLHMp8LD5qJhU5M.xugiL2jsYd+Kk.9aYc0uyGKLqMQDYzhwDAB..apvqcdY4x5a226CRlYdyv2vNl8EV6Q1wgCy5SDQFoaLSfPRUFqzaEjalj4krMyr8689Mr1Fp56El0lHhLR1Xt.A.fJyu34fbx4ehjWWea2L6WXwSbG24924uIrpMQDYjpwjABIUQrRVMoqBRN2jsYl4Av8lnyi+EW2A2c8gX4IhHinLlNP..XSEbMSJZvj9hDXcjLZx1MyZCls4N8GaSanw8zVXVihHxHAi4CDRZywVwhixHagjWaea2LqAu4uaW8c9M08EIQjwyF2DHjTEEU5USialNdg8scyrZAvWto5douyFwy2YHUdhHRnYbWf.P2O.dlZQkdyD7uwQNm9tNyrZ.vWoo5Z9d2H1a6gTIJhHYbiKCDRpRTb1HV12FH+7jLVeWmY19Av+fuM6qq4vfHx3AiqCDRZK3xlPPgy5yPm6yQxY020Yl0pY12x73qt1F2wqGRknHhj1o.g9n7XqXhSEta0Q25H47565Ly7Frc5g80VWcU8SCqZTDQRWTfv.nbbUQlVgS6iSG9rj7B5+5My+B.1W+3G+X+fOWy+ziDF0nHhjpo.gSMtsBWUwNGJC.Kijui+7xL63.1OFddOk0v12aHUihHRJgBDFj1bQqZgQAtcC3S026ppIYl8Jlguiuqi+c0LfVDYzHEHLDU9LupImezocS.3VI46o+q2LKA.9odu+G0YW3mbWGppVx7UoHhLzo.gggJKpjKxL2mlD2HImZ+WuY1wMy1oQ6Gd35dkp0DdSDYjLEHjBTNtpbxOVdeXitOMA986+0Z..vLqYXVUdZOvgq6HOhlzaRpTkn3rQ9H61xImnQ5pynYEwkEiGIZWQhGMh2h3gyBHMObVBF2...i3sDI5JHQmsacZc3mf0wS13dZ+9ARDx+3HgDEHjhs4hJ8rB.+3Nfajj+tCz1Xl0lA7vvreR6s21tzHUZ7saCKM54N8YOyrxlyxfMi.3x2.xGlkOAyGDSEj4By59qtuFVSB.SL4Wjzkppmd51yiAfiBXGEfGsmW2BLdD.6fdxC.XGffGzR3OfYINvQBXCar9G7Xop5Px7TfPZzVKXkKIHH3F.vMPx4OPaiYVW.3wfYUGOd7pW+A10uNSViR5S4y7pl7Til2rsD1rCna1FQLRTjYHFIKDFJ.DyhjSKrq0TEyrlAvaAXuE.dKCrV.+aPu62hNa+UKqopqE.VHWlxIgBDxP1ZgkbwAN2pAv0SxEex1Nyr5ggcazuaemcrWMhkFYpRTb11LBlKxJxbMfyxANWC3rHvYAf4.f4z2mZeoady5..cPy5BjcACcYz5jfcAf3.fF.ILBzSWZZlCjYAfr64qb.P1jLHcVmD30.vqBfW0fsOKAd933XO+FZbO6OccbkAGEHDB1brUr3HH35I4pAvRGnq4PRlYuL.94du+mGGw26FZ3gpIyUoieUY9EmqEI57YD27fg4Cv4AGmKL+7.37.vrNU+81PQOcQyAAv9AvALflHPS.VSdvlbl0LHOJ7INJbtiZIheTCQZMNN1wZ024wvA16w1HfOUTK..qAH38mewSB.4hrxJW3sbQPPtv74Zj4AvYRfY.hYBXyDfyD.yD.wX2ALmQLyZBvdd.97dy+bvyeS6sG+W+4OxtZNU8ylbpo.gPVEyZkEXNtbmiECvqgjy3Ts8dydKB6IgweUB5epNZKwSqegYnaK4tr7iL4blmYX9Dbdf87g9FlOHl+.MpwFpLyZ2fUKAqEvpEFqynUOLTO8V8fnwtne++E0+fGBiM5FEtoBtlYF3xdNALX1.bN.XNFv7.v4Bfy0QNyg5N071aBX+Z.7+Zvdltr3Oi9OFkdn.gQPJGvkaAq5hCBrkSvOH.tLRlyo6808jhydFR9bl2dt3Lwy0R8s7JaD6MdFnrGw41vRi9tJrfhhxrNK.at.bt.1b649S07.v7H4jGNGCyr3.nV.7FFva.XuAAeSC3MMXu0wAey+x519gRE+7LVxWY5kLkHtDmiKH54RZKffmGnc9.77H4TFr6Gy6ODHeFC1uxL7j9Nh+TquocUa5r1GOPABifUNN+rlVrEdI.1URxqD.Wwf8WZLy5D.6y.1GA9sFvqQC+VqqtdslO3qUynw4DwZ.Bt7Yr7YgnQi4rfBA69hy18EoEyF.yFc2+8ELbG0MceaIA0zyWuNLTiAqFO70DzQW07nMUc8Z3YlZUY9EOGjcNmOfc9FvEzynzaICl+SQ..lY0AfeoG3wogGu45a9Wog28PiBDFEYM.AW1rJ87iDguWX16EjWL.d2C09s0LyCf8aFpmzZn6uyFfYM3AOHLbXmyNB71gauKbXWjiejT0yc591+z9rxYJv74RmkqYASgNed.LeBLC.Lc.1y2wzQ28Q8LRUCuRyrVPxOv2PMdhWmjudh3VMdz1qqKv4HCqAH38WXIKxS2uqC1EAxkBfKZvLxr5dD7Y+OlgG0.9EIPhG8un9G7fYfxdTKEHLJW437yJuBWv614vEPysDiXIzvRnimUp73XlYFPmDnc.zALzAHZGvF3tkxnCr2QuRuihkz4HXoO0pG.M.f2Djug48uoAqF.9FNZ0Du01qY8G8QZJcWGR5ylJXkmcVjKEjWBHeu.3hOccCX2+SX6Egg8ZN2+ISb7eVYMT8AxPk7nBJPXLpJyu3b8Qy57bNr.i7bnwy1ncND7rQ2CIxT1DYJSomOn+fn6OrudXVCfndyXCz705ctZoEu1lquk5Fud8SFupb.WdErxyy4bWF.tBRb4.bwmlQvmAfmCv9ORjv1SBb7eVp5LgGsRABiCcaXoQWR9yr.KqHwnKnPXLFHJzLqPBluQjG.lJAlJPOulbBohi86bVvhV.riBiGEDs.yNJHaxL6flgC4fcHuwC5MbH5a+fG4fse.8A8xf0cm20MsILgHWNb7JggeORbwmptW0LqSC1iSi6Nd7tdnwiSRTEHHCVrbbUYOgoEM6bhNgbPfkM5xx1hDMx.t0NuOdBqy9dexo0F6rC8A5RXobbU4L0Bl5kQG9.j7C.fK8zDPTqA7vzvC1DhumwC2VNTffHx3RkGaESbZfuOffkQhqAcO.MFvOSzL63vvdLXUEGI1wX0KNsBDDQDz8jDEtfqgN6ZggkQma5Cz10S2dtW.7uawS7.2492YiY1JM8QABhHR+TNfapEspK0ArB.TJIWx.sclYdX3+xfce1wvOdsGYGGNCWpoTJPPDQNM15rttyw4BJkNd8.7JFnQoWOSFzcACe2mq927g9V3o6JDJ0gEEHHhHCA+8y7ZKLqnQudBtF.bkmjvgCBX+PKQ764NabWOaHTlmQTffHhbFZqyX4wBhlyGCD+gjtKYf1FuYOAA91wqqg6a83INdltFGJTffHhjBr4hV0BiX1MSxahjys+qu6Git3eFww2nrCr8WMLpwSGEHHhHoVrhhJ8CRi+wfX08etNzyEh9AggsVVCaeugUQNPTffHhjl72Vzpl9j.9j.3OgjKn+q2L6oMxuRy09S9woxGxQmoTffHhj9wJKbkKGtf6..Wa+m.bl2+RFs+tlq6He+vb17q.AQDICZaEUxhbFuSP9I6+8HLyrWAl+uto5q59BiyXPABhHRHXywVwLhhfx.4cz+GYqdydd3s+p6rgc7.HC93UUABhHRH5qL8RlR1Y4tcRrARleeWmY1uzmvW1ZarpeYlnVTffHhLBPk4WbtVN4rV.rNGYtIaumGrO+v3sG+yktetQq.AQDYDjsj6xxOxjm3cAf+7997j1L6XvruTS0e3sjttvyJPPDQFAZaET57Y.2ji7iz21My90I79accMT0uJUeLUffHhLB11JrjqjzUgywKJYalYIfgJZp9l+BaD6s8T0wRABhHxHbqAH38UTo2IA+RjbhIa2L6YsDc8GlptA5o.AQDYThMUvJO6nAt+IGcKKYalYsCy9rkU+N9pC28uBDDQjQYpL1ptMPrs9c1B+3NSz1mbCMtm1NS2uJPPDQFEZaEUxhbv8iH46IYalY+eIh20pV2920u8LYeFj5JOQDQxT1cK66PyskIcuybJ4lGIuT..RV.ctaZ4SZgOwtace0LT2m5LDDQjQ41VgkbyNm6albdKz80U.e7xpe66XnreTffHhLFvVKrjKNv41AIKBn6glpA+e7cVWU26fcen.AQDYLhsUPoy2EvGgjuKftusW389O0Zanpu2f48q.AQDYLjJKr3YBWNOLIWJPOShMu+iWVCU8ue5duJPPDQFiYa4U5TcSj+WzwKD.vLqKeBaYqswc7yNUuOEHHhHiAs4XqXFQYvOmzcd..lYGryDItjMz3NesS16QABhHxXTaI+qa1QxI5SQxX.cOOEZxheYar9G7XCz16xrkmHhHYJquocUqOge0dy5..fjWP9LxVOYaulXZhHxXX6ts8UawSYg0R5JE.fjW7xmzhdppaceub+2V0kQhHx3.UFaU+qzwOF.fY1q2jEeI8uqiTWFIhHiCzFwsalcP..RN+oyHqq+aiNCAQDYbhJhU5m14b2C.fY1Q7sYyesGYGGN450YHHhHiS7X0ui+Ey7u...IyyMIbq8c8JPPDQFm39AR3A96StrA7Y565UffHhLNhqtNtOyrCC.3n6bqrnR58Y0rBDDQjwQJCU2A.dndav36O4KUffHhLdi2p9sWvZJ7JDQDQBarhBW0mnxXkbiPi1TQDQDQDQFP++.xSbO2jRWIZA.....IUjSD4pPfIH" ],
									"embed" : 1,
									"id" : "obj-15",
									"maxclass" : "fpic",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "jit_matrix" ],
									"patching_rect" : [ 136.0, 0.0, 388.0, 176.0 ],
									"presentation_rect" : [ 136.0, 0.0, 388.0, 176.0 ]
								}

							}
, 							{
								"box" : 								{
									"id" : "obj-48",
									"maxclass" : "live.line",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 85.0, 305.0, 905.0, 15.0 ],
									"presentation_rect" : [ 85.0, 305.0, 905.0, 15.0 ]
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-46",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 30.0, 395.0, 110.0, 23.0 ],
									"presentation_rect" : [ 30.0, 395.0, 110.0, 23.0 ],
									"style" : "",
									"text" : "min.threadcheck"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-47",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 140.0, 395.0, 220.0, 21.0 ],
									"presentation_rect" : [ 140.0, 395.0, 220.0, 21.0 ],
									"style" : "",
									"text" : "message thread detection for developers"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-44",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 30.0, 370.0, 110.0, 23.0 ],
									"presentation_rect" : [ 30.0, 370.0, 110.0, 23.0 ],
									"style" : "",
									"text" : "min.stress~"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-45",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 140.0, 370.0, 177.0, 21.0 ],
									"presentation_rect" : [ 140.0, 370.0, 177.0, 21.0 ],
									"style" : "",
									"text" : "dsp stress testing for developers"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-42",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 140.0, 470.0, 210.0, 21.0 ],
									"presentation_rect" : [ 140.0, 470.0, 210.0, 21.0 ],
									"style" : "",
									"text" : "get the path to the preferences folder"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-43",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 30.0, 470.0, 110.0, 23.0 ],
									"presentation_rect" : [ 30.0, 470.0, 110.0, 23.0 ],
									"style" : "",
									"text" : "min.prefs"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-40",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 500.0, 465.0, 167.0, 21.0 ],
									"presentation_rect" : [ 500.0, 465.0, 167.0, 21.0 ],
									"style" : "",
									"text" : "return the value of pi"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-41",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 390.0, 465.0, 110.0, 23.0 ],
									"presentation_rect" : [ 390.0, 465.0, 110.0, 23.0 ],
									"style" : "",
									"text" : "min.pi"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-38",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 875.0, 420.0, 160.0, 21.0 ],
									"presentation_rect" : [ 875.0, 420.0, 160.0, 21.0 ],
									"style" : "",
									"text" : "like the phasor~ object"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-39",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 765.0, 420.0, 110.0, 23.0 ],
									"presentation_rect" : [ 765.0, 420.0, 110.0, 23.0 ],
									"style" : "",
									"text" : "min.phasor~"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-35",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 765.0, 470.0, 110.0, 23.0 ],
									"presentation_rect" : [ 765.0, 470.0, 110.0, 23.0 ],
									"style" : "",
									"text" : "min.xfade~"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-36",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 875.0, 450.0, 177.0, 35.0 ],
									"presentation_linecount" : 2,
									"presentation_rect" : [ 875.0, 450.0, 177.0, 35.0 ],
									"style" : "",
									"text" : "pan and crossfade audio signals, sharing a common code base"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-37",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 765.0, 445.0, 110.0, 23.0 ],
									"presentation_rect" : [ 765.0, 445.0, 110.0, 23.0 ],
									"style" : "",
									"text" : "min.panner~"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-31",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 140.0, 496.0, 140.0, 21.0 ],
									"presentation_rect" : [ 140.0, 496.0, 140.0, 21.0 ],
									"style" : "",
									"text" : "like the makenote object."
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-33",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 30.0, 495.0, 110.0, 23.0 ],
									"presentation_rect" : [ 30.0, 495.0, 110.0, 23.0 ],
									"style" : "",
									"text" : "min.note.make"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-19",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 500.0, 440.0, 167.0, 21.0 ],
									"presentation_rect" : [ 500.0, 440.0, 167.0, 21.0 ],
									"style" : "",
									"text" : "process lists in various ways"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-27",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 390.0, 440.0, 110.0, 23.0 ],
									"presentation_rect" : [ 390.0, 440.0, 110.0, 23.0 ],
									"style" : "",
									"text" : "min.list.process"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-11",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 140.0, 345.0, 220.0, 21.0 ],
									"presentation_rect" : [ 140.0, 345.0, 220.0, 21.0 ],
									"style" : "",
									"text" : "a simple object posting the Max console"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-12",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 30.0, 345.0, 110.0, 23.0 ],
									"presentation_rect" : [ 30.0, 345.0, 110.0, 23.0 ],
									"style" : "",
									"text" : "min.hello-world"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-8",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 500.0, 415.0, 240.0, 21.0 ],
									"presentation_rect" : [ 500.0, 415.0, 240.0, 21.0 ],
									"style" : "",
									"text" : "arbitrary calculations using C++ expressions"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-10",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 390.0, 415.0, 110.0, 23.0 ],
									"presentation_rect" : [ 390.0, 415.0, 110.0, 23.0 ],
									"style" : "",
									"text" : "min.function"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-7",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 765.0, 370.0, 110.0, 23.0 ],
									"presentation_rect" : [ 765.0, 370.0, 110.0, 23.0 ],
									"style" : "",
									"text" : "min.edgelow~"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-6",
									"linecount" : 2,
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 875.0, 350.0, 100.0, 35.0 ],
									"presentation_linecount" : 2,
									"presentation_rect" : [ 875.0, 350.0, 100.0, 35.0 ],
									"style" : "",
									"text" : "fancy versions of the edge~ object"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-5",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 765.0, 345.0, 110.0, 23.0 ],
									"presentation_rect" : [ 765.0, 345.0, 110.0, 23.0 ],
									"style" : "",
									"text" : "min.edge~"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-3",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 140.0, 520.0, 125.0, 21.0 ],
									"presentation_rect" : [ 140.0, 520.0, 125.0, 21.0 ],
									"style" : "",
									"text" : "the same as dict.join"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-2",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 30.0, 520.0, 110.0, 23.0 ],
									"presentation_rect" : [ 30.0, 520.0, 110.0, 23.0 ],
									"style" : "",
									"text" : "min.dict.join"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-1",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 875.0, 395.0, 160.0, 21.0 ],
									"presentation_rect" : [ 875.0, 395.0, 160.0, 21.0 ],
									"style" : "",
									"text" : "n-channel audio filter"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-32",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 765.0, 395.0, 110.0, 23.0 ],
									"presentation_rect" : [ 765.0, 395.0, 110.0, 23.0 ],
									"style" : "",
									"text" : "min.dcblocker~"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-28",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 500.0, 390.0, 186.0, 21.0 ],
									"presentation_rect" : [ 500.0, 390.0, 186.0, 21.0 ],
									"style" : "",
									"text" : "convolution calculations using lists"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-29",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 390.0, 390.0, 110.0, 23.0 ],
									"presentation_rect" : [ 390.0, 390.0, 110.0, 23.0 ],
									"style" : "",
									"text" : "min.convolve"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-26",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 875.0, 520.0, 190.0, 21.0 ],
									"presentation_rect" : [ 875.0, 520.0, 190.0, 21.0 ],
									"style" : "",
									"text" : "record and playback audio loops"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-25",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 765.0, 520.0, 110.0, 23.0 ],
									"presentation_rect" : [ 765.0, 520.0, 110.0, 23.0 ],
									"style" : "",
									"text" : "min.buffer.loop~"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-24",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 875.0, 495.0, 190.0, 21.0 ],
									"presentation_rect" : [ 875.0, 495.0, 190.0, 21.0 ],
									"style" : "",
									"text" : "like the index~ object"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-23",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 765.0, 495.0, 110.0, 23.0 ],
									"presentation_rect" : [ 765.0, 495.0, 110.0, 23.0 ],
									"style" : "",
									"text" : "min.buffer.index~"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-22",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 140.0, 420.0, 190.0, 21.0 ],
									"presentation_rect" : [ 140.0, 420.0, 190.0, 21.0 ],
									"style" : "",
									"text" : "like metro, but interval is a random"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-21",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 30.0, 420.0, 110.0, 23.0 ],
									"presentation_rect" : [ 30.0, 420.0, 110.0, 23.0 ],
									"style" : "",
									"text" : "min.beat.random"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-20",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 140.0, 445.0, 210.0, 21.0 ],
									"presentation_rect" : [ 140.0, 445.0, 210.0, 21.0 ],
									"style" : "",
									"text" : "like metro, but using a sequence"
								}

							}
, 							{
								"box" : 								{
									"fontsize" : 12.0,
									"id" : "obj-18",
									"maxclass" : "newobj",
									"numinlets" : 0,
									"numoutlets" : 0,
									"patching_rect" : [ 30.0, 445.0, 110.0, 23.0 ],
									"presentation_rect" : [ 30.0, 445.0, 110.0, 23.0 ],
									"style" : "",
									"text" : "min.beat.pattern"
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"fontface" : 0,
									"fontname" : "Lato Light",
									"fontsize" : 16.0,
									"id" : "obj-16",
									"maxclass" : "markup",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 734.0, 179.0, 306.0, 91.0 ],
									"presentation_rect" : [ 734.0, 179.0, 306.0, 91.0 ],
									"text" : "You can <b>create your own objects in C++</b> with the Min Development Kit.<br/><br/> To get started, <b>Create a Package</b>."
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"fontface" : 0,
									"fontname" : "Lato Light",
									"fontsize" : 16.0,
									"id" : "obj-14",
									"maxclass" : "markup",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 374.0, 179.0, 323.0, 121.0 ],
									"presentation_rect" : [ 374.0, 179.0, 323.0, 121.0 ],
									"text" : "You can <b>re-build the objects yourself</b> that are provided with the Min Development Kit.\n<br/><br/>\nStart here if you are curious about code but not ready to start your own project."
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"fontface" : 0,
									"fontname" : "Lato Light",
									"fontsize" : 16.0,
									"id" : "obj-13",
									"maxclass" : "markup",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 42.0, 179.0, 293.0, 86.0 ],
									"presentation_rect" : [ 42.0, 179.0, 293.0, 86.0 ],
									"text" : "You can <b>explore the objects provided</b> with the Min Development Kit.<br/><br/> No coding required."
								}

							}
, 							{
								"box" : 								{
									"border" : 0,
									"fontface" : 0,
									"fontname" : "Lato Light",
									"fontsize" : 16.0,
									"id" : "obj-9",
									"ignoreclick" : 1,
									"justification" : 2,
									"linkbold" : 1,
									"linkcolor" : [ 0.501961, 0.0, 0.25098, 1.0 ],
									"linkunderline" : 0,
									"maxclass" : "markup",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 880.0, 16.0, 186.0, 66.0 ],
									"presentation_rect" : [ 880.0, 16.0, 186.0, 66.0 ],
									"text" : "<a>Min</a><br/> Create packages and code objects for Max using C++"
								}

							}
, 							{
								"box" : 								{
									"data" : [ 1776, "png", "IBkSG0fBZn....PCIgDQRA...jE...PSHX....PyLgrH....DLmPIQEBHf.B7g.YHB..FbZRDEDU3wY6b1GaUcWGG9464RoaT5FvrgduYRz3Z2lNRVBnjXT2eL.qKKk6bXVFtESLNhaNg1Z5vrjYSWLKjQD3FFlHNiyETCAiqkBXQTbMt4zLXx+vD1TmFw6sW4kVjVdos2ee7O5NMW6JP25o2Su2y8IoI82Kmy2O4Im767VNWnLkoT.K++OU7FWiYdeTmyMn7r9vYYwSYFI2ER2Z1CdJ.EVAsXlwjbp3M9kMuX67JMQIcQf+Jn2F3sbvQ8F1N75OUG+sBQPKlYVS1IZlc8.KFrECPL.lMjJQx9QbDLNBnW4rC2+uq8S0y.SS4snj2yxEfcaxr4ZvB.h+t+kvLaASlcnjFF30L3fCmie8+MaGGtcvMMj8hFrq8TFksbiqZd10mqNrX0A7wwrk.rDOyp4pscR5zfdII2te0LccncC4lpgtXiIsjuRr0326hjl0R87XYRrBy3NMylv8qj5Uhc5b4dgVx10wlp0tXgorjGOopsgZb10sbOXkXrRyrDSz7jzu2g19eI8I+k6fiLbPmiYRD3Rd76+T0l7ygGqAX0Sz55NoShys49xcteXo5ILmtk7XrVVREehD2bCR7PlY2mYVE4OtjNqC1X+o6aasSOWpPkqBAELImOOaM2SsythJdDC6wLypM+wjS+KYt15K8d9IkJWURnHYeRQCUR7q6qfQqlY2R9iIoi4xoGu4rc9xgT7BLBUI6SabWyZ9Il+Wyf1x+HaIIPO+Eu3fs9s662btvLiSElQHYe1zBWQUUFqplcPqdlcC98KozNouQyY5rivLeePYFkj84Yq4dpsxJl8yYlc+42uj1Aouz5VOce4vJaePXFoj8Yqwa79Lya6lYw86SRuwP4xs5Vy106DlY68CynkLL5sy6Ukscyr032mj5WvC2T5N1aXlsIKy3krOoRj7QErEOypD.I4bN8XM2am+fvNaWKJZjL.at1FWZLOucal8QFqSomZco636FZgZRPQkjA3YRj7lpB1mY1x76yIsslR2w5YF5atIVXGf2u7aO+wu3cOmO7OOlUwR7uAFyrk0P025M084OwuJry2DQQmjA3fC92GdQmupcUS0UeKlM5apwL6S0vbuUq6ANwKGxw68PQ2xEiCKUhj6L+q7v4z2roLc7bgYnFOEkGImOK57U0UMUW8RMyp6c65Krx4T+gOvfm3sC0fkGdgc.lprCNxvmU4Vsyo+..lYVrXd6LUMI+Xgc17onWx.zdl8dgKXznj9m.XlMOpfWps326bB6rAkHRFfmLcGmAw8KoKAfY1hW.w99gctfRf0jymtG33YZn55Sal2p.vL6NaXt21Q6dfiehvLWE6WcwDxVSj7E8L6ggQeC4CB2wSltiyDV4ojY4h7QCp0Ioz.XlUaUnsEl4ojTxMetN6WN8H9sMy6A2bhFWdXkmRRICPS8149kzK52NFda4KERmCpjUx.b4gGZCRZ..LytiOShjqMLxQIsjehSs+dQ7L400SmZAMbCWwMXZhRZIC.Ytzlkz+..yrOjprxGuPGgRdIud59xNmqM+1lYMuoEthpJjYnjWx.zeum6mIo2AF8n4JhMmudgr9QBI2N8LBhM521v9VqkkTwUaaBRhDRFfyl4sdAI8uAvLK9sm3l+hEpZGYjb67lCIzXuYaCdzBUsiLRF.2PW54kzH.3Yd20VpM4sWHpajRxsb5CjAnS+1lGEjaNIRIY.jxk+RFOPaE.GD4j7qloqCIorvnm.bA0l7yNcWyHmj2MjShegeaY5AltqYjSx.3P6ZrFls5o6kLhjRtkLc9J9OTeOypYdKrwO4zY8hjRlQ+RI51ugWLuO+3mvFm+xuwfpXS5Of8RMLyN.vWE.S5gREO4r.pCi5ApCw9.dvfnVQFIu0Dq5tA9zFTOX0AT+XC54UmAOU9yWx8mBpZGYjLNKtWL6omzS2oWKnJcjYM4l5siepjdiIybkzPdYG5nAUsiLRFP4xkq0I4b+yA4WXUTRxzR1tNjj1+0dl5OFj0MRIY.xkK2SHoq5OrINYA1I8fHnjaIaWGSvO9pMmQb4Jej7TE2PW76HoAmnwjz+In+PLijRtkSefLR56MQiIQftTADQkL.8MR+ax+Qd9+SvdROHBK41OUOC3bpsw2uy4JK4fj96s+ejjNteaI4FdD60C55Dokb6zyHNbaHutdyMbl8b9ftNQZICPyo2ydbx0C.BB7kJfxRdTb4ZURBE7mzCJKY.nod26qiXW3FIvu7MHJ8nNuFHFYC8kcemLryQYJSYJSYJSYJSYJSYJSYJl3+Ajgt4wp0pU5U.....jTQNQjqBAlf" ],
									"embed" : 1,
									"id" : "obj-4",
									"maxclass" : "fpic",
									"numinlets" : 1,
									"numoutlets" : 1,
									"outlettype" : [ "jit_matrix" ],
									"patching_rect" : [ 200.0, 228.0, 89.0, 77.0 ],
									"presentation_rect" : [ 200.0, 228.0, 89.0, 77.0 ]
								}

							}
 ],
						"lines" : [  ],
						"bgfillcolor_type" : "gradient",
						"bgfillcolor_color1" : [ 0.454902, 0.462745, 0.482353, 1.0 ],
						"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"bgfillcolor_angle" : 270.0,
						"bgfillcolor_proportion" : 0.39
					}
,
					"patching_rect" : [ 10.0, 85.0, 76.0, 23.0 ],
					"presentation_rect" : [ 10.0, 85.0, 76.0, 23.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"fontname" : "Lato Light",
						"fontsize" : 16.0,
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p Overview",
					"varname" : "basic_tab"
				}

			}
 ],
		"lines" : [  ],
		"dependency_cache" : [  ],
		"autosave" : 0
	}

}
