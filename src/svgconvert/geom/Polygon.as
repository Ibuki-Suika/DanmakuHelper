﻿/**
 * Polygon v0.2 (2009/09/22)
 * Copyright (c) 2009 Miller Medeiros <http://www.millermedeiros.com/>
 * This software is released under the MIT License <http://www.opensource.org/licenses/mit-license.php>
 */
package svgconvert.geom {
	
	import svgconvert.geom.Polyline;
	import flash.geom.Matrix;
	import flash.geom.Point;
	
	/**
	 * Object that represents a set of connected (and closed) straight line segments
	 * @author Miller Medeiros (www.millermedeiros.com)
	 */
	public class Polygon extends Polyline {
		
		/**
		 * Creates the Polygon object
		 * @param	pts<Point>	Points of the polygon
		 */
		public function Polygon(pts:Array) {
			super(pts);
		}
		
		/**
		 * Polygon Points
		 */
		override public function set points(value:Array):void {
			_points = value;
			_points.push(Point(_points[0]).clone()); //add close path point
		}
		
		/**
		 * Transform Polyline based on a Matrix
		 * @param	matrix	Tranformation Matrix
		 * @return	Transformed Polygon
		 */
		override public function transform(matrix:Matrix):* {
			var pts:Array = [];
			var n:int = points.length;
			while (n--) {
				pts[n] = matrix.transformPoint(points[n]);
			}
			pts.length -= 1; //remove last point since setPoints clone first one
			return new Polygon(pts);
		}
		
		override public function clone():Polyline {
			throw new Error("method clone() isn't available call 'new Polygon(points)' instead");
		}
		
	}
	
}