------------------
---- AUTOSTART ----
------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("udiskie")
    hl.exec_cmd("waybar")
    hl.exec_cmd("dunst")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'") 		-- GTK3 apps
    hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'")       	-- GTK4 apps
end)
