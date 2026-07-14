//
//  AppState.swift
//  AIChat
//
//  Created by Guillaume Richard on 12/07/2026.
//

import SwiftUI

@Observable
class AppState {
    // private -> tout le monde peut lire mais seule la classe peut la modifier. Contrôle centralisé.
    private(set) var showTabBar: Bool {
        // Bloc didSet qui s'exécute à chaque fois que showTabBar change. Quand valeur change en mémoire, sauvegarde aussi sur le disque.
        didSet {
            UserDefaults.showTabbarView = showTabBar
        }
    }
    
    // Au démarrage, l'état s'initialise avec la valeur sauvegardée sur le disque (UserDefaults.showTabbarView).
    init(showTabBar: Bool = UserDefaults.showTabbarView) {
        self.showTabBar = showTabBar
    }
    
    /*
     Comme showTabBar est en private(set), les vues ne peuvent pas écrire appState.showTabBar = true directement. Elles appellent cette méthode à la place. C'est la porte d'entrée officielle pour modifier l'état. (Et quand elle modifie showTabBar, le didSet sauvegarde tout seul.)
     */
    func updateViewState(showTabBarView: Bool) {
        showTabBar = showTabBarView
    }
}

extension UserDefaults {
    private struct Keys {
        static let showTabbarView = "showTabbarView"
    }
   /* - get : quand tu lis UserDefaults.showTabbarView, ça va chercher le booléen dans le stockage.
      - set : quand tu écris UserDefaults.showTabbarView = true, ça enregistre la valeur dans le stockage. Le mot-clé newValue = la valeur que tu viens d'assigner (ici true).
    */
    static var showTabbarView: Bool {
        get {
            standard.bool(forKey: Keys.showTabbarView)
        }
        set {
            standard.set(newValue, forKey: Keys.showTabbarView)
        }
    }
}


// FLUX COMPLET

/*
 1. Une vue appelle appState.updateViewState(showTabBarView: true).
 2. Ça change showTabBar = true en mémoire.
 3. @Observable détecte le changement → toutes les vues qui lisent showTabBar se redessinent → la tabbar apparaît.
 4. Le didSet se déclenche → UserDefaults.showTabbarView = true → sauvegardé sur le disque.
 5. Prochain lancement de l'app → l'init relit le disque → l'utilisateur retrouve la tabbar. ✅
 */
