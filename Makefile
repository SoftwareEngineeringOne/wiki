diagrams:
	plantuml ./**/*.md -o Diagramme

pdf:
	docker pull eguisse/mddoc:latest
	docker run -it --rm -v "$(CURRENT_DIR):/mnt:rw" "mddoc:latest" bash makepdf.sh -d docs -b build -o build/mddoc-docker-test.pdf -r src/resources -f mddoc.yml
