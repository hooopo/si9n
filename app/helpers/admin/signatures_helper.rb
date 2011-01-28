module Admin::SignaturesHelper
  def build_link(signature)
    if signature.status == Signature::STATUS_NAMES[:normal]
      link_to "隐藏",  hide_admin_signature_path(signature), :remote => true, :method => :post, :id => "s_#{signature.id}"
    else
      link_to "显示",  display_admin_signature_path(signature), :remote => true, :method => :post, :id => "s_#{signature.id}"
    end
  end
end
