module ApplicationHelper
	def chapter_path(chapter_uid)
		c = chapter_uid.split(/[\:\.]/)
		if c.count >= 3
			show_chapter_path(c[0], c[1], c[2])
		end
	end

	def shorten_version_name(version_name)
		version_name.split(/[,(]/).first
	end
end
