

#RGS-TRAPCODE-001
#////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

# The Particular V2 Gizmo
import ParticularV2_3DScript															#import the scripts for use in nuke
toolbar = nuke.toolbar("Nodes")															#get main toolbar
tcMenu = toolbar.addMenu("Trapcode")													#get 'Trapcode' menu
tcMenu.addCommand("Particular 3D Gizmo", "ParticularV2_3DScript.pv2_createGizmo(nuke)")	#add command and run start command. 
																						#need to pass in nuke
#create callbacks
ParticularV2_3DScript.pv2_createCallbacks()

#////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
