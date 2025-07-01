<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor
	xmlns="http://www.opengis.net/sld" xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.1.0/StyledLayerDescriptor.xsd"
	xmlns:xlink="http://www.w3.org/1999/xlink"
	xmlns:se="http://www.opengis.net/se"
	xmlns:ogc="http://www.opengis.net/ogc"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" version="1.1.0">
	<NamedLayer>
		<se:Name>syt_pol</se:Name>
		<UserStyle>
			<se:Name>syt_pol</se:Name>
			<se:FeatureTypeStyle>
				<se:Rule>
					<se:Name>wody 1</se:Name>
					<se:Description>
						<se:Title>wody 1</se:Title>
					</se:Description>
					<ogc:Filter
						xmlns:ogc="http://www.opengis.net/ogc">
						<ogc:Or>
							<ogc:PropertyIsEqualTo>
								<ogc:PropertyName>kod_ob</ogc:PropertyName>
								<ogc:Literal>ZBIORNIK</ogc:Literal>
							</ogc:PropertyIsEqualTo>
							<ogc:PropertyIsEqualTo>
								<ogc:PropertyName>kod_ob</ogc:PropertyName>
								<ogc:Literal>STAWY</ogc:Literal>
							</ogc:PropertyIsEqualTo>
						</ogc:Or>
					</ogc:Filter>
					<se:PolygonSymbolizer>
						<se:Fill>
							<se:SvgParameter name="fill">#a4faff</se:SvgParameter>
							<se:SvgParameter name="fill-opacity">0.5</se:SvgParameter>
						</se:Fill>
						<se:Stroke>
							<se:SvgParameter name="stroke">#00d2dc</se:SvgParameter>
							<se:SvgParameter name="stroke-width">1</se:SvgParameter>
							<se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
						</se:Stroke>
					</se:PolygonSymbolizer>
				</se:Rule>
				<se:Rule>
					<se:Name>wody 2</se:Name>
					<se:Description>
						<se:Title>wody 2</se:Title>
					</se:Description>
					<ogc:Filter
						xmlns:ogc="http://www.opengis.net/ogc">
						<ogc:Or>
							<ogc:PropertyIsEqualTo>
								<ogc:PropertyName>kod_ob</ogc:PropertyName>
								<ogc:Literal>JEZIORO</ogc:Literal>
							</ogc:PropertyIsEqualTo>
							<ogc:PropertyIsEqualTo>
								<ogc:PropertyName>kod_ob</ogc:PropertyName>
								<ogc:Literal>RZEKA</ogc:Literal>
							</ogc:PropertyIsEqualTo>
						</ogc:Or>
					</ogc:Filter>
					<se:PolygonSymbolizer>
						<se:Fill>
							<se:SvgParameter name="fill">#a4faff</se:SvgParameter>
							<se:SvgParameter name="fill-opacity">0.5</se:SvgParameter>
						</se:Fill>
						<se:Stroke>
							<se:SvgParameter name="stroke">#00d2dc</se:SvgParameter>
							<se:SvgParameter name="stroke-width">1</se:SvgParameter>
							<se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
						</se:Stroke>
					</se:PolygonSymbolizer>
				</se:Rule>
				<se:Rule>
					<se:Name>miejscowosci</se:Name>
					<se:Description>
						<se:Title>miejscowosci</se:Title>
					</se:Description>
					<ogc:Filter
						xmlns:ogc="http://www.opengis.net/ogc">
						<ogc:PropertyIsEqualTo>
							<ogc:PropertyName>kod_ob</ogc:PropertyName>
							<ogc:Literal>MIEJSCOW</ogc:Literal>
						</ogc:PropertyIsEqualTo>
					</ogc:Filter>
					<se:PolygonSymbolizer>
						<se:Fill>
							<se:GraphicFill>
								<se:Graphic>
									<!--Parametric SVG-->
									<se:ExternalGraphic>
										<se:OnlineResource xlink:type="simple" xlink:href="assets/map-symbols/bb.svg?fill=%230000ff&amp;fill-opacity=1&amp;outline=%23232323&amp;outline-opacity=1&amp;outline-width=0"/>
										<se:Format>image/svg+xml</se:Format>
									</se:ExternalGraphic>
									<se:Size>36</se:Size>
								</se:Graphic>
							</se:GraphicFill>
						</se:Fill>
					</se:PolygonSymbolizer>
					<se:LineSymbolizer>
						<se:Stroke>
							<se:SvgParameter name="stroke">#b7b7b7</se:SvgParameter>
							<se:SvgParameter name="stroke-width">2</se:SvgParameter>
							<se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
							<se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
						</se:Stroke>
					</se:LineSymbolizer>
				</se:Rule>
				<se:Rule>
					<se:Name>lasy 1</se:Name>
					<se:Description>
						<se:Title>lasy 1</se:Title>
					</se:Description>
					<ogc:Filter
						xmlns:ogc="http://www.opengis.net/ogc">
						<ogc:Or>
							<ogc:PropertyIsEqualTo>
								<ogc:PropertyName>kod_ob</ogc:PropertyName>
								<ogc:Literal>LAS ROZN</ogc:Literal>
							</ogc:PropertyIsEqualTo>
							<ogc:PropertyIsEqualTo>
								<ogc:PropertyName>kod_ob</ogc:PropertyName>
								<ogc:Literal>LAS KOM</ogc:Literal>
							</ogc:PropertyIsEqualTo>
						</ogc:Or>
					</ogc:Filter>
					<se:PolygonSymbolizer>
						<se:Fill>
							<se:SvgParameter name="fill">#a5ffa5</se:SvgParameter>
							<se:SvgParameter name="fill-opacity">0.5</se:SvgParameter>
						</se:Fill>
					</se:PolygonSymbolizer>
				</se:Rule>
				<se:Rule>
					<se:Name>lasy 2</se:Name>
					<se:Description>
						<se:Title>lasy 2</se:Title>
					</se:Description>
					<ogc:Filter
						xmlns:ogc="http://www.opengis.net/ogc">
						<ogc:Or>
							<ogc:PropertyIsEqualTo>
								<ogc:PropertyName>kod_ob</ogc:PropertyName>
								<ogc:Literal>LAS SP</ogc:Literal>
							</ogc:PropertyIsEqualTo>
							<ogc:PropertyIsEqualTo>
								<ogc:PropertyName>kod_ob</ogc:PropertyName>
								<ogc:Literal>LAS NADZ</ogc:Literal>
							</ogc:PropertyIsEqualTo>
						</ogc:Or>
					</ogc:Filter>
					<se:PolygonSymbolizer>
						<se:Fill>
							<se:SvgParameter name="fill">#a5ffa5</se:SvgParameter>
							<se:SvgParameter name="fill-opacity">0.5</se:SvgParameter>
						</se:Fill>
					</se:PolygonSymbolizer>
				</se:Rule>
				<se:Rule>
					<se:Name>lasy 3</se:Name>
					<se:Description>
						<se:Title>lasy 3</se:Title>
					</se:Description>
					<ogc:Filter
						xmlns:ogc="http://www.opengis.net/ogc">
						<ogc:Or>
							<ogc:PropertyIsEqualTo>
								<ogc:PropertyName>kod_ob</ogc:PropertyName>
								<ogc:Literal>LAS PRYW</ogc:Literal>
							</ogc:PropertyIsEqualTo>
							<ogc:PropertyIsEqualTo>
								<ogc:PropertyName>kod_ob</ogc:PropertyName>
								<ogc:Literal>park</ogc:Literal>
							</ogc:PropertyIsEqualTo>
						</ogc:Or>
					</ogc:Filter>
					<se:PolygonSymbolizer>
						<se:Fill>
							<se:SvgParameter name="fill">#a5ffa5</se:SvgParameter>
							<se:SvgParameter name="fill-opacity">0.5</se:SvgParameter>
						</se:Fill>
					</se:PolygonSymbolizer>
				</se:Rule>
				<se:Rule>
					<se:Name>plaza</se:Name>
					<se:Description>
						<se:Title>plaza</se:Title>
					</se:Description>
					<ogc:Filter
						xmlns:ogc="http://www.opengis.net/ogc">
						<ogc:PropertyIsEqualTo>
							<ogc:PropertyName>kod_ob</ogc:PropertyName>
							<ogc:Literal>PLAZA</ogc:Literal>
						</ogc:PropertyIsEqualTo>
					</ogc:Filter>
					<se:PolygonSymbolizer>
						<se:Fill>
							<se:SvgParameter name="fill">#ffff7f</se:SvgParameter>
						</se:Fill>
					</se:PolygonSymbolizer>
				</se:Rule>
				<se:Rule>
					<se:Name>poletko lowieckie 1</se:Name>
					<se:Description>
						<se:Title>poletko lowieckie 1</se:Title>
					</se:Description>
					<ogc:Filter
						xmlns:ogc="http://www.opengis.net/ogc">
						<ogc:Or>
							<ogc:PropertyIsEqualTo>
								<ogc:PropertyName>kod_ob</ogc:PropertyName>
								<ogc:Literal>POL LOWIEC</ogc:Literal>
							</ogc:PropertyIsEqualTo>
							<ogc:PropertyIsEqualTo>
								<ogc:PropertyName>kod_ob</ogc:PropertyName>
								<ogc:Literal>POL PRODUK</ogc:Literal>
							</ogc:PropertyIsEqualTo>
						</ogc:Or>
					</ogc:Filter>
					<se:PolygonSymbolizer>
						<se:Fill>
							<se:SvgParameter name="fill">#b9c772</se:SvgParameter>
						</se:Fill>
					</se:PolygonSymbolizer>
				</se:Rule>
				<se:Rule>
					<se:Name>poletko lowieckie 2</se:Name>
					<se:Description>
						<se:Title>poletko lowieckie 2</se:Title>
					</se:Description>
					<ogc:Filter
						xmlns:ogc="http://www.opengis.net/ogc">
						<ogc:Or>
							<ogc:PropertyIsEqualTo>
								<ogc:PropertyName>kod_ob</ogc:PropertyName>
								<ogc:Literal>POL ZEROWE</ogc:Literal>
							</ogc:PropertyIsEqualTo>
							<ogc:PropertyIsEqualTo>
								<ogc:PropertyName>kod_ob</ogc:PropertyName>
								<ogc:Literal>POL ZGRYZ</ogc:Literal>
							</ogc:PropertyIsEqualTo>
						</ogc:Or>
					</ogc:Filter>
					<se:PolygonSymbolizer>
						<se:Fill>
							<se:SvgParameter name="fill">#b9c772</se:SvgParameter>
						</se:Fill>
					</se:PolygonSymbolizer>
				</se:Rule>
				<se:Rule>
					<se:Name>lotnisko</se:Name>
					<se:Description>
						<se:Title>lotnisko</se:Title>
					</se:Description>
					<ogc:Filter
						xmlns:ogc="http://www.opengis.net/ogc">
						<ogc:PropertyIsEqualTo>
							<ogc:PropertyName>kod_ob</ogc:PropertyName>
							<ogc:Literal>LOTNISKO</ogc:Literal>
						</ogc:PropertyIsEqualTo>
					</ogc:Filter>
					<se:PolygonSymbolizer>
						<se:Fill>
							<se:SvgParameter name="fill">#b4b4c8</se:SvgParameter>
						</se:Fill>
						<se:Stroke>
							<se:SvgParameter name="stroke">#000000</se:SvgParameter>
							<se:SvgParameter name="stroke-width">1</se:SvgParameter>
							<se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
						</se:Stroke>
					</se:PolygonSymbolizer>
				</se:Rule>
				<se:Rule>
					<se:Name>obszar esploatacji surow. min.</se:Name>
					<se:Description>
						<se:Title>obszar esploatacji surow. min.</se:Title>
					</se:Description>
					<ogc:Filter
						xmlns:ogc="http://www.opengis.net/ogc">
						<ogc:PropertyIsEqualTo>
							<ogc:PropertyName>kod_ob</ogc:PropertyName>
							<ogc:Literal>M MINERAL</ogc:Literal>
						</ogc:PropertyIsEqualTo>
					</ogc:Filter>
					<se:PolygonSymbolizer>
						<se:Fill>
							<se:SvgParameter name="fill">#ff8c00</se:SvgParameter>
						</se:Fill>
						<se:Stroke>
							<se:SvgParameter name="stroke">#000000</se:SvgParameter>
							<se:SvgParameter name="stroke-width">1</se:SvgParameter>
							<se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
						</se:Stroke>
					</se:PolygonSymbolizer>
				</se:Rule>
				<se:Rule>
					<se:Name>mezoregion</se:Name>
					<se:Description>
						<se:Title>mezoregion</se:Title>
					</se:Description>
					<ogc:Filter
						xmlns:ogc="http://www.opengis.net/ogc">
						<ogc:PropertyIsEqualTo>
							<ogc:PropertyName>kod_ob</ogc:PropertyName>
							<ogc:Literal>MEZOREG</ogc:Literal>
						</ogc:PropertyIsEqualTo>
					</ogc:Filter>
					<se:LineSymbolizer>
						<se:Stroke>
							<se:SvgParameter name="stroke">#ff00ff</se:SvgParameter>
							<se:SvgParameter name="stroke-width">2</se:SvgParameter>
							<se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
							<se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
							<se:SvgParameter name="stroke-dasharray">4 2</se:SvgParameter>
						</se:Stroke>
					</se:LineSymbolizer>
				</se:Rule>
				<se:Rule>
					<se:Name>obiekty ekologiczne</se:Name>
					<se:Description>
						<se:Title>obiekty ekologiczne</se:Title>
					</se:Description>
					<ogc:Filter
						xmlns:ogc="http://www.opengis.net/ogc">
						<ogc:PropertyIsEqualTo>
							<ogc:PropertyName>kod_ob</ogc:PropertyName>
							<ogc:Literal>OB EKOL</ogc:Literal>
						</ogc:PropertyIsEqualTo>
					</ogc:Filter>
					<se:PolygonSymbolizer>
						<se:Fill>
							<se:SvgParameter name="fill">#8caa41</se:SvgParameter>
						</se:Fill>
					</se:PolygonSymbolizer>
				</se:Rule>
				<se:Rule>
					<se:Name>ogr�dki dzialkowe</se:Name>
					<se:Description>
						<se:Title>ogr�dki dzialkowe</se:Title>
					</se:Description>
					<ogc:Filter
						xmlns:ogc="http://www.opengis.net/ogc">
						<ogc:PropertyIsEqualTo>
							<ogc:PropertyName>kod_ob</ogc:PropertyName>
							<ogc:Literal>OGR DZIAL</ogc:Literal>
						</ogc:PropertyIsEqualTo>
					</ogc:Filter>
					<se:PolygonSymbolizer>
						<se:Fill>
							<se:SvgParameter name="fill">#e2ffd0</se:SvgParameter>
						</se:Fill>
					</se:PolygonSymbolizer>
				</se:Rule>
				<se:Rule>
					<se:Name>pas przeciwpozarowy 1</se:Name>
					<se:Description>
						<se:Title>pas przeciwpo�arowy 1</se:Title>
					</se:Description>
					<ogc:Filter
						xmlns:ogc="http://www.opengis.net/ogc">
						<ogc:Or>
							<ogc:PropertyIsEqualTo>
								<ogc:PropertyName>kod_ob</ogc:PropertyName>
								<ogc:Literal>PPOZ A</ogc:Literal>
							</ogc:PropertyIsEqualTo>
							<ogc:PropertyIsEqualTo>
								<ogc:PropertyName>kod_ob</ogc:PropertyName>
								<ogc:Literal>PPOZ B</ogc:Literal>
							</ogc:PropertyIsEqualTo>
						</ogc:Or>
					</ogc:Filter>
					<se:LineSymbolizer>
						<se:Stroke>
							<se:SvgParameter name="stroke">#ff0000</se:SvgParameter>
							<se:SvgParameter name="stroke-width">1</se:SvgParameter>
							<se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
							<se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
						</se:Stroke>
					</se:LineSymbolizer>
				</se:Rule>
				<se:Rule>
					<se:Name>pas przeciwpozarowy 2</se:Name>
					<se:Description>
						<se:Title>pas przeciwpo�arowy 2</se:Title>
					</se:Description>
					<ogc:Filter
						xmlns:ogc="http://www.opengis.net/ogc">
						<ogc:PropertyIsEqualTo>
							<ogc:PropertyName>kod_ob</ogc:PropertyName>
							<ogc:Literal>PPOZ C</ogc:Literal>
						</ogc:PropertyIsEqualTo>
					</ogc:Filter>
					<se:LineSymbolizer>
						<se:Stroke>
							<se:SvgParameter name="stroke">#ff0000</se:SvgParameter>
							<se:SvgParameter name="stroke-width">1</se:SvgParameter>
							<se:SvgParameter name="stroke-linejoin">bevel</se:SvgParameter>
							<se:SvgParameter name="stroke-linecap">square</se:SvgParameter>
						</se:Stroke>
					</se:LineSymbolizer>
				</se:Rule>
				<se:Rule>
					<se:Name>tereny zalewowe</se:Name>
					<se:Description>
						<se:Title>tereny zalewowe</se:Title>
					</se:Description>
					<ogc:Filter
						xmlns:ogc="http://www.opengis.net/ogc">
						<ogc:PropertyIsEqualTo>
							<ogc:PropertyName>kod_ob</ogc:PropertyName>
							<ogc:Literal>TER ZALEW</ogc:Literal>
						</ogc:PropertyIsEqualTo>
					</ogc:Filter>
					<se:PolygonSymbolizer>
						<se:Fill>
							<se:SvgParameter name="fill">#00fffb</se:SvgParameter>
						</se:Fill>
					</se:PolygonSymbolizer>
				</se:Rule>
				<se:Rule>
					<se:Name>ostoje zwierzyny</se:Name>
					<se:Description>
						<se:Title>ostoje zwierzyny</se:Title>
					</se:Description>
					<ogc:Filter
						xmlns:ogc="http://www.opengis.net/ogc">
						<ogc:PropertyIsEqualTo>
							<ogc:PropertyName>kod_ob</ogc:PropertyName>
							<ogc:Literal>ZWIERZ</ogc:Literal>
						</ogc:PropertyIsEqualTo>
					</ogc:Filter>
					<se:PolygonSymbolizer>
						<se:Fill>
							<se:SvgParameter name="fill">#656d3e</se:SvgParameter>
						</se:Fill>
					</se:PolygonSymbolizer>
				</se:Rule>
				<se:Rule>
					<se:Name>strefa uszkodzen I</se:Name>
					<se:Description>
						<se:Title>strefa uszkodzen I</se:Title>
					</se:Description>
					<ogc:Filter
						xmlns:ogc="http://www.opengis.net/ogc">
						<ogc:PropertyIsEqualTo>
							<ogc:PropertyName>kod_ob</ogc:PropertyName>
							<ogc:Literal>USZK I</ogc:Literal>
						</ogc:PropertyIsEqualTo>
					</ogc:Filter>
					<se:PolygonSymbolizer>
						<se:Fill>
							<se:SvgParameter name="fill">#ffe1aa</se:SvgParameter>
						</se:Fill>
					</se:PolygonSymbolizer>
				</se:Rule>
				<se:Rule>
					<se:Name>strefa uszkodzen II</se:Name>
					<se:Description>
						<se:Title>strefa uszkodzen II</se:Title>
					</se:Description>
					<ogc:Filter
						xmlns:ogc="http://www.opengis.net/ogc">
						<ogc:PropertyIsEqualTo>
							<ogc:PropertyName>kod_ob</ogc:PropertyName>
							<ogc:Literal>USZK II</ogc:Literal>
						</ogc:PropertyIsEqualTo>
					</ogc:Filter>
					<se:PolygonSymbolizer>
						<se:Fill>
							<se:SvgParameter name="fill">#fed464</se:SvgParameter>
						</se:Fill>
					</se:PolygonSymbolizer>
				</se:Rule>
				<se:Rule>
					<se:Name>strefa uszkodzen III</se:Name>
					<se:Description>
						<se:Title>strefa uszkodzen III</se:Title>
					</se:Description>
					<ogc:Filter
						xmlns:ogc="http://www.opengis.net/ogc">
						<ogc:PropertyIsEqualTo>
							<ogc:PropertyName>kod_ob</ogc:PropertyName>
							<ogc:Literal>USZK III</ogc:Literal>
						</ogc:PropertyIsEqualTo>
					</ogc:Filter>
					<se:PolygonSymbolizer>
						<se:Fill>
							<se:SvgParameter name="fill">#ffad00</se:SvgParameter>
						</se:Fill>
					</se:PolygonSymbolizer>
				</se:Rule>
			</se:FeatureTypeStyle>
		</UserStyle>
	</NamedLayer>
</StyledLayerDescriptor>
