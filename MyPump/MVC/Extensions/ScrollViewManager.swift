//
//  ScrollViewManager.swift
//  MyPump
//
//  Created by Александр Майко on 30.01.2021.
//

import UIKit

//class ScrollViewManager: UIScrollView {
//    
//    var imageZoomView: UIImageView!
//    
//    lazy var zoomingTap: UITapGestureRecognizer = { // функция для приближения по щелчку
//        let zoomingTap = UITapGestureRecognizer(target: self, action: #selector(handleZoomingTap))
//        zoomingTap.numberOfTapsRequired = 2 // кол-во щелчков для сробатывания метода
//        return zoomingTap
//    }()
//    
//    func set(image: UIImage){
//        //        imageZoomView.removeFromSuperview()
//        //        imageZoomView = nil
//        //
//        imageZoomView = UIImageView(image: image)
//        self.addSubview(imageZoomView)
//        configurateFor(imageSize: image.size)
//        self.zoomScale = self.minimumZoomScale
//        
//        self.imageZoomView.addGestureRecognizer(self.zoomingTap)
//        self.imageZoomView.isUserInteractionEnabled = true
//    }
//    func configurateFor(imageSize: CGSize) { // устанавливаем границы скролвью по размеру входящего изображения
//        self.contentSize = imageSize
//        // self.minimumZoomScale = 1
//        //  self.maximumZoomScale = 0.3
//        setCurrnetMinandMaxZoomScale()
//        self.zoomScale = self.minimumZoomScale
//        
//    }
//    override func layoutSubviews() { // функция следит за нашими действия и срабатывает каждый раз тогда, когда  наша картинка меняется (приближается или отдаляется)
//        super.layoutSubviews()
//        
//        self.centerImage() // запускает нашу функцию по отцентровыванию изображения
//    }
//    //
//    func setCurrnetMinandMaxZoomScale() {// делаем функцию, позволяющую по умолчанию возвращать изображение к размерам экрана устройства
//        let boundsSize = self.bounds.size //фиксируем рамки
//        let imageSize = imageZoomView.bounds.size //фиксируем изображения
//        
//        let xScale = boundsSize.width / imageSize.width
//        let yScale = boundsSize.height / imageSize.height
//        
//        let minScale = min(xScale, yScale)
//        
//        var maxScale: CGFloat = 1.0
//        if minScale < 0.1 {
//            maxScale = 0.3
//        }
//        if minScale >= 1.0 && minScale < 0.3 {
//            maxScale = 0.7
//        }
//        if minScale > 0.5 {
//            maxScale = max(1.0, minScale)
//        }
//        self.minimumZoomScale = minScale// минимальный и максимальный zoomScale в зависимости от величины нашего изображения
//        self.maximumZoomScale = maxScale
//    }
//    
//    func centerImage() { //центрируем наше изображение
//        let boundsSize = self.bounds.size //снова фиксируем размер нашего устройства
//        var frameToCenter = imageZoomView.frame // ???
//        if frameToCenter.size.width < boundsSize.width {
//            frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width) / 2
//        } else {
//            frameToCenter.origin.x = 0
//        }
//        
//        
//        if frameToCenter.size.height < boundsSize.height {
//            frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height) / 2
//        } else {
//            frameToCenter.origin.y = 0
//        }
//        imageZoomView.frame = frameToCenter
//    }
//    // MARK: - к GESTURE относится
//    
//    @objc func handleZoomingTap(sender: UITapGestureRecognizer) { // функция для "улавливания" места куда мы нажали
//        let location = sender.location(in: sender.view)
//        self.zoom(point: location, animated: true)
//    }
//    
//    
//    func zoom(point: CGPoint, animated: Bool) {//функция для приближения по щелчку
//        let currectScale = self.zoomScale
//        let minScale = self.minimumZoomScale
//        let maxScale = self.maximumZoomScale
//        
//        if (minScale == maxScale && minScale > 1) {// если минимальный scale = максимальному scale и при этом   мин. scale > 1, то просто возвращаем return
//            return
//        } //иначе
//        
//        let toScale = maxScale
//        let finalScale = (currectScale == minScale) ? toScale : minScale // если currnetScale = minScale, то finalScale равен toScale, если нет, то = minScale
//        let zoomRect = self.zoomRect(scale: finalScale, center: point)
//        self.zoom(to: zoomRect, animated: animated)
//    }
//    
//    func zoomRect(scale: CGFloat, center: CGPoint) -> CGRect{
//        
//        var zoomRect = CGRect.zero
//        let bounds = self.bounds
//        zoomRect.size.width = bounds.size.width / scale
//        zoomRect.size.height = bounds.size.height / scale
//        zoomRect.origin.x =  center.x - (zoomRect.size.width / 2)
//        zoomRect.origin.y =  center.y - (zoomRect.size.height / 2)
//        
//        return zoomRect
//    }
//    
//    override init (frame: CGRect) {// указываем кто будет использовать методы и свойства делегата
//        super.init(frame: frame)
//        self.delegate = self
//        self.showsVerticalScrollIndicator = false //убираем вертикальный индикатор
//        self.showsHorizontalScrollIndicator = false // убираем горизонт. индикатор
//        self.decelerationRate = UIScrollView.DecelerationRate.fast //   скорость скролинга
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//}
//
//
//extension ScrollViewManager:  UIScrollViewDelegate  {
//    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
//        return self.imageZoomView
//    }
//    
//    func scrollViewDidZoom(_ scrollView: UIScrollView) {//функция позволяет изображению уменьшаться и возвращаться в центр экрана, собственно, через центр,а не верхний левый угол
//        centerImage()
//    }
//
//}
