import SwiftUI
import UIKit
import YieldloveAdIntegration

struct PageViewController: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> UIViewController {
        Yieldlove.instance.appName = "kicker"
        return BannerViewController(adSlotId: "home_rubrik_mrec")
    }

    func updateUIViewController(_ pageViewController: UIViewController, context: Context) {
    }
}
