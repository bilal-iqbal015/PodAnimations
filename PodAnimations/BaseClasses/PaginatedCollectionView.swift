//
//  PaginatedCollectionView.swift
//  PodAnimations
//
//  Created by Bilal Iqbal on 11/11/19.
//  Copyright © 2019 Bilal Iqbal. All rights reserved.
//

import UIKit

class PaginatedCollectionView: UICollectionViewFlowLayout {
    
    var insertingTopCells: Bool = false
    var sizeForTopInsertions: CGSize = CGSize.zero
    var lastPoint = CGPoint.zero
    
    override public func prepare() {
        super.prepare()
        
        self.scrollDirection = .horizontal
        
        let oldSize = sizeForTopInsertions
        
        if insertingTopCells {
            let newSize = collectionViewContentSize
            let xOffset = collectionView?.contentOffset.x ?? 0 + (newSize.width - oldSize.width)
            let newOffset = CGPoint(x: xOffset, y:  collectionView?.contentOffset.y ?? 0)
            collectionView?.contentOffset = newOffset
        }
        else {
            insertingTopCells = false
        }
        sizeForTopInsertions = collectionViewContentSize
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
       
//        var layoutAttributes = layoutAttributesForElements(in: collectionView!.bounds)
//
//        if layoutAttributes?.count == 0 {
//            return proposedContentOffset
//        }
//
//        var targetIndex = layoutAttributes!.count / 2
//
//        let vX = velocity.x
//
//        if vX > 0 {
//            targetIndex += 1
//        }
//        else if vX < 0 {
//            targetIndex -= 1
//        }
//        else if vX == 0 {
//            return lastPoint
//        }
//
//        if targetIndex >= layoutAttributes!.count {
//            targetIndex = layoutAttributes!.count - 1
//        }
//
//        if targetIndex < 0 {
//            targetIndex = 0
//        }
//
//        let targetAttribute = layoutAttributes?[targetIndex]
//
//        lastPoint = CGPoint(x: targetAttribute!.center.x - (collectionView?.bounds.size.width)! * 0.5, y: proposedContentOffset.y)
//
//        return lastPoint
        
        if let cv = self.collectionView {
            
            let cvBounds = cv.bounds
            let halfWidth = cvBounds.size.width * 0.5;
            let proposedContentOffsetCenterX = proposedContentOffset.x + halfWidth;
            
            if let attributesForVisibleCells = self.layoutAttributesForElements(in: cvBounds) as? [UICollectionViewLayoutAttributes] {
                
                var candidateAttributes : UICollectionViewLayoutAttributes?
                for attributes in attributesForVisibleCells {
                    
                    // == Skip comparison with non-cell items (headers and footers) == //
                    if attributes.representedElementCategory != UICollectionView.ElementCategory.cell {
                        continue
                    }
                    
                    if let candAttrs = candidateAttributes {
                        
                        let a = attributes.center.x - proposedContentOffsetCenterX
                        let b = candAttrs.center.x - proposedContentOffsetCenterX
                        
                        if fabsf(Float(a)) < fabsf(Float(b)) {
                            candidateAttributes = attributes;
                        }
                        
                    }
                    else { // == First time in the loop == //
                        
                        candidateAttributes = attributes;
                        continue;
                    }
                    
                    
                }
                
                return CGPoint(x : candidateAttributes!.center.x - halfWidth, y : proposedContentOffset.y);
                
            }
            
        }
        
        // Fallback
        return super.targetContentOffset(forProposedContentOffset: proposedContentOffset)
        
    }
        
}
