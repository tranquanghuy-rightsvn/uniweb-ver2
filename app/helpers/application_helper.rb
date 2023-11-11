module ApplicationHelper
  def display_status_order(status)
    case status
    when 'new_order'
      "<span class='badge bg-light text-dark'>Đơn hàng mới</span>".html_safe
    when 'confirming_paid'
      "<span class='badge bg-warning text-dark'>Khàng hàng nói rằng đã chuyển tiền</span>".html_safe
    when 'paid'
      "<span class='badge bg-secondary'>Khàng hàng đã chuyển tiền</span>".html_safe
    when 'deliver'
      "<span class='badge bg-info text-dark'>Đang giao hàng</span>".html_safe
    when 'completed'
      "<span class='badge bg-success'>Đã xong</span>".html_safe
    when 'rejected'
      "<span class='badge bg-danger'>Đã hủy</span>".html_safe
    end
  end
end
