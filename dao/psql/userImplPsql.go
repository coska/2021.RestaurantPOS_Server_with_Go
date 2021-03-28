package psql

import (
	"RestaurantPOSServer/models"
	"database/sql"

	_ "github.com/lib/pq"
)

type UserImplPsql struct {
}

func (dao UserImplPsql) Create(u *models.Employee) error {
	query := "INSERT INTO users (first_name, last_name, email) VALUES(?, ?, ?)"
	db := get()
	defer db.Close()
	stmt, err := db.Prepare(query)

	if err != nil {
		return err
	}

	defer stmt.Close()
	// result, err := stmt.Exec(u.FirstName, u.LastName, u.Email)
	// if err != nil {
	// 	return err
	// }

	// id, err := result.LastInsertId()
	// if err != nil {
	// 	return err
	// }

	// u.UserId = int(id)
	return nil
}

func (dao UserImplPsql) GetAll() ([]models.Employee, error) {
	query := "SELECT user_id userId, first_name firstName, last_name lastName, email FROM public.employee"
	users := make([]models.Employee, 0)
	db := get()
	defer db.Close()

	stmt, err := db.Prepare(query)
	if err != nil {
		return users, err
	}

	defer stmt.Close()

	rows, err := stmt.Query()
	if err != nil {
		return users, err
	}

	for rows.Next() {
		var row models.Employee
		err := rows.Scan(&row.UserId, &row.FirstName, &row.LastName, &row.Email)
		if err != nil {
			return nil, err
		}

		users = append(users, row)
	}

	return users, nil

}
func (dao UserImplPsql) GetById(userId string) (models.Employee, error) {

	query := "SELECT user_id userId, first_name firstName, last_name lastName, email FROM public.employee where user_id = $1"

	db := get()
	defer db.Close()

	employee := models.Employee{}

	row := db.QueryRow(query, userId)
	switch err := row.Scan(&employee.UserId, &employee.FirstName, &employee.LastName, &employee.Email); err {
	case sql.ErrNoRows:
		return employee, err
	case nil:
		return employee, err
	default:
		panic(err)
	}

}
