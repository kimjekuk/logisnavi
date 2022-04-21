var wms_layers = [];

var format____0 = new ol.format.GeoJSON();
var features____0 = format____0.readFeatures(json____0, 
            {dataProjection: 'EPSG:4326', featureProjection: 'EPSG:3857'});
var jsonSource____0 = new ol.source.Vector({
    attributions: ' ',
});
jsonSource____0.addFeatures(features____0);
var lyr____0 = new ol.layer.Vector({
                declutter: true,
                source:jsonSource____0, 
                style: style____0,
                interactive: true,
    title: '대한민국_시군구_맵핑준비<br />\
    <img src="styles/legend/___0_0.png" /> 8866 - 34175<br />\
    <img src="styles/legend/___0_1.png" /> 34175 - 47239<br />\
    <img src="styles/legend/___0_2.png" /> 47239 - 70223<br />\
    <img src="styles/legend/___0_3.png" /> 70223 - 110018<br />\
    <img src="styles/legend/___0_4.png" /> 110018 - 176935<br />\
    <img src="styles/legend/___0_5.png" /> 176935 - 226099<br />\
    <img src="styles/legend/___0_6.png" /> 226099 - 281801<br />\
    <img src="styles/legend/___0_7.png" /> 281801 - 351958<br />\
    <img src="styles/legend/___0_8.png" /> 351958 - 442514<br />\
    <img src="styles/legend/___0_9.png" /> 442514 - 887910<br />'
        });

lyr____0.setVisible(true);
var layersList = [lyr____0];
lyr____0.set('fieldAliases', {'SIG_CD': 'SIG_CD', 'SIG_ENG_NM': 'SIG_ENG_NM', 'SIG_KOR_NM': 'SIG_KOR_NM', '행정구역_시군구_별__성별_인구수_20220221_시도코드': '행정구역_시군구_별__성별_인구수_20220221_시도코드', '행정구역_시군구_별__성별_인구수_20220221_시': '행정구역_시군구_별__성별_인구수_20220221_시', '행정구역_시군구_별__성별_인구수_20220221_SIG_KOR_NM': '행정구역_시군구_별__성별_인구수_20220221_SIG_KOR_NM', '행정구역_시군구_별__성별_인구수_20220221_총인구수 (202111)': '행정구역_시군구_별__성별_인구수_20220221_총인구수 (202111)', '행정구역_시군구_별__성별_인구수_20220221_총인구수 (202112)': '행정구역_시군구_별__성별_인구수_20220221_총인구수 (202112)', '행정구역_시군구_별__성별_인구수_20220221_총인구수 (202201)': '행정구역_시군구_별__성별_인구수_20220221_총인구수 (202201)', });
lyr____0.set('fieldImages', {'SIG_CD': 'TextEdit', 'SIG_ENG_NM': 'TextEdit', 'SIG_KOR_NM': 'TextEdit', '행정구역_시군구_별__성별_인구수_20220221_시도코드': 'Range', '행정구역_시군구_별__성별_인구수_20220221_시': 'TextEdit', '행정구역_시군구_별__성별_인구수_20220221_SIG_KOR_NM': 'TextEdit', '행정구역_시군구_별__성별_인구수_20220221_총인구수 (202111)': 'TextEdit', '행정구역_시군구_별__성별_인구수_20220221_총인구수 (202112)': 'TextEdit', '행정구역_시군구_별__성별_인구수_20220221_총인구수 (202201)': 'TextEdit', });
lyr____0.set('fieldLabels', {'SIG_CD': 'no label', 'SIG_ENG_NM': 'no label', 'SIG_KOR_NM': 'no label', '행정구역_시군구_별__성별_인구수_20220221_시도코드': 'no label', '행정구역_시군구_별__성별_인구수_20220221_시': 'no label', '행정구역_시군구_별__성별_인구수_20220221_SIG_KOR_NM': 'no label', '행정구역_시군구_별__성별_인구수_20220221_총인구수 (202111)': 'no label', '행정구역_시군구_별__성별_인구수_20220221_총인구수 (202112)': 'no label', '행정구역_시군구_별__성별_인구수_20220221_총인구수 (202201)': 'no label', });
lyr____0.on('precompose', function(evt) {
    evt.context.globalCompositeOperation = 'normal';
});