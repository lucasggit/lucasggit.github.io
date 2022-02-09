FROM nginx:1.15.8-alpine

#config
COPY ./nginx.conf /etc/nginx/nginx.conf

#content, comment out the ones you dont need!
ADD . /usr/share/nginx/html/
#copy ./*.css /usr/share/nginx/html/
#copy ./*.png /usr/share/nginx/html/
#copy ./*.js /usr/share/nginx/html/
