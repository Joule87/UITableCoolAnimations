//
//  AnimationFactory.swift
//  UITableCoolAnimations
//
//  Created by Julio Collado on 1/12/20.
//  Copyright © 2020 Julio Collado. All rights reserved.
//

import UIKit

struct AnimationFactory {
    
    func getAnimation(for index: Int, isFirstLoad: Bool) -> Animation? {
        let delayFactor: Double = isFirstLoad ? 0.05 : 0
        let animation = Animations(rawValue: index)
        switch animation {
        case .ScaleOut:
            return makeScale(duration: 0.25, delayFactor: delayFactor)
        case .Fade:
            return makeFadeAnimation(duration: 0.30, delayFactor: delayFactor)
        case .BounceUp:
            return makeMoveUpWithBounce(duration: 1.0, delayFactor: delayFactor)
        case .FadeUp:
            return makeMoveUpWithFade(duration: 0.5, delayFactor: delayFactor)
        case .SlideIn:
            return makeSlideIn(duration: 0.5, delayFactor: delayFactor)
        default:
            return nil
        }
    }
    
    private func makeFadeAnimation(duration: TimeInterval, delayFactor: Double) -> Animation {
        return { cell, indexPath, _ in
            cell.alpha = 0
            
            UIView.animate(
                withDuration: duration,
                delay: delayFactor * Double(indexPath.row),
                animations: {
                    cell.alpha = 1
            })
        }
    }
    
    private func makeMoveUpWithBounce(duration: TimeInterval, delayFactor: Double) -> Animation {
        return { cell, indexPath, tableView in
            cell.transform = CGAffineTransform(translationX: 0, y: cell.frame.height)
            
            UIView.animate(
                withDuration: duration,
                delay: delayFactor * Double(indexPath.row),
                usingSpringWithDamping: 0.4,
                initialSpringVelocity: 0.1,
                options: [.curveEaseInOut],
                animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
            })
        }
    }
    
    func makeMoveUpWithFade(duration: TimeInterval, delayFactor: Double) -> Animation {
        return { cell, indexPath, _ in
            cell.transform = CGAffineTransform(translationX: 0, y: cell.frame.height / 2)
            cell.alpha = 0
            
            UIView.animate(
                withDuration: duration,
                delay: delayFactor * Double(indexPath.row),
                options: [.curveEaseInOut],
                animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
                    cell.alpha = 1
            })
        }
    }
    
    func makeSlideIn(duration: TimeInterval, delayFactor: Double) -> Animation {
        return { cell, indexPath, tableView in
            cell.transform = CGAffineTransform(translationX: tableView.bounds.width, y: 0)
            
            UIView.animate(
                withDuration: duration,
                delay: delayFactor * Double(indexPath.row),
                options: [.curveEaseInOut],
                animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
            })
        }
    }
    
    func makeScale(duration: TimeInterval, delayFactor: Double) -> Animation {
        return { cell, indexPath, tableView in
            cell.layer.transform = CATransform3DMakeScale(0,0,0)
            UIView.animate(
                withDuration: duration,
                delay: delayFactor * Double(indexPath.row),
                animations: {
                    cell.layer.transform = CATransform3DMakeScale(1,1,1)
            })
        }
    }
}
