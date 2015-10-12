<div class="typography row content">
	<section class="eight columns">
		<article>
			<h2>$Title</h2>
			<div class="content">
				<em class="">
					run by
					<% if $FacilitatorText %>
					$FacilitatorText.LowerCase
					<% else_if MemberName %>$MemberName.LowerCase<% else %>hydra<% end_if %></em>
				<div class="text pvm ">
					<p class="lead">$Brief</p>
					$Details
				</div>

				<table class="striped">
					<legend class="nonvisual-indicator">Game Details</legend>
					<tbody>
					<% if $Session %>
						<tr>
							<th>Session:</th>
							<td>$Session</td>
						</tr>
					<% end_if %>
					<% if $NumPlayers %>
						<tr>
							<th>Number of Players:</th>
							<td>$NumPlayers</td>
						</tr>
					<% end_if %>
					<% if $Restriction %>
						<tr>
							<th>Restriction:</th>
							<td>$Restriction</td>
						</tr>
					<% end_if %>
					<% if $Genre %>
						<tr>
							<th>Genres:</th>
							<td>
								<% if $getGenresList() %>
									<% loop $getGenresList() %>
										<% if $Title %>$Top.NiceString($Title)<% if not $Last %>, <% end_if %><% end_if %>
									<% end_loop %>
								<% end_if %>
							</td>
						</tr>
					<% end_if %>
					<% if $Costuming %>
						<tr>
							<th>Costume:</th>
							<td>$Costuming</td>
						</tr>
					<% end_if %>
					</tbody>
				</table>
				<% if $showEditLink %>

					<% if $getEditLink %>
					<span class="btn metro rounded medium success">
						<a href="$getEditLink">
							Edit Game
						</a>
					</span>
					<% end_if %>

					<% if $CurrentPlayers() %>
					<hr />
					<h3 class="ptxl">Current Players</h3>
					<table>
						<thead>
							<tr>
								<th>Name</th>
								<th>Email</th>
							</tr>
						</thead>
						<tbody>
						<% loop $CurrentPlayers() %>
							<tr>
								<td>$MemberName</td>
								<td>$MemberEmail</td>
							</tr>
							<% end_loop %>
						</tbody>
					</table>
					<p><em>Player details are only available to the game facilitator &amp; website admins.
						Please respect the privacy of your players.</em></p> <br />

					<% end_if %>


				<% end_if %>
			</div>
		</article>
	</section>
	<section class="four columns">
		<% include Sidebar %>
	</section>
</div>
