#!/bin/bash

palette='rgb(51,63,74),rgb(217,84,104),rgb(139,212,156),rgb(235,191,131),rgb(83,154,252),rgb(182,45,101),rgb(112,225,232),rgb(113,140,161),rgb(65,80,94),rgb(217,84,104),rgb(139,212,156),rgb(247,218,179),rgb(94,196,255),rgb(182,45,101),rgb(112,225,232),rgb(183,197,211)'
foreground='#b7c5d3'
background='#181e24'
cursor='rgb(73,98,124)'
darkstyle='true'

gsettings set io.elementary.terminal.settings palette "$palette"
gsettings set io.elementary.terminal.settings foreground "$foreground"
gsettings set io.elementary.terminal.settings background "$background"
gsettings set io.elementary.terminal.settings cursor-color "$cursor"
gsettings set io.elementary.terminal.settings prefer-dark-style "$darkstyle"
