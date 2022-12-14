#!/bin/bash

#   Create   a   new   Docker   container   based   on   the   ubuntu   image
sudo   apt-get   update
sudo   apt-get   install   docker.io
sudo   docker   run   hello-world

#   Pull   the   latest   ubuntu   image   from   Docker   Hub
sudo   docker   pull   ubuntu

#   Create   a   new   Docker   container   based   on   the   ubuntu   image
   sudo   docker   create   --name   406solutionswebsite   ubuntu

   #   Copy   the   HTML   and   CSS   files   for   your   static   website   into   the   container   in   to   the   home   directory   of   the   ubuntu   container
sudo   docker   cp   /home/tjoa/406solutionswebsite/index.html   406solutionswebsite:/home
sudo   docker   cp   /home/tjoa/406solutionswebsite/app.css   406solutionswebsite:/home
sudo   docker   cp   /home/tjoa/406solutionswebsite/logo1.png   406solutionswebsite:/home
sudo   docker   cp   /home/tjoa/406solutionswebsite/main.py   406solutionswebsite:/home
sudo   docker   cp   /home/tjoa/406solutionswebsite/ runmeb4.sh   406solutionswebsite:/home
sudo   docker   cp   /home/tjoa/406solutionswebsite/aboutus.html   406solutionswebsite:/home
sudo   docker   cp   /home/tjoa/406solutionswebsite/whyus.html   406solutionswebsite:/home
sudo   docker   cp   /home/tjoa/406solutionswebsite/bash.sh   406solutionswebsite:/home


#pull the  latest   nginx   image   from   Docker   Hub
sudo   docker   pull   nginx

#   Create   a   new   Docker   container   based   on   the   nginx   image
sudo   docker   create   --name   406solutionswebsite   nginx

#   Copy   the   HTML   and   CSS   files   for   your   static   website   into   the   container
sudo   docker   cp   /home/406solutionswebsite/index.html   406solutionswebsite:/usr/share/nginx/html
sudo   docker   cp   /home/406solutionswebsite/aboutus.html   406solutionswebsite:/usr/share/nginx/html
sudo   docker   cp   /home/406solutionswebsite/contact.html.html   406solutionswebsite:/usr/share/nginx/html
sudo   docker   cp   /home/406solutionswebsite/bash.sh   406solutionswebsite:/usr/share/nginx/html
sudo   docker   cp   /home/406solutionswebsite/app.css   406solutionswebsite:/usr/share/nginx/html
sudo   docker   cp   /home/406solutionswebsite/logo1.png   406solutionswebsite:/usr/share/nginx/html
sudo   docker   cp   /home/406solutionswebsite/main.py  406solutionswebsite:/usr/share/nginx/html
sudo   docker   cp   /home/406solutionswebsite/runmeb4.sh   406solutionswebsite:/usr/share/nginx/html
sudo   docker   cp   /home/406solutionswebsite/whyus.html   406solutionswebsite:/usr/share/nginx/html


#   Start   the   Docker   container
sudo   docker   start   406solutionswebsite

#connect   to   the   docker   container   via   the   internet
sudo   docker   run   -d   -p   80:80   --name   406solutionswebsite   nginx

#connect   to   406solutionswebsite   container   shell
sudo   docker   exec   -it   406solutionswebsite   /bin/bash

#find   ip   address   for   406solutionswebsite   container
sudo   docker   inspect   406solutionswebsite   |   grep   IPAddress
