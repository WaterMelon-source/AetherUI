--!strict
-- AetherUI Library v1.0.1 (FIXED)
-- Usage: local library = loadstring(game:HttpGet("RAW_GITHUB_LINK"))()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui", 10)
assert(PlayerGui, "AetherUI: PlayerGui not found!")

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
	Font = Font.new(Enum.Font.Gotham), -- Fallback font
	FontBold = Font.new(Enum.Font.GothamBold),
}

-- // Utility Functions (FIXED)
local function createInstance(class: string, parent: Instance?, props: table?): Instance
	props = props or {}  -- ✅ Safeguard against nil props
	local inst = Instance.new(class, parent)
	for key, value in pairs(props) do
		if key ~= "Parent" and key ~= "Name" then
			local success, err = pcall(function()
				inst[key] = value
			end)
			if not success then
				warn(`AetherUI: Failed to set property '{key}' on {class}: {err}`)
			end
		end
	end
	-- Set Name separately to avoid conflicts
	if props.Name then
		inst.Name = props.Name
	end
	return inst
end

-- // Component Builders (with nil-safe callbacks)
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

function Components:BuildToggle(parent: Frame, title: string, description: string?, callback: ((boolean) -> ())?): Frame
	local toggleContainer = createInstance("Frame", parent, {
		Name = "Toggle",
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(1, 0, 0.1, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
	})
	
	local textFrame = createInstance("Frame", toggleContainer, {
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.7, 0, 1, 0),
		Position = UDim2.new(0.35, 0, 0.5, 0),
	})
	
	createInstance("TextLabel", textFrame, {
		Name = "Title", Text = title, TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		FontFace = THEME.FontBold, TextColor3 = THEME.Window.TextPrimary,
		BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 20),
		TextWrapped = true,
	})
	
	if description then
		createInstance("TextLabel", textFrame, {
			Name = "Description", Text = description, TextSize = 12,
			TextXAlignment = Enum.TextXAlignment.Left,
			FontFace = THEME.Font, TextColor3 = THEME.Window.TextSecondary,
			BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 15),
			Position = UDim2.new(0, 0, 0, 22), TextWrapped = true,
		})
	end
	
	createInstance("UIListLayout", textFrame, {
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		Padding = UDim.new(0.01, 0), SortOrder = Enum.SortOrder.LayoutOrder,
	})
	
	local switch = createInstance("Frame", toggleContainer, {
		Name = "Switch", BackgroundColor3 = THEME.Window.SideBackground,
		BorderSizePixel = 0, AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.085, 0, 0.5, 0), Position = UDim2.new(0.9, 0, 0.5, 0),
	})
	createInstance("UICorner", switch, { CornerRadius = UDim.new(1, 0) })
	createInstance("UIStroke", switch, {
		Thickness = 1.6, Color = THEME.Window.StrokeColor,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	})
	
	local circle = createInstance("Frame", switch, {
		Name = "Circle", BackgroundColor3 = THEME.Window.TextPrimary,
		BorderSizePixel = 0, AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.8, 0, 0.8, 0), Position = UDim2.new(0.25, 0, 0.5, 0),
	})
	createInstance("UICorner", circle, { CornerRadius = UDim.new(1, 0) })
	createInstance("UIAspectRatioConstraint", circle)
	
	local isEnabled = false
	local function updateSwitch()
		circle.Position = isEnabled and UDim2.new(0.75, 0, 0.5, 0) or UDim2.new(0.25, 0, 0.5, 0)
		switch.BackgroundColor3 = isEnabled and THEME.Window.Accent.Green or THEME.Window.SideBackground
	end
	
	local clickCatcher = createInstance("TextButton", toggleContainer, {
		Name = "ClickCatcher", BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0), Text = "", AutoButtonColor = false,
	})
	
	clickCatcher.MouseButton1Click:Connect(function()
		isEnabled = not isEnabled
		updateSwitch()
		if callback then pcall(callback, isEnabled) end
	end)
	
	updateSwitch()
	return toggleContainer
end

function Components:BuildButton(parent: Frame, title: string, description: string?, buttonText: string, callback: (() -> ())?): Frame
	local buttonContainer = createInstance("Frame", parent, {
		Name = "Button", BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5), Size = UDim2.new(1, 0, 0.1, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
	})
	
	local textFrame = createInstance("Frame", buttonContainer, {
		BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.7, 0, 1, 0), Position = UDim2.new(0.35, 0, 0.5, 0),
	})
	
	createInstance("TextLabel", textFrame, {
		Name = "Title", Text = title, TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left, FontFace = THEME.FontBold,
		TextColor3 = THEME.Window.TextPrimary, BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 20), TextWrapped = true,
	})
	
	if description then
		createInstance("TextLabel", textFrame, {
			Name = "Description", Text = description, TextSize = 12,
			TextXAlignment = Enum.TextXAlignment.Left, FontFace = THEME.Font,
			TextColor3 = THEME.Window.TextSecondary, BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 15), Position = UDim2.new(0, 0, 0, 22),
			TextWrapped = true,
		})
	end
	
	createInstance("UIListLayout", textFrame, {
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		Padding = UDim.new(0.01, 0), SortOrder = Enum.SortOrder.LayoutOrder,
	})
	
	local actionBtn = createInstance("TextButton", buttonContainer, {
		Name = "Action", Text = buttonText or "Button", TextSize = 12,
		FontFace = THEME.FontBold, TextColor3 = THEME.Window.TextPrimary,
		BackgroundColor3 = THEME.Window.SideBackground, BorderSizePixel = 0,
		AnchorPoint = Vector2.new(0.5, 0.5), Size = UDim2.new(0.12, 0, 0.7, 0),
		Position = UDim2.new(0.9, 0, 0.5, 0), AutoButtonColor = false,
	})
	
	createInstance("UICorner", actionBtn, { CornerRadius = UDim.new(0, 4) })
	createInstance("UIStroke", actionBtn, {
		Thickness = 1.6, Color = THEME.Window.StrokeColor,
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
	})
	
	if callback then
		actionBtn.MouseButton1Click:Connect(function()
			pcall(callback)
		end)
	end
	
	return buttonContainer
end

function Components:BuildSlider(parent: Frame, title: string, description: string?, min: number, max: number, default: number, callback: ((number) -> ())?): Frame
	local sliderContainer = createInstance("Frame", parent, {
		Name = "Slider", BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5), Size = UDim2.new(1, 0, 0.12, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
	})
	
	local header = createInstance("Frame", sliderContainer, {
		BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0.4, 0),
	})
	
	createInstance("TextLabel", header, {
		Name = "Title", Text = title, TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left, FontFace = THEME.FontBold,
		TextColor3 = THEME.Window.TextPrimary, BackgroundTransparency = 1,
		Size = UDim2.new(0.7, 0, 1, 0), TextWrapped = true,
	})
	
	local valueLabel = createInstance("TextLabel", header, {
		Name = "Value", Text = tostring(default), TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Right, FontFace = THEME.Font,
		TextColor3 = THEME.Window.Accent.Green, BackgroundTransparency = 1,
		Size = UDim2.new(0.25, 0, 1, 0), Position = UDim2.new(0.75, 0, 0, 0),
	})
	
	if description then
		createInstance("TextLabel", sliderContainer, {
			Name = "Description", Text = description, TextSize = 11,
			TextXAlignment = Enum.TextXAlignment.Left, FontFace = THEME.Font,
			TextColor3 = THEME.Window.TextSecondary, BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 14), Position = UDim2.new(0, 0, 0.45, 0),
			TextWrapped = true,
		})
	end
	
	local track = createInstance("Frame", sliderContainer, {
		Name = "Track", BackgroundColor3 = THEME.Window.SideBackground,
		BorderSizePixel = 0, AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.9, 0, 0.08, 0), Position = UDim2.new(0.5, 0, 0.85, 0),
	})
	createInstance("UICorner", track, { CornerRadius = UDim.new(1, 0) })
	
	local fill = createInstance("Frame", track, {
		Name = "Fill", BackgroundColor3 = THEME.Window.Accent.Green,
		BorderSizePixel = 0, Size = UDim2.new(0, 0, 1, 0),
	})
	createInstance("UICorner", fill, { CornerRadius = UDim.new(1, 0) })
	
	local knob = createInstance("Frame", track, {
		Name = "Knob", BackgroundColor3 = THEME.Window.TextPrimary,
		BorderSizePixel = 0, AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0, 16, 1, 0), Position = UDim2.new(0, 0, 0.5, 0),
	})
	createInstance("UICorner", knob, { CornerRadius = UDim.new(1, 0) })
	
	local currentValue = default
	local function updateSlider(percent: number)
		percent = math.clamp(percent, 0, 1)
		currentValue = min + (max - min) * percent
		fill.Size = UDim2.new(percent, 0, 1, 0)
		knob.Position = UDim2.new(percent, 0, 0.5, 0)
		valueLabel.Text = string.format("%.2f", currentValue)
		if callback then pcall(callback, currentValue) end
	end
	
	updateSlider((default - min) / (max - min))
	
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
	
	local screenGui = createInstance("ScreenGui", PlayerGui, {
		Name = "AetherUI",
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
	})
	
	local windowFrame = createInstance("Frame", screenGui, {
		Name = "Window", ZIndex = 10, BorderSizePixel = 0,
		BackgroundColor3 = THEME.Window.Background,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.48, 0, 0.5, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundTransparency = 0.1,
	})
	createInstance("UICorner", windowFrame, { CornerRadius = UDim.new(0.01, 25) })
	createInstance("UIAspectRatioConstraint", windowFrame, { AspectRatio = 1.45 })
	
	local side = createInstance("Frame", windowFrame, {
		Name = "Side", ZIndex = 10, BorderSizePixel = 0,
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
	
	local decor = createInstance("Frame", side, {
		Name = "Decor", BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.2, 0, 0.028, 0),
		Position = UDim2.new(0.18, 0, 0.04, 0),
	})
	
	local colors = {THEME.Window.Accent.Red, THEME.Window.Accent.Yellow, THEME.Window.Accent.Green}
	for i, color in ipairs(colors) do
		local dot = createInstance("Frame", decor, {
			BorderSizePixel = 0, BackgroundColor3 = color,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new((i-1)*0.5, 0, 0.5, 0),
		})
		createInstance("UICorner", dot, { CornerRadius = UDim.new(1, 0) })
		createInstance("UIAspectRatioConstraint", dot)
	end
	
	local tabsContainer = createInstance("Frame", side, {
		Name = "Tabs", ZIndex = 11, BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(26, 26, 26),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.9, 0, 0.9, 0),
		Position = UDim2.new(0.5, 0, 0.53, 0),
		BackgroundTransparency = 1,
	})
	createInstance("UICorner", tabsContainer, { CornerRadius = UDim.new(0, 10) })
	createInstance("UIPadding", tabsContainer, {
		PaddingTop = UDim.new(0, 10), PaddingRight = UDim.new(0, 5),
		PaddingLeft = UDim.new(0, 5), PaddingBottom = UDim.new(0, 10),
	})
	createInstance("UIListLayout", tabsContainer, {
		Padding = UDim.new(0, 7), SortOrder = Enum.SortOrder.LayoutOrder,
	})
	
	local main = createInstance("Frame", windowFrame, {
		Name = "Main", ZIndex = 10, BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(187, 187, 187),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.70556, 0, 0.95119, 0),
		Position = UDim2.new(0.63137, 0, 0.4994, 0),
		BackgroundTransparency = 1,
	})
	createInstance("UICorner", main, { CornerRadius = UDim.new(0.01, 25) })
	
	local labelsHeader = createInstance("Frame", main, {
		Name = "Labels", BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.9, 0, 0.075, 0),
		Position = UDim2.new(0.5, 0, 0.05, 0),
	})
	
	createInstance("TextLabel", labelsHeader, {
		Name = "Title", Text = title or "Window", TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left, FontFace = THEME.FontBold,
		TextColor3 = THEME.Window.TextPrimary, BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0.1, 0), Position = UDim2.new(0.5, 0, 0.25, 0),
		TextWrapped = true,
	})
	
	if description then
		createInstance("TextLabel", labelsHeader, {
			Name = "Description", Text = description, TextSize = 10,
			TextXAlignment = Enum.TextXAlignment.Left, FontFace = THEME.Font,
			TextColor3 = THEME.Window.TextSecondary, BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0.1, 0), Position = UDim2.new(0.5, 0, 0.75, 0),
		})
	end
	
	createInstance("UIListLayout", labelsHeader, {
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		Padding = UDim.new(0.3, 0), SortOrder = Enum.SortOrder.LayoutOrder,
	})
	
	local scrollingFrame = createInstance("ScrollingFrame", main, {
		BorderSizePixel = 0, CanvasSize = UDim2.new(0, 0, 0, 500),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.97246, 0, 0.86448, 0),
		Position = UDim2.new(0.53623, 0, 0.54276, 0),
		ScrollBarImageColor3 = Color3.fromRGB(61, 61, 61),
		ScrollBarThickness = 4, BackgroundTransparency = 1,
	})
	createInstance("UIListLayout", scrollingFrame, {
		Padding = UDim.new(0, 20), SortOrder = Enum.SortOrder.LayoutOrder,
	})
	createInstance("UIPadding", scrollingFrame, {
		PaddingTop = UDim.new(0, 10), PaddingRight = UDim.new(0, 20),
		PaddingBottom = UDim.new(0, 20),
	})
	
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
		Name = "Tab", BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(56, 56, 56),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(1, 0, 0.075, 0),
		Position = UDim2.new(0.5, 0, 0.5, 0),
	})
	createInstance("UICorner", tabBtn, { CornerRadius = UDim.new(0.1, 9) })
	
	local button = createInstance("TextButton", tabBtn, {
		Name = "Button", BorderSizePixel = 0,
		TextXAlignment = Enum.TextXAlignment.Left, TextSize = 12,
		TextColor3 = THEME.Window.TextPrimary,
		BackgroundColor3 = Color3.fromRGB(56, 56, 56),
		FontFace = THEME.FontBold, ZIndex = 5,
		AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0.075, 0), Text = "",
		Position = UDim2.new(0.39657, 0, 0.05, 0), AutoButtonColor = false,
	})
	
	if icon then
		createInstance("ImageLabel", tabBtn, {
			Name = "Icon", BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			AnchorPoint = Vector2.new(0.5, 0.5), Image = icon,
			Size = UDim2.new(0.65, 0, 0.65, 0),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BackgroundTransparency = 1, Position = UDim2.new(0.1, 0, 0.5, 0),
		})
	end
	
	createInstance("TextLabel", tabBtn, {
		Name = "Title", TextWrapped = true, TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Left, TextScaled = true,
		FontFace = THEME.FontBold, TextColor3 = THEME.Window.TextPrimary,
		BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(0.55, 0, 0.55, 0), Text = name,
		Name = "Title", Position = UDim2.new(icon and 0.48 or 0.1, 0, 0.5, 0),
	})
	
	local tab = {
		Name = name,
		Container = createInstance("Frame", self._scrollingFrame, {
			Name = name .. "_Content", BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0), Visible = false,
		}),
		Button = button,
	}
	createInstance("UIListLayout", tab.Container, {
		Padding = UDim.new(0, 20), SortOrder = Enum.SortOrder.LayoutOrder,
	})
	
	table.insert(self._tabs, tab)
	
	button.MouseButton1Click:Connect(function()
		for _, t in ipairs(self._tabs) do
			t.Container.Visible = (t == tab)
		end
	end)
	
	if #self._tabs == 1 then
		task.defer(function() button:FireMouseButton1Click() end)
	end
	
	return tab
end

function Window:AddLabel(title: string, description: string?): Frame
	return Components:BuildLabel(self._scrollingFrame, title, description)
end

function Window:AddToggle(title: string, description: string?, callback: ((boolean) -> ())?): Frame
	return Components:BuildToggle(self._scrollingFrame, title, description, callback)
end

function Window:AddButton(title: string, description: string?, buttonText: string?, callback: (() -> ())?): Frame
	return Components:BuildButton(self._scrollingFrame, title, description, buttonText or "Button", callback)
end

function Window:AddSlider(title: string, description: string?, min: number, max: number, default: number, callback: ((number) -> ())?): Frame
	return Components:BuildSlider(self._scrollingFrame, title, description, min, max, default, callback)
end

function Window:Show()
	if self._gui then self._gui.Enabled = true end
end

function Window:Hide()
	if self._gui then self._gui.Enabled = false end
end

function Window:Destroy()
	if self._gui then self._gui:Destroy() end
end

-- // Library Export
local Library = {}
Library._version = "1.0.1"

function Library:CreateWindow(title: string, description: string?, options: table?): table
	return Window.new(title, description, options)
end

function Library:SetTheme(newTheme: table)
	for key, value in pairs(newTheme or {}) do
		if type(value) == "table" and THEME[key] then
			for k, v in pairs(value) do
				THEME[key][k] = v
			end
		elseif THEME[key] then
			THEME[key] = value
		end
	end
end

return Library
