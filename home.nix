{ pkgs, ... }:
{
  home.username = "eike-sakurai";
  home.homeDirectory = "/home/eike-sakurai";
  home.stateVersion = "25.11";
  
  ## PACKAGES
  home.packages = with pkgs; [
    firefox
    ranger
    waybar
    hyprpaper
    alacritty
    wofi
    ueberzugpp
    neovim

    steam
    discord
    obs-studio
    kdePackages.kdenlive
    libreoffice-fresh
    godot-mono

    gamescope
    mangohud
    gamemode
  ];
  
  ## RANGER
  programs.ranger = {
    enable = true;
    settings = {
      preview_images = true;
      preview_images_method = "ueberzug";
      draw_borders = true;
      w3m_delay = 0;
    };
  };
  
  ## HYPRLAND
  wayland.windowManager.hyprland = {
    enable = true;
    settings = 
    {
      monitor = "eDP-1,1920x1080@60,auto,1.5";
      "$mainMod" = "SUPER";
      "$terminal" = "alacritty";
      "$fileManager" = "$terminal -e sh -c 'ranger'";
      "$menu" = "wofi --show drun";
      "$browser" = "firefox";

      exec-once = [
        "waybar"
        "hyprpaper"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 1;
        resize_on_border = true;
        allow_tearing = true;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        rounding_power = 2;
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = false;
        };

        blur = {
          enabled = true;
          size = 6;
          passes = 3;
          ignore_opacity = true;
          new_optimizations = true;
        };
      };

      animations = {
        enabled = true;
        
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1"
          "quick,0.15, 0,0.1,1"
        ];
        
        animation = [
          "global,1,10,default"
          "border,1,5.39,easeOutQuint"
          "windows,1,4.79,easeOutQuint"
          "windowsIn,1,4.1,easeOutQuint,popin 87%"
          "windowsOut,1,1.49,linear,popin 87%"
          "fadeIn,1,1.73,almostLinear"
          "fadeOut,1,1.46,almostLinear"
          "fade,1,3.03,quick"
          "layers,1,3.81,easeOutQuint"
          "layersIn,1,4,easeOutQuint, fade"
          "layersOut,1,1.5,linear,fade"
          "fadeLayersIn,1,1.79,almostLinear"
          "fadeLayersOut,1,1.39,almostLinear"
          "workspaces,1,1.94,almostLinear, fade"
          "workspacesIn,1,1.21,almostLinear, fade"
          "workspacesOut,1,1.94,almostLinear,fade"
          "zoomFactor,1,7,quick"
        ];
      };

      input = {
        kb_layout = "br,us";
        kb_options = "grp:win_space_toggle";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = false;
          scroll_factor = 1.0;
        };
        sensitivity = 0;
        force_no_accel = true;
      };

      bind = [
        "$mainMod, RETURN, exec, $terminal"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, B, exec, $browser"
        "$mainMod CTRL, RETURN, exec, $menu"
        "$mainMod, Q, killactive"
        "$mainMod, V, togglefloating"
        "$mainMod, J, togglesplit"
        "$mainMod, F, fullscreen, 0"
        "$mainMod, M, fullscreen, 1"
        "$mainMod, T, togglefloating"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod SHIFT, right, resizeactive, 50 0"
        "$mainMod SHIFT, left, resizeactive, -50 0"
        "$mainMod SHIFT, down, resizeactive, 0 50"
        "$mainMod SHIFT, up, resizeactive, 0 -50"
        "$mainMod ALT, right, swapwindow, r"
        "$mainMod ALT, left, swapwindow, l"
        "$mainMod ALT, down, swapwindow, d"
        "$mainMod ALT, up, swapwindow, u"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
        "$mainMod CTRL, mouse_down, workspace, empty"
        "$mainMod CTRL, mouse_up, workspace, empty"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
        ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      ];

      bindl = [
        ",XF86AudioNext, exec, playerctl next"
        ",XF86AudioPause, exec, playerctl play-pause"
        ",XF86AudioPlay, exec, playerctl play-pause"
        ",XF86AudioPrev, exec, playerctl previous"
      ];

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      workspace = [
        "1,monitor:eDP-1,default:true"
        "2,monitor:eDP-1"
        "3,monitor:eDP-1"
        "4,monitor:eDP-1"
        "5,monitor:eDP-1"
        "6,monitor:eDP-1"
        "7,monitor:eDP-1"
        "8,monitor:eDP-1"
        "9,monitor:eDP-1"
        "10,monitor:eDP-1"
      ];
    };
  };  
}
