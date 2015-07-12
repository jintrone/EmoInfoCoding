package emoinfocoding

import grails.transaction.Transactional
import groovy.sql.Sql

@Transactional
class DataService {



    def dataSource

    def getPostCount() {

        Sql connection = new Sql(dataSource)
        connection.firstRow("select count(*) c from emo_info_code_sample").c

    }

    def getPostText(id) {
        Sql connection = new Sql(dataSource)
        String result = connection.firstRow("select text from emo_info_code_sample where id=${id}" as String).text
        result.replaceAll(/<APO>/,"'")
    }
}
