
public class HSBFloatingTableView: UITableView {
	
	public enum Position {
		case top
		case bottom
	}
	public var isMargin = false
	public var margin: CGFloat = 0
	public var position: Position = .bottom
	public var embedView: UIView?
	public var height: CGFloat = 30
	public var width: CGFloat?
	
	public func show() {
		resizeView()
	}
	
	public func hide() {
		removeFromSuperview()
	}
	
	fileprivate func resizeView() {
		
		removeFromSuperview()
		
		guard let view = embedView, let superview = superview(view: view) else {
			return
		}
		
		var viewFrame = view.frame
		viewFrame = superview.convert(viewFrame, from: view.superview)
		
		if height == UITableView.automaticDimension {
			viewFrame.size.height = contentSize.height
		} else {
			viewFrame.size.height = height
		}
		
		superview.addSubview(self)
		superview.bringSubviewToFront(self)
		switch position {
		case .bottom:
			viewFrame.origin.y = view.frame.origin.y + view.frame.height
		case .top:
			viewFrame.origin.y = view.frame.origin.y - viewFrame.size.height
		}
		
		viewFrame.size.width = width ?? viewFrame.size.width
		
		if isMargin {
			switch position {
			case .top where viewFrame.origin.y < margin:
				
				viewFrame.size.height = viewFrame.size.height + viewFrame.origin.y - margin
				viewFrame.origin.y = margin
				
				break
			case .bottom where viewFrame.origin.y + viewFrame.height > superview.frame.height - margin:
				viewFrame.size.height = superview.frame.height - (viewFrame.origin.y + superview.frame.height - superview.frame.height) - margin
			default:
				break
			}
		}
		
		frame = viewFrame
	}
	
	fileprivate func superview(view: UIView) -> UIView? {
		
		var superview = view.superview
		
		while superview?.superview != nil {
			superview = superview?.superview
		}
		
		return superview
	}
	
	public override func reloadData() {
		super.reloadData()
		resizeView()
	}
}
