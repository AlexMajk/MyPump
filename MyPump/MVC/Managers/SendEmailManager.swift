//
//  SendEmailManager.swift
//  MyPump
//
//  Created by Александр Майко on 01.04.2021.
//

import Foundation
import MessageUI

class SendEmailManager {
    
    
static func createEmailUrl(to: String, subject: String, body: String) -> URL? {
            let subjectEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            let bodyEncoded = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!

            let gmailUrl = URL(string: "googlegmail://co?to=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
            let outlookUrl = URL(string: "ms-outlook://compose?to=\(to)&subject=\(subjectEncoded)")
                let yahooMail = URL(string: "ymail://mail/compose?to=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
                let sparkUrl = URL(string: "readdle-spark://compose?recipient=\(to)&subject=\(subjectEncoded)&body=\(bodyEncoded)")
            let defaultUrl = URL(string: "mailto:\(to)?subject=\(subjectEncoded)&body=\(bodyEncoded)")

            if let gmailUrl = gmailUrl, UIApplication.shared.canOpenURL(gmailUrl) {
                return gmailUrl
            } else if let outlookUrl = outlookUrl, UIApplication.shared.canOpenURL(outlookUrl) {
                return outlookUrl
                } else if let yahooMail = yahooMail, UIApplication.shared.canOpenURL(yahooMail) {
                    return yahooMail
                } else if let sparkUrl = sparkUrl, UIApplication.shared.canOpenURL(sparkUrl) {
                    return sparkUrl
            }

            return defaultUrl
        }



}
