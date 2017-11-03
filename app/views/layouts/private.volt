<div class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header" style="width: auto;">
      <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>
      {{ link_to(null, 'class': 'navbar-brandbrand', 'Vökuró')}}
    </div>

    <div class="collapse navbar-collapse">

      <ul class="nav navbar-nav">

        {%- set menus = [
          'Home': null,
          'Settings': [
            'Users': 'users',
            'Profiles': 'profiles',
            'Permissions': 'permissions'
          ]
        ] -%}

        {%- macro drawMenu(menus = 0) %}
          {%- for key, value in menus %}

            {% if value == dispatcher.getControllerName() %}
              <li class="active">
            {% else %}
              <li>
            {% endif %}
            {%- if value is type('array') %}
              <a href="#">{{ key }} <b class="caret"></b></a>
              <ul class="dropdown-menu">
                {{ drawMenu(value) }}
              </ul>
            {% else %}
              <a href="{{ url(value) }}">{{ key }}</a>
            {%- endif %}
            </li>

          {%- endfor %}
        {%- endmacro %}

        {{ drawMenu(menus) }}

        {#%- for key, value in menus %}
          {% if value == dispatcher.getControllerName() %}
          <li class="active">{{ link_to(value, key) }}</li>
          {% else %}
          <li>{{ link_to(value, key) }}</li>
          {% endif %}
        {%- endfor -%#}

      </ul>

      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">{{ auth.getName() }} <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li>{{ link_to('users/changePassword', 'Change Password') }}</li>
          </ul>
        </li>
        <li>{{ link_to('session/logout', 'Logout') }}</li>
      </ul>
    </div>
  </div>
</div>

<div class="container">
  {{ content() }}
</div>