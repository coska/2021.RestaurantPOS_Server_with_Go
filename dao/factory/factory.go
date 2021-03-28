package factory

import (
	"RestaurantPOSServer/dao/interfaces"
	"RestaurantPOSServer/dao/psql"
	"log"
)

func FactoryDao(e string) interfaces.UserDao {
	var i interfaces.UserDao
	switch e {
	// case "mysql":
	// 	i = mysql.UserImplMysql{}
	case "postgres":
		i = psql.UserImplPsql{}
	default:
		log.Fatalf("El motor %s no esta implementado", e)
		return nil
	}

	return i
}
