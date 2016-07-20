<footer class="footer" role="contentinfo">
	<div class="row">
		<div class="columns twelve">
			<p class="right">&copy; NZLarps 2016</p>

		</div>
	</div>
	<div class="navbar">
		<% if SiteConfig.FooterLinks%>
		<ul>
			<% loop SiteConfig.FooterLinks %>
				<li><a href="$Link">$Name</a></li>
			<% end_loop %>
		</ul>
		<% end_if %>
		<% if SiteConfig.FacebookURL || SiteConfig.TwitterUsername %>

			<% if SiteConfig.TwitterUsername %>
				<a class="meta-data pts pull-right" href="http://www.twitter.com/$SiteConfig.TwitterUsername"><i class="icon-twitter icon-dark" aria-hidden="true"></i><span class="nonvisual-indicator">Follow us on Twitter</span></a>
			<% end_if %>
			<% if SiteConfig.FacebookURL %>
				<a class="meta-data pts pull-right" href="http://www.facebook.com/$SiteConfig.FacebookURL"><i class="icon-facebook icon-dark" aria-hidden="true"></i><span class="nonvisual-indicator">Join us on Facebook</span></a>
			<% end_if %>

		<% end_if %>
	</div>
</footer>

<a href="$BaseHref" class="logo-footer" title="home"></a>
