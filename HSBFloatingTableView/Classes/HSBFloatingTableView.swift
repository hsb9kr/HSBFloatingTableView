
public class HSBFloatingTableView: UITableView {
	
	public enum Position {
		case top
		case bottom
	}
	
	public override var isHidden: Bool {
		
		didSet {
			if isHidden {
				removeFromSuperview()
			} else {
				resizeView()
			}
		}
	}
	public var isMargin = false
	public var margin: CGFloat = 0
	public var position: Position = .bottom
	public var embedView: UIView?
	public var maxHeight: CGFloat?
	public var width: CGFloat?
	
	public override init(frame: CGRect, style: UITableView.Style) {
		super.init(frame: frame, style: style)
		isHidden = true
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		isHidden = true
	}
	
	fileprivate func resizeView() {
		
		removeFromSuperview()
		
		guard !isHidden, let view = embedView, let superview = superview(view: view) else {
			return
		}
		
		var viewFrame = view.frame
		
		viewFrame = superview.convert(viewFrame, from: view.superview)
		
		if let height = maxHeight {
			viewFrame.size.height = contentSize.height > height ? height : contentSize.height
		} else {
			viewFrame.size.height = contentSize.height
		}
		
		superview.addSubview(self)
		superview.bringSubviewToFront(self)
		switch position {
		case .bottom:
			viewFrame.origin.y = viewFrame.origin.y + view.frame.height
		case .top:
			viewFrame.origin.y = viewFrame.origin.y - viewFrame.height
		}
		
		viewFrame.size.width = width ?? viewFrame.size.width
		
		if isMargin {
			switch position {
			case .top where viewFrame.origin.y < margin:
				
				let height = viewFrame.size.height + viewFrame.origin.y - margin
				viewFrame.size.height = height < 0 ? 0 : height
				viewFrame.origin.y = margin
				
				break
			case .bottom where viewFrame.origin.y + viewFrame.height > superview.frame.height - margin:
				let height = superview.frame.height - (viewFrame.origin.y + superview.frame.height - superview.frame.height) - margin
				viewFrame.size.height = height < 0 ? 0 : height
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
