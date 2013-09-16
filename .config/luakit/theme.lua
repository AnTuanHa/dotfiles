--------------------------
-- Default luakit theme --
--------------------------

local theme = {}

-- Default settings
theme.font = "monospace normal 9"
theme.fg   = "#DCDCCC"
theme.bg   = "#3f3F3F"

-- Genaral colours
theme.success_fg = "#7F9F7F"
theme.loaded_fg  = "#6ca0a3"
theme.error_fg = "#000"
theme.error_bg = "#cc9393"

-- Warning colours
theme.warning_fg = "#cc9393"
theme.warning_bg = "#3f3f3f"

-- Notification colours
theme.notif_fg = "#dcdccc"
theme.notif_bg = "#3f3f3f"

-- Menu colours
theme.menu_fg                   = "#DCDCCC"
theme.menu_bg                   = "#3F3F3F"
theme.menu_selected_fg          = "#7f9f7f"
theme.menu_selected_bg          = "#2f2f2f"
theme.menu_title_bg             = "#1f1f1f"
theme.menu_primary_title_fg     = "#CC9393"
theme.menu_secondary_title_fg   = "#DCDCCC"

-- Proxy manager
theme.proxy_active_menu_fg      = '#DCDCCC'
theme.proxy_active_menu_bg      = '#2f2f2f'
theme.proxy_inactive_menu_fg    = '#9c9c8c'
theme.proxy_inactive_menu_bg    = '#3F3F3F'

-- Statusbar specific
theme.sbar_fg         = "#f0dfaf"
theme.sbar_bg         = "#3f3f3f"

-- Downloadbar specific
theme.dbar_fg         = "#dcdccc"
theme.dbar_bg         = "#3f3f3f"
theme.dbar_error_fg   = "#cc9393"

-- Input bar specific
theme.ibar_fg           = "#DCDCCC"
theme.ibar_bg           = "#3F3F3F"

-- Tab label
theme.tab_fg            = "#dcdccc"
theme.tab_bg            = "#3f3f3f"
theme.tab_ntheme        = "#6f6f6f"
theme.selected_fg       = "#f0dfaf"
theme.selected_bg       = "#1e2320"
theme.selected_ntheme   = "#6ca0a3"
theme.loading_fg        = "#6ca0a3"
theme.loading_bg        = "#1e2320"

-- Trusted/untrusted ssl colours
theme.trust_fg          = "#7f9f7f"
theme.notrust_fg        = "#cc9393"

return theme
-- vim: et:sw=4:ts=8:sts=4:tw=80
