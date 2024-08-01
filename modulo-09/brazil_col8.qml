<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="AllStyleCategories" version="3.28.3-Firenze" maxScale="0" hasScaleBasedVisibilityFlag="0" minScale="1e+08">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal enabled="0" mode="0" fetchMode="0">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <elevation enabled="0" zoffset="0" zscale="1" band="1" symbology="Line">
    <data-defined-properties>
      <Option type="Map">
        <Option name="name" value="" type="QString"/>
        <Option name="properties"/>
        <Option name="type" value="collection" type="QString"/>
      </Option>
    </data-defined-properties>
    <profileLineSymbol>
      <symbol is_animated="0" frame_rate="10" name="" alpha="1" force_rhr="0" clip_to_extent="1" type="line">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleLine" enabled="1" locked="0" pass="0">
          <Option type="Map">
            <Option name="align_dash_pattern" value="0" type="QString"/>
            <Option name="capstyle" value="square" type="QString"/>
            <Option name="customdash" value="5;2" type="QString"/>
            <Option name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="customdash_unit" value="MM" type="QString"/>
            <Option name="dash_pattern_offset" value="0" type="QString"/>
            <Option name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="dash_pattern_offset_unit" value="MM" type="QString"/>
            <Option name="draw_inside_polygon" value="0" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="line_color" value="133,182,111,255" type="QString"/>
            <Option name="line_style" value="solid" type="QString"/>
            <Option name="line_width" value="0.6" type="QString"/>
            <Option name="line_width_unit" value="MM" type="QString"/>
            <Option name="offset" value="0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="ring_filter" value="0" type="QString"/>
            <Option name="trim_distance_end" value="0" type="QString"/>
            <Option name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="trim_distance_end_unit" value="MM" type="QString"/>
            <Option name="trim_distance_start" value="0" type="QString"/>
            <Option name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="trim_distance_start_unit" value="MM" type="QString"/>
            <Option name="tweak_dash_pattern_on_corners" value="0" type="QString"/>
            <Option name="use_custom_dash" value="0" type="QString"/>
            <Option name="width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </profileLineSymbol>
    <profileFillSymbol>
      <symbol is_animated="0" frame_rate="10" name="" alpha="1" force_rhr="0" clip_to_extent="1" type="fill">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleFill" enabled="1" locked="0" pass="0">
          <Option type="Map">
            <Option name="border_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="color" value="133,182,111,255" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="35,35,35,255" type="QString"/>
            <Option name="outline_style" value="no" type="QString"/>
            <Option name="outline_width" value="0.26" type="QString"/>
            <Option name="outline_width_unit" value="MM" type="QString"/>
            <Option name="style" value="solid" type="QString"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </profileFillSymbol>
  </elevation>
  <customproperties>
    <Option type="Map">
      <Option name="WMSBackgroundLayer" value="false" type="bool"/>
      <Option name="WMSPublishDataSourceUrl" value="false" type="bool"/>
      <Option name="embeddedWidgets/count" value="0" type="int"/>
      <Option name="identify/format" value="Value" type="QString"/>
    </Option>
  </customproperties>
  <pipe-data-defined-properties>
    <Option type="Map">
      <Option name="name" value="" type="QString"/>
      <Option name="properties"/>
      <Option name="type" value="collection" type="QString"/>
    </Option>
  </pipe-data-defined-properties>
  <pipe>
    <provider>
      <resampling enabled="false" maxOversampling="2" zoomedOutResamplingMethod="nearestNeighbour" zoomedInResamplingMethod="nearestNeighbour"/>
    </provider>
    <rasterrenderer band="1" alphaBand="-1" opacity="1" nodataColor="" type="paletted">
      <rasterTransparency/>
      <minMaxOrigin>
        <limits>None</limits>
        <extent>WholeRaster</extent>
        <statAccuracy>Estimated</statAccuracy>
        <cumulativeCutLower>0.02</cumulativeCutLower>
        <cumulativeCutUpper>0.98</cumulativeCutUpper>
        <stdDevFactor>2</stdDevFactor>
      </minMaxOrigin>
      <colorPalette>
        <paletteEntry label="Forest Formation" alpha="255" value="3" color="#1f8d49"/>
        <paletteEntry label="Savanna Formation" alpha="255" value="4" color="#7dc975"/>
        <paletteEntry label="Mangrove" alpha="255" value="5" color="#04381d"/>
        <paletteEntry label="Floodable Forest" alpha="255" value="6" color="#026975"/>
        <paletteEntry label="Forest Plantation" alpha="255" value="9" color="#7a5900"/>
        <paletteEntry label="Wetland" alpha="255" value="11" color="#519799"/>
        <paletteEntry label="Grassland" alpha="255" value="12" color="#d6bc74"/>
        <paletteEntry label="Other non Forest Natural Formations" alpha="255" value="13" color="#d89f5c"/>
        <paletteEntry label="Pasture" alpha="255" value="15" color="#edde8e"/>
        <paletteEntry label="Sugar Cane" alpha="255" value="20" color="#db7093"/>
        <paletteEntry label="Mosaic of Uses" alpha="255" value="21" color="#ffefc3"/>
        <paletteEntry label="Beach, Dune and Sand Spot" alpha="255" value="23" color="#ffa07a"/>
        <paletteEntry label="Urban Area" alpha="255" value="24" color="#d4271e"/>
        <paletteEntry label="Other non Vegetated Areas" alpha="255" value="25" color="#db4d4f"/>
        <paletteEntry label="Rocky Outcrop" alpha="255" value="29" color="#ffaa5f"/>
        <paletteEntry label="Mining" alpha="255" value="30" color="#9c0027"/>
        <paletteEntry label="Aquaculture" alpha="255" value="31" color="#091077"/>
        <paletteEntry label="Hypersaline Tidal Flat" alpha="255" value="32" color="#fc8114"/>
        <paletteEntry label="River, Lake and Ocean" alpha="255" value="33" color="#2532e4"/>
        <paletteEntry label="Palm Oil" alpha="255" value="35" color="#9065d0"/>
        <paletteEntry label="Soybean" alpha="255" value="39" color="#f5b3c8"/>
        <paletteEntry label="Rice" alpha="255" value="40" color="#c71585"/>
        <paletteEntry label="Other Temporary Crops" alpha="255" value="41" color="#f54ca9"/>
        <paletteEntry label="Coffee" alpha="255" value="46" color="#d68fe2"/>
        <paletteEntry label="Citrus" alpha="255" value="47" color="#9932cc"/>
        <paletteEntry label="Other Perennial Crops" alpha="255" value="48" color="#e6ccff"/>
        <paletteEntry label="Wooded Sandbank Vegetation" alpha="255" value="49" color="#02d659"/>
        <paletteEntry label="Herbaceous Sandbank Vegetation" alpha="255" value="50" color="#ad5100"/>
        <paletteEntry label="Cotton" alpha="255" value="62" color="#ff69b4"/>
      </colorPalette>
      <colorramp name="[source]" type="randomcolors">
        <Option/>
      </colorramp>
    </rasterrenderer>
    <brightnesscontrast gamma="1" contrast="0" brightness="0"/>
    <huesaturation invertColors="0" colorizeBlue="128" grayscaleMode="0" colorizeRed="255" colorizeStrength="100" colorizeOn="0" saturation="0" colorizeGreen="128"/>
    <rasterresampler maxOversampling="2"/>
    <resamplingStage>resamplingFilter</resamplingStage>
  </pipe>
  <blendMode>0</blendMode>
</qgis>
