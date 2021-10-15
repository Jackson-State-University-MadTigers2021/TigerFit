//
//  ExerciseViewController.swift
//  TigerFit
//
//  Created by Kyla Wilson on 4/25/21.
//

import UIKit
import AVFoundation

class ExerciseViewController: UIViewController {
    
    @IBOutlet weak var videoView: UIView!

    @IBOutlet weak var exerciseTitle: UILabel!
    @IBOutlet weak var exerciseDescription: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var intensityLabel: UILabel!
    
    public var exercise: Exercise!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupNavigationBar()
        
        SetupVideoPlayer(videoPathURL: exercise.videoPath!)
        exerciseTitle.text = "\(exercise.name!)"
        exerciseDescription.text = "\(exercise.description!)"
        timeLabel.text = "\(exercise.time!)"
        intensityLabel.text = "\(exercise.intensity!)"
    }
    
    @objc func GoBack() {
        navigationController?.popViewController(animated: true)
    }
    
    func SetupNavigationBar() {
        self.title = "Today's Workout"
        
        let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 30))
        backButton.setTitle(" BACK", for: .normal)
        backButton.titleLabel?.Spacing(spacing: 1.8)
        backButton.titleLabel?.textAlignment = .left
        backButton.setTitleColor(APP_THEME_COLOR, for: .normal)
        backButton.setImage(UIImage(systemName: "arrow.backward")?.withTintColor(APP_THEME_COLOR, renderingMode: .alwaysTemplate), for: .normal)
        backButton.addTarget(self, action: #selector(GoBack), for: .touchUpInside)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
        let newMealButton = UIButton()
        newMealButton.setImage(UIImage(systemName: "goforward")?.withTintColor(APP_THEME_COLOR, renderingMode: .alwaysTemplate), for: .normal)
        newMealButton.target(forAction: #selector(GoBack), withSender: self)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: newMealButton)
        
        navigationController?.navigationBar.tintColor = APP_THEME_COLOR
    }
    
    func SetupVideoPlayer(videoPathURL: String) {
        guard let path = Bundle.main.path(forResource: videoPathURL, ofType:"mp4") else {
            debugPrint("video not found")
                return
        }
        
        let player = AVPlayer(url: URL(fileURLWithPath: path))

        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.videoView.frame
        playerLayer.frame.size.width = self.view.frame.width
        playerLayer.contentsScale = 1
        playerLayer.videoGravity = .resizeAspectFill
        self.view.layer.addSublayer(playerLayer)
        player.play()
    }

}
