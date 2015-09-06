<div class="typography row content">
	<section class="eight columns">

		<article>
			<h2>$Title</h2>
			<div class="content">
				<% if CurrentMember %>
					$Content
					<% if $SiteConfig.CurrentEvent %>
						<% if $Form %>
							$Form
						<% end_if %>
					<% else %>
						<p>There is no current event set to submit games to</p>
					<% end_if %>
					$PageComments
				<% else %>
					<% if $LoggedOutMessage %>
						$LoggedOutMessage
					<% else %>

					<p>Login or Register to submit a Larp</p>
					<% end_if %>
				<% end_if %>
			</div>
		</article>
	</section>
	<aside class="four columns">
		<% if $getGamesByFacilitator %>
		<div class="sidebar">
			<div class="sidebar-inner">
				<h3 class="pt0">Games Submitted</h3>
				<ul class="unstyled">
				<% loop $getGamesByFacilitator %>
					<li>
						<a href="{$Top.Link}edit/$ID">$Title</a>
					</li>
				<% end_loop %>
				</ul>
			</div>
		</div>
		<% end_if %>
		<% include Sidebar %>
	</aside>
</div>
