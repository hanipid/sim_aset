{{ content() }}

<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">Kode Barang [{{ parent.nama|upper }}]</h3>
  </div>
  <div class="panel-body">
    
    <div>

      <!-- Nav tabs -->
      {% set url = url('kode_barang/jenis/'~(level - 1)~'/'~parent.parent) %}
      <?php 
        $tk = explode(".",$tmpKode); 
        // var_dump($tk);
        // $tmpKode = $tk[0];
        // for ($i = 1; $i < $level; $i++)
        // {
        //   $tmpKode .= '.'.$tk[$i];
        // }
        //   echo "<br>".$tmpKode.'<br>';
        // <!--  -->
        // <!-- [[ kode buat menu tab menggunakan array push ]] -->
        // <!--  -->
      ?>
      <ul class="nav nav-tabs" role="tablist">
        <li role="presentation"><a href="{{ url('kode_barang/kelompok') }}">Kelompok</a></li>
        <li role="presentation" {% if level == 3 %}class="active"{% endif %}>
          <a href="{{url('kode_barang/jenis/3/'~parent.parent~'/'~tk[0]~'.'~tk[1])}}" {% if level < 3 %}disabled="disabled"{% endif %}>Jenis</a>
          <!-- <a href="{{url~'/'~tmpKode}}" {% if level < 3 %}disabled="disabled"{% endif %}>Jenis</a> -->
        </li>
        <li role="presentation" {% if level == 4 %}class="active"{% endif %}>
          <a href="{{url('kode_barang/jenis/4/'~parent.parent~'/'~tk[0]~'.'~tk[1]~'.'~tk[2])}}" class="btn" {% if level < 4 %}disabled="disabled"{% endif %}>Objek</a>
          <!-- <a href="{{url~'/'~tmpKode}}" class="btn" {% if level < 4 %}disabled="disabled"{% endif %}>Objek</a> -->
        </li>
        <li role="presentation" {% if level == 5 %}class="active"{% endif %}>
          <a href="{{url('kode_barang/jenis/5/'~parent.parent~'/'~tk[0]~'.'~tk[1]~'.'~tk[2]~'.'~tk[3])}}" class="btn" {% if level < 5 %}disabled="disabled"{% endif %}>Rincian Objek</a>
          <!-- <a href="{{url~'/'~tmpKode}}" class="btn" {% if level < 5 %}disabled="disabled"{% endif %}>Rincian Objek</a> -->
        </li>
        <li role="presentation" {% if level == 6 %}class="active"{% endif %}>
          <a href="{{url('kode_barang/jenis/6/'~parent.parent~'/'~tk[0]~'.'~tk[1]~'.'~tk[2]~'.'~tk[3])~'.'~tk[4]}}" class="btn" {% if level < 6 %}disabled="disabled"{% endif %}>Sub Rincian Objek</a>
          <!-- <a href="{{url~'/'~tmpKode}}" class="btn" {% if level < 6 %}disabled="disabled"{% endif %}>Sub Rincian Objek</a> -->
        </li>
        <li role="presentation" {% if level == 7 %}class="active"{% endif %}>
          <a href="{{url~'/'~tmpKode}}" class="btn" {% if level < 7 %}disabled="disabled"{% endif %}>Sub Sub Rincian Objek</a>
        </li>
      </ul>

      <!-- Tab panes -->
      <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="jenis">
          <div class="pull-right">
            <a href="#" class="btn btn-success" data-toggle="modal" data-target="#modalTambah">Tambah</a>
          </div>
          <div class="row">
            <div class="col-md-8 col-md-offset-1">
              <form action="">
                <div class="input-group">
                  <input type="text" class="form-control" placeholder="Search">
                  <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><i class="fa fa-search"></i></button>
                  </span>
                </div>
              </form>
            </div>
          </div> <!-- .row -->
          <div class="row">
            <div class="col-md-6">
            {% for a in paginator.items %}
              {% set nextLevel = a.level + 1 %}
              
              <div class="row">
                <div class="col-xs-10">
                  <a href="{{ url('kode_barang/jenis/'~nextLevel~'/'~a.idak~'/'~tmpKode~a.kdak) }}" class="btn btn-block btn-primary">
                    <span class="pull-left">{{tmpKode}}{{a.kdak}} {{ a.nama|upper }}</span>&nbsp;
                  </a>
                </div>
                <div class="col-xs-2">
                  <a href="#" onclick="loadDynamicContentModal('{{a.idak}}','{{a.nama}}')" class="btn btn-warning" data-toggle="modal" data-target="#modalEdit">Edit</a>
                </div>
              </div>    

              {% if loop.index % 5 == 0  %}
                </div> <!-- .col-md-6 -->
                <div class="col-md-6">
              {% endif %}
              
            {% endfor %}
            </div> <!-- .col-md-6 -->
          </div>
          <div class="row">
            <div class="col-md-12">
              <nav aria-label="Page navigation">
                {% if paginator.total_pages > 1 %}
                {% set controller = this.view.getControllerName()|lower  %}
                {% set action = this.view.getActionName()|lower %}
                {% set startIndex = 1 %}
                {% if paginator.total_pages > 5 %}
                  {% if paginator.current > 3 %}
                      {% set startIndex = startIndex + paginator.current - 3 %}
                  {% endif %}
                  {% if paginator.total_pages - paginator.current < 5 %}
                      {% set startIndex = paginator.total_pages - 4 %}
                  {% endif %}
                {% endif %}
                  <ul class="pagination pagination-sm m-t-none m-b-none">
                      {% if paginator.current > 1 %}
                          <li>{{ link_to(controller ~ '/' ~ action ~ '/' ~ idak, 'data-page' : paginator.first, '<i class="fa fa-angle-double-left"></i>', 'title' : 'Go to page ' ~ paginator.next) }}</li>
                      {% endif %}
                      {% for pageIndex in startIndex..paginator.total_pages %}
                          {% if pageIndex is startIndex + 5 %}
                              {% break %}
                          {% endif %}

                          <li {% if pageIndex is paginator.current %}class="active"{% endif %}>
                              {{ link_to(controller ~ '/' ~ action ~ '/' ~ idak ~ '?p=' ~ pageIndex, pageIndex, 'data-page' : pageIndex, 'title' : 'Go to page ' ~ pageIndex) }}
                          </li>
                      {% endfor %}

                      {% if paginator.current < paginator.total_pages %}
                          <li>{{ link_to(controller ~ '/' ~ action ~ '/' ~ idak ~ '?p=' ~ paginator.last, 'data-page' : paginator.last, '<i class="fa fa-angle-double-right"></i>', 'title' : 'Go to page ' ~ paginator.last) }}</li>
                      {% endif %}
                  </ul>
                {% endif %}
              </nav>
            </div>
          </div>
        </div>
      </div>

    </div>

  </div>
</div>

<div class="modal fade" id="modalTambah" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Tambah Jenis</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="post" action="{{url('kode_barang/jenis/'~level~'/'~idak~'/'~tmpKode)}}">
          <div class="form-group">
            <label for="kode" class="col-sm-3 control-label">Kode</label>
            <div class="col-sm-9">
              <div class="input-group">
                <span class="input-group-addon">{{tmpKode}}</span>
                <input type="text" class="form-control" name="kode" id="kode" placeholder="Kode">
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="nama" class="col-sm-3 control-label">Nama Jenis</label>
            <div class="col-sm-9">
              <input type="text" class="form-control" name="nama" id="nama" placeholder="Nama Jenis">
            </div>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
        </form>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="modalEdit" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Edit Jenis</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="post" action="{{url('kode_barang/editJenis/'~tmpKode~'/'~idak)}}">
          <div id="demo-modal"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save changes</button>
        </form>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
  function loadDynamicContentModal(idak) {
    var options = {
      modal : true,
      height : 300,
      width : 500
    };
    $('#demo-modal').load('{{ url("kode_barang/editJenis/"~tmpKode~"/") }}'+idak,
      function(res, status, xhr) {
        $('#bootstrap-modal').modal({
          show : true
        });
      }
    );
  }
</script>