{{ content() }}
<div class="previous pull-left">
  {#{ link_to("posts/index", "&larr; Go Back", "class": "btn btn-default") }#}
  <form class="form" action="{{ url('posts/index') }}" method="get">
    <div class="form-group">
      <div class="input-group">
        <input type="text" name="q" placeholder="Search" class="form-control">
        <div class="input-group-addon"><i class="fa fa-search"></i></div>
      </div>
    </div>
  </form>
</div>
<div class="pull-right">
  {{ link_to("posts/create", "<i class='fa fa-plus'></i> Create posts", "class": "btn btn-primary") }}
</div>

{% if page.items %}
  <table class="table table-striped" align="center">
    <thead>
      <tr>
        <th>Publish Date</th>
        <th>Title</th>
      </tr>
    </thead>
    <tbody>

      {% for post in page.items %}

        <tr>
          <td width="100">{{ date('d/m/Y', strtotime(post.published_at)) }}</td>
          <td>
            <strong style="font-weight:600;">{{ post.title }}</strong> 
            <span class="badge pull-right">
              <a href="{{ url('posts/index/?c='~post.category) }}"><i class="fa fa-tag"></i> {{ post.categories.name }}</a>
            </span>
            <br>
            {% if post.status == "publish" %}
              <i class="text-success">Published</i>
            {% elseif post.status == "draft" %}
              <i class="text-warning">Draft</i>
            {% endif %}
          </td>
          <td width="60" class="text-center">
            
            {{ link_to("posts/create/" ~ post.id, '<i class="fa fa-edit"></i>', "class": "btn btn-info btn-block") }}
          </td>
          <td width="60" class="text-center">

            {{ link_to("posts/delete/" ~ post.id, '<i class="fa fa-trash"></i>', "class": "btn btn-danger btn-block", "onclick": "return confirm('Are you sure?')") }}
          </td>
        </tr>

      {% endfor %}

    </tbody>
    <tbody>
      <tr>
        <td colspan="10" align="right">
          <nav aria-label="Page navigation">
            <ul class="pagination">
              {% if keywords != null %}
                {% set query = "?q="~keywords %}
              {% elseif category != null %}
                {% set query = "?c="~category %}
              {% endif %}
              <li>
                <a href='{{ url("posts") }}' aria-label="First">
                  <span aria-hidden="true">&laquo;</span>
                </a>
              </li>
                <li>
                  <a href='{{ url("posts/index/"~page.before~"/"~query) }}' aria-label="Previous">
                    <span aria-hidden="true">&lsaquo;</span>
                  </a>
                </li>
              <li><a href="">Page {{ page.current~" from "~page.total_pages }} pages.</a></li>
              <li>
                <a href='{{ url("posts/index/"~page.next~"/"~query) }}' aria-label="Next">
                  <span aria-hidden="true">&rsaquo;</span>
                </a>
              </li>
              <li>
                <a href='{{ url("posts/index/"~page.last~"/"~query) }}' aria-label="Last">
                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
            </ul>
          </nav>
        </td>
      </tr>
    <tbody>
  </table>
{% else %}
  <div class="col-md-12">
    No Post Recorded 
  </div>
{% endif %}