//
//  DetailsViewController.swift
//  Code9-Mobile-2022-iOS
//
//  Created by Zolt Varga on 4/24/22.
//
import UIKit

class DetailsViewController: UIViewController {
    
    // MARK: - UI
    
    lazy var name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.accessibilityIdentifier = "nameIdentifier"
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemGray
        imageView.layer.cornerRadius = 8
        imageView.accessibilityIdentifier = "imageViewIdentifier"
        
        return imageView
    }()
    
    lazy var nekiButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Back", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 20
        button.accessibilityIdentifier = "nekiButtonIdentifier"
        return button
    }()
    
    // MARK: - Services and Data
    
    var client: Client?
    private let networking = Networking()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
        
        setupUI()
        
        setProfilePicture()
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        // 1. Add image view
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        // 2. Add name label
        view.addSubview(name)
        name.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16).isActive = true
        name.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        name.text = client?.name
        
        // 3. nekiButton
        view.addSubview(nekiButton)
        nekiButton.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 20).isActive = true
        nekiButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nekiButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        nekiButton.addTarget(self, action:#selector(tapNekiButton), for: .touchUpInside)
    }
    
    private func setProfilePicture() {
        // 0. Check if there is image url string
        if let imageUrlString = client?.picture {
            // 1. Create URL
            if let url = URL(string: imageUrlString) {
                // 2. Try to download the image based by URL
                networking.downloadImage(from: url) { imageDownloaded in
                    // 3. Always update the UI from the main thread
                    DispatchQueue.main.async() { [weak self] in
                        // 4. Set the image on UI element
                        self?.imageView.image = imageDownloaded
                    }
                }
            }
        }
    }
    
    @objc func tapNekiButton() {
        if client?.name == "Robyn Tucker" {
            let vc = LoginViewController()
            UIApplication.shared.windows.first?.rootViewController = vc
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
}
