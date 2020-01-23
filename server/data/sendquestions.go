package main

import (
	"fmt"
	"io/ioutil"
	"os"
	"strings"

	"github.com/orsenkucher/nothing/server/server"
)

const filename = "questions.txt"

func main() {
	args := map[string]bool{}
	for _, arg := range os.Args[1:] {
		args[arg] = true
	}
	fmt.Println("args:", args)
	if args["-v"] {
		validate()
	} else if args["-s"] {
		sendQuestions()
	} else {
		fmt.Println(`
==HELP==
-v :validate
-s :send questions

Use $ go run .	to run multifile main package`)
	}
}

func sendQuestions() {
	dat, _ := ioutil.ReadFile(filename)
	str := string(dat)
	lines := strings.Split(str, "\n")
	serv := server.Server{}
	serv.StartUp()
	for _, l := range lines {
		var question server.Question
		strs := strings.Split(l, "|")
		if len(strs) < 3 {
			fmt.Println("ALARM We miss ", l)
			continue
		}
		question.Question = strs[0]
		question.Left = strs[2]
		question.Right = strs[1]
		serv.AddQuestion(question)
	}
}
