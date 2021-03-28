package interfaces

import "RestaurantPOSServer/models"

type UserDao interface {
	Create(u *models.Employee) error
	// Update(u *models.User) error
	// Delete(i int) error

	GetById(userId string) (models.Employee, error)

	GetAll() ([]models.Employee, error)
}
