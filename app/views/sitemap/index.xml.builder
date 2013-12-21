xml.instruct!
xml.urlset(
  'xmlns'.to_sym => "http://www.sitemaps.org/schemas/sitemap/0.9",
  'xmlns:image'.to_sym => "http://www.google.com/schemas/sitemap-image/1.1"
) do

	xml.url do 
		xml.loc "#{root_url}"
		xml.changefreq "always"
		xml.priority "1.0"
	end

	xml.url do 
		xml.loc "#{rvs_url}"
		xml.changefreq "weekly"
		xml.priority "0.9"
	end

	xml.url do 
		xml.loc "#{parts_url}"
		xml.changefreq "monthly"
		xml.priority "0.8"
	end

	xml.url do 
		xml.loc "#{services_url}"
		xml.changefreq "monthly"
		xml.priority "0.8"
	end

	xml.url do 
		xml.loc "#{contact_url}"
		xml.changefreq "never"
		xml.priority "0.8"
	end

	@rvs.each do |rv|
		xml.url do 
		xml.loc "#{rv_url(rv)}"
		xml.changefreq "never"
		xml.priority "0.7"
		end
	end

	@parts.each do |part|
		xml.url do 
		xml.loc "#{part_url(part)}"
		xml.changefreq "never"
		xml.priority "0.6"
		end
	end

	@services.each do |service|
		xml.url do 
		xml.loc "#{service_url(service)}"
		xml.changefreq "never"
		xml.priority "0.6"
		end
	end
end