#!/bin/bash

#############################################################
#                                                           #
# Program:      mzoom                                       #
# Author:       dw                                          #
# Date:         2007-07-07                                  #
# Purpose:      Explore the Mandelbrot set in bash!         #
# Usage:        See below                                   #
# Version:      1.01.6930                                   #
#                                                           #
#############################################################

#### Usage: Run with no arguments, program will draw full mandelbrot set. After set is complete,
#### use the arrow keys to navigate to the upper left corner of an area you want to zoom into,
#### then press the "z" key once, use the right arrow key again to move to the right, you are now
#### deciding how big of a "box" to draw around the area, when you are far enough to the right,
#### press the "z" key one more time, this will draw a box roughly around the area to be zoomed
#### into, after a brief pause, the program will zoom into the area you selected. Repeat process
#### to continue zooming, use control c to exit.

#### As your level of zoom increases, you'll want to increase the number of iterations, you can
#### do this by pressing the "i" key while in zoom mode, anytime before pressing the second "z",
#### this will increase the max iterations by 50 each time.

#### This program uses integer math to explore the Mandelbrot set, it will not zoom in as far as
#### a "real" Mandelbrot explorer, but floating point was just too slow in bash, you'll know when
#### you hit the limit, I have tested it to about 2,000,000 magnification. My bash/python hybred
#### version zooms much further and is over 40 times faster. :-)

#### GET CURRENT SCREEN SIZE - METHOD 1
w=`tput cols`
e=`tput lines`

#### DO WE HAVE A SCREEN SIZE? IF NOT, TRY METHOD 2
if [ ! "$w" ]
then
  #### GET CURRENT SCREEN SIZE - METHOD 2
  w=`stty -a | grep rows | awk -F ";" '{print$3}' | awk '{print$2}'`
  e=`stty -a | grep rows | awk -F ";" '{print$2}' | awk '{print$2}'`
  #### HOW ABOUT NOW?
  if [ ! "$w" ]
  then
    clear;echo;echo "COULD NOT OBTAIN SCREEN SIZE";echo;exit
  fi
fi

#### SET MAX X & Y
((w = w - 1));((e = e - 1));maxy="$e";maxx="$w"

#### SETUP THE COLOR VARIABLES
off="\033[0m";gry="\033[1;0m";red="\033[1;31m";grn="\033[1;32m";yel="\033[1;33m"
blu="\033[1;34m";pur="\033[1;35m";aqu="\033[1;36m";wht="\033[1;37m"

#### SET THE BC PRECESION
pre=20

#### SETUP THE MANDELBROT VARIABLES
si=$(echo "scale=$pre;(2.5)" | bc)          ### length of side = 2.5
c=$(echo "scale=$pre;(-2.00)" | bc)         ### acorner = -2
k=$(echo "scale=$pre;(-1.25)" | bc)         ### bcorner = -1.25
it=100                                      ### iterations = 100

#### SETUP THE COLOR ARRAYS
p[1]="$gry";p[2]="$wht";p[3]="$red";p[4]="$grn";p[5]="$yel"
p[6]="$blu";p[7]="$pur";p[8]="$aqu";p[9]="$wht"

nsi=$(echo "scale=$pre;(2.5)" | bc)

#### THE MAIN ROUTINE
mandelbrot()
{
#### FILL THE COLOR ARRAY
  x=1;z=0;xx=1
  while ((x < it))
  do
    ((z++))
   if ((z > 9))
    then
      z=1
    fi
    pix["$x"]="${p[$z]}""$xx"
    ((x++));((xx++))
    if ((xx > 9))
    then
      xx=1
    fi
  done

  #### AUTO CALCULATE ASPECT RATIO
  ar=$(echo "scale=$pre;($w/$e)/2" | bc)
  gr=$(echo "scale=$pre;($si/($w/$ar))" | bc)

  #### MULTIPLIER FOR INTEGER MATH IS 2^27 SO WE USE A 27 BIT SHIFT IN THE MAIN LOOP
  mul=134217728;clear;m=0;n=0;pxl="M";g=`echo "$gr" | awk '{print(int($1*'"$mul"'))}'`
  hr=$(echo "scale=$pre;($si/$e)" | bc);h=`echo "$hr" | awk '{print(int($1*'"$mul"'))}'`
  gcr=$(echo "scale=$pre;(($gr+$c)*$mul)" | bc);gc=`echo "$gcr" | awk '{print(int($1))}'`
  mhkr=$(echo "scale=$pre;(($hr+$k)*$mul)" | bc);mhk=`echo "$mhkr" | awk '{print(int($1))}'`
  ngc="$gc";writexy="tput cup";((mul4 = mul << 2))

  #### PRINT ZOOM RATIO, ITERATIONS AND COORDINATES AT LOWER LEFT CORNER OF SCREEN
  mag1=$(echo "scale=$pre;(2.5/$nsi)" | bc);echo -e "$wht"
  mag2=`echo "$mag1" | awk '{print int($0)}'`
  $writexy $((maxy - 3)) 0;echo -n "       ZOOM = $mag2"
  $writexy $((maxy - 2)) 0;echo -n "    ACORNER = $c "
  $writexy $((maxy - 1)) 0;echo -n "    BCORNER = $k "
  $writexy $((maxy - 0)) 0;echo -n " ITERATIONS = $it "

  #### THE MAIN LOOP WITH 27 BIT SHIFT
  while ((m < e))
  do
    x=1;tput cup $m $n
    while ((x < it))
    do
      ((v = (a * b) >> 27));((a = (aq - bq) + ngc));((b = (v << 1) + mhk))
      ((aq = (a * a) >> 27));((bq = (b * b) >> 27))
      if ((aq + bq > mul4))
      then
        echo -en ${pix[$x]};((x = it))
      fi
      ((x++))
    done
    a=0;b=0;aq=0;bq=0;((n++));((ngc = ngc + g))
    if ((n > w))
    then
      n=0;((m++));ngc=gc;((mhk = mhk + h))
    fi
  done
  echo -en "$off"
}

#### THE ZOOM ROUTINE
zoomin()
{
  zoom=0;x=0;y=0;maxy="$e";maxx="$w";beenhere=0
  read_keys()
  {
    key="";read -sn1 key
    case "$key" in
      A)  ((y--));if ((y < 0));then y=0;fi
          ;;
      B)  ((y++));if ((y > maxy));then ((y--));fi
          ;;
      D)  ((x--));if ((x < 0));then x=0;fi
          ;;
      C)  ((x++));if ((x > maxx));then ((x--));fi
          ;;
      i)  ((it = it + 50));tput cup $maxy 0;echo -en "$red ITERATIONS = $it $off"
          ;;
      z)  ((zoom++));beenhere=1
          ;;
    esac
  }

  while ((zoom != 2))
  do
    if ((zoom == 1)) && ((beenhere == 1));then x1="$x";y1="$y";beenhere=0;fi
    if ((zoom == 2)) && ((beenhere == 1));then x2="$x";y2="$y";beenhere=0;zoom=3;fi
    if ((zoom != 2));then read_keys;fi
    if ((beenhere == 0));then tput cup $y $x;echo -en "$wht#$off";fi
  done

  X1="$x1";Y1="$y1";X2="$x";Y2="$y";Y1org="$Y1";X1org="$X1";X2org="$X2"

  if ((X1 >= X2));then clear;echo;echo "X2 MUST BE GREATER THAN X1";echo;exit;fi

  #### DRAW CRAPPY BOX
  ((dif = X2 - X1));xx="$X1";((xxx = xx + dif));tput cup $Y1 $X1
  while ((xx < xxx))
  do
    ((xx++));tput cup $Y1 $xx;echo -en "$wht#$off"
  done

  xx="$Y1";((xxx = xx + (dif >> 1)));tput cup $Y1 $X1
  while ((xx < xxx))
  do
    ((xx++));if ((xx > maxy)); then xxx="$maxy";fi
    tput cup $xx $X1;echo -en "$wht#$off"
  done

  Y2="$xx";((xx = X1));tput cup $Y2 $X1;((xxx = X1 + dif))
  while ((xx < xxx))
  do
    ((xx++));tput cup $Y2 $xx;echo -en "$wht#$off"
  done

  xx="$Y1";((xxx = xx + (dif >> 1)));((X1 = X1 + dif));tput cup $Y1 $X1
  while ((xx < xxx))
  do
    ((xx++));if ((xx > maxy)); then xxx="$maxy";fi
    tput cup $xx $X1;echo -en "$wht#$off"
  done

  #### SET COORDINATES FOR ZOOMED IN AREA
  nc=$(echo "scale=$pre;(($X1org*$gr)+$c)" | bc)
  nk=$(echo "scale=$pre;(($Y1org*$hr)+$k)" | bc)
  nsi=$(echo "scale=$pre;(($X2org-$X1org)*$gr)" | bc)
  c="$nc";k="$nk";si="$nsi";ngc=0;mhk=0;gc=0;hk=0
  sleep 1
}

#### THE INFINITE LOOP
while [ 1 ]
do
  mandelbrot
  tput cup $maxy 0;echo -en "$grn READY TO ZOOM IN       $off"
  zoomin
done
exit
