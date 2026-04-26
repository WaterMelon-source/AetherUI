--!strict
-- AetherUI Library v4.2

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")

-- // Utility: Safe instance creation
local function createInstance(class: string, parent: Instance?, props: table?): Instance
	props = props or {}
	local inst = Instance.new(class, parent)
	for key, value in pairs(props) do
		if key ~= "Parent" and key ~= "Name" and key ~= "Text" then
			pcall(function() inst[key] = value end)
		end
	end
	if props.Name then inst.Name = props.Name end
	if props.Text then inst.Text = props.Text end
	return inst
end

-- // Utility: Font loader with fallback
local function getFont(path: string, weight: Enum.FontWeight, style: Enum.FontStyle): Font
	local success, font = pcall(Font.new, path, weight, style)
	return success and font or Font.fromEnum(Enum.Font.Gotham)
end

-- // Constants
local FONT_PATH = "rbxasset://fonts/families/GothamSSm.json"
local DEFAULT_ICON = "rbxassetid://10747373176"
local THEME = {
	WindowBackground = Color3.fromRGB(31, 31, 31),
	SideBackground = Color3.fromRGB(36, 36, 36),
	StrokeColor = Color3.fromRGB(51, 51, 51),
	TabsBackground = Color3.fromRGB(26, 26, 26),
	TabBackground = Color3.fromRGB(56, 56, 56),
	TabSelected = Color3.fromRGB(71, 71, 71),
	MainPlaceholder = Color3.fromRGB(187, 187, 187),
	TextPrimary = Color3.fromRGB(255, 255, 255),
	TextSecondary = Color3.fromRGB(151, 151, 151),
	ScrollBar = Color3.fromRGB(61, 61, 61),
	SliderTrack = Color3.fromRGB(61, 61, 61),
	SliderFill = Color3.fromRGB(0, 123, 255),
	ToggleOff = Color3.fromRGB(36, 36, 36),
	ToggleOn = Color3.fromRGB(40, 202, 64),
	DropdownBg = Color3.fromRGB(41, 41, 41),
	DropdownOption = Color3.fromRGB(51, 51, 51),
	DropdownHover = Color3.fromRGB(66, 66, 66),
	StatusIdle = Color3.fromRGB(151, 151, 151),
	StatusRunning = Color3.fromRGB(40, 202, 64),
	StatusPaused = Color3.fromRGB(255, 190, 47),
	Accent = {
		Red = Color3.fromRGB(255, 96, 88),
		Yellow = Color3.fromRGB(255, 190, 47),
		Green = Color3.fromRGB(40, 202, 64),
	}
}

-- // Components Module (Enhanced)
local Components = {}

-- ✅ NEW: Divider Component
function Components:BuildDivider(parent: Frame, label: string?): Frame
	local divider = createInstance("Frame", parent, {
		Name = "Divider",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.95, 0, 0.04, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundTransparency = 1,
	})
	createInstance("UIAspectRatioConstraint", divider, { AspectRatio = 12 })
	
	if label then
		local labelFrame = createInstance("Frame", divider, {
			Name = "LabelFrame",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(0.4, 0, 1, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			BackgroundTransparency = 1,
		})
		createInstance("TextLabel", labelFrame, {
			Text = label,
			TextSize = 11,
			TextColor3 = THEME.TextSecondary,
			FontFace = getFont(FONT_PATH, Enum.FontWeight.Medium, Enum.FontStyle.Normal),
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			TextScaled = true,
			TextWrapped = true,
		})
	else
		local line = createInstance("Frame", divider, {
			Name = "Line",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(1, 0, 0.02, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			BackgroundColor3 = THEME.StrokeColor,
		})
		createInstance("UICorner", line, { CornerRadius = UDim.new(0, 1) })
	end
	return divider
end

-- ✅ NEW: Status Indicator Component
function Components:BuildStatus(parent: Frame, title: string, initialState: boolean): Frame
	local statusContainer = createInstance("Frame", parent, {
		Name = "Status",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.95, 0, 0.08, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundTransparency = 1,
	})
	createInstance("UIAspectRatioConstraint", statusContainer, { AspectRatio = 8 })
	
	local dot = createInstance("Frame", statusContainer, {
		Name = "Dot",
		AnchorPoint = Vector2.new(0, 0.5),
		Size = UDim2.new(0.08, 0, 0.6, 0),
		Position = UDim2.new(0.02, 0, 0.5, 0),
		BackgroundColor3 = initialState and THEME.StatusRunning or THEME.StatusIdle,
	})
	createInstance("UICorner", dot, { CornerRadius = UDim.new(1, 0) })
	createInstance("UIAspectRatioConstraint", dot)
	
	local label = createInstance("TextLabel", statusContainer, {
		Name = "Label",
		Text = title,
		TextSize = 13,
		TextColor3 = THEME.TextPrimary,
		FontFace = getFont(FONT_PATH, Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0, 0.5),
		Size = UDim2.new(0.9, 0, 1, 0),
		Position = UDim2.new(0.12, 0, 0.5, 0),
		TextXAlignment = Enum.TextXAlignment.Left,
		TextScaled = true,
		TextWrapped = true,
	})
	
	local self = {
		Container = statusContainer,
		Dot = dot,
		Label = label,
		Update = function(self, isRunning: boolean, newText: string?)
			dot.BackgroundColor3 = isRunning and THEME.StatusRunning or THEME.StatusIdle
			if newText then label.Text = newText end
		end
	}
	return self
end

-- ✅ NEW: Dropdown Component
function Components:BuildDropdown(parent: Frame, title: string, description: string, options: {string}, default: string, callback: ((string) -> ())?): Frame
	local dropdownContainer = createInstance("Frame", parent, {
		Name = "Dropdown",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(1, 0, 0.1, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundTransparency = 1,
	})
	createInstance("UIAspectRatioConstraint", dropdownContainer, { AspectRatio = 11 })
	
	local textFrame = createInstance("Frame", dropdownContainer, {
		Name = "Frame",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.34036, 0, 1, 0),
		Position = UDim2.new(0.17018, 0, 0.5, 0),
		BackgroundTransparency = 1,
	})
	createInstance("UIAspectRatioConstraint", textFrame, { AspectRatio = 4 })
	createInstance("UIListLayout", textFrame, {
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		Padding = UDim.new(0.01, 0),
		VerticalAlignment = Enum.VerticalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
	})
	
	createInstance("TextLabel", textFrame, {
		Name = "1Title",
		Text = title,
		TextSize = 14,
		TextColor3 = THEME.TextPrimary,
		FontFace = getFont(FONT_PATH, Enum.FontWeight.Medium, Enum.FontStyle.Normal),
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0.32, 0),
		TextScaled = true,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left,
	})
	createInstance("TextLabel", textFrame, {
		Name = "2Description",
		Text = description,
		TextSize = 12,
		TextColor3 = THEME.TextSecondary,
		FontFace = getFont(FONT_PATH, Enum.FontWeight.Medium, Enum.FontStyle.Normal),
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0.3, 0),
		TextScaled = true,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left,
	})
	
	local dropdownBtn = createInstance("TextButton", dropdownContainer, {
		Name = "DropdownBtn",
		Text = default,
		TextSize = 12,
		TextColor3 = THEME.TextPrimary,
		BackgroundColor3 = THEME.DropdownBg,
		FontFace = getFont(FONT_PATH, Enum.FontWeight.Medium, Enum.FontStyle.Normal),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.1754, 0, 0.7, 0),
		Position = UDim2.new(0.9, 0, 0.5, 0),
		BorderSizePixel = 0,
		AutoButtonColor = false,
		TextScaled = true,
		TextWrapped = true,
	})
	createInstance("UICorner", dropdownBtn, { CornerRadius = UDim.new(0, 4) })
	createInstance("UIAspectRatioConstraint", dropdownBtn, { AspectRatio = 1.8 })
	createInstance("UIStroke", dropdownBtn, {
		Thickness = 1.6,
		Color = THEME.StrokeColor,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	})
	
	local dropdownList = createInstance("Frame", dropdownContainer, {
		Name = "DropdownList",
		BackgroundColor3 = THEME.DropdownBg,
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(0.5, 0),
		Size = UDim2.new(0.1754, 0, 0, 0),
		Position = UDim2.new(0.9, 0, 1.05, 0),
		Visible = false,
		ZIndex = 100,
	})
	createInstance("UICorner", dropdownList, { CornerRadius = UDim.new(0, 4) })
	createInstance("UIStroke", dropdownList, {
		Thickness = 1.6,
		Color = THEME.StrokeColor,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	})
	createInstance("UIListLayout", dropdownList, { SortOrder = Enum.SortOrder.LayoutOrder })
	
	for _, option in ipairs(options) do
		local optionBtn = createInstance("TextButton", dropdownList, {
			Text = option,
			TextSize = 11,
			TextColor3 = THEME.TextPrimary,
			BackgroundColor3 = THEME.DropdownOption,
			FontFace = getFont(FONT_PATH, Enum.FontWeight.Medium, Enum.FontStyle.Normal),
			Size = UDim2.new(1, 0, 0.25, 0),
			BorderSizePixel = 0,
			AutoButtonColor = false,
			TextScaled = true,
		})
		createInstance("UIPadding", optionBtn, { PaddingLeft = UDim.new(0, 8) })
		
		optionBtn.MouseEnter:Connect(function()
			optionBtn.BackgroundColor3 = THEME.DropdownHover
		end)
		optionBtn.MouseLeave:Connect(function()
			optionBtn.BackgroundColor3 = THEME.DropdownOption
		end)
		optionBtn.MouseButton1Click:Connect(function()
			dropdownBtn.Text = option
			dropdownList.Visible = false
			if callback then pcall(callback, option) end
		end)
	end
	
	local isOpen = false
	dropdownBtn.MouseButton1Click:Connect(function()
		isOpen = not isOpen
		dropdownList.Visible = isOpen
		if isOpen then
			local totalHeight = #options * 0.25
			dropdownList.Size = UDim2.new(0.1754, 0, totalHeight, 0)
		end
	end)
	
	UserInputService.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 and isOpen then
			local mousePos = UserInputService:GetMouseLocation()
			local absPos = dropdownList.AbsolutePosition
			local absSize = dropdownList.AbsoluteSize
			if mousePos.X < absPos.X or mousePos.X > absPos.X + absSize.X or
			   mousePos.Y < absPos.Y or mousePos.Y > absPos.Y + absSize.Y then
				dropdownList.Visible = false
				isOpen = false
			end
		end
	end)
	
	return dropdownContainer
end

-- // Existing components (Label, Button, Slider, Toggle) remain unchanged
-- [Keeping your original BuildLabel, BuildButton, BuildSlider, BuildToggle functions here...]
-- For brevity, I'll assume they're included as-is from your v4.1 code.

-- // Window Class (Enhanced)
local Window = {}
Window.__index = Window

function Window.new(title: string, description: string): table
	local self = setmetatable({}, Window)
	
	local screenGui = createInstance("ScreenGui", CoreGui, {
		Name = "AetherUI",
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		Enabled = false,
		ResetOnSpawn = false,
	})
	
	local window = createInstance("Frame", screenGui, {
		Name = "Window",
		ZIndex = 10,
		BorderSizePixel = 0,
		BackgroundColor3 = THEME.WindowBackground,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.48, 0, 0.5, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundTransparency = 0.1,
	})
	createInstance("UICorner", window, { CornerRadius = UDim.new(0.03, 0) })
	createInstance("UIAspectRatioConstraint", window, { AspectRatio = 1.45 })
	
	-- Drag Frame (unchanged)
	local dragFrame = createInstance("Frame", window, {
		Name = "Drag",
		ZIndex = 10,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(36, 36, 36),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(1.00005, 0, 0.1256, 0),
		Position = UDim2.new(0.49997, 0, 0.06201, 0),
		BackgroundTransparency = 1,
	})
	
	local dragging = false
	local dragStart = nil
	local startPos = nil
	
	dragFrame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = window.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			local delta = input.Position - dragStart
			window.Position = UDim2.new(0.5, startPos.X.Offset + delta.X, 0.5, startPos.Y.Offset + delta.Y)
		end
	end)
	
	-- Side panel, tabs, main content (unchanged structure)
	local side = createInstance("Frame", window, {
		Name = "Side",
		ZIndex = 10,
		BorderSizePixel = 0,
		BackgroundColor3 = THEME.SideBackground,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.25, 0, 0.95, 0),
		Position = UDim2.new(0.14, 0, 0.5, 0),
		BackgroundTransparency = 0.25,
	})
	createInstance("UICorner", side, { CornerRadius = UDim.new(0.05, 0) })
	createInstance("UIStroke", side, {
		Color = THEME.StrokeColor,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	})
	
	local tabsContainer = createInstance("Frame", side, {
		Name = "Tabs",
		ZIndex = 11,
		BorderSizePixel = 0,
		BackgroundColor3 = THEME.TabsBackground,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.9, 0, 0.9, 0),
		Position = UDim2.new(0.5, 0, 0.53, 0),
		BackgroundTransparency = 1,
	})
	createInstance("UICorner", tabsContainer, { CornerRadius = UDim.new(0, 10) })
	createInstance("UIPadding", tabsContainer, {
		PaddingTop = UDim.new(0, 10),
		PaddingRight = UDim.new(0, 5),
		PaddingLeft = UDim.new(0, 5),
		PaddingBottom = UDim.new(0, 10),
	})
	createInstance("UIListLayout", tabsContainer, {
		Padding = UDim.new(0, 10),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})
	
	createInstance("TextLabel", tabsContainer, {
		Name = "Category",
		Text = "Category",
		TextSize = 12,
		TextColor3 = THEME.TextSecondary,
		FontFace = getFont(FONT_PATH, Enum.FontWeight.Medium, Enum.FontStyle.Normal),
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(1, 0, 0.035, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		TextScaled = true,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left,
	})
	
	local main = createInstance("Frame", window, {
		Name = "Main",
		ZIndex = 10,
		BorderSizePixel = 0,
		BackgroundColor3 = THEME.MainPlaceholder,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.70556, 0, 0.95119, 0),
		Position = UDim2.new(0.63137, 0, 0.4994, 0),
		BackgroundTransparency = 1,
	})
	createInstance("UICorner", main, { CornerRadius = UDim.new(0.01, 25) })
	
	local labels = createInstance("Frame", main, {
		Name = "Labels",
		ZIndex = 2,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.9, 0, 0.075, 0),
		Position = UDim2.new(0.5, 0, 0.05, 0),
		BackgroundTransparency = 1,
	})
	
	createInstance("TextLabel", labels, {
		Name = "1Title",
		Text = title,
		TextSize = 14,
		TextColor3 = THEME.TextPrimary,
		FontFace = getFont(FONT_PATH, Enum.FontWeight.Bold, Enum.FontStyle.Normal),
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(1, 0, 0.4, 0),
		Position = UDim2.new(0.5, 0, 0.25, 0),
		TextScaled = true,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left,
	})
	
	createInstance("TextLabel", labels, {
		Name = "2Description",
		Text = description,
		TextSize = 10,
		TextColor3 = THEME.TextSecondary,
		FontFace = getFont(FONT_PATH, Enum.FontWeight.Medium, Enum.FontStyle.Normal),
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.2961, 0, 0.3, 0),
		Position = UDim2.new(0.14805, 0, 0.9, 0),
		TextScaled = true,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left,
	})
	
	createInstance("UIListLayout", labels, {
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		Padding = UDim.new(0.1, 0),
		VerticalAlignment = Enum.VerticalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
	})
	
	local scrollingFrame = createInstance("ScrollingFrame", main, {
		BorderSizePixel = 0,
		CanvasSize = UDim2.new(0, 0, 0, 500),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.97246, 0, 0.86448, 0),
		Position = UDim2.new(0.53623, 0, 0.54276, 0),
		ScrollBarImageColor3 = THEME.ScrollBar,
		ScrollBarThickness = 4,
		BackgroundTransparency = 1,
	})
	createInstance("UIAspectRatioConstraint", scrollingFrame, { AspectRatio = 1.23 })
	createInstance("UIPadding", scrollingFrame, {
		PaddingTop = UDim.new(0.025, 0),
		PaddingRight = UDim.new(0.05, 0),
		PaddingBottom = UDim.new(0.1, 0),
	})
	createInstance("UIListLayout", scrollingFrame, {
		Padding = UDim.new(0.02, 0),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})
	
	self._gui = screenGui
	self._window = window
	self._dragFrame = dragFrame
	self._tabsContainer = tabsContainer
	self._scrollingFrame = scrollingFrame
	self._tabs = {}
	self._currentTab = nil
	self._keybinds = {}
	
	return self
end

function Window:AddTab(name: string, iconId: string?): table
	local tabBtn = createInstance("Frame", self._tabsContainer, {
		Name = "Tab",
		BorderSizePixel = 0,
		BackgroundColor3 = THEME.TabBackground,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(1, 0, 0.075, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = 1,
	})
	createInstance("UICorner", tabBtn, { CornerRadius = UDim.new(0.3, 0) })
	
	local tabButton = createInstance("TextButton", tabBtn, {
		Name = "Button",
		BorderSizePixel = 0,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextSize = 12,
		TextColor3 = THEME.TextPrimary,
		BackgroundColor3 = THEME.TabBackground,
		FontFace = getFont(FONT_PATH, Enum.FontWeight.Bold, Enum.FontStyle.Normal),
		ZIndex = 5,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Text = "",
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AutoButtonColor = false,
	})
	
	local iconAsset = iconId and ("rbxassetid://" .. tostring(iconId):gsub("[^%d]", "")) or DEFAULT_ICON
	local icon = createInstance("ImageLabel", tabBtn, {
		Name = "Icon",
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Image = iconAsset,
		Size = UDim2.new(0.65, 0, 0.65, 0),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = 1,
		Position = UDim2.new(0.12, 0, 0.5, 0),
	})
	createInstance("UIAspectRatioConstraint", icon)
	
	createInstance("TextLabel", tabBtn, {
		Name = "Title",
		Text = name,
		TextSize = 12,
		TextColor3 = THEME.TextPrimary,
		FontFace = getFont(FONT_PATH, Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.55, 0, 0.55, 0),
		Position = UDim2.new(0.49, 0, 0.5, 0),
		TextScaled = true,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left,
	})
	
	local content = createInstance("Frame", self._scrollingFrame, {
		Name = name .. "_Content",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Visible = false,
	})
	createInstance("UIListLayout", content, {
		Padding = UDim.new(0.02, 0),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})
	
	local tab = { Name = name, Container = content, TabFrame = tabBtn, Button = tabButton }
	table.insert(self._tabs, tab)
	
	tabButton.MouseButton1Click:Connect(function()
		for _, t in ipairs(self._tabs) do
			local isSelected = (t == tab)
			t.Container.Visible = isSelected
			t.TabFrame.BackgroundTransparency = isSelected and 0 or 1
			t.TabFrame.BackgroundColor3 = isSelected and THEME.TabSelected or THEME.TabBackground
		end
		self._currentTab = tab
	end)
	
	if #self._tabs == 1 then
		tab.Container.Visible = true
		tab.TabFrame.BackgroundTransparency = 0
		tab.TabFrame.BackgroundColor3 = THEME.TabSelected
		self._currentTab = tab
	end
	
	return tab
end

function Window:_getTarget(): Frame
	if self._currentTab and self._currentTab.Container.Visible then
		return self._currentTab.Container
	end
	return self._scrollingFrame
end

-- // Component builders (now include new ones)
function Window:AddLabel(title: string): Frame
	return Components:BuildLabel(self:_getTarget(), title)
end
function Window:AddButton(title: string, description: string, buttonText: string, callback: (() -> ())?): Frame
	return Components:BuildButton(self:_getTarget(), title, description, buttonText, callback)
end
function Window:AddSlider(title: string, description: string, min: number, max: number, default: number, callback: ((number) -> ())?, step: number?): Frame
	return Components:BuildSlider(self:_getTarget(), title, description, min, max, default, callback, step)
end
function Window:AddToggle(title: string, description: string, default: boolean?, callback: ((boolean) -> ())?): Frame
	return Components:BuildToggle(self:_getTarget(), title, description, default, callback)
end
function Window:AddDivider(label: string?): Frame
	return Components:BuildDivider(self:_getTarget(), label)
end
function Window:AddStatus(title: string, initialState: boolean): table
	return Components:BuildStatus(self:_getTarget(), title, initialState)
end
function Window:AddDropdown(title: string, description: string, options: {string}, default: string, callback: ((string) -> ())?): Frame
	return Components:BuildDropdown(self:_getTarget(), title, description, options, default, callback)
end

-- ✅ NEW: Keybind Support
function Window:AddKeybind(title: string, description: string, defaultKey: Enum.KeyCode, callback: (() -> ())?): table
	local keybindContainer = createInstance("Frame", self:_getTarget(), {
		Name = "Keybind",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(1, 0, 0.1, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundTransparency = 1,
	})
	createInstance("UIAspectRatioConstraint", keybindContainer, { AspectRatio = 11 })
	
	local textFrame = createInstance("Frame", keybindContainer, {
		Name = "Frame",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.34036, 0, 1, 0),
		Position = UDim2.new(0.17018, 0, 0.5, 0),
		BackgroundTransparency = 1,
	})
	createInstance("UIAspectRatioConstraint", textFrame, { AspectRatio = 4 })
	createInstance("UIListLayout", textFrame, {
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		Padding = UDim.new(0.01, 0),
		VerticalAlignment = Enum.VerticalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
	})
	
	createInstance("TextLabel", textFrame, {
		Name = "1Title",
		Text = title,
		TextSize = 14,
		TextColor3 = THEME.TextPrimary,
		FontFace = getFont(FONT_PATH, Enum.FontWeight.Medium, Enum.FontStyle.Normal),
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0.32, 0),
		TextScaled = true,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left,
	})
	createInstance("TextLabel", textFrame, {
		Name = "2Description",
		Text = description,
		TextSize = 12,
		TextColor3 = THEME.TextSecondary,
		FontFace = getFont(FONT_PATH, Enum.FontWeight.Medium, Enum.FontStyle.Normal),
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0.3, 0),
		TextScaled = true,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left,
	})
	
	local keyBtn = createInstance("TextButton", keybindContainer, {
		Name = "KeyBtn",
		Text = defaultKey.Name,
		TextSize = 12,
		TextColor3 = THEME.TextPrimary,
		BackgroundColor3 = THEME.DropdownBg,
		FontFace = getFont(FONT_PATH, Enum.FontWeight.Medium, Enum.FontStyle.Normal),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.1754, 0, 0.7, 0),
		Position = UDim2.new(0.9, 0, 0.5, 0),
		BorderSizePixel = 0,
		AutoButtonColor = false,
		TextScaled = true,
	})
	createInstance("UICorner", keyBtn, { CornerRadius = UDim.new(0, 4) })
	createInstance("UIAspectRatioConstraint", keyBtn, { AspectRatio = 1.8 })
	createInstance("UIStroke", keyBtn, {
		Thickness = 1.6,
		Color = THEME.StrokeColor,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	})
	
	local isListening = false
	local currentKey = defaultKey
	
	keyBtn.MouseButton1Click:Connect(function()
		isListening = true
		keyBtn.Text = "..."
		keyBtn.BackgroundColor3 = THEME.Accent.Yellow
	end)
	
	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if gameProcessed then return end
		if isListening and input.UserInputType == Enum.UserInputType.Keyboard then
			isListening = false
			currentKey = input.KeyCode
			keyBtn.Text = currentKey.Name
			keyBtn.BackgroundColor3 = THEME.DropdownBg
			if callback then pcall(callback) end
		end
	end)
	
	self._keybinds[currentKey] = callback
	
	return { Container = keybindContainer, Button = keyBtn, GetKey = function() return currentKey end }
end

-- ✅ NEW: Config Save/Load Helpers
function Window:SaveConfig(config: table, filename: string)
	local success, result = pcall(HttpService.JSONEncode, HttpService, config)
	if success then
		pcall(function()
			writefile(filename, result)
		end)
	end
end

function Window:LoadConfig(filename: string): table?
	local success, result = pcall(readfile, filename)
	if success and result then
		local decoded = pcall(HttpService.JSONDecode, HttpService, result)
		if decoded then return decoded end
	end
	return nil
end

function Window:Show() 
	if self._gui then 
		self._gui.Enabled = true 
		self._window.Position = UDim2.new(0.5, 0, 0.5, 0)
	end 
end
function Window:Hide() 
	if self._gui then self._gui.Enabled = false end 
end
function Window:Destroy() 
	if self._gui then self._gui:Destroy() end 
end

-- // Library Export
local Library = { _version = "4.2" }
function Library:CreateWindow(title: string, description: string): table
	return Window.new(title, description)
end

return Library
