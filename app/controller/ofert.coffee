class OfertCtrl extends Monocle.Controller

	events: 
		"tap a#back"       		: "onBack"
		"tap a#addFavorite"     : "onAddFavorite"
		"tap a#facebook"        : "onFacebook"
		"tap a#sendhv"			: "OnSend"


	oferta = null
	initialize: (data) ->
		oferta = data
		$$('section#ofert').html('')
		view = new __View.Ofert model: data
		view.append data
		Lungo.Router.section 'ofert'
		Lungo.Notification.hide()

	onBack: ->
		do __Controller.Main.initialize

	onAddFavorite: ->
		db = window.openDatabase("SiJoven", "1.0", "Test DB", 1000000)
		db.transaction( __Controller.Ofert.Query, __Controller.Ofert.Error, __Controller.Ofert.success )

	Query: (tx) ->
		tx.executeSql('INSERT INTO favorites (PkOferta, EntidadNombre, EdadObejtivo, Oportunidad, Ubicacion, UrlFuente ) VALUES ("' + oferta.result[0].PkOferta + '","' + oferta.result[0].EntidadNombre + '","' + oferta.result[0].EdadObejtivo + '","' + oferta.result[0].Oportunidad + '","' + oferta.result[0].Ubicacion + '","' + oferta.result[0].UrlFuente + '")')

	onFacebook: ->
		window.plugins.socialsharing.share( oferta.result[0].Oportunidad, 'Te Invito a que le heches un vistazo', null, oferta.result[0].UrlFuente)

	OnSend: -> 
		window.plugin.email.open({
		    to:          [oferta.result[0].UrlFuente],
		    subject:     'Saludos este es mi perfil',
		    body:        '<style>
	.div1{
		border:1px solid #0E1350;
		width: 8cm;
		padding: 2%;		
		font:Verdana, Geneva, sans-serif;
		
		
	}
	
	.div2{
		border:1px double #0E1350;
	}
</style>

<div class="div1">
<div class="div2">
<table width="100%" border="0" align="center">
  <tr>
    <td height="41" colspan="2" align="center" valign="middle" bgcolor="#6C83EC"><h3><strong>HOJA DE VIDA</strong></h3></td>

  </tr>
  <tr>
    <td width="40%" height="4px" colspan="2" valign="middle" bgcolor="#A9B8F3">&nbsp;</td>

  </tr>
  <tr>
    <td width="40%" colspan="2" align="center" valign="middle" bgcolor="#A9B8F3"><strong>Datos Personales:</strong></td>
    
  </tr>
  <tr>
    <td width="40%" align="right" valign="middle">Nombre Completo: </td>
    <td width="60%" valign="middle">&nbsp;</td>
  </tr>

  <tr>
    <td width="40%" align="right" valign="middle">Fecha de nacimiento:</td>
    <td width="60%" valign="middle">&nbsp;</td>
  </tr>
  <tr>
    <td width="40%" align="right" valign="middle">Email:</td>
    <td width="60%" valign="middle">&nbsp;</td>
  </tr>
  <tr>
    <td width="40%" align="right" valign="middle">Cedula de Ciudadania:</td>
    <td width="60%" valign="middle">&nbsp;</td>
  </tr>
  <tr>
    <td width="40%" valign="middle">&nbsp;</td>
    <td width="60%" valign="middle">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2" align="center" valign="middle" bgcolor="#A9B8F3"><strong>Estudios</strong></td>

  </tr>
  <tr>
    <td width="40%" align="right" valign="middle">Nivel de Estudio:</td>
    <td width="60%" valign="middle">&nbsp;</td>
  </tr>
 
 
</table>
</div>
</div>',
		    isHtml:      true
		});
__Controller.Ofert = new OfertCtrl "section#ofert"