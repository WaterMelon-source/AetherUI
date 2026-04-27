local G2L = {};

-- StarterGui.AetherUI
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["Name"] = [[AetherUI]];
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
G2L["1"]["ResetOnSpawn"] = false;
G2L["1"]["DisplayOrder"] = 100;


-- StarterGui.AetherUI.Window
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["ZIndex"] = 10;
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
G2L["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["2"]["Size"] = UDim2.new(0.48, 0, 0.5, 0);
G2L["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["2"]["Name"] = [[Window]];
G2L["2"]["BackgroundTransparency"] = 0.1;


-- StarterGui.AetherUI.Window.UICorner
G2L["3"] = Instance.new("UICorner", G2L["2"]);
G2L["3"]["CornerRadius"] = UDim.new(0.03, 0);


-- StarterGui.AetherUI.Window.Side
G2L["4"] = Instance.new("Frame", G2L["2"]);
G2L["4"]["ZIndex"] = 10;
G2L["4"]["BorderSizePixel"] = 0;
G2L["4"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
G2L["4"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["4"]["Size"] = UDim2.new(0.25, 0, 0.95, 0);
G2L["4"]["Position"] = UDim2.new(0.14, 0, 0.5, 0);
G2L["4"]["Name"] = [[Side]];
G2L["4"]["BackgroundTransparency"] = 0.25;


-- StarterGui.AetherUI.Window.Side.UICorner
G2L["5"] = Instance.new("UICorner", G2L["4"]);
G2L["5"]["CornerRadius"] = UDim.new(0.05, 0);


-- StarterGui.AetherUI.Window.Side.UIStroke
G2L["6"] = Instance.new("UIStroke", G2L["4"]);
G2L["6"]["Color"] = Color3.fromRGB(51, 51, 51);
G2L["6"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;


-- StarterGui.AetherUI.Window.Side.Decor
G2L["7"] = Instance.new("Frame", G2L["4"]);
G2L["7"]["ZIndex"] = 2;
G2L["7"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["7"]["Size"] = UDim2.new(0.2, 0, 0.028, 0);
G2L["7"]["Position"] = UDim2.new(0.18, 0, 0.04, 0);
G2L["7"]["Name"] = [[Decor]];
G2L["7"]["BackgroundTransparency"] = 1;


-- StarterGui.AetherUI.Window.Side.Decor.Red
G2L["8"] = Instance.new("Frame", G2L["7"]);
G2L["8"]["BorderSizePixel"] = 0;
G2L["8"]["BackgroundColor3"] = Color3.fromRGB(255, 96, 88);
G2L["8"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["8"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["8"]["Position"] = UDim2.new(0, 0, 0.5, 0);
G2L["8"]["Name"] = [[Red]];


-- StarterGui.AetherUI.Window.Side.Decor.Red.UICorner
G2L["9"] = Instance.new("UICorner", G2L["8"]);
G2L["9"]["CornerRadius"] = UDim.new(1, 0);


-- StarterGui.AetherUI.Window.Side.Decor.Red.UIAspectRatioConstraint
G2L["a"] = Instance.new("UIAspectRatioConstraint", G2L["8"]);



-- StarterGui.AetherUI.Window.Side.Decor.Yellow
G2L["b"] = Instance.new("Frame", G2L["7"]);
G2L["b"]["BorderSizePixel"] = 0;
G2L["b"]["BackgroundColor3"] = Color3.fromRGB(255, 190, 47);
G2L["b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["b"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["b"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["b"]["Name"] = [[Yellow]];


-- StarterGui.AetherUI.Window.Side.Decor.Yellow.UICorner
G2L["c"] = Instance.new("UICorner", G2L["b"]);
G2L["c"]["CornerRadius"] = UDim.new(1, 0);


-- StarterGui.AetherUI.Window.Side.Decor.Yellow.UIAspectRatioConstraint
G2L["d"] = Instance.new("UIAspectRatioConstraint", G2L["b"]);



-- StarterGui.AetherUI.Window.Side.Decor.Green
G2L["e"] = Instance.new("Frame", G2L["7"]);
G2L["e"]["BorderSizePixel"] = 0;
G2L["e"]["BackgroundColor3"] = Color3.fromRGB(40, 202, 64);
G2L["e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["e"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["e"]["Position"] = UDim2.new(1, 0, 0.5, 0);
G2L["e"]["Name"] = [[Green]];


-- StarterGui.AetherUI.Window.Side.Decor.Green.UICorner
G2L["f"] = Instance.new("UICorner", G2L["e"]);
G2L["f"]["CornerRadius"] = UDim.new(1, 0);


-- StarterGui.AetherUI.Window.Side.Decor.Green.UIAspectRatioConstraint
G2L["10"] = Instance.new("UIAspectRatioConstraint", G2L["e"]);



-- StarterGui.AetherUI.Window.Side.Tabs
G2L["11"] = Instance.new("Frame", G2L["4"]);
G2L["11"]["ZIndex"] = 11;
G2L["11"]["BorderSizePixel"] = 0;
G2L["11"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 26);
G2L["11"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["11"]["Size"] = UDim2.new(0.9, 0, 0.9, 0);
G2L["11"]["Position"] = UDim2.new(0.5, 0, 0.53, 0);
G2L["11"]["Name"] = [[Tabs]];
G2L["11"]["BackgroundTransparency"] = 1;


-- StarterGui.AetherUI.Window.Side.Tabs.UICorner
G2L["12"] = Instance.new("UICorner", G2L["11"]);
G2L["12"]["CornerRadius"] = UDim.new(0, 10);


-- StarterGui.AetherUI.Window.Side.Tabs.UIListLayout
G2L["13"] = Instance.new("UIListLayout", G2L["11"]);
G2L["13"]["Padding"] = UDim.new(0, 10);
G2L["13"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.AetherUI.Window.Side.Tabs.Category
G2L["14"] = Instance.new("TextLabel", G2L["11"]);
G2L["14"]["TextWrapped"] = true;
G2L["14"]["TextSize"] = 12;
G2L["14"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["14"]["TextScaled"] = true;
G2L["14"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["14"]["TextColor3"] = Color3.fromRGB(151, 151, 151);
G2L["14"]["BackgroundTransparency"] = 1;
G2L["14"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["14"]["Size"] = UDim2.new(1, 0, 0.035, 0);
G2L["14"]["Text"] = [[Category]];
G2L["14"]["Name"] = [[Category]];
G2L["14"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.AetherUI.Window.Side.Tabs.UIPadding
G2L["15"] = Instance.new("UIPadding", G2L["11"]);
G2L["15"]["PaddingTop"] = UDim.new(0, 10);
G2L["15"]["PaddingRight"] = UDim.new(0, 5);
G2L["15"]["PaddingLeft"] = UDim.new(0, 5);
G2L["15"]["PaddingBottom"] = UDim.new(0, 10);


-- StarterGui.AetherUI.Window.Side.Tabs.Tab
G2L["16"] = Instance.new("Frame", G2L["11"]);
G2L["16"]["BorderSizePixel"] = 0;
G2L["16"]["BackgroundColor3"] = Color3.fromRGB(56, 56, 56);
G2L["16"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["16"]["Size"] = UDim2.new(1, 0, 0.075, 0);
G2L["16"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["16"]["Name"] = [[Tab]];
G2L["16"]["Visible"] = false; -- Hide template


-- StarterGui.AetherUI.Window.Side.Tabs.Tab.Button
G2L["17"] = Instance.new("TextButton", G2L["16"]);
G2L["17"]["BorderSizePixel"] = 0;
G2L["17"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["17"]["TextSize"] = 12;
G2L["17"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["17"]["BackgroundColor3"] = Color3.fromRGB(56, 56, 56);
G2L["17"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["17"]["ZIndex"] = 5;
G2L["17"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["17"]["BackgroundTransparency"] = 1;
G2L["17"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["17"]["Text"] = [[]];
G2L["17"]["Name"] = [[Button]];
G2L["17"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.AetherUI.Window.Side.Tabs.Tab.Title
G2L["18"] = Instance.new("TextLabel", G2L["16"]);
G2L["18"]["TextWrapped"] = true;
G2L["18"]["TextSize"] = 12;
G2L["18"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["18"]["TextScaled"] = true;
G2L["18"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
G2L["18"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["18"]["BackgroundTransparency"] = 1;
G2L["18"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["18"]["Size"] = UDim2.new(0.55, 0, 0.55, 0);
G2L["18"]["Text"] = [[Tab Example]];
G2L["18"]["Name"] = [[Title]];
G2L["18"]["Position"] = UDim2.new(0.49, 0, 0.5, 0);


-- StarterGui.AetherUI.Window.Side.Tabs.Tab.Icon
G2L["19"] = Instance.new("ImageLabel", G2L["16"]);
G2L["19"]["BorderSizePixel"] = 0;
G2L["19"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["19"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["19"]["Image"] = [[rbxassetid://16884179038]];
G2L["19"]["ImageRectSize"] = Vector2.new(108, 108);
G2L["19"]["Size"] = UDim2.new(0.65, 0, 0.65, 0);
G2L["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["19"]["BackgroundTransparency"] = 1;
G2L["19"]["ImageRectOffset"] = Vector2.new(578, 330);
G2L["19"]["Name"] = [[Icon]];
G2L["19"]["Position"] = UDim2.new(0.12, 0, 0.5, 0);


-- StarterGui.AetherUI.Window.Side.Tabs.Tab.Icon.UIAspectRatioConstraint
G2L["1a"] = Instance.new("UIAspectRatioConstraint", G2L["19"]);



-- StarterGui.AetherUI.Window.Side.Tabs.Tab.UICorner
G2L["1b"] = Instance.new("UICorner", G2L["16"]);
G2L["1b"]["CornerRadius"] = UDim.new(0.3, 0);


-- StarterGui.AetherUI.Window.Main
G2L["1c"] = Instance.new("Frame", G2L["2"]);
G2L["1c"]["ZIndex"] = 10;
G2L["1c"]["BorderSizePixel"] = 0;
G2L["1c"]["BackgroundColor3"] = Color3.fromRGB(187, 187, 187);
G2L["1c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["1c"]["Size"] = UDim2.new(0.70556, 0, 0.95119, 0);
G2L["1c"]["Position"] = UDim2.new(0.63137, 0, 0.4994, 0);
G2L["1c"]["Name"] = [[Main]];
G2L["1c"]["BackgroundTransparency"] = 1;


-- StarterGui.AetherUI.Window.Main.UICorner
G2L["1d"] = Instance.new("UICorner", G2L["1c"]);
G2L["1d"]["CornerRadius"] = UDim.new(0.01, 25);


-- StarterGui.AetherUI.Window.Main.Labels
G2L["1e"] = Instance.new("Frame", G2L["1c"]);
G2L["1e"]["ZIndex"] = 2;
G2L["1e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["1e"]["Size"] = UDim2.new(0.9, 0, 0.075, 0);
G2L["1e"]["Position"] = UDim2.new(0.5, 0, 0.05, 0);
G2L["1e"]["Name"] = [[Labels]];
G2L["1e"]["BackgroundTransparency"] = 1;


-- StarterGui.AetherUI.Window.Main.Labels.1Title
G2L["1f"] = Instance.new("TextLabel", G2L["1e"]);
G2L["1f"]["TextWrapped"] = true;
G2L["1f"]["ZIndex"] = 2;
G2L["1f"]["TextSize"] = 14;
G2L["1f"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["1f"]["TextScaled"] = true;
G2L["1f"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["1f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1f"]["BackgroundTransparency"] = 1;
G2L["1f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["1f"]["Size"] = UDim2.new(1, 0, 0.4, 0);
G2L["1f"]["Text"] = [[Example]];
G2L["1f"]["Name"] = [[1Title]];
G2L["1f"]["Position"] = UDim2.new(0.5, 0, 0.25, 0);


-- StarterGui.AetherUI.Window.Main.Labels.UIListLayout
G2L["20"] = Instance.new("UIListLayout", G2L["1e"]);
G2L["20"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["20"]["Padding"] = UDim.new(0.1, 0);
G2L["20"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
G2L["20"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["20"]["ItemLineAlignment"] = Enum.ItemLineAlignment.Start;


-- StarterGui.AetherUI.Window.Main.Labels.2Description
G2L["21"] = Instance.new("TextLabel", G2L["1e"]);
G2L["21"]["TextWrapped"] = true;
G2L["21"]["ZIndex"] = 2;
G2L["21"]["TextSize"] = 10;
G2L["21"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["21"]["TextScaled"] = true;
G2L["21"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["21"]["TextColor3"] = Color3.fromRGB(151, 151, 151);
G2L["21"]["BackgroundTransparency"] = 1;
G2L["21"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["21"]["Size"] = UDim2.new(0.2961, 0, 0.3, 0);
G2L["21"]["Text"] = [[Lorem ipsum dolor sit amet]];
G2L["21"]["Name"] = [[2Description]];
G2L["21"]["Position"] = UDim2.new(0.14805, 0, 0.9, 0);


-- StarterGui.AetherUI.Window.Main.ScrollingFrame
G2L["22"] = Instance.new("ScrollingFrame", G2L["1c"]);
G2L["22"]["BorderSizePixel"] = 0;
G2L["22"]["CanvasSize"] = UDim2.new(0, 0, 0, 500);
G2L["22"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["22"]["Size"] = UDim2.new(0.97246, 0, 0.86448, 0);
G2L["22"]["ScrollBarImageColor3"] = Color3.fromRGB(61, 61, 61);
G2L["22"]["Position"] = UDim2.new(0.53623, 0, 0.54276, 0);
G2L["22"]["ScrollBarThickness"] = 4;
G2L["22"]["BackgroundTransparency"] = 1;
G2L["22"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
G2L["22"]["ScrollingDirection"] = Enum.ScrollingDirection.Y;


-- StarterGui.AetherUI.Window.Main.ScrollingFrame.UIListLayout
G2L["23"] = Instance.new("UIListLayout", G2L["22"]);
G2L["23"]["Padding"] = UDim.new(0.02, 0);
G2L["23"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.AetherUI.Window.Main.ScrollingFrame.UIAspectRatioConstraint
G2L["24"] = Instance.new("UIAspectRatioConstraint", G2L["22"]);
G2L["24"]["AspectRatio"] = 1.23;


-- StarterGui.AetherUI.Window.Main.ScrollingFrame.UIPadding
G2L["25"] = Instance.new("UIPadding", G2L["22"]);
G2L["25"]["PaddingTop"] = UDim.new(0.025, 0);
G2L["25"]["PaddingRight"] = UDim.new(0.05, 0);
G2L["25"]["PaddingBottom"] = UDim.new(0.1, 0);


-- ============= TEMPLATES (Hidden for cloning) =============
local function createTemplate(name, parent)
    local obj = parent:WaitForChild(name)
    local clone = obj:Clone()
    clone.Parent = nil
    clone.Visible = false
    obj.Visible = false -- Hide original
    return clone
end

-- Template elements for cloning
local TEMPLATES = {}
local SCROLL = G2L["1c"]:WaitForChild("ScrollingFrame")

TEMPLATES.Label = createTemplate("Label", SCROLL)
TEMPLATES.Button = createTemplate("Button", SCROLL)
TEMPLATES.Slider = createTemplate("Slider", SCROLL)
TEMPLATES.Toggle = createTemplate("Toggle", SCROLL)
TEMPLATES.Dropdown = createTemplate("Dropdown", SCROLL)
TEMPLATES.Tab = G2L["11"]:WaitForChild("Tab") -- Keep reference, already hidden


-- ============= LIBRARY CODE =============
local Library = {}
Library.__index = Library

local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")

-- Drag System
local function setupDrag(window, dragFrame)
    local dragging, startMouse, startPos
    
    dragFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            startMouse = input.Position
            startPos = window.Position
            input.Changed:Connect(function(prop)
                if prop == "UserInputState" and input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    UIS.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - startMouse
            window.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
end

-- Tab Class
local Tab = {}
Tab.__index = Tab

function Tab:AddLabel(config)
    config = config or {}
    local el = TEMPLATES.Label:Clone()
    el.Parent = self._container
    el.Visible = true
    if config.Name then el.Name = config.Name end
    
    local frame = el:WaitForChild("Frame")
    frame:WaitForChild("Title").Text = config.Title or "Label"
    frame:WaitForChild("2Description").Text = config.Description or ""
    return el
end

function Tab:AddButton(config)
    config = config or {}
    local el = TEMPLATES.Button:Clone()
    el.Parent = self._container
    el.Visible = true
    if config.Name then el.Name = config.Name end
    
    local frame = el:WaitForChild("Frame")
    frame:WaitForChild("1Title").Text = config.Title or "Button"
    frame:WaitForChild("2Description").Text = config.Description or ""
    local btn = el:WaitForChild("Button")
    btn:WaitForChild("Text").Text = config.Text or "Click"
    
    if config.Callback then
        btn.MouseButton1Click:Connect(config.Callback)
    end
    return el
end

function Tab:AddSlider(config)
    config = config or {}
    local el = TEMPLATES.Slider:Clone()
    el.Parent = self._container
    el.Visible = true
    if config.Name then el.Name = config.Name end
    
    local frame = el:WaitForChild("Frame")
    frame:WaitForChild("1Title").Text = config.Title or "Slider"
    frame:WaitForChild("2Description").Text = config.Description or ""
    
    local bar = el:WaitForChild("Slider")
    local valueFill = bar:WaitForChild("Value")
    local circle = bar:WaitForChild("Circle")
    
    local min, max = config.Min or 0, config.Max or 100
    local rounding = config.Rounding or 1
    local value = config.Default or min
    
    local function round(num)
        if rounding <= 0 then return num end
        local mult = 10^rounding
        return math.floor(num * mult + 0.5) / mult
    end
    
    local function update(newVal)
        value = math.clamp(round(newVal), min, max)
        local pct = (value - min) / (max - min)
        valueFill.Size = UDim2.new(pct, 0, 1, 0)
        circle.Position = UDim2.new(pct, 0, 0.5, 0)
        if config.Callback then config.Callback(value) end
    end
    
    update(value)
    
    local dragging = false
    local function handleInput(pos)
        local absPos, absSize = bar.AbsolutePosition, bar.AbsoluteSize
        local pct = math.clamp((pos.X - absPos.X) / absSize.X, 0, 1)
        update(min + pct * (max - min))
    end
    
    bar.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            handleInput(inp.Position)
        end
    end)
    
    bar.InputEnded:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
    end)
    
    UIS.InputChanged:Connect(function(inp)
        if dragging and inp.UserInputType == Enum.UserInputType.MouseMovement then
            handleInput(inp.Position)
        end
    end)
    
    return {
        Element = el,
        SetValue = update,
        GetValue = function() return value end
    }
end

function Tab:AddToggle(config)
    config = config or {}
    local el = TEMPLATES.Toggle:Clone()
    el.Parent = self._container
    el.Visible = true
    if config.Name then el.Name = config.Name end
    
    local frame = el:WaitForChild("Frame")
    frame:WaitForChild("1Title").Text = config.Title or "Toggle"
    frame:WaitForChild("2Description").Text = config.Description or ""
    
    local switch = el:WaitForChild("Switch")
    local circle = switch:WaitForChild("Circle")
    
    local state = config.Default or false
    local onColor = config.OnColor or Color3.fromRGB(0, 150, 255)
    
    local function update()
        circle.Position = UDim2.new(state and 0.75 or 0.25, 0, 0.5, 0)
        switch.BackgroundColor3 = state and onColor or Color3.fromRGB(36, 36, 36)
        if config.Callback then config.Callback(state) end
    end
    update()
    
    switch.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then
            state = not state
            update()
        end
    end)
    
    return {
        Element = el,
        SetValue = function(v) state = v; update() end,
        GetValue = function() return state end
    }
end

function Tab:AddDropdown(config)
    config = config or {}
    local el = TEMPLATES.Dropdown:Clone()
    el.Parent = self._container
    el.Visible = true
    if config.Name then el.Name = config.Name end
    
    local frame = el:WaitForChild("Frame")
    frame:WaitForChild("1Title").Text = config.Title or "Dropdown"
    frame:WaitForChild("2Description").Text = config.Description or ""
    
    local btn = el:WaitForChild("Button")
    local btnText = btn:WaitForChild("Text")
    local scroll = btn:WaitForChild("ScrollingFrame")
    local listLayout = scroll:WaitForChild("UIListLayout")
    
    btnText.Text = config.Placeholder or "Select..."
    local options = config.Options or {}
    local selected = config.Default
    
    -- Create option buttons from template
    local optTemplate = scroll:WaitForChild("Button")
    optTemplate.Visible = false
    
    for _, optName in ipairs(options) do
        local optBtn = optTemplate:Clone()
        optBtn.Parent = scroll
        optBtn.Visible = true
        optBtn:WaitForChild("Text").Text = optName
        optBtn.MouseButton1Click:Connect(function()
            selected = optName
            btnText.Text = optName
            scroll.Visible = false
            btn.Size = UDim2.new(0.23027, 0, 0.7, 0)
            if config.Callback then config.Callback(optName) end
        end)
    end
    scroll.Visible = false
    
    btn.MouseButton1Click:Connect(function()
        local expanded = not scroll.Visible
        scroll.Visible = expanded
        btn.Size = expanded and UDim2.new(0.23027, 0, 0.7 * math.min(#options, 5), 0) or UDim2.new(0.23027, 0, 0.7, 0)
    end)
    
    return {
        Element = el,
        SetValue = function(v) 
            selected = v
            btnText.Text = v
            if config.Callback then config.Callback(v) end
        end,
        GetValue = function() return selected end
    }
end

-- Main Library
function Library.new()
    local self = setmetatable({}, Library)
    
    self._window = G2L["2"]
    self._side = G2L["4"]
    self._tabsContainer = G2L["11"]
    self._main = G2L["1c"]
    self._scroll = self._main:WaitForChild("ScrollingFrame")
    self._tabs = {}
    
    -- Setup drag
    setupDrag(self._window, self._window:WaitForChild("Drag"))
    
    return self
end

function Library:AddTab(name, icon)
    local tabBtn = TEMPLATES.Tab:Clone()
    tabBtn.Parent = self._tabsContainer
    tabBtn.Visible = true
    
    local title = tabBtn:WaitForChild("Title")
    local iconLabel = tabBtn:WaitForChild("Icon")
    local clickBtn = tabBtn:WaitForChild("Button")
    
    title.Text = name or "Tab"
    if icon then iconLabel.Image = icon end
    
    -- Create content container for this tab
    local content = Instance.new("Frame")
    content.Name = "Content_"..name
    content.BackgroundTransparency = 1
    content.Size = UDim2.new(1, 0, 1, 0)
    content.Parent = self._scroll
    content.Visible = false
    
    local layout = Instance.new("UIListLayout", content)
    layout.Padding = UDim.new(0.02, 0)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    
    local tabObj = setmetatable({
        _container = content,
        _button = tabBtn
    }, Tab)
    
    -- Tab switching
    clickBtn.MouseButton1Click:Connect(function()
        for _, t in ipairs(self._tabs) do
            t._container.Visible = false
        end
        content.Visible = true
    end)
    
    table.insert(self._tabs, tabObj)
    
    -- Auto-select first tab
    if #self._tabs == 1 then
        content.Visible = true
    end
    
    return tabObj
end

function Library:SetTitle(title)
    local labels = self._main:WaitForChild("Labels")
    labels:WaitForChild("1Title").Text = title or "AetherUI"
end

function Library:SetDescription(desc)
    local labels = self._main:WaitForChild("Labels")
    labels:WaitForChild("2Description").Text = desc or ""
end

function Library:Destroy()
    G2L["1"]:Destroy()
end

function Library:Show()
    G2L["1"].Enabled = true
end

function Library:Hide()
    G2L["1"].Enabled = false
end

-- Return constructor
return function()
    return Library.new()
end
