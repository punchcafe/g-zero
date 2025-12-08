extends GutTest

func test_to_cartesian():
	var cases = [\
		# Rotatate through theta while keeping fi 0
		# TODO: determine the best orientation for this, as this is currently 
		# following academinc with Z pointing up.
		{"fi": 0, "theta": 0, "radius": 10, "expected": Vector3(0,10.0,0)},\
		{"fi": 0, "theta": PI/2, "radius": 10, "expected": Vector3(10.0,0,0)},\
		{"fi": 0, "theta": PI, "radius": 10, "expected": Vector3(0,-10.0, 0.0)},\
		{"fi": 0, "theta": 3*PI/2, "radius": 10, "expected": Vector3(-10.0,0,0)},\
		
		{"fi": PI/2, "theta": 0, "radius": 10, "expected": Vector3(0,10.0,0)},\
		{"fi": PI/2, "theta": PI/2, "radius": 10, "expected": Vector3(0,0,-10.0)},\
		{"fi": PI/2, "theta": PI, "radius": 10, "expected": Vector3(0,-10.0, 0.0)},\
		{"fi": PI/2, "theta": 3*PI/2, "radius": 10, "expected": Vector3(0,0,10.0)},\


		{"fi": -1 * PI/2, "theta": 0, "radius": 10, "expected": Vector3(0,10.0,0)},\
		{"fi": -1 * PI/2, "theta": PI/2, "radius": 10, "expected": Vector3(0,0,10.0)},\
		{"fi": -1 * PI/2, "theta": PI, "radius": 10, "expected": Vector3(0,-10.0, 0.0)},\
		{"fi": -1 * PI/2, "theta": 3*PI/2, "radius": 10, "expected": Vector3(0,0,-10.0)},\

		{"fi": PI, "theta": 0, "radius": 10, "expected": Vector3(0,10.0,0)},\
		{"fi": PI, "theta": PI/2, "radius": 10, "expected": Vector3(-10.0,0,0)},\
		{"fi": PI, "theta": PI, "radius": 10, "expected": Vector3(0,-10.0, 0.0)},\
		{"fi": PI, "theta": 3*PI/2, "radius": 10, "expected": Vector3(10.0,0,0)},\
		
		{"fi": 3 * PI/2, "theta": 0, "radius": 10, "expected": Vector3(0,10.0,0)},\
		{"fi": 3 * PI/2, "theta": PI/2, "radius": 10, "expected": Vector3(0,0,10.0)},\
		{"fi": 3 * PI/2, "theta": PI, "radius": 10, "expected": Vector3(0,-10.0, 0.0)},\
		{"fi": 3 * PI/2, "theta": 3*PI/2, "radius": 10, "expected": Vector3(0,0,-10.0)},\
	]
	for case in cases:
		var subject = SphericalCoordinate.new()
		subject.fi = case.fi
		subject.theta = case.theta
		subject.radius = case.radius
		assert_almost_eq(case.expected, subject.to_cartesian(), Vector3(0.01, 0.01, 0.01))

func test_add():
	var cases := [\
	# RADIUS cases
	
	# TODO: Still a few open questions for this as to how they should interact, 
	# and what happens when something goes negative.
	# For now, a few simple cases of simple addition / subtraction
	
		{\
		"lhs": SphericalCoordinate.of(1.5, 0.0, 0.0),\
		"rhs": SphericalCoordinate.of(3.0, 0.0, 0.0),\
		"expected": SphericalCoordinate.of(4.5, 0, 0)\
		},\
		{\
		"lhs": SphericalCoordinate.of(-1.5, 0.0, 0.0),\
		"rhs": SphericalCoordinate.of(3.0, 0.0, 0.0),\
		"expected": SphericalCoordinate.of(1.5, 0, 0)\
		},\
	
	# THETA cases
	#
	# Wrapping over PI -> -PI
		{\
		"lhs": SphericalCoordinate.of(0, PI - 0.1, 0.0),\
		"rhs": SphericalCoordinate.of(0, 0.2, 0.0),\
		"expected": SphericalCoordinate.of(0, 0.1 - PI, 0.0)\
		},\
	# Wrapping over -PI -> PI
		{\
		"lhs": SphericalCoordinate.of(0, -PI + 0.1, 0.0),\
		"rhs": SphericalCoordinate.of(0, -0.2, 0.0),\
		"expected": SphericalCoordinate.of(0, PI - 0.1, 0.0)\
		},\
	# Simple Addition
		{\
		"lhs": SphericalCoordinate.of(0, 1.0, 0.0),\
		"rhs": SphericalCoordinate.of(0, 1.0, 0.0),\
		"expected": SphericalCoordinate.of(0, 2.0, 0.0)\
		},\
	# Simple Subtraction
		{\
		"lhs": SphericalCoordinate.of(0, 1.0, 0.0),\
		"rhs": SphericalCoordinate.of(0, -0.5, 0.0),\
		"expected": SphericalCoordinate.of(0, 0.5, 0.0)\
		},\
	# FI cases
	#
	# Wrapping over PI -> -PI
		{\
		"lhs": SphericalCoordinate.of(0, 0.0, PI - 0.1),\
		"rhs": SphericalCoordinate.of(0, 0.0, 0.2),\
		"expected": SphericalCoordinate.of(0, 0.0, 0.1 - PI)\
		},\
	# Wrapping over -PI -> PI
		{\
		"lhs": SphericalCoordinate.of(0, 0.0, -PI + 0.1),\
		"rhs": SphericalCoordinate.of(0, 0.0, -0.2),\
		"expected": SphericalCoordinate.of(0, 0.0, PI - 0.1)\
		},\
	# Simple Addition
		{\
		"lhs": SphericalCoordinate.of(0, 0.0, 1.0),\
		"rhs": SphericalCoordinate.of(0, 0.0, 1.0),\
		"expected": SphericalCoordinate.of(0, 0.0, 2.0)\
		},\
	# Simple Subtraction
		{\
		"lhs": SphericalCoordinate.of(0, 0.0, 1.0),\
		"rhs": SphericalCoordinate.of(0, 0.0, -0.5),\
		"expected": SphericalCoordinate.of(0, 0.0, 0.5)\
		},\
	]
	
	for case in cases:
		var result = case.lhs.add(case.rhs)
		assert_almost_eq(case.expected.fi, result.fi, 0.01)
		assert_almost_eq(case.expected.theta, result.theta, 0.01)
		assert_almost_eq(case.expected.radius, result.radius, 0.01)
