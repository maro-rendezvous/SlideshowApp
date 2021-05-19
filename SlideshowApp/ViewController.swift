//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 落合克彦 on 2021/05/19.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    // 配列に指定するindex番号を宣言
    var nowIndex:Int = 0

    // スライドショーに使用するタイマーを宣言
    var timer: Timer!

    // スライドショーさせる画像の配列を宣言
    var imageArray:[UIImage] = [
        UIImage(named: "image1")!,
        UIImage(named: "image2")!,
        UIImage(named: "image3")!,
        UIImage(named: "image4")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = imageArray[0]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if (timer != nil) {
            //画面遷移時にタイマーを停止する
            timer.invalidate()

            setButtonProperty(true)
        }
        
        // segueから遷移先のResultViewControllerを取得する
        let expansionViewController:ExpansionViewController = segue.destination as! ExpansionViewController
        // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
        expansionViewController.image = imageArray[nowIndex]
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }

    @IBAction func forward(_ sender: Any) {
        changeImage()
    }
    
    @IBAction func back(_ sender: Any) {
        changeImageBack()
    }
    
    @IBAction func slideShowButton(_ sender: Any) {
        // 再生中か停止しているかを判定
        if (timer == nil) {
            // 再生時の処理を実装

            // タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)

            //ボタン無効
            setButtonProperty(false)

        } else {
            // 停止時の処理を実装
            // タイマーを停止する
            timer.invalidate()

            // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
            timer = nil

            //ボタン有効
            setButtonProperty(true)
            
        }
    }
    
    @objc func setButtonProperty(_ flag:Bool) {
        //ボタン有効無効
        forwardButton.isEnabled = flag
        backButton.isEnabled = flag
        //ボタン名変更
        if (flag) {
            startButton.setTitle("再生", for: .normal)
        } else {
            startButton.setTitle("停止", for: .normal)
        }
    }
    
    @objc func changeImage() {
        // indexを増やして表示する画像を切り替える
        nowIndex += 1

        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
    }
    
    @objc func changeImageBack() {

        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == 0) {
            // indexを一番最初の数字に戻す
            nowIndex = imageArray.count - 1
        } else {
            nowIndex -= 1
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
    }
}

