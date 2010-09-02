module ApplicationHelper
  def title(*parts)
    @title = (parts << "Biljett").join(" - ") unless parts.empty?
    @title || "Biljett"
  end
end
