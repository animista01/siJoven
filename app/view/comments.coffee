class __View.Comments extends Monocle.View

	container: "section#comments"
	template: """
		<header>
			<p class="title centered">{{#establecimiento}} {{name}} {{/establecimiento}}</p>
   		</header>
	    <article id="art-comments" class="list scroll indented active">
			<ul>
				{{#result}}
					<li class="theme" id="{{id}}">
			            <strong>{{comment}}</strong>
						<small>- {{user}}</small>
			        </li>
				{{/result}}
			</ul>
			<br>
			<div class="form">
				<fieldset>
	                <textarea placeholder="Write something..." id="txtComment"></textarea>
	            </fieldset>
	            <a href="#" data-action="saveComment" class="button small accept margin-top on-right">
	            	<span class="icon ok"></span><abbr>Enviar</abbr>
	            </a>
			</div>
	    </article>
	    <footer>
	        <nav>
	            <a href="#" data-action="back" id="{{#establecimiento}}{{id}}{{/establecimiento}}">
					<span class="icon chevron-left"></span>
	            </a>
	        </nav>
	    </footer>
		"""