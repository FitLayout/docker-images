docker rm -f page-view || true && docker run -d -p 8440:80 --restart unless-stopped --name page-view fitlayout/page-view

