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
