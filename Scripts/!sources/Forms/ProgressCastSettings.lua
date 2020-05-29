function CreateProgressCastSettingsForm()
	local form=createWidget(nil, "raidSettingsForm", "Form", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 400, 360, 200, 100)
	hide(form)
	priority(form, 5000)
	
	local panel=createWidget(form, "Panel", "Panel")
	setText(createWidget(form, "closeSomeSettingsButton", "Button", WIDGET_ALIGN_HIGH, WIDGET_ALIGN_LOW, 20, 20, 20, 20), "x")

	setLocaleText(createWidget(form, "castSettingsFormHeader", "TextView",  WIDGET_ALIGN_CENTER, nil, 150, 20, nil, 16))
	setLocaleText(createWidget(form, "saveButton", "Button", WIDGET_ALIGN_CENTER, WIDGET_ALIGN_HIGH, 200, 30, nil, 20))
	
	createWidget(form, "showImportantCasts", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 330, 25, 20, 80)
	createWidget(form, "showImportantBuffs", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 330, 25, 20, 110)
	createWidget(form, "selectablePanel", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 330, 25, 20, 140)
	createWidget(form, "fixedPanel", "CheckBox", WIDGET_ALIGN_LOW, WIDGET_ALIGN_LOW, 330, 25, 20, 170)
	
	setLocaleText(createWidget(form, "panelWidthText", "TextView", nil, nil, 200, 25, 20, 200))
	createWidget(form, "panelWidthEdit", "EditLine", nil, nil, 80, 25, 270, 200)
	
	setLocaleText(createWidget(form, "panelHeightText", "TextView", nil, nil, 200, 25, 20, 230))
	createWidget(form, "panelHeightEdit", "EditLine", nil, nil, 80, 25, 270, 230)
	
	DnD.Init(form, panel, true)
		
	return form
end

function SaveProgressCastFormSettings(aForm)
	local mySettings = {}
	local profile = GetCurrentProfile()
	mySettings = profile.castFormSettings
	
	mySettings.showImportantCasts = getCheckBoxState(getChild(aForm, "showImportantCasts"))
	mySettings.showImportantBuffs = getCheckBoxState(getChild(aForm, "showImportantBuffs"))
	mySettings.selectable = getCheckBoxState(getChild(aForm, "selectablePanel"))
	mySettings.fixed = not getCheckBoxState(getChild(aForm, "fixedPanel"))
	
	mySettings.panelWidthText = getTextString(getChild(aForm, "panelWidthEdit"))
	mySettings.panelHeightText = getTextString(getChild(aForm, "panelHeightEdit"))
	
	return mySettings
end

function LoadProgressCastFormSettings(aForm)
	local mySettings = {}
	local profile = GetCurrentProfile()
	mySettings = profile.castFormSettings
		
	setLocaleText(getChild(aForm, "showImportantCasts"), mySettings.showImportantCasts)
	setLocaleText(getChild(aForm, "showImportantBuffs"), mySettings.showImportantBuffs)
	setLocaleText(getChild(aForm, "selectablePanel"), mySettings.selectable)
	setLocaleText(getChild(aForm, "fixedPanel"), not mySettings.fixed)
	
	setText(getChild(aForm, "panelWidthEdit"), mySettings.panelWidthText)
	setText(getChild(aForm, "panelHeightEdit"), mySettings.panelHeightText)
	
end