//
//  ViewController.swift
//  XYZMerchant
//
//  Created by Joshi, Rabin on 2021-07-30.
//

import UIKit
import AuthenticationServices
import SafariServices

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func didSelectSFSafariViewControllerLocalStorage() {
        let urlString = "https://rjoshi-deloitte.github.io/LocalStorage.html"
        if let url = URL(string: urlString) {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            let vc = SFSafariViewController(url: url, configuration: config)
            vc.delegate = self
            present(vc, animated: true)
        }
    }
    
    func didSelectSFSafariViewControllerClientCookies() {
        let urlString = "https://rjoshi-deloitte.github.io/DocumentCookie.html"
        if let url = URL(string: urlString) {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            let vc = SFSafariViewController(url: url, configuration: config)
            vc.delegate = self
            present(vc, animated: true)
        }
    }
    
    func didSelectSFSafariViewControllerServerCookies() {
        let urlString = "https://qa.updogshop.com/"
        if let url = URL(string: urlString) {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            let vc = SFSafariViewController(url: url, configuration: config)
            vc.delegate = self
            present(vc, animated: true)
        }
    }
    
    func didSelectASWebAuthenticationSessionLocalStorage() {
        let urlString = "https://rjoshi-deloitte.github.io/LocalStorage.html"
        // Use the URL and callback scheme specified by the authorization provider.
        guard let authURL = URL(string: urlString) else { return }
        let scheme = "com.example.ABCMerchant"

        // Initialize the session.
        let session = ASWebAuthenticationSession(url: authURL, callbackURLScheme: scheme) { callbackURL, error in
            // Handle the callback.
            debugPrint(callbackURL ?? "", error ?? "")
        }
        session.presentationContextProvider = self
        session.prefersEphemeralWebBrowserSession = false
        session.start()
    }
    
    func didSelectASWebAuthenticationSessionClientCookies() {
        let urlString = "https://rjoshi-deloitte.github.io/DocumentCookie.html"
        // Use the URL and callback scheme specified by the authorization provider.
        guard let authURL = URL(string: urlString) else { return }
        let scheme = "com.example.ABCMerchant"

        // Initialize the session.
        let session = ASWebAuthenticationSession(url: authURL, callbackURLScheme: scheme) { callbackURL, error in
            // Handle the callback.
            debugPrint(callbackURL ?? "", error ?? "")
        }
        session.presentationContextProvider = self
        session.prefersEphemeralWebBrowserSession = false
        session.start()
    }
    
    func didSelectASWebAuthenticationSessionServerCookies() {
        let urlString = "https://qa.updogshop.com/"
        // Use the URL and callback scheme specified by the authorization provider.
        guard let authURL = URL(string: urlString) else { return }
        let scheme = "com.example.ABCMerchant"

        // Initialize the session.
        let session = ASWebAuthenticationSession(url: authURL, callbackURLScheme: scheme) { callbackURL, error in
            // Handle the callback.
            debugPrint(callbackURL ?? "", error ?? "")
        }
        session.presentationContextProvider = self
        session.prefersEphemeralWebBrowserSession = false
        session.start()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch (indexPath.section, indexPath.row) {
        case (0, 0): didSelectSFSafariViewControllerLocalStorage()
        case (0, 1): didSelectSFSafariViewControllerClientCookies()
        case (0, 2): didSelectSFSafariViewControllerServerCookies()
        case (1, 0): didSelectASWebAuthenticationSessionLocalStorage()
        case (1, 1): didSelectASWebAuthenticationSessionClientCookies()
        case (1, 2): didSelectASWebAuthenticationSessionServerCookies()
        default: break
        }
    }
}

extension ViewController: SFSafariViewControllerDelegate {
    
}

extension ViewController: ASWebAuthenticationPresentationContextProviding {
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
        return view.window!
    }
}
