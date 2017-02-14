package main

import (
	"encoding/xml"
	"fmt"
	"io/ioutil"
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

type Products struct {
	XMLName  xml.Name  `xml:"products"`
	Products []Product `xml:"product"`
}

func main() {
	v := Products{}
	xmlData := readXML()

	err := xml.Unmarshal([]byte(xmlData), &v)
	if err != nil {
		panic(err)
	}

	for _, ps := range v.Products {
		fmt.Println("master pid: ", ps.ID)
		for _, vs := range ps.Variants {
			fmt.Println("variant id: ", vs.ID)
		}
		for _, vg := range ps.VariationGroups {
			fmt.Println("variant group id: ", vg.ID)
		}
	}
}

func readXML() string {
	data, err := ioutil.ReadFile("products.xml")
	if err != nil {
		panic(err)
	}

	return string(data)
}
