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
        
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        if let cv = self.collectionView {
            
            let cvBounds = cv.bounds
            let halfWidth = cvBounds.size.width * 0.5;
            let proposedContentOffsetCenterX = proposedContentOffset.x + halfWidth;
            
            if let attributesForVisibleCells = self.layoutAttributesForElements(in: cvBounds) as? [UICollectionViewLayoutAttributes] {
                
                var candidateAttributes : UICollectionViewLayoutAttributes?
                for attributes in attributesForVisibleCells {
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
                    else {
                        candidateAttributes = attributes;
                        continue;
                    }
                    
                    
                }
                
                return CGPoint(x : candidateAttributes!.center.x - halfWidth, y : proposedContentOffset.y);
                
            }
            
        }
        
        return super.targetContentOffset(forProposedContentOffset: proposedContentOffset)
        
    }
        
}
