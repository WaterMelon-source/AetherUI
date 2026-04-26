--!strict
-- AetherUI Library v1.0
-- Usage: local library = loadstring(game:HttpGet("RAW_GITHUB_LINK"))()
--        local window = library:CreateWindow("My Window", "Description")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- // Theme Configuration
local THEME = {
	Window = {
		Background = Color3.fromRGB(31, 31, 31),
		SideBackground = Color3.fromRGB(36, 36, 36),
		StrokeColor = Color3.fromRGB(51, 51, 51),
		TextPrimary = Color3.fromRGB(255, 255, 255),
		TextSecondary = Color3.fromRGB(151, 151, 151),
		Accent = {
			Red = Color3.fromRGB(255, 96, 88),
			Yellow = Color3.fromRGB(255, 190, 47),
			Green = Color3.fromRGB(40, 202, 64),
		}
	},
	Font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
	FontBold = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
}

-- // Utility Functions
local function createInstance(class: string, parent: Instance?, props: table): Instance
	local inst = Instance.new(class, parent)
	for key, value in pairs(props) do
		if key ~= "Parent" then
			inst[key] = value
		end
	end
	return inst
end

-- // Component Builders
local Components = {}

function Components:BuildLabel(parent: Frame, title: string, description: string?): Frame
	local labelContainer = createInstance("Frame", parent, {
		Name = "Label",
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(1, 0, 0.1, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
	})
	
	createInstance("TextLabel", labelContainer, {
		Name = "Title",
		Text = title,
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		FontFace = THEME.FontBold,
		TextColor3 = THEME.Window.TextPrimary,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 20),
		Position = UDim2.new(0, 0, 0, 0),
		TextWrapped = true,
	})
	
	if description then
		createInstance("TextLabel", labelContainer, {
			Name = "Description",
			Text = description,
			TextSize = 12,
			TextXAlignment = Enum.TextXAlignment.Left,
			FontFace = THEME.Font,
			TextColor3 = THEME.Window.TextSecondary,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 15),
			Position = UDim2.new(0, 0, 0, 22),
			TextWrapped = true,
		})
	end
	
	return labelContainer
end

function Components:BuildToggle(parent: Frame, title: string, description: string?, callback: ((state: boolean) -> ())?): Frame
	local toggleContainer = createInstance("Frame", parent, {
		Name = "Toggle",
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(1, 0, 0.1, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
	})
	
	-- Text Frame
	local textFrame = createInstance("Frame", toggleContainer, {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.7, 0, 1, 0),
		Position = UDim2.new(0.35, 0, 0.5, 0),
	})
	
	createInstance("TextLabel", textFrame, {
		Name = "Title",
		Text = title,
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		FontFace = THEME.FontBold,
		TextColor3 = THEME.Window.TextPrimary,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 20),
		TextWrapped = true,
	})
	
	if description then
		createInstance("TextLabel", textFrame, {
			Name = "Description",
			Text = description,
			TextSize = 12,
			TextXAlignment = Enum.TextXAlignment.Left,
			FontFace = THEME.Font,
			TextColor3 = THEME.Window.TextSecondary,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 15),
			Position = UDim2.new(0, 0, 0, 22),
			TextWrapped = true,
		})
	end
	
	createInstance("UIListLayout", textFrame, {
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		Padding = UDim.new(0.01, 0),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})
	
	-- Switch
	local switch = createInstance("Frame", toggleContainer, {
		Name = "Switch",
		BackgroundColor3 = THEME.Window.SideBackground,
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.085, 0, 0.5, 0),
		Position = UDim2.new(0.9, 0, 0.5, 0),
	})
	
	createInstance("UICorner", switch, { CornerRadius = UDim.new(1, 0) })
	createInstance("UIStroke", switch, {
		Thickness = 1.6,
		Color = THEME.Window.StrokeColor,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	})
	
	local circle = createInstance("Frame", switch, {
		Name = "Circle",
		BackgroundColor3 = THEME.Window.TextPrimary,
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.8, 0, 0.8, 0),
		Position = UDim2.new(0.25, 0, 0.5, 0),
	})
	createInstance("UICorner", circle, { CornerRadius = UDim.new(1, 0) })
	createInstance("UIAspectRatioConstraint", circle)
	
	-- Toggle Logic
	local isEnabled = false
	local function updateSwitch()
		circle.Position = isEnabled and UDim2.new(0.75, 0, 0.5, 0) or UDim2.new(0.25, 0, 0.5, 0)
		switch.BackgroundColor3 = isEnabled and THEME.Window.Accent.Green or THEME.Window.SideBackground
	end
	
	createInstance("TextButton", toggleContainer, {
		Name = "ClickCatcher",
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Text = "",
		AutoButtonColor = false,
	}).MouseButton1Click:Connect(function()
		isEnabled = not isEnabled
		updateSwitch()
		if callback then callback(isEnabled) end
	end)
	
	updateSwitch()
	
	return toggleContainer
end

function Components:BuildButton(parent: Frame, title: string, description: string?, buttonText: string, callback: (() -> ())?): Frame
	local buttonContainer = createInstance("Frame", parent, {
		Name = "Button",
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(1, 0, 0.1, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
	})
	
	-- Text Frame
	local textFrame = createInstance("Frame", buttonContainer, {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.7, 0, 1, 0),
		Position = UDim2.new(0.35, 0, 0.5, 0),
	})
	
	createInstance("TextLabel", textFrame, {
		Name = "Title",
		Text = title,
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		FontFace = THEME.FontBold,
		TextColor3 = THEME.Window.TextPrimary,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 20),
		TextWrapped = true,
	})
	
	if description then
		createInstance("TextLabel", textFrame, {
			Name = "Description",
			Text = description,
			TextSize = 12,
			TextXAlignment = Enum.TextXAlignment.Left,
			FontFace = THEME.Font,
			TextColor3 = THEME.Window.TextSecondary,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 15),
			Position = UDim2.new(0, 0, 0, 22),
			TextWrapped = true,
		})
	end
	
	createInstance("UIListLayout", textFrame, {
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		Padding = UDim.new(0.01, 0),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})
	
	-- Action Button
	local actionBtn = createInstance("TextButton", buttonContainer, {
		Name = "Action",
		Text = buttonText or "Button",
		TextSize = 12,
		FontFace = THEME.FontBold,
		TextColor3 = THEME.Window.TextPrimary,
		BackgroundColor3 = THEME.Window.SideBackground,
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.12, 0, 0.7, 0),
		Position = UDim2.new(0.9, 0, 0.5, 0),
		AutoButtonColor = false,
	})
	
	createInstance("UICorner", actionBtn, { CornerRadius = UDim.new(0, 4) })
	createInstance("UIStroke", actionBtn, {
		Thickness = 1.6,
		Color = THEME.Window.StrokeColor,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	})
	
	if callback then
		actionBtn.MouseButton1Click:Connect(callback)
	end
	
	return buttonContainer
end

function Components:BuildSlider(parent: Frame, title: string, description: string?, min: number, max: number, default: number, callback: ((value: number) -> ())?): Frame
	local sliderContainer = createInstance("Frame", parent, {
		Name = "Slider",
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(1, 0, 0.12, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
	})
	
	-- Header
	local header = createInstance("Frame", sliderContainer, {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0.4, 0),
	})
	
	createInstance("TextLabel", header, {
		Name = "Title",
		Text = title,
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		FontFace = THEME.FontBold,
		TextColor3 = THEME.Window.TextPrimary,
		BackgroundTransparency = 1,
		Size = UDim2.new(0.7, 0, 1, 0),
		TextWrapped = true,
	})
	
	local valueLabel = createInstance("TextLabel", header, {
		Name = "Value",
		Text = tostring(default),
		TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Right,
		FontFace = THEME.Font,
		TextColor3 = THEME.Window.Accent.Green,
		BackgroundTransparency = 1,
		Size = UDim2.new(0.25, 0, 1, 0),
		Position = UDim2.new(0.75, 0, 0, 0),
	})
	
	if description then
		createInstance("TextLabel", sliderContainer, {
			Name = "Description",
			Text = description,
			TextSize = 11,
			TextXAlignment = Enum.TextXAlignment.Left,
			FontFace = THEME.Font,
			TextColor3 = THEME.Window.TextSecondary,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 14),
			Position = UDim2.new(0, 0, 0.45, 0),
			TextWrapped = true,
		})
	end
	
	-- Slider Track
	local track = createInstance("Frame", sliderContainer, {
		Name = "Track",
		BackgroundColor3 = THEME.Window.SideBackground,
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.9, 0, 0.08, 0),
		Position = UDim2.new(0.5, 0, 0.85, 0),
	})
	createInstance("UICorner", track, { CornerRadius = UDim.new(1, 0) })
	
	-- Slider Fill
	local fill = createInstance("Frame", track, {
		Name = "Fill",
		BackgroundColor3 = THEME.Window.Accent.Green,
		BorderSizePixel = 0,
		Size = UDim2.new(0, 0, 1, 0),
	})
	createInstance("UICorner", fill, { CornerRadius = UDim.new(1, 0) })
	
	-- Slider Knob
	local knob = createInstance("Frame", track, {
		Name = "Knob",
		BackgroundColor3 = THEME.Window.TextPrimary,
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0, 16, 1, 0),
		Position = UDim2.new(0, 0, 0.5, 0),
	})
	createInstance("UICorner", knob, { CornerRadius = UDim.new(1, 0) })
	
	-- Slider Logic
	local currentValue = default
	local function updateSlider(percent: number)
		percent = math.clamp(percent, 0, 1)
		currentValue = min + (max - min) * percent
		fill.Size = UDim2.new(percent, 0, 1, 0)
		knob.Position = UDim2.new(percent, 0, 0.5, 0)
		valueLabel.Text = string.format("%.2f", currentValue)
		if callback then callback(currentValue) end
	end
	
	-- Initialize
	updateSlider((default - min) / (max - min))
	
	-- Drag Handling
	local dragging = false
	knob.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
		end
	end)
	
	knob.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false
		end
	end)
	
	track.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			local mousePos = input.Position.X
			local trackPos = track.AbsolutePosition.X
			local trackWidth = track.AbsoluteSize.X
			local percent = (mousePos - trackPos) / trackWidth
			updateSlider(percent)
		end
	end)
	
	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			local mousePos = input.Position.X
			local trackPos = track.AbsolutePosition.X
			local trackWidth = track.AbsoluteSize.X
			local percent = (mousePos - trackPos) / trackWidth
			updateSlider(percent)
		end
	end)
	
	return sliderContainer
end

-- // Window Class
local Window = {}
Window.__index = Window

function Window.new(title: string, description: string?, options: table?): table
	options = options or {}
	
	local self = setmetatable({}, Window)
	
	-- // Build Base GUI (Refactored from your G2L code)
	local screenGui = createInstance("ScreenGui", PlayerGui, {
		Name = "AetherUI",
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		Parent = PlayerGui,
	})
	
	local windowFrame = createInstance("Frame", screenGui, {
		Name = "Window",
		ZIndex = 10,
		BorderSizePixel = 0,
		BackgroundColor3 = THEME.Window.Background,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.48, 0, 0.5, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundTransparency = 0.1,
	})
	createInstance("UICorner", windowFrame, { CornerRadius = UDim.new(0.01, 25) })
	createInstance("UIAspectRatioConstraint", windowFrame, { AspectRatio = 1.45 })
	
	-- Side Panel
	local side = createInstance("Frame", windowFrame, {
		Name = "Side",
		ZIndex = 10,
		BorderSizePixel = 0,
		BackgroundColor3 = THEME.Window.SideBackground,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.25, 0, 0.95, 0),
		Position = UDim2.new(0.14, 0, 0.5, 0),
		BackgroundTransparency = 0.25,
	})
	createInstance("UICorner", side, { CornerRadius = UDim.new(0.01, 15) })
	createInstance("UIStroke", side, {
		Color = THEME.Window.StrokeColor,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	})
	
	-- Decor (status dots)
	local decor = createInstance("Frame", side, {
		Name = "Decor",
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.2, 0, 0.028, 0),
		Position = UDim2.new(0.18, 0, 0.04, 0),
	})
	
	for _, color in ipairs({THEME.Window.Accent.Red, THEME.Window.Accent.Yellow, THEME.Window.Accent.Green}) do
		local dot = createInstance("Frame", decor, {
			BorderSizePixel = 0,
			BackgroundColor3 = color,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(1, 0, 1, 0),
		})
		createInstance("UICorner", dot, { CornerRadius = UDim.new(1, 0) })
		createInstance("UIAspectRatioConstraint", dot)
		dot.Position = UDim2.new((#decor:GetChildren()-1)*0.5, 0, 0.5, 0)
	end
	
	-- Tabs Container
	local tabsContainer = createInstance("Frame", side, {
		Name = "Tabs",
		ZIndex = 11,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(26, 26, 26),
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
		Padding = UDim.new(0, 7),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})
	
	-- Main Content Area
	local main = createInstance("Frame", windowFrame, {
		Name = "Main",
		ZIndex = 10,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(187, 187, 187),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.70556, 0, 0.95119, 0),
		Position = UDim2.new(0.63137, 0, 0.4994, 0),
		BackgroundTransparency = 1,
	})
	createInstance("UICorner", main, { CornerRadius = UDim.new(0.01, 25) })
	
	-- Labels Header
	local labelsHeader = createInstance("Frame", main, {
		Name = "Labels",
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.9, 0, 0.075, 0),
		Position = UDim2.new(0.5, 0, 0.05, 0),
	})
	
	createInstance("TextLabel", labelsHeader, {
		Name = "Title",
		Text = title or "Window",
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		FontFace = THEME.FontBold,
		TextColor3 = THEME.Window.TextPrimary,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0.1, 0),
		Position = UDim2.new(0.5, 0, 0.25, 0),
		TextWrapped = true,
	})
	
	if description then
		createInstance("TextLabel", labelsHeader, {
			Name = "Description",
			Text = description,
			TextSize = 10,
			TextXAlignment = Enum.TextXAlignment.Left,
			FontFace = THEME.Font,
			TextColor3 = THEME.Window.TextSecondary,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0.1, 0),
			Position = UDim2.new(0.5, 0, 0.75, 0),
		})
	end
	
	createInstance("UIListLayout", labelsHeader, {
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		Padding = UDim.new(0.3, 0),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})
	
	-- Scrolling Content
	local scrollingFrame = createInstance("ScrollingFrame", main, {
		BorderSizePixel = 0,
		CanvasSize = UDim2.new(0, 0, 0, 500),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.97246, 0, 0.86448, 0),
		Position = UDim2.new(0.53623, 0, 0.54276, 0),
		ScrollBarImageColor3 = Color3.fromRGB(61, 61, 61),
		ScrollBarThickness = 4,
		BackgroundTransparency = 1,
	})
	createInstance("UIListLayout", scrollingFrame, {
		Padding = UDim.new(0, 20),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})
	createInstance("UIPadding", scrollingFrame, {
		PaddingTop = UDim.new(0, 10),
		PaddingRight = UDim.new(0, 20),
		PaddingBottom = UDim.new(0, 20),
	})
	
	-- Store references
	self._gui = screenGui
	self._window = windowFrame
	self._side = side
	self._tabsContainer = tabsContainer
	self._scrollingFrame = scrollingFrame
	self._tabs = {}
	
	return self
end

function Window:AddTab(name: string, icon: string?): table
	local tabBtn = createInstance("Frame", self._tabsContainer, {
		Name = "Tab",
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(56, 56, 56),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(1, 0, 0.075, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
	})
	createInstance("UICorner", tabBtn, { CornerRadius = UDim.new(0.1, 9) })
	
	local button = createInstance("TextButton", tabBtn, {
		Name = "Button",
		BorderSizePixel = 0,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextSize = 12,
		TextColor3 = THEME.Window.TextPrimary,
		BackgroundColor3 = Color3.fromRGB(56, 56, 56),
		FontFace = THEME.FontBold,
		ZIndex = 5,
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0.075, 0),
		Text = "",
		Name = "Button",
		Position = UDim2.new(0.39657, 0, 0.05, 0),
		AutoButtonColor = false,
	})
	
	if icon then
		createInstance("ImageLabel", tabBtn, {
			Name = "Icon",
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Image = icon,
			Size = UDim2.new(0.65, 0, 0.65, 0),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1,
			Position = UDim2.new(0.1, 0, 0.5, 0),
		})
	end
	
	createInstance("TextLabel", tabBtn, {
		Name = "Title",
		TextWrapped = true,
		TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextScaled = true,
		FontFace = THEME.FontBold,
		TextColor3 = THEME.Window.TextPrimary,
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.55, 0, 0.55, 0),
		Text = name,
		Name = "Title",
		Position = UDim2.new(icon and 0.48 or 0.1, 0, 0.5, 0),
	})
	
	local tab = {
		Name = name,
		Container = createInstance("Frame", self._scrollingFrame, {
			Name = name .. "_Content",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			Visible = false,
		}),
		Button = button,
	}
	createInstance("UIListLayout", tab.Container, {
		Padding = UDim.new(0, 20),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})
	
	table.insert(self._tabs, tab)
	
	button.MouseButton1Click:Connect(function()
		for _, t in ipairs(self._tabs) do
			t.Container.Visible = (t == tab)
		end
	end)
	
	-- Auto-select first tab
	if #self._tabs == 1 then
		button:FireMouseButton1Click()
	end
	
	return tab
end

function Window:AddLabel(title: string, description: string?): Frame
	return Components:BuildLabel(self._scrollingFrame, title, description)
end

function Window:AddToggle(title: string, description: string?, callback: ((state: boolean) -> ())?): Frame
	return Components:BuildToggle(self._scrollingFrame, title, description, callback)
end

function Window:AddButton(title: string, description: string?, buttonText: string?, callback: (() -> ())?): Frame
	return Components:BuildButton(self._scrollingFrame, title, description, buttonText or "Button", callback)
end

function Window:AddSlider(title: string, description: string?, min: number, max: number, default: number, callback: ((value: number) -> ())?): Frame
	return Components:BuildSlider(self._scrollingFrame, title, description, min, max, default, callback)
end

function Window:Show()
	self._gui.Enabled = true
end

function Window:Hide()
	self._gui.Enabled = false
end

function Window:Destroy()
	self._gui:Destroy()
end

-- // Library Export
local Library = {}

function Library:CreateWindow(title: string, description: string?, options: table?): table
	return Window.new(title, description, options)
end

function Library:SetTheme(newTheme: table)
	for key, value in pairs(newTheme) do
		if type(value) == "table" then
			THEME[key] = THEME[key] or {}
			for k, v in pairs(value) do
				THEME[key][k] = v
			end
		else
			THEME[key] = value
		end
	end
end

return Library
