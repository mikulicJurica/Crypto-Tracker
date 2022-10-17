import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        let tabBarController = UITabBarController()
        
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        let addViewController = UINavigationController(rootViewController: AddViewController())
        let settingsViewController = UINavigationController(rootViewController: SettingsViewController())
        
        //style
        tabBarController.tabBar.tintColor = StyleConstants.AppColors.blueColor
        tabBarController.tabBar.unselectedItemTintColor = StyleConstants.AppColors.cyanColor
        tabBarController.tabBar.backgroundColor = StyleConstants.AppColors.whiteColor
        
        homeViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: StyleConstants.IconImages.homeIcon), selectedImage: UIImage(systemName: StyleConstants.IconImages.homeIconSelected))
        addViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: StyleConstants.IconImages.addIcon), selectedImage: UIImage(systemName: StyleConstants.IconImages.addIconSelected))
        settingsViewController.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: StyleConstants.IconImages.settingsIcon), selectedImage: UIImage(systemName: StyleConstants.IconImages.settingsIconSelected))
        
        tabBarController.viewControllers = [homeViewController, addViewController, settingsViewController]
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
    }

}

