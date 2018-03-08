package casarural.auth

import grails.plugin.springsecurity.ui.RegistrationCode
import grails.plugin.springsecurity.ui.strategy.RegistrationCodeStrategy

class RegistrationCodeController extends grails.plugin.springsecurity.ui.RegistrationCodeController {
    /** Dependency injection for the 'uiRegistrationCodeStrategy' bean. */
    RegistrationCodeStrategy uiRegistrationCodeStrategy

    def edit() {
        super.edit()
    }

    def update() {
        withForm {
            doUpdate { registrationCode ->
                uiRegistrationCodeStrategy.updateRegistrationCode params, registrationCode
            }
        }.invalidToken {
            doUpdateWithInvalidToken()
        }
    }

    def delete() {
        withForm {
            tryDelete { registrationCode ->
                uiRegistrationCodeStrategy.deleteRegistrationCode registrationCode
            }
        }.invalidToken {
            doDeleteWithInvalidToken()
        }
    }

    def search() {
        if (!isSearch()) {
            // show the form
            return
        }

        def results = doSearch { ->
            like 'token', delegate
            like 'username', delegate
        }

        renderSearch([results: results, totalCount: results.totalCount],
                'token', 'username')
    }

    protected Class<?> getClazz() { RegistrationCode }
    protected String getClassLabelCode() { 'registrationCode.label' }
    protected String getSimpleClassName() { 'RegistrationCode' }
    protected Map model(registrationCode, String action) {
        [registrationCode: registrationCode]
    }
}
