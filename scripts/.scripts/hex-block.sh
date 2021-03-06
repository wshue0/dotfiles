#!/usr/bin/env bash
# source: Meyithi, https://bbs.archlinux.org/viewtopic.php?pid=1010829#p1010829

xdef="$HOME/.Xresources"

colors=( $( sed -re '/^!/d; /^$/d; /^#/d; s/(\*color)([0-9]):/\10\2:/g;' $xdef | grep 'color[01][0-9]:' | sort | sed  's/^.*: *//g' ) 
)

# stack of 4 * 4
# echo
# for i in {0..3}; do echo -en "\e[$((30+$i))m ${colors[i]} \u2588\u2588 \e[0m"; done
# echo
# for i in {4..7}; do echo -en "\e[$((30+$i))m ${colors[i]} \u2588\u2588 \e[0m"; done
# echo
# for i in {8..11}; do echo -en "\e[1;$((22+$i))m ${colors[i]} \u2588\u2588 \e[0m"; done
# echo
# for i in {12..15}; do echo -en "\e[1;$((22+$i))m ${colors[i]} \u2588\u2588 \e[0m"; done
# echo -e "\n"
# stack of 2 * 8
echo
for i in {0..7}; do echo -en "\e[$((30+$i))m ${colors[i]} \u2588\u2588 \e[0m"; done
echo
for i in {8..15}; do echo -en "\e[1;$((22+$i))m ${colors[i]} \u2588\u2588 \e[0m"; done
echo -e "\n"
