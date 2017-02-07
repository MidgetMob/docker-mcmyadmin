FROM java:7u111
MAINTAINER Jon Schulberger <jschoulzy@gmail.com>

EXPOSE 8080
EXPOSE 25565

RUN adduser mcmyadmin --disabled-login

WORKDIR	/usr/local
RUN	wget http://mcmyadmin.com/Downloads/etc.zip && \
	unzip -u etc.zip && \
	rm -f etc.zip

USER mcmyadmin

WORKDIR	/home/mcmyadmin
RUN	wget http://mcmyadmin.com/Downloads/MCMA2-Latest.zip && \
	unzip -u MCMA2-Latest.zip && \
	rm -f MCMA2-Latest.zip && \
	wget http://mcmyadmin.com/Downloads/MCMA2_glibc26_2.zip && \
	unzip -u MCMA2_glibc26_2.zip && \
	rm -f MCMA2_glibc26_2.zip && \
	./MCMA2_Linux_x86_64 -setpass mcmyadmin -configonly

VOLUME /home/mcmyadmin/Minecraft

CMD ["./MCMA2_Linux_x86_64"]
