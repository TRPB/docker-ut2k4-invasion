FROM captbrick/ut2004

COPY UT2004/ /usr/src/ut2004

EXPOSE 7777/udp 7778/udp 7787/udp 28902 80

ENTRYPOINT ["/entrypoint.sh"]
CMD ["ucc-bin", "server", "DM-Morpheus3?game=XGame.xDeathMatch", "ini=UT2004.ini", "-nohomedir"]
