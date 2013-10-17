module ChaptersHelper
	def chapter_link(link, chapter_uid)
		c = chapter_uid.split(/[\:\.]/)
		if c[0] and c[1] and c[2]
			link_to link, show_chapter_path(c[0], c[1], c[2])
		end
	end
end
