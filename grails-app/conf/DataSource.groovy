dataSource {
    pooled = true
    jmxExport = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
//    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
    singleSession = true // configure OSIV singleSession mode
}

// environment specific settings
environments {
    development {
        dataSource {
            logSql = false
            dbCreate = "update"
            pooled = true
            driverClassName = "com.mysql.jdbc.Driver"
            username = "cscw"
            password = "cscw"
            url = "jdbc:mysql://localhost:3306/cscw16"
            dialect = org.hibernate.dialect.MySQL5InnoDBDialect
            properties {
                validationQuery = "select 1"
                testWhileIdle = true
                timeBetweenEvictionRunsMillis = 60000
            }
        }
    }
    test {
        dataSource {
            dbCreate = "create-drop"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            pooled = true
            driverClassName = "com.mysql.jdbc.Driver"
            username = "cscw"
            password = "cscw"
            url = "jdbc:mysql://localhost:3306/cscw16"
            dialect = org.hibernate.dialect.MySQL5InnoDBDialect
            properties {
                validationQuery = "select 1"
                testWhileIdle = true
                timeBetweenEvictionRunsMillis = 60000
            }
        }
    }
}
