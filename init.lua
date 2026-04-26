--!strict
-- AetherUI Library v2.0 (Exact Match)
-- GitHub Usage: local library = loadstring(game:HttpGet("RAW_LINK"))()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui", 10)
assert(PlayerGui, "AetherUI: PlayerGui not found")

-- // Theme - Exact colors from your GUI
local THEME = {
	Window = {
		Background = Color3.fromRGB(31, 31, 31),
		SideBackground = Color3.fromRGB(36, 36, 36),
		StrokeColor = Color3.fromRGB(51, 51, 51),
		TabsBackground = Color3.fromRGB(26, 26, 26),
		TabBackground = Color3.fromRGB(56, 56, 56),
		MainPlaceholder = Color3.fromRGB(187, 187, 187),
		TextPrimary = Color3.fromRGB(255, 255, 255),
		TextSecondary = Color3.fromRGB(151, 151, 151),
		ScrollBar = Color3.fromRGB(61, 61, 61),
		SliderTrack = Color3.fromRGB(61, 61, 61),
		SliderFill = Color3.fromRGB(0, 123, 255),
		Accent = {
			Red = Color3.fromRGB(255, 96, 88),
			Yellow = Color3.fromRGB(255, 190, 47),
			Green = Color3.fromRGB(40, 202, 64),
		}
	},
	-- Font helper with fallback
	FontPath = "rbxasset://fonts/families/GothamSSm.json",
}

local function getFont(weight: Enum.FontWeight, style: Enum.FontStyle): Font
	local success, font = pcall(Font.new, THEME.FontPath, weight, style)
	if success then return font end
	-- Fallback to built-in fonts if custom font fails
	local fallbacks = {
		[Enum.FontWeight.Regular] = Enum.Font.Gotham,
		[Enum.FontWeight.Medium] = Enum.Font.Gotham,
		[Enum.FontWeight.SemiBold] = Enum.Font.GothamBold,
		[Enum.FontWeight.Bold] = Enum.Font.GothamBold,
	}
	return Font.fromEnum(fallbacks[weight] or Enum.Font.Gotham)
end

-- // Safe instance creator
local function createInstance(class: string, parent: Instance?, props: table?): Instance
	props = props or {}
	local inst = Instance.new(class, parent)
	for key, value in pairs(props) do
		if key ~= "Parent" and key ~= "Name" then
			pcall(function() inst[key] = value end)
		end
	end
	if props.Name then inst.Name = props.Name end
	return inst
end

-- // Component Builders (Exact structure match)
local Components = {}

function Components:BuildLabel(parent: Frame, title: string): Frame
	local label = createInstance("TextLabel", parent, {
		Name = "Label",
		TextWrapped = true,
		TextSize = 16,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextScaled = true,
		FontFace = getFont(Enum.FontWeight.Bold, Enum.FontStyle.Normal),
		TextColor3 = THEME.Window.TextPrimary,
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(1, 0, 0.05, 0),
		Text = title,
		Position = UDim2.new(0.5, 0, 0.5, 0),
	})
	createInstance("UIAspectRatioConstraint", label, { AspectRatio = 2.45 })
	return label
end

function Components:BuildSeparator(parent: Frame): Frame
	return createInstance("Frame", parent, {
		Name = "Seperator",
		BorderSizePixel = 0,
		BackgroundColor3 = THEME.Window.TextPrimary,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(1, 0, 0.002, 0),
		Position = UDim2.new(0.5, 0, 1.05, 0),
	})
end

function Components:BuildSlider(parent: Frame, title: string, description: string, min: number, max: number, default: number, callback: ((number) -> ())?): Frame
	local sliderContainer = createInstance("Frame", parent, {
		Name = "Slider",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(1, 0, 0.1, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundTransparency = 1,
	})
	
	-- Slider track (the horizontal bar)
	local sliderTrack = createInstance("Frame", sliderContainer, {
		Name = "Slider",
		BorderSizePixel = 0,
		BackgroundColor3 = THEME.Window.SliderTrack,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.1754, 0, 0.1, 0),
		Position = UDim2.new(0.9, 0, 0.5, 0),
	})
	createInstance("UICorner", sliderTrack, { CornerRadius = UDim.new(1, 0) })
	createInstance("UIAspectRatioConstraint", sliderTrack, { AspectRatio = 16 })
	createInstance("UIStroke", sliderTrack, {
		Thickness = 1.6,
		Color = THEME.Window.StrokeColor,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	})
	
	-- Fill (progress)
	local fill = createInstance("Frame", sliderTrack, {
		Name = "Value",
		BorderSizePixel = 0,
		BackgroundColor3 = THEME.Window.SliderFill,
		Size = UDim2.new(0, 0, 1, 0),
	})
	createInstance("UICorner", fill, { CornerRadius = UDim.new(1, 0) })
	
	-- Knob (circle handle)
	local knob = createInstance("Frame", sliderTrack, {
		Name = "Circle",
		BorderSizePixel = 0,
		BackgroundColor3 = THEME.Window.TextPrimary,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(2.5, 0, 2.5, 0),
		Position = UDim2.new(0, 0, 0.5, 0),
	})
	createInstance("UICorner", knob, { CornerRadius = UDim.new(1, 0) })
	createInstance("UIAspectRatioConstraint", knob)
	
	-- Text frame
	local textFrame = createInstance("Frame", sliderContainer, {
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
		ItemLineAlignment = Enum.ItemLineAlignment.Start,
	})
	
	createInstance("TextLabel", textFrame, {
		Name = "Title",
		TextWrapped = true,
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextScaled = true,
		FontFace = getFont(Enum.FontWeight.Medium, Enum.FontStyle.Normal),
		TextColor3 = THEME.Window.TextPrimary,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0.32, 0),
		Text = title,
	})
	
	createInstance("TextLabel", textFrame, {
		Name = "Description",
		TextWrapped = true,
		TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextScaled = true,
		FontFace = getFont(Enum.FontWeight.Medium, Enum.FontStyle.Normal),
		TextColor3 = THEME.Window.TextSecondary,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0.3, 0),
		Text = description,
		Position = UDim2.new(0, 0, 0, 20),
	})
	
	-- Slider logic
	local currentValue = default
	local function update(percent: number)
		percent = math.clamp(percent, 0, 1)
		currentValue = min + (max - min) * percent
		fill.Size = UDim2.new(percent, 0, 1, 0)
		knob.Position = UDim2.new(percent, 0, 0.5, 0)
		if callback then pcall(callback, currentValue) end
	end
	
	update((default - min) / (max - min))
	
	-- Drag handling
	local dragging = false
	knob.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true end
	end)
	knob.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
	end)
	sliderTrack.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			local percent = (input.Position.X - sliderTrack.AbsolutePosition.X) / sliderTrack.AbsoluteSize.X
			update(percent)
		end
	end)
	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			local percent = (input.Position.X - sliderTrack.AbsolutePosition.X) / sliderTrack.AbsoluteSize.X
			update(percent)
		end
	end)
	
	return sliderContainer
end

function Components:BuildToggle(parent: Frame, title: string, description: string, callback: ((boolean) -> ())?): Frame
	local toggleContainer = createInstance("Frame", parent, {
		Name = "Toggle",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(1, 0, 0.1, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundTransparency = 1,
	})
	
	-- Switch
	local switch = createInstance("Frame", toggleContainer, {
		Name = "Switch",
		BorderSizePixel = 0,
		BackgroundColor3 = THEME.Window.SideBackground,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.085, 0, 0.5, 0),
		Position = UDim2.new(0.9, 0, 0.5, 0),
	})
	createInstance("UICorner", switch, { CornerRadius = UDim.new(1, 0) })
	createInstance("UIAspectRatioConstraint", switch, { AspectRatio = 2 })
	createInstance("UIStroke", switch, {
		Thickness = 1.6,
		Color = THEME.Window.StrokeColor,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	})
	
	local circle = createInstance("Frame", switch, {
		Name = "Circle",
		BorderSizePixel = 0,
		BackgroundColor3 = THEME.Window.TextPrimary,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.7, 0, 0.7, 0),
		Position = UDim2.new(0.25, 0, 0.5, 0),
	})
	createInstance("UICorner", circle, { CornerRadius = UDim.new(1, 0) })
	createInstance("UIAspectRatioConstraint", circle)
	
	-- Text frame
	local textFrame = createInstance("Frame", toggleContainer, {
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
		ItemLineAlignment = Enum.ItemLineAlignment.Start,
	})
	
	createInstance("TextLabel", textFrame, {
		Name = "Title",
		TextWrapped = true,
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextScaled = true,
		FontFace = getFont(Enum.FontWeight.Medium, Enum.FontStyle.Normal),
		TextColor3 = THEME.Window.TextPrimary,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0.32, 0),
		Text = title,
	})
	
	createInstance("TextLabel", textFrame, {
		Name = "Description",
		TextWrapped = true,
		TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextScaled = true,
		FontFace = getFont(Enum.FontWeight.Medium, Enum.FontStyle.Normal),
		TextColor3 = THEME.Window.TextSecondary,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0.3, 0),
		Text = description,
		Position = UDim2.new(0, 0, 0, 20),
	})
	
	-- Toggle logic
	local enabled = false
	local function update()
		circle.Position = enabled and UDim2.new(0.75, 0, 0.5, 0) or UDim2.new(0.25, 0, 0.5, 0)
		switch.BackgroundColor3 = enabled and THEME.Window.Accent.Green or THEME.Window.SideBackground
	end
	
	createInstance("TextButton", toggleContainer, {
		Name = "ClickCatcher",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Text = "",
		AutoButtonColor = false,
	}).MouseButton1Click:Connect(function()
		enabled = not enabled
		update()
		if callback then pcall(callback, enabled) end
	end)
	
	update()
	return toggleContainer
end

function Components:BuildButton(parent: Frame, title: string, description: string, buttonText: string, callback: (() -> ())?): Frame
	local buttonContainer = createInstance("Frame", parent, {
		Name = "Button",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(1, 0, 0.1, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundTransparency = 1,
	})
	
	-- Text frame
	local textFrame = createInstance("Frame", buttonContainer, {
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
		ItemLineAlignment = Enum.ItemLineAlignment.Start,
	})
	
	createInstance("TextLabel", textFrame, {
		Name = "Title",
		TextWrapped = true,
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextScaled = true,
		FontFace = getFont(Enum.FontWeight.Medium, Enum.FontStyle.Normal),
		TextColor3 = THEME.Window.TextPrimary,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0.32, 0),
		Text = title,
	})
	
	createInstance("TextLabel", textFrame, {
		Name = "Description",
		TextWrapped = true,
		TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextScaled = true,
		FontFace = getFont(Enum.FontWeight.Medium, Enum.FontStyle.Normal),
		TextColor3 = THEME.Window.TextSecondary,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0.3, 0),
		Text = description,
		Position = UDim2.new(0, 0, 0, 20),
	})
	
	-- Action button
	local actionBtn = createInstance("TextButton", buttonContainer, {
		Name = "Button",
		TextWrapped = true,
		BorderSizePixel = 0,
		TextSize = 12,
		AutoButtonColor = false,
		TextScaled = true,
		TextColor3 = THEME.Window.TextPrimary,
		BackgroundColor3 = THEME.Window.SideBackground,
		FontFace = getFont(Enum.FontWeight.Bold, Enum.FontStyle.Normal),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.12, 0, 0.7, 0),
		Text = "",
		Position = UDim2.new(0.9, 0, 0.5, 0),
	})
	createInstance("UICorner", actionBtn, { CornerRadius = UDim.new(0, 4) })
	createInstance("UIAspectRatioConstraint", actionBtn, { AspectRatio = 1.8 })
	createInstance("UIStroke", actionBtn, {
		Thickness = 1.6,
		Color = THEME.Window.StrokeColor,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	})
	
	-- Button text label
	createInstance("TextLabel", actionBtn, {
		Name = "Text",
		TextWrapped = true,
		TextSize = 12,
		TextScaled = true,
		FontFace = getFont(Enum.FontWeight.Regular, Enum.FontStyle.Normal),
		TextColor3 = THEME.Window.TextPrimary,
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.8, 0, 0.8, 0),
		Text = buttonText,
		Position = UDim2.new(0.5, 0, 0.5, 0),
	})
	
	if callback then
		actionBtn.MouseButton1Click:Connect(function() pcall(callback) end)
	end
	
	return buttonContainer
end

-- // Window Class
local Window = {}
Window.__index = Window

function Window.new(title: string, description: string): table
	local self = setmetatable({}, Window)
	
	-- ScreenGui
	local screenGui = createInstance("ScreenGui", PlayerGui, {
		Name = "AetherUI",
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	})
	
	-- Main Window Frame
	local window = createInstance("Frame", screenGui, {
		Name = "Window",
		ZIndex = 10,
		BorderSizePixel = 0,
		BackgroundColor3 = THEME.Window.Background,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.48, 0, 0.5, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundTransparency = 0.1,
	})
	createInstance("UICorner", window, { CornerRadius = UDim.new(0, 20) })
	createInstance("UIAspectRatioConstraint", window, { AspectRatio = 1.45 })
	
	-- Side Panel
	local side = createInstance("Frame", window, {
		Name = "Side",
		ZIndex = 10,
		BorderSizePixel = 0,
		BackgroundColor3 = THEME.Window.SideBackground,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.25, 0, 0.95, 0),
		Position = UDim2.new(0.14, 0, 0.5, 0),
		BackgroundTransparency = 0.25,
	})
	createInstance("UICorner", side, { CornerRadius = UDim.new(0, 12) })
	createInstance("UIStroke", side, {
		Color = THEME.Window.StrokeColor,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	})
	
	-- Decor (traffic light dots)
	local decor = createInstance("Frame", side, {
		Name = "Decor",
		ZIndex = 2,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.2, 0, 0.028, 0),
		Position = UDim2.new(0.18, 0, 0.04, 0),
		BackgroundTransparency = 1,
	})
	
	local decorColors = {THEME.Window.Accent.Red, THEME.Window.Accent.Yellow, THEME.Window.Accent.Green}
	local decorPositions = {UDim2.new(0, 0, 0.5, 0), UDim2.new(0.5, 0, 0.5, 0), UDim2.new(1, 0, 0.5, 0)}
	
	for i, color in ipairs(decorColors) do
		local dot = createInstance("Frame", decor, {
			BorderSizePixel = 0,
			BackgroundColor3 = color,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(1, 0, 1, 0),
			Position = decorPositions[i],
			Name = ({ "Red", "Yellow", "Green" })[i],
		})
		createInstance("UICorner", dot, { CornerRadius = UDim.new(1, 0) })
		createInstance("UIAspectRatioConstraint", dot)
	end
	
	-- Tabs Container
	local tabsContainer = createInstance("Frame", side, {
		Name = "Tabs",
		ZIndex = 11,
		BorderSizePixel = 0,
		BackgroundColor3 = THEME.Window.TabsBackground,
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
	
	-- Category label
	createInstance("TextLabel", tabsContainer, {
		Name = "Category",
		TextWrapped = true,
		TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextScaled = true,
		FontFace = getFont(Enum.FontWeight.Medium, Enum.FontStyle.Normal),
		TextColor3 = THEME.Window.TextSecondary,
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(1, 0, 0.03, 0),
		Text = "Category",
		Position = UDim2.new(0.5, 0, 0.5, 0),
	})
	
	-- Main Content Area
	local main = createInstance("Frame", window, {
		Name = "Main",
		ZIndex = 10,
		BorderSizePixel = 0,
		BackgroundColor3 = THEME.Window.MainPlaceholder,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.70556, 0, 0.95119, 0),
		Position = UDim2.new(0.63137, 0, 0.4994, 0),
		BackgroundTransparency = 1,
	})
	createInstance("UICorner", main, { CornerRadius = UDim.new(0.01, 25) })
	
	-- Header Labels
	local labels = createInstance("Frame", main, {
		Name = "Labels",
		ZIndex = 2,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.9, 0, 0.075, 0),
		Position = UDim2.new(0.5, 0, 0.05, 0),
		BackgroundTransparency = 1,
	})
	
	createInstance("TextLabel", labels, {
		Name = "Title",
		TextWrapped = true,
		ZIndex = 2,
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextScaled = true,
		FontFace = getFont(Enum.FontWeight.Bold, Enum.FontStyle.Normal),
		TextColor3 = THEME.Window.TextPrimary,
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(1, 0, 0.4, 0),
		Text = title,
		Position = UDim2.new(0.5, 0, 0.25, 0),
	})
	
	createInstance("TextLabel", labels, {
		Name = "Description",
		TextWrapped = true,
		ZIndex = 2,
		TextSize = 10,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextScaled = true,
		FontFace = getFont(Enum.FontWeight.Medium, Enum.FontStyle.Normal),
		TextColor3 = THEME.Window.TextSecondary,
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.2961, 0, 0.3, 0),
		Text = description or "",
		Position = UDim2.new(0.14805, 0, 0.9, 0),
	})
	
	createInstance("UIListLayout", labels, {
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		Padding = UDim.new(0.1, 0),
		VerticalAlignment = Enum.VerticalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		ItemLineAlignment = Enum.ItemLineAlignment.Start,
	})
	
	-- Scrolling Content Frame
	local scrollingFrame = createInstance("ScrollingFrame", main, {
		BorderSizePixel = 0,
		CanvasSize = UDim2.new(0, 0, 0, 500),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.97246, 0, 0.86448, 0),
		Position = UDim2.new(0.53623, 0, 0.54276, 0),
		ScrollBarImageColor3 = THEME.Window.ScrollBar,
		ScrollBarThickness = 4,
		BackgroundTransparency = 1,
	})
	createInstance("UIAspectRatioConstraint", scrollingFrame, { AspectRatio = 1.23 })
	createInstance("UIPadding", scrollingFrame, {
		PaddingTop = UDim.new(0, 10),
		PaddingRight = UDim.new(0, 20),
		PaddingBottom = UDim.new(0, 20),
	})
	createInstance("UIListLayout", scrollingFrame, {
		Padding = UDim.new(0, 10),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})
	
	-- Store references
	self._gui = screenGui
	self._window = window
	self._tabsContainer = tabsContainer
	self._scrollingFrame = scrollingFrame
	self._tabs = {}
	self._currentTabContent = scrollingFrame
	
	return self
end

function Window:AddTab(name: string, iconId: string?): table
	local tabBtn = createInstance("Frame", self._tabsContainer, {
		Name = "Tab",
		BorderSizePixel = 0,
		BackgroundColor3 = THEME.Window.TabBackground,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(1, 0, 0.075, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
	})
	createInstance("UICorner", tabBtn, { CornerRadius = UDim.new(0.1, 9) })
	
	-- Button click area
	createInstance("TextButton", tabBtn, {
		Name = "Button",
		BorderSizePixel = 0,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextSize = 12,
		TextColor3 = THEME.Window.TextPrimary,
		BackgroundColor3 = THEME.Window.TabBackground,
		FontFace = getFont(Enum.FontWeight.Bold, Enum.FontStyle.Normal),
		ZIndex = 5,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0.075, 0),
		Text = "",
		Position = UDim2.new(0.39657, 0, 0.05, 0),
		AutoButtonColor = false,
	})
	
	-- Icon (if provided)
	if iconId then
		local icon = createInstance("ImageLabel", tabBtn, {
			Name = "Icon",
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Image = "rbxassetid://" .. tostring(iconId):gsub("[^%d]", ""),
			Size = UDim2.new(0.65, 0, 0.65, 0),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			Position = UDim2.new(0.12, 0, 0.5, 0),
		})
		createInstance("UIAspectRatioConstraint", icon)
	end
	
	-- Title
	createInstance("TextLabel", tabBtn, {
		Name = "Title",
		TextWrapped = true,
		TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextScaled = true,
		FontFace = getFont(Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
		TextColor3 = THEME.Window.TextPrimary,
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.55, 0, 0.55, 0),
		Text = name,
		Position = UDim2.new(iconId and 0.49 or 0.1, 0, 0.5, 0),
	})
	
	-- Tab content container (hidden by default)
	local content = createInstance("Frame", self._scrollingFrame, {
		Name = name .. "_Content",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		Visible = false,
	})
	createInstance("UIListLayout", content, {
		Padding = UDim.new(0, 10),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})
	
	local tab = { Name = name, Container = content, Button = tabBtn }
	table.insert(self._tabs, tab)
	
	-- Tab switching
	tabBtn.MouseButton1Click:Connect(function()
		for _, t in ipairs(self._tabs) do
			t.Container.Visible = (t == tab)
		end
	end)
	
	-- Auto-select first tab
	if #self._tabs == 1 then
		task.defer(function() tabBtn:FindFirstChild("Button"):FireMouseButton1Click() end)
	end
	
	return tab
end

-- Component methods (add to current tab or main if no tab selected)
function Window:_getTarget(): Frame
	-- If a tab is active, add to its container; otherwise add to main scrolling frame
	for _, tab in ipairs(self._tabs) do
		if tab.Container.Visible then return tab.Container end
	end
	return self._scrollingFrame
end

function Window:AddLabel(title: string): Frame
	return Components:BuildLabel(self:_getTarget(), title)
end

function Window:AddSeparator(): Frame
	return Components:BuildSeparator(self:_getTarget())
end

function Window:AddSlider(title: string, description: string, min: number, max: number, default: number, callback: ((number) -> ())?): Frame
	return Components:BuildSlider(self:_getTarget(), title, description, min, max, default, callback)
end

function Window:AddToggle(title: string, description: string, callback: ((boolean) -> ())?): Frame
	return Components:BuildToggle(self:_getTarget(), title, description, callback)
end

function Window:AddButton(title: string, description: string, buttonText: string, callback: (() -> ())?): Frame
	return Components:BuildButton(self:_getTarget(), title, description, buttonText, callback)
end

function Window:Show() if self._gui then self._gui.Enabled = true end end
function Window:Hide() if self._gui then self._gui.Enabled = false end end
function Window:Destroy() if self._gui then self._gui:Destroy() end end

-- // Library Export
local Library = { _version = "2.0" }

function Library:CreateWindow(title: string, description: string): table
	return Window.new(title, description)
end

return Library
