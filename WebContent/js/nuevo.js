$(document).ready(function() {
$('#pinBoot').pinterest_grid({
no_columns: 4,
padding_x: 10,
padding_y: 10,
margin_bottom: 50,
single_column_breakpoint: 700
});
});

/*
Ref:
Thanks to:
http://www.jqueryscript.net/layout/Simple-jQuery-Plugin-To-Create-Pinterest-Style-Grid-Layout-Pinterest-Grid.html
*/


/*
    Pinterest Grid Plugin
    Copyright 2014 Mediademons
    @author smm 16/04/2014

    usage:

     $(document).ready(function() {

        $('#blog-landing').pinterest_grid({
            no_columns: 4
        });

    });


*/
;(function ($, window, document, undefined) {
    var pluginName = 'pinterest_grid',
        defaults = {
            padding_x: 10,
            padding_y: 10,
            no_columns: 3,
            margin_bottom: 50,
            single_column_breakpoint: 700
        },
        columns,
        $article,
        article_width;

    function Plugin(element, options) {
        this.element = element;
        this.options = $.extend({}, defaults, options) ;
        this._defaults = defaults;
        this._name = pluginName;
        this.init();
    }

    Plugin.prototype.init = function () {
        var self = this,
            resize_finish;

        $(window).resize(function() {
            clearTimeout(resize_finish);
            resize_finish = setTimeout( function () {
                self.make_layout_change(self);
            }, 11);
        });

        self.make_layout_change(self);

        setTimeout(function() {
            $(window).resize();
        }, 500);
    };

    Plugin.prototype.calculate = function (single_column_mode) {
        var self = this,
            tallest = 0,
            row = 0,
            $container = $(this.element),
            container_width = $container.width();
            $article = $(this.element).children();

        if(single_column_mode === true) {
            article_width = $container.width() - self.options.padding_x;
        } else {
            article_width = ($container.width() - self.options.padding_x * self.options.no_columns) / self.options.no_columns;
        }

        $article.each(function() {
            $(this).css('width', article_width);
        });

        columns = self.options.no_columns;

        $article.each(function(index) {
            var current_column,
                left_out = 0,
                top = 0,
                $this = $(this),
                prevAll = $this.prevAll(),
                tallest = 0;

            if(single_column_mode === false) {
                current_column = (index % columns);
            } else {
                current_column = 0;
            }

            for(var t = 0; t < columns; t++) {
                $this.removeClass('c'+t);
            }

            if(index % columns === 0) {
                row++;
            }

            $this.addClass('c' + current_column);
            $this.addClass('r' + row);

            prevAll.each(function(index) {
                if($(this).hasClass('c' + current_column)) {
                    top += $(this).outerHeight() + self.options.padding_y;
                }
            });

            if(single_column_mode === true) {
                left_out = 0;
            } else {
                left_out = (index % columns) * (article_width + self.options.padding_x);
            }

            $this.css({
                'left': left_out,
                'top' : top
            });
        });

        this.tallest($container);
        $(window).resize();
    };

    Plugin.prototype.tallest = function (_container) {
        var column_heights = [],
            largest = 0;

        for(var z = 0; z < columns; z++) {
            var temp_height = 0;
            _container.find('.c'+z).each(function() {
                temp_height += $(this).outerHeight();
            });
            column_heights[z] = temp_height;
        }

        largest = Math.max.apply(Math, column_heights);
        _container.css('height', largest + (this.options.padding_y + this.options.margin_bottom));
    };

    Plugin.prototype.make_layout_change = function (_self) {
        if($(window).width() < _self.options.single_column_breakpoint) {
            _self.calculate(true);
        } else {
            _self.calculate(false);
        }
    };

    $.fn[pluginName] = function (options) {
        return this.each(function () {
            if (!$.data(this, 'plugin_' + pluginName)) {
                $.data(this, 'plugin_' + pluginName,
                new Plugin(this, options));
            }
        });
    }

})(jQuery, window, document);

$(document).ready(function() {
    $("div.bhoechie-tab-menu>div.list-group>a").click(function(e) {
    	alert("presioneeeeee")
        e.preventDefault();
        $(this).siblings('a.active').removeClass("active");
        $(this).addClass("active");
        var index = $(this).index();
        $("div.bhoechie-tab>div.bhoechie-tab-content").removeClass("active");
        $("div.bhoechie-tab>div.bhoechie-tab-content").eq(index).addClass("active");
    });
});

function capturaId(form, id){
	var x = document.createElement("INPUT");
	x.setAttribute("type", "hidden");
	x.setAttribute("value", id);
	x.setAttribute("name", "id");
	document.getElementById(form.getAttribute("id")).appendChild(x);
	
	document.forms[form.getAttribute("id")].submit();
}


	function show(form, Id){
		var id = Id;
		document[form].id_persona.value=id
		var AJAX = new XMLHttpRequest();
		 AJAX.onreadystatechange = function(){
			if(AJAX.readyState == 4 && AJAX.status == 200) {
			      var json = eval('(' + AJAX.responseText +')');
			      document[form].nombre.value=json.nombre;
			      document[form].apellido.value=json.apellido;
			      document[form].direccion.value=json.direccion;
			      document[form].nick.value=json.nick;
			      document[form].pass.value=json.pass;
			      document[form].sexo.value=json.sexo;
			      document[form].clave.value=document[form].pass.value;
			      document[form].userp.value=document[form].nick.value;
			      alert(document[form].clave.value)
			  }else if (AJAX.readyState == 4 && AJAX.status != 200) {
			    alert('Algo no esta bien... Error...');
			  }
		}
		 AJAX.open("GET", "./editarUsuarios.jsp?id="+id+"");
		 AJAX.send("");
		 n();
		 //alert("service.jsp?username="+miusuario);
	  
	};
function n(){
	$(".fade").modal("show");
}
function limpiar(form){
	document[form].id_persona.value="";
	document[form].nombre.value="";
    document[form].apellido.value="";
    document[form].direccion.value="";
    document[form].sexo.value="";
    document[form].nick.value="";
    document[form].pass.value="";
}
function buscachk(obj){
	if(this.checked){
		alert("aki")
	}
}

function nuevoU(form, id){
	alert("aki toi");
	document[form].id.value=id;
	$(".nuevo").modal("show");
}

function Md5edit(form){
	alert(document[form].clave.value)
   if(document[form].pass.value != document[form].clave.value){
	   var  mypass =  md5(document[form].nick.value)+md5(document[form].pass.value);
		document[form].pass.value = md5(mypass)
   }else{
	   if(document[form].clave.value == ""){
		   var  mypass =  md5(document[form].nick.value)+md5(document[form].pass.value);
			document[form].pass.value = md5(mypass)
			alert(document[form].pass.value)
	   }
   }
	  
   
     document[form].submit();
  
 }
function Md5Log(form){
	var  mypass =  md5(document[form].nick.value)+md5(document[form].pass.value);
	document[form].pass.value = md5(mypass)
	alert(document[form].pass.value)
	document[form].submit();
}
// ANIMACION DE MENUUU
$(function(){

    $('#show').on('click',function(){        
        $('.card-reveal').slideToggle('slow');
    });
    
    $('.card-reveal .close').on('click',function(){
        $('.card-reveal').slideToggle('slow');
    });
});