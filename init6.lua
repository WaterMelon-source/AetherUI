local G2L = {};

-- StarterGui.AetherUI
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["Name"] = [[AetherUI]];
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

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
G2L["22"]["BackgroundTransparency"] = 1; -- ✅ ALWAYS 1

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

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Label
G2L["26"] = Instance.new("Frame", G2L["22"]);
G2L["26"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["26"]["Size"] = UDim2.new(0.34036, 0, 1, 0);
G2L["26"]["Position"] = UDim2.new(0.17018, 0, 0.5, 0);
G2L["26"]["Name"] = [[Label]];
G2L["26"]["BackgroundTransparency"] = 1;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Label.UIListLayout
G2L["27"] = Instance.new("UIListLayout", G2L["26"]);
G2L["27"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["27"]["Padding"] = UDim.new(0.01, 0);
G2L["27"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
G2L["27"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["27"]["ItemLineAlignment"] = Enum.ItemLineAlignment.Start;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Label.Title
G2L["28"] = Instance.new("TextLabel", G2L["26"]);
G2L["28"]["TextWrapped"] = true;
G2L["28"]["TextSize"] = 14;
G2L["28"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["28"]["TextScaled"] = true;
G2L["28"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["28"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["28"]["BackgroundTransparency"] = 1;
G2L["28"]["Size"] = UDim2.new(1, 0, 0.5, 0);
G2L["28"]["Text"] = [[Example]];
G2L["28"]["Name"] = [[Title]];

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Label.UIAspectRatioConstraint
G2L["29"] = Instance.new("UIAspectRatioConstraint", G2L["26"]);
G2L["29"]["AspectRatio"] = 4;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Button
G2L["2a"] = Instance.new("Frame", G2L["22"]);
G2L["2a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["2a"]["Size"] = UDim2.new(1, 0, 0.1, 0);
G2L["2a"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["2a"]["Name"] = [[Button]];
G2L["2a"]["BackgroundTransparency"] = 1;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Button.Frame
G2L["2b"] = Instance.new("Frame", G2L["2a"]);
G2L["2b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["2b"]["Size"] = UDim2.new(0.34036, 0, 1, 0);
G2L["2b"]["Position"] = UDim2.new(0.17018, 0, 0.5, 0);
G2L["2b"]["BackgroundTransparency"] = 1;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Button.Frame.UIListLayout
G2L["2c"] = Instance.new("UIListLayout", G2L["2b"]);
G2L["2c"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["2c"]["Padding"] = UDim.new(0.01, 0);
G2L["2c"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
G2L["2c"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["2c"]["ItemLineAlignment"] = Enum.ItemLineAlignment.Start;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Button.Frame.1Title
G2L["2d"] = Instance.new("TextLabel", G2L["2b"]);
G2L["2d"]["TextWrapped"] = true;
G2L["2d"]["TextSize"] = 14;
G2L["2d"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["2d"]["TextScaled"] = true;
G2L["2d"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["2d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2d"]["BackgroundTransparency"] = 1;
G2L["2d"]["Size"] = UDim2.new(1, 0, 0.32, 0);
G2L["2d"]["Text"] = [[Example]];
G2L["2d"]["Name"] = [[1Title]];

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Button.Frame.2Description
G2L["2e"] = Instance.new("TextLabel", G2L["2b"]);
G2L["2e"]["TextWrapped"] = true;
G2L["2e"]["TextSize"] = 12;
G2L["2e"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["2e"]["TextScaled"] = true;
G2L["2e"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["2e"]["TextColor3"] = Color3.fromRGB(151, 151, 151);
G2L["2e"]["BackgroundTransparency"] = 1;
G2L["2e"]["Size"] = UDim2.new(1, 0, 0.3, 0);
G2L["2e"]["Text"] = [[Lorem ipsum dolor sit amet]];
G2L["2e"]["Name"] = [[2Description]];
G2L["2e"]["Position"] = UDim2.new(0, 0, 0, 20);

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Button.Frame.UIAspectRatioConstraint
G2L["2f"] = Instance.new("UIAspectRatioConstraint", G2L["2b"]);
G2L["2f"]["AspectRatio"] = 4;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Button.Button
G2L["30"] = Instance.new("TextButton", G2L["2a"]);
G2L["30"]["TextWrapped"] = true;
G2L["30"]["BorderSizePixel"] = 0;
G2L["30"]["TextSize"] = 12;
G2L["30"]["AutoButtonColor"] = false;
G2L["30"]["TextScaled"] = true;
G2L["30"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["30"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
G2L["30"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["30"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["30"]["Size"] = UDim2.new(0.12, 0, 0.7, 0);
G2L["30"]["Text"] = [[]];
G2L["30"]["Name"] = [[Button]];
G2L["30"]["Position"] = UDim2.new(0.9, 0, 0.5, 0);

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Button.Button.UICorner
G2L["31"] = Instance.new("UICorner", G2L["30"]);
G2L["31"]["CornerRadius"] = UDim.new(0, 4);

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Button.Button.Text
G2L["32"] = Instance.new("TextLabel", G2L["30"]);
G2L["32"]["TextWrapped"] = true;
G2L["32"]["TextSize"] = 12;
G2L["32"]["TextScaled"] = true;
G2L["32"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["32"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["32"]["BackgroundTransparency"] = 1;
G2L["32"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["32"]["Size"] = UDim2.new(0.8, 0, 0.8, 0);
G2L["32"]["Text"] = [[Button]];
G2L["32"]["Name"] = [[Text]];
G2L["32"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Button.Button.UIStroke
G2L["33"] = Instance.new("UIStroke", G2L["30"]);
G2L["33"]["Thickness"] = 1.6;
G2L["33"]["Color"] = Color3.fromRGB(51, 51, 51);
G2L["33"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Button.Button.UIAspectRatioConstraint
G2L["34"] = Instance.new("UIAspectRatioConstraint", G2L["30"]);
G2L["34"]["AspectRatio"] = 1.8;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Button.UIAspectRatioConstraint
G2L["35"] = Instance.new("UIAspectRatioConstraint", G2L["2a"]);
G2L["35"]["AspectRatio"] = 11;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Slider
G2L["36"] = Instance.new("Frame", G2L["22"]);
G2L["36"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["36"]["Size"] = UDim2.new(1, 0, 0.1, 0);
G2L["36"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["36"]["Name"] = [[Slider]];
G2L["36"]["BackgroundTransparency"] = 1;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Slider.Slider
G2L["37"] = Instance.new("Frame", G2L["36"]);
G2L["37"]["BorderSizePixel"] = 0;
G2L["37"]["BackgroundColor3"] = Color3.fromRGB(61, 61, 61);
G2L["37"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["37"]["Size"] = UDim2.new(0.1754, 0, 0.1, 0);
G2L["37"]["Position"] = UDim2.new(0.9, 0, 0.5, 0);
G2L["37"]["Name"] = [[Slider]];

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Slider.Slider.UICorner
G2L["38"] = Instance.new("UICorner", G2L["37"]);
G2L["38"]["CornerRadius"] = UDim.new(1, 0);

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Slider.Slider.Value
G2L["39"] = Instance.new("Frame", G2L["37"]);
G2L["39"]["BorderSizePixel"] = 0;
G2L["39"]["BackgroundColor3"] = Color3.fromRGB(0, 123, 255);
G2L["39"]["Size"] = UDim2.new(0, 0, 1, 0);
G2L["39"]["Name"] = [[Value]];

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Slider.Slider.Value.UICorner
G2L["3a"] = Instance.new("UICorner", G2L["39"]);
G2L["3a"]["CornerRadius"] = UDim.new(1, 0);

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Slider.Slider.Circle
G2L["3b"] = Instance.new("Frame", G2L["37"]);
G2L["3b"]["BorderSizePixel"] = 0;
G2L["3b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3b"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["3b"]["Size"] = UDim2.new(2.5, 0, 2.5, 0);
G2L["3b"]["Position"] = UDim2.new(0, 0, 0.5, 0);
G2L["3b"]["Name"] = [[Circle]];

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Slider.Slider.Circle.UICorner
G2L["3c"] = Instance.new("UICorner", G2L["3b"]);
G2L["3c"]["CornerRadius"] = UDim.new(1, 0);

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Slider.Slider.Circle.UIAspectRatioConstraint
G2L["3d"] = Instance.new("UIAspectRatioConstraint", G2L["3b"]);

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Slider.Slider.UIStroke
G2L["3e"] = Instance.new("UIStroke", G2L["37"]);
G2L["3e"]["Thickness"] = 1.6;
G2L["3e"]["Color"] = Color3.fromRGB(51, 51, 51);
G2L["3e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Slider.Slider.UIAspectRatioConstraint
G2L["3f"] = Instance.new("UIAspectRatioConstraint", G2L["37"]);
G2L["3f"]["AspectRatio"] = 16;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Slider.Frame
G2L["40"] = Instance.new("Frame", G2L["36"]);
G2L["40"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["40"]["Size"] = UDim2.new(0.34036, 0, 1, 0);
G2L["40"]["Position"] = UDim2.new(0.17018, 0, 0.5, 0);
G2L["40"]["BackgroundTransparency"] = 1;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Slider.Frame.UIListLayout
G2L["41"] = Instance.new("UIListLayout", G2L["40"]);
G2L["41"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["41"]["Padding"] = UDim.new(0.01, 0);
G2L["41"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
G2L["41"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["41"]["ItemLineAlignment"] = Enum.ItemLineAlignment.Start;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Slider.Frame.UIAspectRatioConstraint
G2L["42"] = Instance.new("UIAspectRatioConstraint", G2L["40"]);
G2L["42"]["AspectRatio"] = 4;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Slider.Frame.1Title
G2L["43"] = Instance.new("TextLabel", G2L["40"]);
G2L["43"]["TextWrapped"] = true;
G2L["43"]["TextSize"] = 14;
G2L["43"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["43"]["TextScaled"] = true;
G2L["43"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["43"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["43"]["BackgroundTransparency"] = 1;
G2L["43"]["Size"] = UDim2.new(1, 0, 0.32, 0);
G2L["43"]["Text"] = [[Example]];
G2L["43"]["Name"] = [[1Title]];

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Slider.Frame.2Description
G2L["44"] = Instance.new("TextLabel", G2L["40"]);
G2L["44"]["TextWrapped"] = true;
G2L["44"]["TextSize"] = 12;
G2L["44"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["44"]["TextScaled"] = true;
G2L["44"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["44"]["TextColor3"] = Color3.fromRGB(151, 151, 151);
G2L["44"]["BackgroundTransparency"] = 1;
G2L["44"]["Size"] = UDim2.new(1, 0, 0.3, 0);
G2L["44"]["Text"] = [[Lorem ipsum dolor sit amet]];
G2L["44"]["Name"] = [[2Description]];
G2L["44"]["Position"] = UDim2.new(0, 0, 0, 20);

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Slider.UIAspectRatioConstraint
G2L["45"] = Instance.new("UIAspectRatioConstraint", G2L["36"]);
G2L["45"]["AspectRatio"] = 11;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Toggle
G2L["46"] = Instance.new("Frame", G2L["22"]);
G2L["46"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["46"]["Size"] = UDim2.new(1, 0, 0.1, 0);
G2L["46"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["46"]["Name"] = [[Toggle]];
G2L["46"]["BackgroundTransparency"] = 1;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Toggle.Switch
G2L["47"] = Instance.new("Frame", G2L["46"]);
G2L["47"]["BorderSizePixel"] = 0;
G2L["47"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
G2L["47"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["47"]["Size"] = UDim2.new(0.085, 0, 0.5, 0);
G2L["47"]["Position"] = UDim2.new(0.9, 0, 0.5, 0);
G2L["47"]["Name"] = [[Switch]];

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Toggle.Switch.UICorner
G2L["48"] = Instance.new("UICorner", G2L["47"]);
G2L["48"]["CornerRadius"] = UDim.new(1, 0);

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Toggle.Switch.Circle
G2L["49"] = Instance.new("Frame", G2L["47"]);
G2L["49"]["BorderSizePixel"] = 0;
G2L["49"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["49"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["49"]["Size"] = UDim2.new(0.7, 0, 0.7, 0);
G2L["49"]["Position"] = UDim2.new(0.25, 0, 0.5, 0);
G2L["49"]["Name"] = [[Circle]];

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Toggle.Switch.Circle.UICorner
G2L["4a"] = Instance.new("UICorner", G2L["49"]);
G2L["4a"]["CornerRadius"] = UDim.new(1, 0);

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Toggle.Switch.Circle.UIAspectRatioConstraint
G2L["4b"] = Instance.new("UIAspectRatioConstraint", G2L["49"]);

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Toggle.Switch.UIStroke
G2L["4c"] = Instance.new("UIStroke", G2L["47"]);
G2L["4c"]["Thickness"] = 1.6;
G2L["4c"]["Color"] = Color3.fromRGB(51, 51, 51);
G2L["4c"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Toggle.Switch.UIAspectRatioConstraint
G2L["4d"] = Instance.new("UIAspectRatioConstraint", G2L["47"]);
G2L["4d"]["AspectRatio"] = 2;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Toggle.Frame
G2L["4e"] = Instance.new("Frame", G2L["46"]);
G2L["4e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["4e"]["Size"] = UDim2.new(0.34036, 0, 1, 0);
G2L["4e"]["Position"] = UDim2.new(0.17018, 0, 0.5, 0);
G2L["4e"]["BackgroundTransparency"] = 1;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Toggle.Frame.UIListLayout
G2L["4f"] = Instance.new("UIListLayout", G2L["4e"]);
G2L["4f"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["4f"]["Padding"] = UDim.new(0.01, 0);
G2L["4f"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
G2L["4f"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["4f"]["ItemLineAlignment"] = Enum.ItemLineAlignment.Start;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Toggle.Frame.UIAspectRatioConstraint
G2L["50"] = Instance.new("UIAspectRatioConstraint", G2L["4e"]);
G2L["50"]["AspectRatio"] = 4;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Toggle.Frame.1Title
G2L["51"] = Instance.new("TextLabel", G2L["4e"]);
G2L["51"]["TextWrapped"] = true;
G2L["51"]["TextSize"] = 14;
G2L["51"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["51"]["TextScaled"] = true;
G2L["51"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["51"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["51"]["BackgroundTransparency"] = 1;
G2L["51"]["Size"] = UDim2.new(1, 0, 0.32, 0);
G2L["51"]["Text"] = [[Example]];
G2L["51"]["Name"] = [[1Title]];

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Toggle.Frame.2Description
G2L["52"] = Instance.new("TextLabel", G2L["4e"]);
G2L["52"]["TextWrapped"] = true;
G2L["52"]["TextSize"] = 12;
G2L["52"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["52"]["TextScaled"] = true;
G2L["52"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["52"]["TextColor3"] = Color3.fromRGB(151, 151, 151);
G2L["52"]["BackgroundTransparency"] = 1;
G2L["52"]["Size"] = UDim2.new(1, 0, 0.3, 0);
G2L["52"]["Text"] = [[Lorem ipsum dolor sit amet]];
G2L["52"]["Name"] = [[2Description]];
G2L["52"]["Position"] = UDim2.new(0, 0, 0, 20);

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Toggle.UIAspectRatioConstraint
G2L["53"] = Instance.new("UIAspectRatioConstraint", G2L["46"]);
G2L["53"]["AspectRatio"] = 11;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Dropdown
G2L["54"] = Instance.new("Frame", G2L["22"]);
G2L["54"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["54"]["Size"] = UDim2.new(1, 0, 0.1, 0);
G2L["54"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["54"]["Name"] = [[Dropdown]];
G2L["54"]["BackgroundTransparency"] = 1;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Dropdown.Frame
G2L["55"] = Instance.new("Frame", G2L["54"]);
G2L["55"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["55"]["Size"] = UDim2.new(0.34036, 0, 1, 0);
G2L["55"]["Position"] = UDim2.new(0.17018, 0, 0.5, 0);
G2L["55"]["BackgroundTransparency"] = 1;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Dropdown.Frame.UIListLayout
G2L["56"] = Instance.new("UIListLayout", G2L["55"]);
G2L["56"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
G2L["56"]["Padding"] = UDim.new(0.01, 0);
G2L["56"]["VerticalAlignment"] = Enum.VerticalAlignment.Center;
G2L["56"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["56"]["ItemLineAlignment"] = Enum.ItemLineAlignment.Start;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Dropdown.Frame.1Title
G2L["57"] = Instance.new("TextLabel", G2L["55"]);
G2L["57"]["TextWrapped"] = true;
G2L["57"]["TextSize"] = 14;
G2L["57"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["57"]["TextScaled"] = true;
G2L["57"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["57"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["57"]["BackgroundTransparency"] = 1;
G2L["57"]["Size"] = UDim2.new(1, 0, 0.32, 0);
G2L["57"]["Text"] = [[Example]];
G2L["57"]["Name"] = [[1Title]];

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Dropdown.Frame.2Description
G2L["58"] = Instance.new("TextLabel", G2L["55"]);
G2L["58"]["TextWrapped"] = true;
G2L["58"]["TextSize"] = 12;
G2L["58"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["58"]["TextScaled"] = true;
G2L["58"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
G2L["58"]["TextColor3"] = Color3.fromRGB(151, 151, 151);
G2L["58"]["BackgroundTransparency"] = 1;
G2L["58"]["Size"] = UDim2.new(1, 0, 0.3, 0);
G2L["58"]["Text"] = [[Lorem ipsum dolor sit amet]];
G2L["58"]["Name"] = [[2Description]];
G2L["58"]["Position"] = UDim2.new(0, 0, 0, 20);

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Dropdown.Frame.UIAspectRatioConstraint
G2L["59"] = Instance.new("UIAspectRatioConstraint", G2L["55"]);
G2L["59"]["AspectRatio"] = 4;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Dropdown.Button
G2L["5a"] = Instance.new("TextButton", G2L["54"]);
G2L["5a"]["TextWrapped"] = true;
G2L["5a"]["BorderSizePixel"] = 0;
G2L["5a"]["TextSize"] = 12;
G2L["5a"]["AutoButtonColor"] = false;
G2L["5a"]["TextScaled"] = true;
G2L["5a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5a"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
G2L["5a"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["5a"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["5a"]["Size"] = UDim2.new(0.23027, 0, 0.7, 0);
G2L["5a"]["Text"] = [[]];
G2L["5a"]["Name"] = [[Button]];
G2L["5a"]["Position"] = UDim2.new(0.85487, 0, 0.5, 0);

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Dropdown.Button.UICorner
G2L["5b"] = Instance.new("UICorner", G2L["5a"]);
G2L["5b"]["CornerRadius"] = UDim.new(0, 4);

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Dropdown.Button.Text
G2L["5c"] = Instance.new("TextLabel", G2L["5a"]);
G2L["5c"]["TextWrapped"] = true;
G2L["5c"]["TextSize"] = 12;
G2L["5c"]["TextScaled"] = true;
G2L["5c"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["5c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5c"]["BackgroundTransparency"] = 1;
G2L["5c"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["5c"]["Size"] = UDim2.new(0.6, 0, 0.8, 0);
G2L["5c"]["Text"] = [[Hello]];
G2L["5c"]["Name"] = [[Text]];
G2L["5c"]["Position"] = UDim2.new(0.4, 0, 0.5, 0);

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Dropdown.Button.UIStroke
G2L["5d"] = Instance.new("UIStroke", G2L["5a"]);
G2L["5d"]["Thickness"] = 1.6;
G2L["5d"]["Color"] = Color3.fromRGB(51, 51, 51);
G2L["5d"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Dropdown.Button.Icon
G2L["5e"] = Instance.new("ImageLabel", G2L["5a"]);
G2L["5e"]["BorderSizePixel"] = 0;
G2L["5e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["5e"]["Image"] = [[rbxassetid://16167593004]];
G2L["5e"]["ImageRectSize"] = Vector2.new(108, 108);
G2L["5e"]["Size"] = UDim2.new(0.4, 0, 0.4, 0);
G2L["5e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5e"]["BackgroundTransparency"] = 1;
G2L["5e"]["ImageRectOffset"] = Vector2.new(798, 0);
G2L["5e"]["Name"] = [[Icon]];
G2L["5e"]["Position"] = UDim2.new(0.82, 0, 0.5, 0);

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Dropdown.Button.Icon.UIAspectRatioConstraint
G2L["5f"] = Instance.new("UIAspectRatioConstraint", G2L["5e"]);

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Dropdown.Button.UIAspectRatioConstraint
G2L["60"] = Instance.new("UIAspectRatioConstraint", G2L["5a"]);
G2L["60"]["AspectRatio"] = 3.61;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Dropdown.Button.ScrollingFrame
G2L["61"] = Instance.new("ScrollingFrame", G2L["5a"]);
G2L["61"]["BorderSizePixel"] = 0;
G2L["61"]["CanvasSize"] = UDim2.new(0, 0, 0, 500);
G2L["61"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
G2L["61"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["61"]["Size"] = UDim2.new(0.9, 0, 3.47932, 0);
G2L["61"]["ScrollBarImageColor3"] = Color3.fromRGB(61, 61, 61);
G2L["61"]["Position"] = UDim2.new(0.5, 0, 2.98966, 0);
G2L["61"]["ScrollBarThickness"] = 4;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Dropdown.Button.ScrollingFrame.UIListLayout
G2L["62"] = Instance.new("UIListLayout", G2L["61"]);
G2L["62"]["Padding"] = UDim.new(0.02, 0);
G2L["62"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Dropdown.Button.ScrollingFrame.UIStroke
G2L["63"] = Instance.new("UIStroke", G2L["61"]);
G2L["63"]["Thickness"] = 1.6;
G2L["63"]["Color"] = Color3.fromRGB(51, 51, 51);
G2L["63"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Dropdown.Button.ScrollingFrame.Button
G2L["64"] = Instance.new("TextButton", G2L["61"]);
G2L["64"]["TextWrapped"] = true;
G2L["64"]["BorderSizePixel"] = 0;
G2L["64"]["TextSize"] = 12;
G2L["64"]["AutoButtonColor"] = false;
G2L["64"]["TextScaled"] = true;
G2L["64"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["64"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
G2L["64"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["64"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["64"]["Size"] = UDim2.new(0.9, 0, 0.05, 0);
G2L["64"]["Text"] = [[]];
G2L["64"]["Name"] = [[Button]];
G2L["64"]["Position"] = UDim2.new(0.85487, 0, 0.5, 0);

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Dropdown.Button.ScrollingFrame.Button.UICorner
G2L["65"] = Instance.new("UICorner", G2L["64"]);
G2L["65"]["CornerRadius"] = UDim.new(0, 4);

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Dropdown.Button.ScrollingFrame.Button.Text
G2L["66"] = Instance.new("TextLabel", G2L["64"]);
G2L["66"]["TextWrapped"] = true;
G2L["66"]["TextSize"] = 12;
G2L["66"]["TextScaled"] = true;
G2L["66"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["66"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["66"]["BackgroundTransparency"] = 1;
G2L["66"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["66"]["Size"] = UDim2.new(0.6, 0, 0.8, 0);
G2L["66"]["Text"] = [[Example]];
G2L["66"]["Name"] = [[Text]];
G2L["66"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Dropdown.Button.ScrollingFrame.Button.UIStroke
G2L["67"] = Instance.new("UIStroke", G2L["64"]);
G2L["67"]["Thickness"] = 1.6;
G2L["67"]["Color"] = Color3.fromRGB(51, 51, 51);
G2L["67"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Dropdown.Button.ScrollingFrame.Button.UIAspectRatioConstraint
G2L["68"] = Instance.new("UIAspectRatioConstraint", G2L["64"]);
G2L["68"]["AspectRatio"] = 3.42;

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Dropdown.Button.ScrollingFrame.UIPadding
G2L["69"] = Instance.new("UIPadding", G2L["61"]);
G2L["69"]["PaddingTop"] = UDim.new(0.01, 0);
G2L["69"]["PaddingRight"] = UDim.new(0.05, 0);
G2L["69"]["PaddingLeft"] = UDim.new(0.1, 0);
G2L["69"]["PaddingBottom"] = UDim.new(0.1, 0);

-- StarterGui.AetherUI.Window.Main.ScrollingFrame.Dropdown.UIAspectRatioConstraint
G2L["6f"] = Instance.new("UIAspectRatioConstraint", G2L["54"]);
G2L["6f"]["AspectRatio"] = 11;

-- StarterGui.AetherUI.Window.UIAspectRatioConstraint
G2L["70"] = Instance.new("UIAspectRatioConstraint", G2L["2"]);
G2L["70"]["AspectRatio"] = 1.45;

-- StarterGui.AetherUI.Window.Drag
G2L["71"] = Instance.new("Frame", G2L["2"]);
G2L["71"]["ZIndex"] = 10;
G2L["71"]["BorderSizePixel"] = 0;
G2L["71"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
G2L["71"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["71"]["Size"] = UDim2.new(1.00005, 0, 0.1256, 0);
G2L["71"]["Position"] = UDim2.new(0.49997, 0, 0.06201, 0);
G2L["71"]["Name"] = [[Drag]];
G2L["71"]["BackgroundTransparency"] = 1;

-- ============================================
-- AETHERUI LIBRARY SYSTEM (FINAL FIXED VERSION)
-- ============================================

local AetherUI = {}
AetherUI.__index = AetherUI

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Internal references
local ScreenGui, Window, Main, ScrollingFrame, TabsContainer, DragFrame
local Templates = {}
local TabSystem = {Current = nil, Tabs = {}}

local function InitRefs()
    ScreenGui = G2L["1"]
    Window = G2L["2"]
    Main = G2L["1c"]
    ScrollingFrame = G2L["22"]
    TabsContainer = G2L["11"]
    DragFrame = G2L["71"]
    
    -- Template references (hide originals)
    Templates.Label = G2L["26"]
    Templates.Button = G2L["2a"]
    Templates.Slider = G2L["36"]
    Templates.Toggle = G2L["46"]
    Templates.Dropdown = G2L["54"]
    Templates.Tab = G2L["16"]
    
    for _, t in pairs(Templates) do
        if t.Parent == ScrollingFrame or t.Parent == TabsContainer then
            t.Visible = false
        end
    end
end

function AetherUI.new(cfg)
    cfg = cfg or {}
    InitRefs()
    
    local self = setmetatable({}, AetherUI)
    self._elements = {}
    
    self:_setupDrag()
    
    if cfg.Title then self:SetTitle(cfg.Title) end
    if cfg.Description then self:SetDescription(cfg.Description) end
    
    return self
end

function AetherUI:SetTitle(txt)
    local t = Main:FindFirstChild("Labels") and Main.Labels:FindFirstChild("1Title")
    if t then t.Text = tostring(txt) end
end

function AetherUI:SetDescription(txt)
    local d = Main:FindFirstChild("Labels") and Main.Labels:FindFirstChild("2Description")
    if d then d.Text = tostring(txt) end
end

function AetherUI:_setupDrag()
    local win, drag = Window, DragFrame
    local dragging, dragInput, dragStart, startPos
    
    local function update(inp)
        local delta = inp.Position - dragStart
        win.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    drag.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = inp.Position
            startPos = win.Position
            inp.Changed:Connect(function()
                if inp.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    
    drag.InputChanged:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseMovement or inp.UserInputType == Enum.UserInputType.Touch then
            dragInput = inp
        end
    end)
    
    UserInputService.InputChanged:Connect(function(inp)
        if inp == dragInput and dragging then update(inp) end
    end)
end

-- ✅ HELPER: Create content container for tab elements
local function createContentContainer()
    local container = Instance.new("Frame")
    container.BackgroundTransparency = 1
    container.Size = UDim2.new(1, 0, 1, 0)
    container.Visible = false
    
    local layout = Instance.new("UIListLayout", container)
    layout.Padding = UDim.new(0.02, 0)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    
    local padding = Instance.new("UIPadding", container)
    padding.PaddingTop = UDim.new(0.025, 0)
    padding.PaddingRight = UDim.new(0.05, 0)
    padding.PaddingBottom = UDim.new(0.1, 0)
    
    return container
end

function AetherUI:AddLabel(cfg)
    cfg = cfg or {}
    local el = Templates.Label:Clone()
    el.Visible = true
    el.Parent = ScrollingFrame
    if cfg.Title and el:FindFirstChild("Title") then el.Title.Text = tostring(cfg.Title) end
    table.insert(self._elements, el)
    return el
end

function AetherUI:AddButton(cfg)
    cfg = cfg or {}
    local el = Templates.Button:Clone()
    el.Visible = true
    el.Parent = ScrollingFrame
    
    local frame = el:WaitForChild("Frame")
    local title = frame:WaitForChild("1Title")
    local desc = frame:WaitForChild("2Description")
    local btn = el:WaitForChild("Button")
    local btnTxt = btn:WaitForChild("Text")
    
    if cfg.Title then title.Text = tostring(cfg.Title) end
    if cfg.Description then desc.Text = tostring(cfg.Description) end
    if cfg.ButtonText then btnTxt.Text = tostring(cfg.ButtonText) end
    
    if cfg.Callback then
        btn.MouseButton1Click:Connect(function() cfg.Callback() end)
    end
    
    table.insert(self._elements, el)
    return el
end

function AetherUI:AddSlider(cfg)
    cfg = cfg or {}
    local el = Templates.Slider:Clone()
    el.Visible = true
    el.Parent = ScrollingFrame
    
    local frame = el:WaitForChild("Frame")
    local title = frame:WaitForChild("1Title")
    local desc = frame:WaitForChild("2Description")
    
    -- ✅ FIXED: Correct path - Slider template has ONE "Slider" child (G2L["37"])
    local sliderBar = el:WaitForChild("Slider")
    local sliderVal = sliderBar:WaitForChild("Value")
    local sliderCircle = sliderBar:WaitForChild("Circle")
    
    if cfg.Title then title.Text = tostring(cfg.Title) end
    if cfg.Description then desc.Text = tostring(cfg.Description) end
    
    local min, max = cfg.Min or 0, cfg.Max or 100
    local rounding = cfg.Rounding or 1
    local default = cfg.Default or min
    
    local function round(n)
        local m = 10^(rounding or 0)
        return math.floor(n * m + 0.5) / m
    end
    
    local function update(val)
        val = math.clamp(val, min, max)
        val = round(val)
        local pct = (val - min) / (max - min)
        sliderVal.Size = UDim2.new(pct, 0, 1, 0)
        sliderCircle.Position = UDim2.new(pct, 0, 0.5, 0)
        if cfg.Callback then cfg.Callback(val) end
    end
    
    update(default)
    
    local dragging = false
    local function handle(inp)
        local pos = sliderBar.AbsolutePosition.x
        local size = sliderBar.AbsoluteSize.x
        local pct = math.clamp((inp.Position.x - pos) / size, 0, 1)
        update(min + (max - min) * pct)
    end
    
    sliderBar.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            handle(inp)
        end
    end)
    
    sliderBar.InputChanged:Connect(function(inp)
        if dragging and (inp.UserInputType == Enum.UserInputType.MouseMovement or inp.UserInputType == Enum.UserInputType.Touch) then
            handle(inp)
        end
    end)
    
    UserInputService.InputEnded:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    
    table.insert(self._elements, el)
    return el, update
end

function AetherUI:AddToggle(cfg)
    cfg = cfg or {}
    local el = Templates.Toggle:Clone()
    el.Visible = true
    el.Parent = ScrollingFrame
    
    local frame = el:WaitForChild("Frame")
    local title = frame:WaitForChild("1Title")
    local desc = frame:WaitForChild("2Description")
    local sw = el:WaitForChild("Switch")
    local circle = sw:WaitForChild("Circle")
    
    if cfg.Title then title.Text = tostring(cfg.Title) end
    if cfg.Description then desc.Text = tostring(cfg.Description) end
    
    local state = cfg.Default or false
    
    -- ✅ SMOOTH TOGGLE ANIMATION
    local function update(s, animate)
        state = s
        local targetPos = UDim2.new(s and 0.75 or 0.25, 0, 0.5, 0)
        local targetColor = s and Color3.fromRGB(0,123,255) or Color3.fromRGB(36,36,36)
        
        if animate ~= false then
            TweenService:Create(circle, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = targetPos}):Play()
            TweenService:Create(sw, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = targetColor}):Play()
        else
            circle.Position = targetPos
            sw.BackgroundColor3 = targetColor
        end
        
        if cfg.Callback then cfg.Callback(s) end
    end
    
    update(state, false)
    
    sw.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
            update(not state, true)
        end
    end)
    
    table.insert(self._elements, el)
    return el, function(v) if v ~= nil then update(v, true) end return state end
end

function AetherUI:AddDropdown(cfg)
    cfg = cfg or {}
    local el = Templates.Dropdown:Clone()
    el.Visible = true
    el.Parent = ScrollingFrame
    
    local frame = el:WaitForChild("Frame")
    local title = frame:WaitForChild("1Title")
    local desc = frame:WaitForChild("2Description")
    local btn = el:WaitForChild("Button")
    local btnTxt = btn:WaitForChild("Text")
    local icon = btn:WaitForChild("Icon")
    local list = btn:WaitForChild("ScrollingFrame")
    
    if cfg.Title then title.Text = tostring(cfg.Title) end
    if cfg.Description then desc.Text = tostring(cfg.Description) end
    
    local options = cfg.Options or {}
    local selected = cfg.Default or options[1] or "Select..."
    local opened = false
    
    btnTxt.Text = selected
    
    local RECT_CLOSED = Vector2.new(798, 0)
    local RECT_OPENED = Vector2.new(798, 108)
    
    local function updateIcon(open)
        icon.ImageRectOffset = open and RECT_OPENED or RECT_CLOSED
    end
    
    -- ✅ DROPDOWN STARTS CLOSED
    list.Visible = false
    updateIcon(false)
    btn.Size = UDim2.new(0.23027, 0, 0.7, 0)
    
    local optTpl = list:WaitForChild("Button")
    optTpl.Visible = false
    
    for _, opt in ipairs(options) do
        local ob = optTpl:Clone()
        ob.Visible = true
        ob.Parent = list
        ob:WaitForChild("Text").Text = tostring(opt)
        ob.MouseButton1Click:Connect(function()
            selected = opt
            btnTxt.Text = opt
            opened = false
            updateIcon(false)
            list.Visible = false
            btn.Size = UDim2.new(0.23027, 0, 0.7, 0)
            if cfg.Callback then cfg.Callback(opt) end
        end)
    end
    
    btn.MouseButton1Click:Connect(function()
        opened = not opened
        updateIcon(opened)
        list.Visible = opened
        btn.Size = opened and UDim2.new(0.23027, 0, 3.47932, 0) or UDim2.new(0.23027, 0, 0.7, 0)
    end)
    
    table.insert(self._elements, el)
    return el, function() return selected end
end

-- ✅ TAB SYSTEM: BackgroundTransparency switching (0=active, 1=inactive)
function AetherUI:AddTab(cfg)
    cfg = cfg or {}
    local tabName = cfg.Name or "Tab"
    local iconId = cfg.Icon or "rbxassetid://16884179038"
    
    -- Clone tab button template
    local tabBtn = Templates.Tab:Clone()
    tabBtn.Visible = true
    tabBtn.Parent = TabsContainer
    
    local btn = tabBtn:WaitForChild("Button")
    local title = tabBtn:WaitForChild("Title")
    local icon = tabBtn:WaitForChild("Icon")
    
    title.Text = tabName
    icon.Image = iconId
    
    -- ✅ Create content container for this tab (inside ScrollingFrame)
    local contentFrame = createContentContainer()
    contentFrame.Parent = ScrollingFrame
    
    -- Store tab data
    local tabData = {
        Button = tabBtn,
        Content = contentFrame,
        Elements = {}
    }
    
    -- ✅ TAB SWITCHING: BackgroundTransparency method
    local function activateTab()
        -- Deactivate previous tab
        if TabSystem.Current and TabSystem.Current.Button then
            -- Set old tab button to inactive (BackgroundTransparency = 1)
            TabSystem.Current.Button.BackgroundTransparency = 1
            -- Hide old content
            TabSystem.Current.Content.Visible = false
        end
        
        -- Activate new tab
        -- Set new tab button to active (BackgroundTransparency = 0)
        tabBtn.BackgroundTransparency = 0
        -- Show new content
        contentFrame.Visible = true
        
        TabSystem.Current = tabData
    end
    
    -- Click handler
    btn.MouseButton1Click:Connect(activateTab)
    
    -- Auto-activate first tab
    if not TabSystem.Current then
        -- Set initial state: first tab active (0), others will be 1 when created
        tabBtn.BackgroundTransparency = 0
        contentFrame.Visible = true
        TabSystem.Current = tabData
    else
        -- Non-first tabs start inactive
        tabBtn.BackgroundTransparency = 1
        contentFrame.Visible = false
    end
    
    -- Return API for adding elements to this tab
    local tabAPI = {}
    
    function tabAPI:AddLabel(c) return self:_addElement("Label", c, contentFrame) end
    function tabAPI:AddButton(c) return self:_addElement("Button", c, contentFrame) end
    function tabAPI:AddSlider(c) return self:_addElement("Slider", c, contentFrame) end
    function tabAPI:AddToggle(c) return self:_addElement("Toggle", c, contentFrame) end
    function tabAPI:AddDropdown(c) return self:_addElement("Dropdown", c, contentFrame) end
    
    function tabAPI:_addElement(type, config, parent)
        config = config or {}
        local el
        if type == "Label" then
            el = Templates.Label:Clone()
            el.Visible = true
            el.Parent = parent
            if config.Title and el:FindFirstChild("Title") then el.Title.Text = tostring(config.Title) end
        elseif type == "Button" then
            el = Templates.Button:Clone()
            el.Visible = true
            el.Parent = parent
            local frame = el:WaitForChild("Frame")
            if config.Title then frame:WaitForChild("1Title").Text = tostring(config.Title) end
            if config.Description then frame:WaitForChild("2Description").Text = tostring(config.Description) end
            if config.ButtonText then el:WaitForChild("Button"):WaitForChild("Text").Text = tostring(config.ButtonText) end
            if config.Callback then
                el:WaitForChild("Button").MouseButton1Click:Connect(function() config.Callback() end)
            end
        elseif type == "Slider" then
            el = Templates.Slider:Clone()
            el.Visible = true
            el.Parent = parent
            local frame = el:WaitForChild("Frame")
            local sliderBar = el:WaitForChild("Slider")
            local sliderVal = sliderBar:WaitForChild("Value")
            local sliderCircle = sliderBar:WaitForChild("Circle")
            
            if config.Title then frame:WaitForChild("1Title").Text = tostring(config.Title) end
            if config.Description then frame:WaitForChild("2Description").Text = tostring(config.Description) end
            
            local min, max = config.Min or 0, config.Max or 100
            local rounding = config.Rounding or 1
            local default = config.Default or min
            
            local function round(n)
                local m = 10^(rounding or 0)
                return math.floor(n * m + 0.5) / m
            end
            
            local function update(val)
                val = math.clamp(val, min, max)
                val = round(val)
                local pct = (val - min) / (max - min)
                sliderVal.Size = UDim2.new(pct, 0, 1, 0)
                sliderCircle.Position = UDim2.new(pct, 0, 0.5, 0)
                if config.Callback then config.Callback(val) end
            end
            
            update(default)
            
            local dragging = false
            local function handle(inp)
                local pos = sliderBar.AbsolutePosition.x
                local size = sliderBar.AbsoluteSize.x
                local pct = math.clamp((inp.Position.x - pos) / size, 0, 1)
                update(min + (max - min) * pct)
            end
            
            sliderBar.InputBegan:Connect(function(inp)
                if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
                    dragging = true
                    handle(inp)
                end
            end)
            
            sliderBar.InputChanged:Connect(function(inp)
                if dragging and (inp.UserInputType == Enum.UserInputType.MouseMovement or inp.UserInputType == Enum.UserInputType.Touch) then
                    handle(inp)
                end
            end)
            
            UserInputService.InputEnded:Connect(function(inp)
                if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
                    dragging = false
                end
            end)
            
            return el, update
        elseif type == "Toggle" then
            el = Templates.Toggle:Clone()
            el.Visible = true
            el.Parent = parent
            local frame = el:WaitForChild("Frame")
            local sw = el:WaitForChild("Switch")
            local circle = sw:WaitForChild("Circle")
            
            if config.Title then frame:WaitForChild("1Title").Text = tostring(config.Title) end
            if config.Description then frame:WaitForChild("2Description").Text = tostring(config.Description) end
            
            local state = config.Default or false
            local function update(s, animate)
                state = s
                local targetPos = UDim2.new(s and 0.75 or 0.25, 0, 0.5, 0)
                local targetColor = s and Color3.fromRGB(0,123,255) or Color3.fromRGB(36,36,36)
                if animate ~= false then
                    TweenService:Create(circle, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {Position = targetPos}):Play()
                    TweenService:Create(sw, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {BackgroundColor3 = targetColor}):Play()
                else
                    circle.Position = targetPos
                    sw.BackgroundColor3 = targetColor
                end
                if config.Callback then config.Callback(s) end
            end
            update(state, false)
            sw.InputBegan:Connect(function(inp)
                if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
                    update(not state, true)
                end
            end)
            return el, function(v) if v ~= nil then update(v, true) end return state end
        elseif type == "Dropdown" then
            el = Templates.Dropdown:Clone()
            el.Visible = true
            el.Parent = parent
            local frame = el:WaitForChild("Frame")
            local btn = el:WaitForChild("Button")
            local btnTxt = btn:WaitForChild("Text")
            local icon = btn:WaitForChild("Icon")
            local list = btn:WaitForChild("ScrollingFrame")
            
            if config.Title then frame:WaitForChild("1Title").Text = tostring(config.Title) end
            if config.Description then frame:WaitForChild("2Description").Text = tostring(config.Description) end
            
            local options = config.Options or {}
            local selected = config.Default or options[1] or "Select..."
            local opened = false
            btnTxt.Text = selected
            
            local RECT_CLOSED = Vector2.new(798, 0)
            local RECT_OPENED = Vector2.new(798, 108)
            local function updateIcon(open)
                icon.ImageRectOffset = open and RECT_OPENED or RECT_CLOSED
            end
            
            list.Visible = false
            updateIcon(false)
            btn.Size = UDim2.new(0.23027, 0, 0.7, 0)
            
            local optTpl = list:WaitForChild("Button")
            optTpl.Visible = false
            
            for _, opt in ipairs(options) do
                local ob = optTpl:Clone()
                ob.Visible = true
                ob.Parent = list
                ob:WaitForChild("Text").Text = tostring(opt)
                ob.MouseButton1Click:Connect(function()
                    selected = opt
                    btnTxt.Text = opt
                    opened = false
                    updateIcon(false)
                    list.Visible = false
                    btn.Size = UDim2.new(0.23027, 0, 0.7, 0)
                    if config.Callback then config.Callback(opt) end
                end)
            end
            
            btn.MouseButton1Click:Connect(function()
                opened = not opened
                updateIcon(opened)
                list.Visible = opened
                btn.Size = opened and UDim2.new(0.23027, 0, 3.47932, 0) or UDim2.new(0.23027, 0, 0.7, 0)
            end)
            
            return el, function() return selected end
        end
        if el then table.insert(tabData.Elements, el) end
        return el
    end
    
    table.insert(TabSystem.Tabs, tabData)
    return tabAPI
end

function AetherUI:Destroy()
    if ScreenGui then ScreenGui:Destroy() end
end

-- Export: returns ScreenGui and Setup function
return G2L["1"], function(cfg) return AetherUI.new(cfg) end
