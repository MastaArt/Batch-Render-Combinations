/*  
[INFO] 
NAME = Batch Render Combinations
VERSION = 1.0.4
AUTHOR = MastaMan
DEV = https://3dground.net
HELP = 
[1.0.0]
* Initial release =

[1.1.0]
* Changed: Find more materials combination by trim right numbers in names and search by mask ex: Plastic_*=
* Added: Animate model for three views: Front, Side, Back=
* Added: Render base model with shadows in studio=

[1.0.1]
+ Added: Checkboxes with angles=

[1.0.2]
- BugFix: Can't open render folder=

[1.0.3]
* Changed: Support different file types (max, fbx, obj)=

[1.0.4]
- BugFix: Model rotation=

[SCRIPT]
*/

try(closeRolloutFloater fBatchRenderCombinations) catch()
global fBatchRenderCombinations = newRolloutFloater "Batch Render Combinations" 280 630

-- FileProperties based settings system
struct '$' (
    fn add n v = (
        return (fileProperties.addProperty #custom n v)
    ),
    fn get n = (
        i = fileProperties.findProperty #custom n
        if(i != 0) do (
            v = fileProperties.getPropertyValue #custom i
            if(v[1] == "#") do return execute(v)
            return v
        )
        return undefined
    ),
    fn del n = (
        fileProperties.deleteProperty #custom n
    ),
    fn list t: #full = (
        p = fileProperties.getNumProperties #custom
        res = #()
        for i in 1 to (fileProperties.getNumProperties #custom) do (
            n = fileProperties.getPropertyName #custom i
            v = fileProperties.getPropertyValue #custom i
            
            case t of (
                #names: append res n
                #values: append res v
                default: append res #(n, v)
            )
        )
        
        return res
    )
)

rollout _rStepABB0  "Main"
(
    fn pickMaterialFilter obj = classOf obj == Sphere and obj.material != undefined 

	group "Views" (
		checkbox cbxView0 "0 deg" checked: true
		checkbox cbxView35 "35 deg" checked: true
		checkbox cbxView90 "90 deg" checked: true
		checkbox cbxView180 "180 deg" checked: true
	)
	
    group "List Of Combinations" (
        listbox lbxCombinationsList "" height: 6
        button btnAddCombination "Add" width: 100 across: 2 tooltip: "Create combinations in a studio scene.\nSettings are saved directly into the scene!"
        button btnRemoveCombination "Remove" width: 100
    )

    group "Create Combinations" (
        edittext edtModelPartName "Model Part Name: "
        listbox lbxModelPartMaterials "Model Part Materials: " height: 6
        pickbutton btnAddMaterial "Pick Material" width: 100 across: 2 filter: pickMaterialFilter message: "Please pick Sphere with material in the scene!" tooltip: "Pick Sphere with material in the studio scene."
        button btnRemoveMaterial "Remove Material" width: 100
    )

	group "Merge Models From" (
        edittext edtMergeModelPath "" readonly: true across: 2 align: #left fieldwidth: 195
        button btnMergeModelPath "..." width: 35  align: #right offset: [0, -3]
    )

    group "Save Output Renders" (
        edittext edtBatchRenderPath "" readonly: true across: 2 align: #left fieldwidth: 195
        button btnSetBatchRenderPath "..." width: 35  align: #right offset: [0, -3]
    )
    
    button btnStartRender "Start Batch Render" height: 35 width: 240 offset: [0, 10]
    
    fn getSaveDir type: "jpg" = (
        type = (toUpper type) +" (*." + type + ")|*." + type
        f = getSaveFileName filename: "DO NOT CHANGE NAME" caption:"Save File" types: type
        if(f == undefined) do return f
        
        p = getFileNamePath f

        return p
    )
    
    fn filterCombinations c = (
        if(c == undefined) do return #()
        return for i in c where c[1] != undefined collect i
    )
    
    fn getCombinations = (		
        c = ('$').get "COMBINAITONS"
        return filterCombinations c
    )
    
    fn addCombination c = (
        ('$').add "COMBINAITONS" (c as string)
    )
    
    fn removeFromArray c i = (
        if(i == 1 and c.count == 1) do return #()
        return for k in 1 to c.count where k != i collect c[k]
    )
    
    fn uiCreateCombinations n = (
        if(n == false) do (
            edtModelPartName.text = ""
            lbxModelPartMaterials.items = #()
        )
        
        edtModelPartName.enabled = n
        lbxModelPartMaterials.enabled = n
        btnAddMaterial.enabled = n
        btnRemoveMaterial.enabled = n
    )
    
    fn displayCombinationProps c id = (
        uiCreateCombinations false
        
        if(id == 0) do return false
        if(c.count == 0) do return false
        
        n = c[id][1]
        m = c[id][2]
        
        edtModelPartName.text = n
        lbxModelPartMaterials.items = m
        uiCreateCombinations true
    )
    
    fn updateCombinaitonsList = (
        uiCreateCombinations false
        
        c = getCombinations()
        
        if(c.count > 0) do (
            names = #() 
            for i in c do (
                n = i[1]
                if(i[2].count == 0) do n += "   [Empty Materials]"

                append names n
             )
                 
            lbxCombinationsList.items = names
            lbxCombinationsList.selection = c.count
            displayCombinationProps c (c.count)
            return false
        )
        
        lbxCombinationsList.items = #()
    )
    
    fn addNewCombination = (
        s = '$'()
        
        c = getCombinations()
        
        append c #("New Combination", #())
        c = filterCombinations c
            
        addCombination c
            
        updateCombinaitonsList()
    )
    
    fn removeCombination = (
        id = lbxCombinationsList.selection
            
        if(id == 0) do return messageBox "Please select combination from list!" title: "Warning!"
        
        q = queryBox ("Do you really want to delete combination \"" + lbxCombinationsList.selected + "\"") title: "Confirm?"
        if(not q) do return false
        
        c = getCombinations()	
        
        c = removeFromArray c id
        c = filterCombinations c
    
        addCombination c
        
        updateCombinaitonsList()
    )
    
    fn loadAdditionalSettings = (
        s = '$'()
        
        p1 = s.get "MERGE_MODELS_PATH"
        if(p1 != undefined and doesFileExist p1) do edtMergeModelPath.text = p1
        
        p2 = s.get "OUT_RENDER_PATH"
        if(p2 != undefined and doesFileExist p2) do edtBatchRenderPath.text = p2
    )
    
    on _rStepABB0 open do (
        uiCreateCombinations false
        
        updateCombinaitonsList()
        loadAdditionalSettings()
    )
    
    on btnAddCombination pressed do (
        addNewCombination()
        setFocus edtModelPartName
    )
    
    on btnRemoveCombination pressed do (
        removeCombination()
    )
    
    on lbxCombinationsList selected v do (
        id = lbxCombinationsList.selection
        c = getCombinations()
        uiCreateCombinations false
        
        if(c[id] == undefined) do return false
        
        displayCombinationProps c id
        
        uiCreateCombinations true
    )
    
    on edtModelPartName entered  v do (
        id = lbxCombinationsList.selection
        c = getCombinations()
        
        if(c[id] == undefined) do return false
        
        if(v.count < 3) do (
            edtModelPartName.text = c[id][1]
            return messageBox "Please enter valid model name (min. 3 chars)" title: "Error!"
        )
                
        c[id][1] = v
        
        addCombination c
        
        updateCombinaitonsList()
        lbxCombinationsList.selection = id
        displayCombinationProps c id
    )
    
    on btnAddMaterial picked obj do (
        if(obj == undefined) do return false
        
        n = obj.name
        
        id = lbxCombinationsList.selection
        c = getCombinations()
        
        if(c[id] == undefined) do return false
        
        appendIfUnique c[id][2] n
        
        addCombination c
        
        updateCombinaitonsList()
        lbxCombinationsList.selection = id
        displayCombinationProps c id
    )
    
    on btnRemoveMaterial pressed do (
        id = lbxCombinationsList.selection
        c = getCombinations()
        
        sid = lbxModelPartMaterials.selection
        
        if(sid == 0) do return messageBox "Please select material from list!" title: "Warning!"
        if(c[id] == undefined) do return false
        
        m = c[id][2]
        c[id][2] = removeFromArray m sid
        
        addCombination c
        
        updateCombinaitonsList()
        lbxCombinationsList.selection = id
        displayCombinationProps c id
    )
    
    on btnMergeModelPath pressed do (
        p = getSaveDir type: "max"
        if(p == undefined) do return false
        
        ('$').add "MERGE_MODELS_PATH" p
        
        loadAdditionalSettings()
    )
    
    on btnSetBatchRenderPath pressed do (
        p = getSaveDir type: "png"
        if(p == undefined) do return false
        
        ('$').add "OUT_RENDER_PATH" p
        
        loadAdditionalSettings()
    )
    
    fn isCorona = (
        r = renderers.current
        if(matchPattern (r as string) pattern: "*CoronaRenderer*") do return r
        return undefined
    )
    
    fn getModelsParts n = (
        return for i in (objects as array) where (matchPattern (i.name) pattern: (n + "*")) collect i
    )
	
	fn getModelMaterials n = (
		n = trimRight n "0123456789"
        return for i in (objects as array) where classOf i == Sphere and (matchPattern (i.name) pattern: (n + "*")) collect i
    )

    fn forceUngroup o = (
        o = o as array
        if(o.count == 0) do return false

        for i in o where isGroupHead i and isValidNode i do explodeGroup i
    )
    
    fn forceDeleteObjects o = (
        o = o as array
        if(o.count == 0) do return false

        oo = for i in o where isValidNode i and not isDeleted i collect i
        delete oo
    )
	
	fn assignAllMaterialsFirst combinations = (		
		if(combinations.count == 0) do return false
		
		for i in combinations do (
			modelPartName = i[1]
			modelPartMaterials = i[2]
			
			modelParts = getModelsParts modelPartName
			
			select modelParts
            forceUngroup selection
            select modelParts
			
			if(modelParts.count == 0) do return false
				
			m = getModelMaterials modelPartMaterials[1]
			if(m == undefined or m.count == 0) do continue
			
			for iii in modelParts do iii.material = m[1].material			
		)
	)
	
	fn setupRender fileName isSelectedMode: true = (
		cr = isCorona()
		
		deleteFile fileName
		
		if(renderSceneDialog.isOpen()) do renderSceneDialog.close() 		
			
		rendSaveFile = true
		rendOutputFilename = fileName
		rendTimeType = 1
		cr.renderSelected_mode = if(isSelectedMode) then 1 else 0
		cr.vfb_clearBetweenRenders = true
		reMgr = maxOps.getCurRenderElementMgr()
		reMgr.SetElementsActive false

		renderSceneDialog.update()
	)
    
    fn batchRender combinations pth modelName frame = (       
		if(combinations.count == 0) do (
			print ("Not found combinations for " + modelName + "\"!")
			return false
		)
		
		assignAllMaterialsFirst combinations
		
		tmp = pth + modelName + "_" + frame[1] + "_base.png"
		
		setupRender tmp isSelectedMode: false
		
		print ("Render the base " + tmp)
		max quick render
		    
        for i in combinations do (
            modelPartName = i[1]
            modelPartMaterials = i[2]

            modelParts = getModelsParts modelPartName

            if(modelParts.count == 0) do (
                print ("Missing models parts for \"" + modelPartName + "\" in \"" + modelName + "\"!")
                continue
            )

            select modelParts
            forceUngroup selection
            select modelParts

            for ii in modelPartMaterials do (
                mats = getModelMaterials ii
                
                if(mats == undefined or mats.count == 0) do (
                    print ("Missing material \"" + ii + "\" for model part \"" + modelPartName + "\"!")
                    continue
				)

				for m in mats do (
					matName = m.name
					for iii in modelParts do iii.material = m.material
					
					tmp = pth + modelName + "_" + frame[1] + "_" + modelPartName + "_" + matName + ".png"
					
					setupRender tmp isSelectedMode: true
					
					print ("Render the " + tmp)
					
					max quick render
				)
            )
        )
    )
	
	fn getCenterOfModel objs = (
		for i in objs where isGroupHead i do return i.pos
		return objs.center
	)
	
	fn addFileToScene f = (
		ext = getFileNameType f
		
		case ext of (
			".max": mergeMaxFile f #select #noRedraw #autoRenameDups #renameMtlDups quiet: true
			default: importFile f #noPrompt
		)		
	)
    
    on btnStartRender pressed do (
        cr = isCorona()
        if(cr == undefined) do return messageBox "Please assign Corona Renderer!" title: "Error!"
		
		frames = #()
		
		if(cbxView0.checked) do append frames #("0deg", 0)
		if(cbxView35.checked) do append frames #("35deg", -35)
		if(cbxView90.checked) do append frames #("90deg", -90)
		if(cbxView180.checked) do append frames #("180deg", -180)

        origMaxFile = maxFilePath + maxFileName

        if(origMaxFile == "") do return messageBox "Please save the scene!" title: "Error!"

        checkForSave()

        s = ('$')
        p1 = s.get "MERGE_MODELS_PATH"
        p2 = s.get "OUT_RENDER_PATH"
        
        if(p1 == undefined or not doesFileExist p1) do return messageBox "Please choose Merge Models Path!" title: "Error!"
        if(p2 == undefined or not doesFileExist p2) do return messageBox "Please choose Save Output Render Path" title: "Error!"

        combinations = getCombinations()

        if(combinations.count == 0) do return messageBox "Please add Model Combinatons first!" title: "Error!"
        for i in combinations where i[1] == "New Combination" do return messageBox ("Please change name for combination \"New Combination\"\n\n Or remove this combination!") title: "Error!"
        for i in combinations where i[2].count == 0 do return messageBox ("Please add Model Part Materials for combination \"" + i[1] + "\"!\n\nOr remove this combination!") title: "Error!"
		
		
		if(frames.count == 0) do return messageBox "Please choose at least one view angle!" title: "Error!" 
		
		types = #("fbx", "max", "obj")
		files = #()
		for type in types do (
			join files (getFiles(p1 + "*." + type))
		)
        
        progressStart "In process..."
        escapeEnable = true
        clearListener()
		
        for i in 1 to files.count do (
            f = files[i]

            addFileToScene f

            currentModel = #()
            currentModel = selection as array
			
			centerModel = getCenterOfModel selection
			
            modelName = getFilenameFile f 
			
			pointHelper = point name: "ModelCenter" pos: centerModel
				
			for ss in currentModel do ss.parent = pointHelper
			
            for frame in frames do (
				pointHelper.rotation.z = 0
				rotate pointHelper (eulerAngles 0 0 frame[2])
				batchRender combinations p2 modelName frame
			)
			
            forceDeleteObjects currentModel
			delete pointHelper
			
            progressUpdate (100 * i / files.count)
        )
        progressEnd()
        
		q = queryBox "All combinations are rendered.\n\nDo you want to open the folder with renders?" title: "Confirm!"			
		if(q) do return  shellLaunch p2 ""
    )
)

rollout _rAboutABB "About" 
(
    label lblName "" 
    label lblVer "" 
    
    label lblAuthor "" height: 30
    hyperlink lblCopy ""  align: #center
    
    fn getScriptInfo s releaseInfo: "" =  (
        if(releaseInfo != "") do
        (
            r = getINISetting s releaseInfo
            return r
        )

        v = getINISetting s "INFO" "VERSION"
        a = getINISetting s "INFO" "AUTHOR"
        n = getINISetting s "INFO" "NAME"
        o = getINISetting s "ABOUT"
        c = getINISetting s "INFO" "DEV"
        h = getINISetting s "INFO" "HELP"
        
        r = for i in (getINISetting s) where (i != "ABOUT" and i != "SCRIPT" and i != "COPY") collect i
        
        return #(n, a, v, o, r, c, h)
    )

    on _rAboutABB open do
    (
        i = getScriptInfo (getThisScriptFilename())
            
        lblName.caption = i[1]
        lblAuthor.caption = i[2]
        lblVer.caption = i[3]
        lblCopy.address  = lblCopy.caption = i[6]
    )
)

addRollout _rStepABB0 fBatchRenderCombinations rolledUp:false
addRollout _rAboutABB fBatchRenderCombinations rolledUp:true 