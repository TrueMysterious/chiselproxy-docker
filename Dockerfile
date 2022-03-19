FROM heroku/heroku:20
RUN  curl -s https://api.github.com/repos/jpillora/chisel/releases/latest  | grep "browser_download_url.*_linux_amd64.gz" | cut -d : -f 2,3 | tr -d \"  | xargs curl -sSL | zcat > /bin/chisel
RUN chmod +x /bin/chisel
RUN useradd -m heroku
USER heroku
EXPOSE 5000
CMD chisel server --proxy duck.com
