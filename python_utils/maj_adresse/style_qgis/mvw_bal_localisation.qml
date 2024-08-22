<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyLocal="1" version="3.22.15-Białowieża" simplifyDrawingHints="0" labelsEnabled="1" simplifyMaxScale="1" minScale="2000" styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="1" simplifyDrawingTol="1" maxScale="0" simplifyAlgorithm="0" readOnly="0" symbologyReferenceScale="-1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <temporal limitMode="0" accumulate="0" startExpression="" endExpression="" startField="" durationField="" endField="" enabled="0" mode="0" durationUnit="min" fixedDuration="0">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <renderer-v2 symbollevels="0" enableorderby="0" forceraster="0" referencescale="-1" type="singleSymbol">
    <symbols>
      <symbol name="0" clip_to_extent="1" alpha="1" force_rhr="0" type="marker">
        <data_defined_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </data_defined_properties>
        <layer class="SimpleMarker" enabled="1" pass="0" locked="0">
          <Option type="Map">
            <Option name="angle" value="0" type="QString"/>
            <Option name="cap_style" value="square" type="QString"/>
            <Option name="color" value="0,0,0,255" type="QString"/>
            <Option name="horizontal_anchor_point" value="1" type="QString"/>
            <Option name="joinstyle" value="bevel" type="QString"/>
            <Option name="name" value="circle" type="QString"/>
            <Option name="offset" value="0,0" type="QString"/>
            <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="offset_unit" value="MM" type="QString"/>
            <Option name="outline_color" value="35,35,35,255" type="QString"/>
            <Option name="outline_style" value="solid" type="QString"/>
            <Option name="outline_width" value="0" type="QString"/>
            <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="outline_width_unit" value="MM" type="QString"/>
            <Option name="scale_method" value="diameter" type="QString"/>
            <Option name="size" value="2" type="QString"/>
            <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
            <Option name="size_unit" value="MM" type="QString"/>
            <Option name="vertical_anchor_point" value="1" type="QString"/>
          </Option>
          <prop v="0" k="angle"/>
          <prop v="square" k="cap_style"/>
          <prop v="0,0,0,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="circle" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="35,35,35,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="2" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="fillColor" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="&quot;hex_color&quot;" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <labeling type="simple">
    <settings calloutType="simple">
      <text-style fontItalic="0" fieldName="CASE WHEN &quot;suffixe&quot; is NULL and  &quot;numero&quot;  &lt;> 99999 THEN &quot;numero&quot; &#xd;&#xa;WHEN &quot;numero&quot;  = 99999 THEN   &quot;voie_nom&quot; &#xd;&#xa;ELSE&#xd;&#xa;&quot;numero&quot; ||  &quot;suffixe&quot; &#xd;&#xa;END" fontKerning="1" fontSize="10" textOpacity="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontLetterSpacing="0" namedStyle="Bold" multilineHeight="1" textOrientation="horizontal" fontStrikeout="0" blendMode="0" capitalization="0" isExpression="1" legendString="Aa" fontWordSpacing="0" fontUnderline="0" fontFamily="MS Shell Dlg 2" fontWeight="75" useSubstitutions="0" textColor="0,0,0,255" previewBkgrdColor="255,255,255,255" allowHtml="0" fontSizeUnit="Point">
        <families/>
        <text-buffer bufferBlendMode="0" bufferNoFill="1" bufferColor="250,250,250,255" bufferSizeUnits="MM" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferDraw="1" bufferOpacity="1" bufferJoinStyle="128" bufferSize="1"/>
        <text-mask maskSizeUnits="MM" maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskOpacity="1" maskType="0" maskEnabled="0" maskedSymbolLayers="" maskSize="1" maskJoinStyle="128"/>
        <background shapeSizeUnit="Point" shapeRotation="0" shapeFillColor="255,255,255,255" shapeType="2" shapeOffsetX="0" shapeRadiiY="0" shapeSVGFile="" shapeRadiiX="0" shapeBorderWidthUnit="Point" shapeRadiiUnit="Point" shapeBorderWidth="0" shapeSizeX="2" shapeSizeType="0" shapeRotationType="0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeJoinStyle="64" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetY="0" shapeSizeY="2" shapeOpacity="1" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeBlendMode="0" shapeDraw="0" shapeOffsetUnit="Point" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeBorderColor="128,128,128,255">
          <symbol name="markerSymbol" clip_to_extent="1" alpha="1" force_rhr="0" type="marker">
            <data_defined_properties>
              <Option type="Map">
                <Option name="name" value="" type="QString"/>
                <Option name="properties"/>
                <Option name="type" value="collection" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer class="SimpleMarker" enabled="1" pass="0" locked="0">
              <Option type="Map">
                <Option name="angle" value="0" type="QString"/>
                <Option name="cap_style" value="square" type="QString"/>
                <Option name="color" value="243,166,178,255" type="QString"/>
                <Option name="horizontal_anchor_point" value="1" type="QString"/>
                <Option name="joinstyle" value="bevel" type="QString"/>
                <Option name="name" value="circle" type="QString"/>
                <Option name="offset" value="0,0" type="QString"/>
                <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
                <Option name="offset_unit" value="MM" type="QString"/>
                <Option name="outline_color" value="35,35,35,255" type="QString"/>
                <Option name="outline_style" value="solid" type="QString"/>
                <Option name="outline_width" value="0" type="QString"/>
                <Option name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
                <Option name="outline_width_unit" value="MM" type="QString"/>
                <Option name="scale_method" value="diameter" type="QString"/>
                <Option name="size" value="2" type="QString"/>
                <Option name="size_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
                <Option name="size_unit" value="MM" type="QString"/>
                <Option name="vertical_anchor_point" value="1" type="QString"/>
              </Option>
              <prop v="0" k="angle"/>
              <prop v="square" k="cap_style"/>
              <prop v="243,166,178,255" k="color"/>
              <prop v="1" k="horizontal_anchor_point"/>
              <prop v="bevel" k="joinstyle"/>
              <prop v="circle" k="name"/>
              <prop v="0,0" k="offset"/>
              <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
              <prop v="MM" k="offset_unit"/>
              <prop v="35,35,35,255" k="outline_color"/>
              <prop v="solid" k="outline_style"/>
              <prop v="0" k="outline_width"/>
              <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
              <prop v="MM" k="outline_width_unit"/>
              <prop v="diameter" k="scale_method"/>
              <prop v="2" k="size"/>
              <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
              <prop v="MM" k="size_unit"/>
              <prop v="1" k="vertical_anchor_point"/>
              <data_defined_properties>
                <Option type="Map">
                  <Option name="name" value="" type="QString"/>
                  <Option name="properties"/>
                  <Option name="type" value="collection" type="QString"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
          <symbol name="fillSymbol" clip_to_extent="1" alpha="1" force_rhr="0" type="fill">
            <data_defined_properties>
              <Option type="Map">
                <Option name="name" value="" type="QString"/>
                <Option name="properties"/>
                <Option name="type" value="collection" type="QString"/>
              </Option>
            </data_defined_properties>
            <layer class="SimpleFill" enabled="1" pass="0" locked="0">
              <Option type="Map">
                <Option name="border_width_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
                <Option name="color" value="255,255,255,255" type="QString"/>
                <Option name="joinstyle" value="bevel" type="QString"/>
                <Option name="offset" value="0,0" type="QString"/>
                <Option name="offset_map_unit_scale" value="3x:0,0,0,0,0,0" type="QString"/>
                <Option name="offset_unit" value="MM" type="QString"/>
                <Option name="outline_color" value="128,128,128,255" type="QString"/>
                <Option name="outline_style" value="no" type="QString"/>
                <Option name="outline_width" value="0" type="QString"/>
                <Option name="outline_width_unit" value="Point" type="QString"/>
                <Option name="style" value="solid" type="QString"/>
              </Option>
              <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
              <prop v="255,255,255,255" k="color"/>
              <prop v="bevel" k="joinstyle"/>
              <prop v="0,0" k="offset"/>
              <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
              <prop v="MM" k="offset_unit"/>
              <prop v="128,128,128,255" k="outline_color"/>
              <prop v="no" k="outline_style"/>
              <prop v="0" k="outline_width"/>
              <prop v="Point" k="outline_width_unit"/>
              <prop v="solid" k="style"/>
              <data_defined_properties>
                <Option type="Map">
                  <Option name="name" value="" type="QString"/>
                  <Option name="properties"/>
                  <Option name="type" value="collection" type="QString"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </background>
        <shadow shadowScale="100" shadowBlendMode="6" shadowRadiusAlphaOnly="0" shadowUnder="0" shadowRadiusUnit="MM" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOpacity="0.69999999999999996" shadowOffsetAngle="135" shadowColor="0,0,0,255" shadowOffsetUnit="MM" shadowOffsetGlobal="1" shadowRadius="1.5" shadowDraw="0" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetDist="1"/>
        <dd_properties>
          <Option type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
        </dd_properties>
        <substitutions/>
      </text-style>
      <text-format useMaxLineLengthForAutoWrap="1" addDirectionSymbol="0" formatNumbers="0" reverseDirectionSymbol="0" plussign="0" placeDirectionSymbol="0" decimals="3" leftDirectionSymbol="&lt;" multilineAlign="3" rightDirectionSymbol=">" autoWrapLength="0" wrapChar=""/>
      <placement dist="0" preserveRotation="1" maxCurvedCharAngleOut="-25" geometryGenerator="" lineAnchorClipping="0" quadOffset="4" lineAnchorType="0" placementFlags="10" distUnits="MM" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" priority="5" geometryGeneratorType="PointGeometry" offsetType="1" overrunDistanceUnit="MM" lineAnchorPercent="0.5" distMapUnitScale="3x:0,0,0,0,0,0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" centroidWhole="0" fitInPolygonOnly="0" layerType="PointGeometry" xOffset="0" offsetUnits="MM" rotationUnit="AngleDegrees" repeatDistance="0" maxCurvedCharAngleIn="25" overrunDistance="0" polygonPlacementFlags="2" geometryGeneratorEnabled="0" centroidInside="0" rotationAngle="0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" repeatDistanceUnits="MM" yOffset="0" placement="1"/>
      <rendering maxNumLabels="2000" scaleMin="0" limitNumLabels="0" upsidedownLabels="0" drawLabels="1" fontMinPixelSize="3" obstacleType="1" obstacle="1" scaleVisibility="1" unplacedVisibility="0" zIndex="0" minFeatureSize="0" labelPerPart="0" scaleMax="2000" mergeLines="0" fontMaxPixelSize="10000" fontLimitPixelSize="0" obstacleFactor="1" displayAll="0"/>
      <dd_properties>
        <Option type="Map">
          <Option name="name" value="" type="QString"/>
          <Option name="properties" type="Map">
            <Option name="BufferColor" type="Map">
              <Option name="active" value="false" type="bool"/>
              <Option name="field" value="hex_color" type="QString"/>
              <Option name="type" value="2" type="int"/>
            </Option>
            <Option name="Color" type="Map">
              <Option name="active" value="false" type="bool"/>
              <Option name="field" value="hex_color" type="QString"/>
              <Option name="type" value="2" type="int"/>
            </Option>
          </Option>
          <Option name="type" value="collection" type="QString"/>
        </Option>
      </dd_properties>
      <callout type="simple">
        <Option type="Map">
          <Option name="anchorPoint" value="pole_of_inaccessibility" type="QString"/>
          <Option name="blendMode" value="0" type="int"/>
          <Option name="ddProperties" type="Map">
            <Option name="name" value="" type="QString"/>
            <Option name="properties"/>
            <Option name="type" value="collection" type="QString"/>
          </Option>
          <Option name="drawToAllParts" value="false" type="bool"/>
          <Option name="enabled" value="0" type="QString"/>
          <Option name="labelAnchorPoint" value="point_on_exterior" type="QString"/>
          <Option name="lineSymbol" value="&lt;symbol name=&quot;symbol&quot; clip_to_extent=&quot;1&quot; alpha=&quot;1&quot; force_rhr=&quot;0&quot; type=&quot;line&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;name&quot; value=&quot;&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option name=&quot;type&quot; value=&quot;collection&quot; type=&quot;QString&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer class=&quot;SimpleLine&quot; enabled=&quot;1&quot; pass=&quot;0&quot; locked=&quot;0&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;align_dash_pattern&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;capstyle&quot; value=&quot;square&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;customdash&quot; value=&quot;5;2&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;customdash_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;customdash_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;dash_pattern_offset&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;dash_pattern_offset_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;dash_pattern_offset_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;draw_inside_polygon&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;joinstyle&quot; value=&quot;bevel&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;line_color&quot; value=&quot;60,60,60,255&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;line_style&quot; value=&quot;solid&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;line_width&quot; value=&quot;0.3&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;line_width_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;offset&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;offset_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;offset_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;ring_filter&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;trim_distance_end&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;trim_distance_end_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;trim_distance_end_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;trim_distance_start&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;trim_distance_start_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;trim_distance_start_unit&quot; value=&quot;MM&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;tweak_dash_pattern_on_corners&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;use_custom_dash&quot; value=&quot;0&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;width_map_unit_scale&quot; value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot;/>&lt;/Option>&lt;prop v=&quot;0&quot; k=&quot;align_dash_pattern&quot;/>&lt;prop v=&quot;square&quot; k=&quot;capstyle&quot;/>&lt;prop v=&quot;5;2&quot; k=&quot;customdash&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;customdash_map_unit_scale&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;customdash_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;dash_pattern_offset&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;dash_pattern_offset_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;draw_inside_polygon&quot;/>&lt;prop v=&quot;bevel&quot; k=&quot;joinstyle&quot;/>&lt;prop v=&quot;60,60,60,255&quot; k=&quot;line_color&quot;/>&lt;prop v=&quot;solid&quot; k=&quot;line_style&quot;/>&lt;prop v=&quot;0.3&quot; k=&quot;line_width&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;line_width_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;offset&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;offset_map_unit_scale&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;offset_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;ring_filter&quot;/>&lt;prop v=&quot;0&quot; k=&quot;trim_distance_end&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;trim_distance_end_map_unit_scale&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;trim_distance_end_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;trim_distance_start&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;trim_distance_start_map_unit_scale&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;trim_distance_start_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;prop v=&quot;0&quot; k=&quot;use_custom_dash&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;width_map_unit_scale&quot;/>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option name=&quot;name&quot; value=&quot;&quot; type=&quot;QString&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option name=&quot;type&quot; value=&quot;collection&quot; type=&quot;QString&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" type="QString"/>
          <Option name="minLength" value="0" type="double"/>
          <Option name="minLengthMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
          <Option name="minLengthUnit" value="MM" type="QString"/>
          <Option name="offsetFromAnchor" value="0" type="double"/>
          <Option name="offsetFromAnchorMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
          <Option name="offsetFromAnchorUnit" value="MM" type="QString"/>
          <Option name="offsetFromLabel" value="0" type="double"/>
          <Option name="offsetFromLabelMapUnitScale" value="3x:0,0,0,0,0,0" type="QString"/>
          <Option name="offsetFromLabelUnit" value="MM" type="QString"/>
        </Option>
      </callout>
    </settings>
  </labeling>
  <customproperties>
    <Option type="Map">
      <Option name="dualview/previewExpressions" type="List">
        <Option value="&quot;adresse_complete&quot;" type="QString"/>
        <Option value="&quot;commune_nom&quot;" type="QString"/>
      </Option>
      <Option name="embeddedWidgets/count" value="0" type="int"/>
      <Option name="variableNames"/>
      <Option name="variableValues"/>
    </Option>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer attributeLegend="1" diagramType="Histogram">
    <DiagramCategory direction="0" diagramOrientation="Up" backgroundAlpha="255" sizeScale="3x:0,0,0,0,0,0" scaleDependency="Area" labelPlacementMethod="XHeight" height="15" scaleBasedVisibility="0" sizeType="MM" penColor="#000000" lineSizeType="MM" lineSizeScale="3x:0,0,0,0,0,0" showAxis="1" penAlpha="255" spacingUnit="MM" spacing="5" minimumSize="0" backgroundColor="#ffffff" spacingUnitScale="3x:0,0,0,0,0,0" rotationOffset="270" penWidth="0" opacity="1" enabled="0" barWidth="5" width="15" minScaleDenominator="0" maxScaleDenominator="1e+08">
      <fontProperties description="MS Shell Dlg 2,8.25,-1,5,50,0,0,0,0,0" style=""/>
      <attribute field="" colorOpacity="1" label="" color="#000000"/>
      <axisSymbol>
        <symbol name="" clip_to_extent="1" alpha="1" force_rhr="0" type="line">
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties"/>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
          <layer class="SimpleLine" enabled="1" pass="0" locked="0">
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
              <Option name="line_color" value="35,35,35,255" type="QString"/>
              <Option name="line_style" value="solid" type="QString"/>
              <Option name="line_width" value="0.26" type="QString"/>
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
            <prop v="0" k="align_dash_pattern"/>
            <prop v="square" k="capstyle"/>
            <prop v="5;2" k="customdash"/>
            <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
            <prop v="MM" k="customdash_unit"/>
            <prop v="0" k="dash_pattern_offset"/>
            <prop v="3x:0,0,0,0,0,0" k="dash_pattern_offset_map_unit_scale"/>
            <prop v="MM" k="dash_pattern_offset_unit"/>
            <prop v="0" k="draw_inside_polygon"/>
            <prop v="bevel" k="joinstyle"/>
            <prop v="35,35,35,255" k="line_color"/>
            <prop v="solid" k="line_style"/>
            <prop v="0.26" k="line_width"/>
            <prop v="MM" k="line_width_unit"/>
            <prop v="0" k="offset"/>
            <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
            <prop v="MM" k="offset_unit"/>
            <prop v="0" k="ring_filter"/>
            <prop v="0" k="trim_distance_end"/>
            <prop v="3x:0,0,0,0,0,0" k="trim_distance_end_map_unit_scale"/>
            <prop v="MM" k="trim_distance_end_unit"/>
            <prop v="0" k="trim_distance_start"/>
            <prop v="3x:0,0,0,0,0,0" k="trim_distance_start_map_unit_scale"/>
            <prop v="MM" k="trim_distance_start_unit"/>
            <prop v="0" k="tweak_dash_pattern_on_corners"/>
            <prop v="0" k="use_custom_dash"/>
            <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
            <data_defined_properties>
              <Option type="Map">
                <Option name="name" value="" type="QString"/>
                <Option name="properties"/>
                <Option name="type" value="collection" type="QString"/>
              </Option>
            </data_defined_properties>
          </layer>
        </symbol>
      </axisSymbol>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings dist="0" showAll="1" priority="0" zIndex="0" linePlacementFlags="18" placement="0" obstacle="0">
    <properties>
      <Option type="Map">
        <Option name="name" value="" type="QString"/>
        <Option name="properties"/>
        <Option name="type" value="collection" type="QString"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <legend showLabelLegend="0" type="default-vector"/>
  <referencedLayers/>
  <fieldConfiguration>
    <field name="id" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="uid_adresse" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="cle_interop" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="commune_insee" configurationFlags="None">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="commune_nom" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="commune_deleguee_insee" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="commune_deleguee_nom" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="voie_nom" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="lieudit_complement_nom" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="numero" configurationFlags="None">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="suffixe" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="cad_parcelles" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="source" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="date_der_maj" configurationFlags="None">
      <editWidget type="DateTime">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="certification_commune" configurationFlags="None">
      <editWidget type="Range">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="voie_nom_bre" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="voie_nom_fra" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="position" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="adresse_complete" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="hex_color" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="priorite" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="code_postal" configurationFlags="None">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="" field="id" index="0"/>
    <alias name="" field="uid_adresse" index="1"/>
    <alias name="" field="cle_interop" index="2"/>
    <alias name="" field="commune_insee" index="3"/>
    <alias name="" field="commune_nom" index="4"/>
    <alias name="" field="commune_deleguee_insee" index="5"/>
    <alias name="" field="commune_deleguee_nom" index="6"/>
    <alias name="" field="voie_nom" index="7"/>
    <alias name="" field="lieudit_complement_nom" index="8"/>
    <alias name="" field="numero" index="9"/>
    <alias name="" field="suffixe" index="10"/>
    <alias name="" field="cad_parcelles" index="11"/>
    <alias name="" field="source" index="12"/>
    <alias name="" field="date_der_maj" index="13"/>
    <alias name="" field="certification_commune" index="14"/>
    <alias name="" field="voie_nom_bre" index="15"/>
    <alias name="" field="voie_nom_fra" index="16"/>
    <alias name="" field="position" index="17"/>
    <alias name="" field="adresse_complete" index="18"/>
    <alias name="" field="hex_color" index="19"/>
    <alias name="" field="priorite" index="20"/>
    <alias name="" field="code_postal" index="21"/>
  </aliases>
  <defaults>
    <default field="id" expression="" applyOnUpdate="0"/>
    <default field="uid_adresse" expression="" applyOnUpdate="0"/>
    <default field="cle_interop" expression="" applyOnUpdate="0"/>
    <default field="commune_insee" expression="" applyOnUpdate="0"/>
    <default field="commune_nom" expression="" applyOnUpdate="0"/>
    <default field="commune_deleguee_insee" expression="" applyOnUpdate="0"/>
    <default field="commune_deleguee_nom" expression="" applyOnUpdate="0"/>
    <default field="voie_nom" expression="" applyOnUpdate="0"/>
    <default field="lieudit_complement_nom" expression="" applyOnUpdate="0"/>
    <default field="numero" expression="" applyOnUpdate="0"/>
    <default field="suffixe" expression="" applyOnUpdate="0"/>
    <default field="cad_parcelles" expression="" applyOnUpdate="0"/>
    <default field="source" expression="" applyOnUpdate="0"/>
    <default field="date_der_maj" expression="" applyOnUpdate="0"/>
    <default field="certification_commune" expression="" applyOnUpdate="0"/>
    <default field="voie_nom_bre" expression="" applyOnUpdate="0"/>
    <default field="voie_nom_fra" expression="" applyOnUpdate="0"/>
    <default field="position" expression="" applyOnUpdate="0"/>
    <default field="adresse_complete" expression="" applyOnUpdate="0"/>
    <default field="hex_color" expression="" applyOnUpdate="0"/>
    <default field="priorite" expression="" applyOnUpdate="0"/>
    <default field="code_postal" expression="" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint notnull_strength="1" field="id" unique_strength="1" constraints="3" exp_strength="0"/>
    <constraint notnull_strength="0" field="uid_adresse" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" field="cle_interop" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" field="commune_insee" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" field="commune_nom" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" field="commune_deleguee_insee" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" field="commune_deleguee_nom" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" field="voie_nom" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" field="lieudit_complement_nom" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" field="numero" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" field="suffixe" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" field="cad_parcelles" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" field="source" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" field="date_der_maj" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" field="certification_commune" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" field="voie_nom_bre" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" field="voie_nom_fra" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" field="position" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" field="adresse_complete" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" field="hex_color" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" field="priorite" unique_strength="0" constraints="0" exp_strength="0"/>
    <constraint notnull_strength="0" field="code_postal" unique_strength="0" constraints="0" exp_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="id" desc="" exp=""/>
    <constraint field="uid_adresse" desc="" exp=""/>
    <constraint field="cle_interop" desc="" exp=""/>
    <constraint field="commune_insee" desc="" exp=""/>
    <constraint field="commune_nom" desc="" exp=""/>
    <constraint field="commune_deleguee_insee" desc="" exp=""/>
    <constraint field="commune_deleguee_nom" desc="" exp=""/>
    <constraint field="voie_nom" desc="" exp=""/>
    <constraint field="lieudit_complement_nom" desc="" exp=""/>
    <constraint field="numero" desc="" exp=""/>
    <constraint field="suffixe" desc="" exp=""/>
    <constraint field="cad_parcelles" desc="" exp=""/>
    <constraint field="source" desc="" exp=""/>
    <constraint field="date_der_maj" desc="" exp=""/>
    <constraint field="certification_commune" desc="" exp=""/>
    <constraint field="voie_nom_bre" desc="" exp=""/>
    <constraint field="voie_nom_fra" desc="" exp=""/>
    <constraint field="position" desc="" exp=""/>
    <constraint field="adresse_complete" desc="" exp=""/>
    <constraint field="hex_color" desc="" exp=""/>
    <constraint field="priorite" desc="" exp=""/>
    <constraint field="code_postal" desc="" exp=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
    <actionsetting name="Info adresse" action="from qgis.PyQt.QtWebKitWidgets import QWebView&#xd;&#xa;from qgis.PyQt.QtCore import Qt&#xd;&#xa;from qgis.PyQt.QtWidgets import QMainWindow&#xd;&#xa;&#xd;&#xa;# Obtenez les valeurs des champs de l'entité sélectionnée&#xd;&#xa;champ1 = str('[% &quot;adresse_complete&quot; %]')&#xd;&#xa;champ2 = str('[% Replace(&quot;cad_parcelles&quot;,'|',' - ')%]')&#xd;&#xa;champ3= str('[%'Position : ' || &quot;Position&quot; %]')&#xd;&#xa;champ4= str('[% 'Date de mise à jour : ' || &quot;date_der_maj&quot; %]')&#xd;&#xa;champ5 = str('[% CASE WHEN certification_commune = 1 then 'Certifié' else 'Non certifié' END %]')&#xd;&#xa;&#xd;&#xa;&#xd;&#xa;html = f&quot;&quot;&quot;&#xd;&#xa;&lt;!DOCTYPE html>&#xd;&#xa;&lt;html>&#xd;&#xa;&lt;head>&#xd;&#xa;    &lt;style>&#xd;&#xa;        .infobulle {{&#xd;&#xa;            font-family: Arial, sans-serif;&#xd;&#xa;            border-collapse: collapse;&#xd;&#xa;            width: 400px; /* Paramètre la largeur */&#xd;&#xa;            height: 100px; /* Paramètre la hauteur */&#xd;&#xa;            background-color: #ffffff;&#xd;&#xa;            color: #000000;&#xd;&#xa;            overflow: auto;&#xd;&#xa;        }}&#xd;&#xa;        .infobulle td, .infobulle th {{&#xd;&#xa;            border: 1px solid #ddd;&#xd;&#xa;            padding: 8px;&#xd;&#xa;        }}&#xd;&#xa;        .infobulle tr:nth-child(even){{background-color: #f2f2f2;}}&#xd;&#xa;        .infobulle tr:hover {{background-color: #ddd;}}&#xd;&#xa;        .infobulle th {{&#xd;&#xa;            padding-top: 12px;&#xd;&#xa;            padding-bottom: 12px;&#xd;&#xa;            text-align: left;&#xd;&#xa;            background-color: #ffffff;&#xd;&#xa;            color: #000000;&#xd;&#xa;        }}&#xd;&#xa;    &lt;/style>&#xd;&#xa;&lt;/head>&#xd;&#xa;&lt;body>&#xd;&#xa;&lt;table class=&quot;infobulle&quot;>&#xd;&#xa;    &lt;h1>Fiche identité adresse&lt;/h1>&#xd;&#xa;    &lt;tr>&#xd;&#xa;        &lt;th>{champ1}&lt;/th>&#xd;&#xa;    &lt;/tr>&#xd;&#xa;    &lt;tr>&#xd;&#xa;        &lt;th>{champ2}&lt;/th>&#xd;&#xa;    &lt;/tr>&#xd;&#xa;    &lt;tr>&#xd;&#xa;        &lt;th>{champ3}&lt;/th>&#xd;&#xa;    &lt;/tr>&#xd;&#xa;    &lt;tr>&#xd;&#xa;        &lt;th>{champ4}&lt;/th>&#xd;&#xa;    &lt;/tr>&#xd;&#xa;    &lt;tr>&#xd;&#xa;        &lt;th>{champ5}&lt;/th>&#xd;&#xa;    &lt;/tr>&#xd;&#xa;&lt;/table>&#xd;&#xa;&lt;/body>&#xd;&#xa;&lt;/html>&#xd;&#xa;&quot;&quot;&quot;&#xd;&#xa;&#xd;&#xa;# Créez une fenêtre QWebView pour afficher le contenu HTML&#xd;&#xa;view = QWebView()&#xd;&#xa;view.setHtml(html)&#xd;&#xa;view.setWindowTitle(&quot;Infobulle&quot;)&#xd;&#xa;view.resize(450, 350)  # Paramètre la largeur et la hauteur de la fenêtre&#xd;&#xa;view.show()&#xd;&#xa;&#xd;&#xa;&#xd;&#xa;" capture="0" icon="" id="{f3420251-fa93-4a07-bf88-4451591410f7}" shortTitle="Info adresse" notificationMessage="" isEnabledOnlyWhenEditable="0" type="1">
      <actionScope id="Canvas"/>
      <actionScope id="Feature"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig sortOrder="0" actionWidgetStyle="dropDown" sortExpression="&quot;voie_nom&quot;">
    <columns>
      <column name="id" hidden="0" width="-1" type="field"/>
      <column name="uid_adresse" hidden="0" width="-1" type="field"/>
      <column name="cle_interop" hidden="0" width="-1" type="field"/>
      <column name="commune_insee" hidden="0" width="-1" type="field"/>
      <column name="commune_nom" hidden="0" width="-1" type="field"/>
      <column name="commune_deleguee_insee" hidden="0" width="-1" type="field"/>
      <column name="commune_deleguee_nom" hidden="0" width="-1" type="field"/>
      <column name="voie_nom" hidden="0" width="-1" type="field"/>
      <column name="lieudit_complement_nom" hidden="0" width="-1" type="field"/>
      <column name="numero" hidden="0" width="-1" type="field"/>
      <column name="suffixe" hidden="0" width="-1" type="field"/>
      <column name="position" hidden="0" width="-1" type="field"/>
      <column name="cad_parcelles" hidden="0" width="-1" type="field"/>
      <column name="source" hidden="0" width="-1" type="field"/>
      <column name="date_der_maj" hidden="0" width="-1" type="field"/>
      <column name="certification_commune" hidden="0" width="-1" type="field"/>
      <column name="voie_nom_bre" hidden="0" width="-1" type="field"/>
      <column name="voie_nom_fra" hidden="0" width="-1" type="field"/>
      <column name="adresse_complete" hidden="0" width="-1" type="field"/>
      <column name="hex_color" hidden="0" width="-1" type="field"/>
      <column name="priorite" hidden="0" width="-1" type="field"/>
      <column name="code_postal" hidden="0" width="-1" type="field"/>
      <column hidden="1" width="-1" type="actions"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1"></editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
Les formulaires QGIS peuvent avoir une fonction Python qui est appelée lorsque le formulaire est
ouvert.

Utilisez cette fonction pour ajouter une logique supplémentaire à vos formulaires.

Entrez le nom de la fonction dans le champ 
"Fonction d'initialisation Python".
Voici un exemple:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
    geom = feature.geometry()
    control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>generatedlayout</editorlayout>
  <editable>
    <field name="adresse_complete" editable="1"/>
    <field name="cad_parcelles" editable="1"/>
    <field name="certification_commune" editable="1"/>
    <field name="cle_interop" editable="1"/>
    <field name="code_postal" editable="1"/>
    <field name="commune_deleguee_insee" editable="1"/>
    <field name="commune_deleguee_nom" editable="1"/>
    <field name="commune_insee" editable="1"/>
    <field name="commune_nom" editable="1"/>
    <field name="date_der_maj" editable="1"/>
    <field name="hex_color" editable="1"/>
    <field name="id" editable="1"/>
    <field name="lat" editable="1"/>
    <field name="lieudit_complement_nom" editable="1"/>
    <field name="long" editable="1"/>
    <field name="numero" editable="1"/>
    <field name="position" editable="1"/>
    <field name="priorite" editable="1"/>
    <field name="source" editable="1"/>
    <field name="suffixe" editable="1"/>
    <field name="uid_adresse" editable="1"/>
    <field name="voie_nom" editable="1"/>
    <field name="voie_nom_bre" editable="1"/>
    <field name="voie_nom_fra" editable="1"/>
    <field name="x" editable="1"/>
    <field name="y" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="adresse_complete" labelOnTop="0"/>
    <field name="cad_parcelles" labelOnTop="0"/>
    <field name="certification_commune" labelOnTop="0"/>
    <field name="cle_interop" labelOnTop="0"/>
    <field name="code_postal" labelOnTop="0"/>
    <field name="commune_deleguee_insee" labelOnTop="0"/>
    <field name="commune_deleguee_nom" labelOnTop="0"/>
    <field name="commune_insee" labelOnTop="0"/>
    <field name="commune_nom" labelOnTop="0"/>
    <field name="date_der_maj" labelOnTop="0"/>
    <field name="hex_color" labelOnTop="0"/>
    <field name="id" labelOnTop="0"/>
    <field name="lat" labelOnTop="0"/>
    <field name="lieudit_complement_nom" labelOnTop="0"/>
    <field name="long" labelOnTop="0"/>
    <field name="numero" labelOnTop="0"/>
    <field name="position" labelOnTop="0"/>
    <field name="priorite" labelOnTop="0"/>
    <field name="source" labelOnTop="0"/>
    <field name="suffixe" labelOnTop="0"/>
    <field name="uid_adresse" labelOnTop="0"/>
    <field name="voie_nom" labelOnTop="0"/>
    <field name="voie_nom_bre" labelOnTop="0"/>
    <field name="voie_nom_fra" labelOnTop="0"/>
    <field name="x" labelOnTop="0"/>
    <field name="y" labelOnTop="0"/>
  </labelOnTop>
  <reuseLastValue>
    <field name="adresse_complete" reuseLastValue="0"/>
    <field name="cad_parcelles" reuseLastValue="0"/>
    <field name="certification_commune" reuseLastValue="0"/>
    <field name="cle_interop" reuseLastValue="0"/>
    <field name="code_postal" reuseLastValue="0"/>
    <field name="commune_deleguee_insee" reuseLastValue="0"/>
    <field name="commune_deleguee_nom" reuseLastValue="0"/>
    <field name="commune_insee" reuseLastValue="0"/>
    <field name="commune_nom" reuseLastValue="0"/>
    <field name="date_der_maj" reuseLastValue="0"/>
    <field name="hex_color" reuseLastValue="0"/>
    <field name="id" reuseLastValue="0"/>
    <field name="lat" reuseLastValue="0"/>
    <field name="lieudit_complement_nom" reuseLastValue="0"/>
    <field name="long" reuseLastValue="0"/>
    <field name="numero" reuseLastValue="0"/>
    <field name="position" reuseLastValue="0"/>
    <field name="priorite" reuseLastValue="0"/>
    <field name="source" reuseLastValue="0"/>
    <field name="suffixe" reuseLastValue="0"/>
    <field name="uid_adresse" reuseLastValue="0"/>
    <field name="voie_nom" reuseLastValue="0"/>
    <field name="voie_nom_bre" reuseLastValue="0"/>
    <field name="voie_nom_fra" reuseLastValue="0"/>
    <field name="x" reuseLastValue="0"/>
    <field name="y" reuseLastValue="0"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"adresse_complete"</previewExpression>
  <mapTip>&lt;html>&#xd;
&lt;head>&#xd;
    &lt;style>&#xd;
        .infobulle {&#xd;
            font-family: Arial, sans-serif;&#xd;
            border-collapse: collapse;&#xd;
            width: 400px; /* Paramètre la largeur */&#xd;
            height: 200px; /* Paramètre la hauteur */&#xd;
            background-color: #ffffff;&#xd;
            color: #000000;&#xd;
        }&#xd;
        .infobulle td, .infobulle th {&#xd;
            border: 1px solid #ddd;&#xd;
            padding: 8px;&#xd;
        }&#xd;
        .infobulle tr:nth-child(even){background-color: #f2f2f2;}&#xd;
        .infobulle tr:hover {background-color: #ddd;}&#xd;
        .infobulle th {&#xd;
            padding-top: 12px;&#xd;
            padding-bottom: 12px;&#xd;
            text-align: left;&#xd;
            background-color: #ffffff;&#xd;
            color: #000000;&#xd;
        }&#xd;
    &lt;/style>&#xd;
&lt;/head>&#xd;
&lt;body>&#xd;
&#xd;
&lt;table class="infobulle">&#xd;
    &lt;tr>&#xd;
        &lt;th>[%adresse_complete%]&lt;/th>&#xd;
    &lt;/tr>&#xd;
	&lt;tr>&#xd;
        &lt;th>[% Replace("cad_parcelles",'|',' - ')%]&lt;/th>&#xd;
    &lt;/tr>&#xd;
	&lt;tr>&#xd;
        &lt;th>Position : [%Position%]&lt;/th>&#xd;
    &lt;/tr>&#xd;
	&lt;tr>&#xd;
        &lt;th>Date de mise à jour : [%date_der_maj%]&lt;/th>&#xd;
    &lt;/tr>&#xd;
	&lt;tr>&#xd;
        &lt;th>[% CASE WHEN certification_commune = 1 then 'Certifié' else 'Non certifié' END %]&lt;/th>&#xd;
    &lt;/tr>&#xd;
	&#xd;
&lt;/table>&#xd;
&#xd;
&lt;/body>&#xd;
&lt;/html></mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>
