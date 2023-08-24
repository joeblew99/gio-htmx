package main

import (
	"bytes"
	"errors"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"path"

	"github.com/aymanbagabas/go-udiff"
)

func main() {
	a := "Hello, world!"
	b := "Hello, Go!"

	edits := udiff.Strings(a, b)
	d, err := udiff.ToUnifiedDiff("a.txt", "b.txt", a, edits)
	if err != nil {
		panic(err)
	}

	fmt.Println(d.String())

	// xml
	txt("./deckxml/small", "test-01.xml", "test-02.xml")

	//txt("./deckxml/big", "test-01.xml", "test-02.xml")

	// dsh
	txt("./deckdsh/small", "test-01.dsh", "test-02.dsh")

	//txt("./deckdsh/big", "test-01.dsh", "test-02.dsh")

	// json
	txt("./json/small", "test-01.json", "test-02.json")
}

func txt(folder string, aFileName string, bFileName string) {
	fmt.Println("-- START --")

	ext := filtToExtension(aFileName)

	aFile := folder + "/" + aFileName
	bFile := folder + "/" + bFileName
	//editFile := folder + "/" + "edit.txt"
	diffFile := folder + "/" + "diff.txt"
	finalFile := folder + "/" + "final" + ext

	fmt.Println("ext: " + ext)
	fmt.Println("A File: " + aFile)
	fmt.Println("B File: " + bFile)

	a := fileToString(aFile)
	b := fileToString(bFile)

	edits := udiff.Strings(a, b)

	fmt.Println("")
	fmt.Println("-- edits --")
	fmt.Println(edits)
	//stringToFile(edits, editFile)

	d, err := udiff.ToUnifiedDiff(aFile, bFile, a, edits)
	if err != nil {
		panic(err)
	}

	fmt.Println("")
	fmt.Println("-- ToUnifiedDiff --")
	fmt.Println(d.String())
	stringToFile(d.String(), diffFile)

	fmt.Println("")
	fmt.Println("-- Hunks --")

	for _, h := range d.Hunks {
		fmt.Printf("hunk: -%d, +%d\n", h.FromLine, h.ToLine)
		for _, l := range h.Lines {
			fmt.Printf("%s %q\n", l.Kind, l.Content)
		}
	}

	fmt.Println("")
	fmt.Println("-- Apply --")

	final, err := udiff.Apply(a, edits)
	if err != nil {
		panic(err)
	}
	fmt.Println(final)

	stringToFile(final, finalFile)

	fmt.Println("")
	fmt.Println("-- Equal --")
	equal := filesEqual(bFile, finalFile)
	if !equal {
		err := errors.New("failed")
		panic(err)
	}
	fmt.Println(equal)

}

func filesEqual(file1 string, file2 string) bool {
	// per comment, better to not read an entire file into memory
	// this is simply a trivial example.
	f1, err1 := ioutil.ReadFile(file1)

	if err1 != nil {
		log.Fatal(err1)
	}

	f2, err2 := ioutil.ReadFile(file2)

	if err2 != nil {
		log.Fatal(err2)
	}

	return bytes.Equal(f1, f2) // Per comment, this is significantly more performant.

}

func fileToString(file string) string {
	fmt.Println("")
	fmt.Println(file)

	content, err := ioutil.ReadFile(file)
	if err != nil {
		log.Fatal(err)
	}

	// Convert []byte to string and print to screen
	text := string(content)

	fmt.Println("")
	fmt.Println(text)

	return text
}

func filtToExtension(file string) (extension string) {
	// get the extension of a file

	ext := path.Ext(file) //obtain the extension of file
	return ext
}

func stringToFile(content string, file string) {
	f, err := os.Create(file)

	if err != nil {
		log.Fatal(err)
	}

	defer f.Close()

	_, err2 := f.WriteString(content)

	if err2 != nil {
		log.Fatal(err2)
	}

	fmt.Println("Wrote " + file)
}
