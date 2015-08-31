package main

import (
	"fmt"
	"log"
	"net/http"
	"io/ioutil"
)

func loadFile(filename string) string {
	log.Println(fmt.Sprintf("INFO - Loading file %s", filename))
	body, e := ioutil.ReadFile(filename)
	if (e != nil) {
		log.Println(fmt.Sprintf("ERROR - %s", e))
	}
	return string(body[:])
}

func indexHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, loadFile("templates/index.html"))
}

func fileHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, loadFile(r.URL.Path[1:]))
}

func main() {
	port := "8080"

	http.HandleFunc("/", indexHandler)
	http.HandleFunc("/templates/", fileHandler)
	http.HandleFunc("/static/", fileHandler)

	log.Println(fmt.Sprintf("INFO - Starting web server on port %s", port))
	e := http.ListenAndServe(fmt.Sprintf(":%s", port), nil)
	if (e != nil) {
		log.Println(fmt.Sprintf("ERROR - %s", e))
	}
}
