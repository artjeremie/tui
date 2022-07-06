local f = CreateFrame("frame")
f:RegisterEvent("ADDON_LOADED")

f:SetScript("OnEvent", function(self, event)

    for i, v in pairs({
        FriendsFrame.NineSlice.TopEdge,
        FriendsFrame.NineSlice.TopEdge,
        FriendsFrame.NineSlice.TopRightCorner,
        FriendsFrame.NineSlice.RightEdge,
        FriendsFrame.NineSlice.BottomRightCorner,
        FriendsFrame.NineSlice.BottomEdge,
        FriendsFrame.NineSlice.BottomLeftCorner,
        FriendsFrame.NineSlice.LeftEdge,
        FriendsFrame.NineSlice.TopLeftCorner,
        FriendsFriendsFrame.Border.TopEdge,
        FriendsFriendsFrame.Border.RightEdge,
        FriendsFriendsFrame.Border.BottomEdge,
        FriendsFriendsFrame.Border.LeftEdge,
        FriendsFriendsFrame.Border.TopRightCorner,
        FriendsFriendsFrame.Border.TopLeftCorner,
        FriendsFriendsFrame.Border.BottomLeftCorner,
        FriendsFriendsFrame.Border.BottomRightCorner,
    }) do
        v:SetVertexColor(.15, .15, .15)
    end

    for i, v in pairs({
        FriendsFrame.Bg,
        FriendsFrame.TitleBg,
        FriendsFrameInset.NineSlice.TopEdge,
        FriendsFrameInset.NineSlice.TopEdge,
        FriendsFrameInset.NineSlice.TopRightCorner,
        FriendsFrameInset.NineSlice.RightEdge,
        FriendsFrameInset.NineSlice.BottomRightCorner,
        FriendsFrameInset.NineSlice.BottomEdge,
        FriendsFrameInset.NineSlice.BottomLeftCorner,
        FriendsFrameInset.NineSlice.LeftEdge,
        FriendsFrameInset.NineSlice.TopLeftCorner
    }) do
        v:SetVertexColor(.3, .3, .3)
    end

    for i, v in pairs({
        FriendsListFrameScrollFrameTop,
        FriendsListFrameScrollFrameMiddle,
        FriendsListFrameScrollFrameBottom,
        FriendsListFrameScrollFrameThumbTexture,
        FriendsListFrameScrollFrameScrollUpButton.Normal,
        FriendsListFrameScrollFrameScrollDownButton.Normal,
        FriendsListFrameScrollFrameScrollUpButton.Disabled,
        FriendsListFrameScrollFrameScrollDownButton.Disabled
    }) do
        v:SetVertexColor(.3, .3, .3)
    end

    self:UnregisterEvent("ADDON_LOADED")
    f:SetScript("OnEvent", nil)
end)