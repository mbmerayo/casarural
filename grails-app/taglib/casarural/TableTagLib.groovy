package casarural

import groovy.xml.MarkupBuilder

class TableTagLib {
    static namespace = 'casarural'

    def table = {attrs, body ->
        StringWriter output = new StringWriter()
        def builder = new MarkupBuilder(output)
        if (!attrs.class) attrs.class = ''
        attrs.class = 'table table-hover table-striped ' + attrs.class
        builder.table(attrs) {
            mkp.yieldUnescaped(body())
        }
        out << output.toString()
    }
}
