package main

import (
	"encoding/xml"
	"fmt"
	"os"
)

type Variant struct {
	ID int `xml:"product-id,attr"`
}

type VariationGroup struct {
	ID int `xml:"product-id,attr"`
}
type Product struct {
	ID              int              `xml:"product-id,attr"`
	Variants        []Variant        `xml:"variations>variants>variant"`
	VariationGroups []VariationGroup `xml:"variations>variation-groups>variation-group"`
}

type Catalog struct {
	XMLName  xml.Name  `xml:"catalog"`
	Products []Product `xml:"product"`
}

func main() {
	xmlFile := readXML()
	defer xmlFile.Close()

	decoder := xml.NewDecoder(xmlFile)

	for {
		t, _ := decoder.Token()
		if t == nil {
			break
		}

		var inElement string

		switch se := t.(type) {
		case xml.StartElement:
			inElement = se.Name.Local
			// ...and its name is "page"
			if inElement == "product" {
				var p Product
				// decode a whole chunk of following XML into the
				// variable p which is a Page (se above)
				decoder.DecodeElement(&p, &se)

				fmt.Println("master pid: ", p.ID)
				for _, vs := range p.Variants {
					fmt.Println("variant id: ", vs.ID)
				}
				for _, vg := range p.VariationGroups {
					fmt.Println("variant group id: ", vg.ID)
				}
			}

		}

	}

}

func readXML() *os.File {
	data, err := os.Open("products.xml")
	if err != nil {
		panic(err)
	}

	return data
}
