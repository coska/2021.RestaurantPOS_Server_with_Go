package models

type Employee struct {
	UserId    string `validate:"required,min=3,max=32"`
	FirstName string `validate:"required,min=1,max=32"`
	LastName  string `validate:"required,min=1,max=32"`
	Email     string `validate:"required,email,min=6,max=32"`
}
