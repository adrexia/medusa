<div class="row">
	<% include Breadcrumbs %>
	<div class="row">
		<% include Sidebar %>
		<div class="columns nine">
			<div class="main typography results-list" role="main" id="main">
				<h1 class="page-header">$Title</h1>
				$Content.RichLinks
				<% if Games %>
					<section class="pagination-content">
					<% loop Games %>
						<article class="item $EvenOdd $FirstLast clearfix">
							<header>
								<h3 id="ID-{$ID}"><a href="$Top.GameListingPage.Link{$Link}">$Title</a></h3>
								<strong class="">run by <% if MemberName %>$MemberName.LowerCase<% else %>Hydra<% end_if %></strong>
							</header>
							<div class="text pvm">
								$Brief
							</div>
						</article>
					<% end_loop %>
					</section>

					<% with Games %>
						<% include Pagination %>
					<% end_with %>
				<% else %>
					<div class="resultsHeader">
						<p class="pull-right">None</p>
					</div>

					<article class="">
						<p>No games</p>
					</article>
				<% end_if %>
				$Form
				<% include RelatedPages %>
				$PageComments
			</div>
			<footer class="content-footer columns twelve">
				<% include PrintShare %>
				<% include LastEdited %>
			</footer>
		</div>
	</div>
</div>