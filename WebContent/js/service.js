function Insertar(form){
		var idinv = document[form].idinv.value;
		var marca = document[form].marca.value;
		var modelo = document[form].modelo.value;
		var serie = document[form].serie.value;
		var desc = document[form].descripcion.value;
		var xmlHttp = new XMLHttpRequest();
		xmlHttp.onreadystatechange = function(){
			if(xmlHttp.readyState == 4 && xmlHttp.status == 200) {
			      var json = eval('(' + xmlHttp.responseText +')');
			      if(json.mensaje == '1'){
			    	  alert("Registro Insertado");
			      }
			      else{
			    	  alert("Registro no Insertado");
			      }
		}}
		 xmlHttp.open("GET", "ServiceInventario.jsp?idinv="+idinv+"&marca="+ marca +"&modelo="+ modelo +"&serie="+ serie +"&descripcion="+desc+"");
		 xmlHttp.send("");
	  
	};
	