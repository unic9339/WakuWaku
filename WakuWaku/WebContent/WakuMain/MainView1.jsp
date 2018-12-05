<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="../CSS/MainView1.css" rel="stylesheet" type="text/css">

<!-- article 시작 -->
<div class="col-sm-8">
	<div id="myBtnContainer">
		<button class="btn active" onclick="filterSelection('Show all')">
			Show all</button>
		<button class="btn" onclick="filterSelection('Korean food')">
			Korean food</button>
		<button class="btn" onclick="filterSelection('Chicken')">
			Chicken</button>
		<button class="btn" onclick="filterSelection('Japanese food')">Japanese
			food</button>
		<button class="btn" onclick="filterSelection('Chinese food')">
			Chinese food</button>
		<button class="btn" onclick="filterSelection('Restaurant')">Restaurant</button>
		<button class="btn" onclick="filterSelection('Desert')">Desert</button>
		<button class="btn" onclick="filterSelection('Burger')">
			Burger</button>

	</div>
	<!-- Portfolio Gallery Grid -->
	<div class="row">
		<div class="column Burger">
			<div class="content">
				<img src="../img/burgerking.jpg" alt="burgerking" style="width: 100%">
				<h4>
					버거킹 4.0 <a href="burger information.html"> <span
						class="glyphicon glyphicon-triangle-right"></span>
					</a>
				</h4>
				<p>경기 화성시 동탄 지성로 190</p>
			</div>
		</div>
		<div class="column Korean food">
			<div class="content">
				<img src="../img/sundae.jpg" alt="sundae" style="width: 100%">
				<h4>
					담소소사골순대 3.5 <a href="sundae information.html"> <span
						class="glyphicon glyphicon-triangle-right"></span>
					</a>
				</h4>
				<p>경기 화성시 효행로 1063 메디프랜드 1층</p>
			</div>
		</div>
		<div class="column Chicken">
			<div class="content">
				<img src="../img/bbangya.jpg" alt="chicken" style="width: 100%">
				<h4>
					치킨빵야 4.0 <a href="bbangya information.html"> <span
						class="glyphicon glyphicon-triangle-right"></span>
					</a>
				</h4>
				<p>경기 화성시 병점2로 65 116호</p>
			</div>
		</div>
		<div class="column Japanese food">
			<div class="content">
				<img src="../img/today is sushi.jpg" alt="sushi" style="width: 100%">
				<h4>
					오늘은 스시로 3.5 <a href="sushi information.html"> <span
						class="glyphicon glyphicon-triangle-right"></span>
					</a>
				</h4>
				<p>경기 화성시 병점중앙로156번길 11-2</p>
			</div>
		</div>
		<div class="column Chinese food">
			<div class="content">
				<img src="../img/jajang.jpg" alt="jajangmyun" style="width: 100%">
				<h4>
					차이나팬더 3.0 <a href="china panda information.html"> <span
						class="glyphicon glyphicon-triangle-right"></span>
					</a>
				</h4>
				<p>경기 오산시 외삼미로 162-40 1층</p>
			</div>
		</div>
		<div class="column Japanese food">
			<div class="content">
				<img src="../img/ramen.jpg" alt="ramen" style="width: 100%">
				<h4>
					키와마루아지 3.5 <a href="ramen information.html"> <span
						class="glyphicon glyphicon-triangle-right"></span>
					</a>
				</h4>
				<p>경기 화성시 동탄중심상가2길 11 1층 101호</p>
			</div>
		</div>
		<div class="column Restaurant">
			<div class="content">
				<img src="../img/dominos.jpg" alt="pizza" style="width: 100%">
				<h4>
					도미노피자 3.0 <a href="domino information.html"> <span
						class="glyphicon glyphicon-triangle-right"></span>
					</a>
				</h4>
				<p>경기 화성시 병점중앙로 156</p>
			</div>
		</div>

		<div class="column Desert">
			<div class="content">
				<img src="../img/coffee.jpg" alt="coffee" style="width: 100%">
				<h4>
					커피볶는우리동네 3.5 <a href="coffee information.html"> <span
						class="glyphicon glyphicon-triangle-right"></span>
					</a>
				</h4>
				<p>경기 화성시 병점3로 95</p>
			</div>
		</div>
		<div class="column Burger">
			<div class="content">
				<img src="../img/touch1.jpg" alt="moms touch" style="width: 100%">
				<h4>
					맘스터치 3.5 <a href="touch information.html"> <span
						class="glyphicon glyphicon-triangle-right"></span>
					</a>
				</h4>
				<p>경기 화성시 병점2로 44</p>
			</div>
		</div>
		<div class="column Restaurant">
			<div class="content">
				<img src="../img/inseng.jpg" alt="cutlet" style="width: 100%">
				<h4>
					인생돈가스 4.0 <a href="inseng information.html"> <span
						class="glyphicon glyphicon-triangle-right"></span>
					</a>
				</h4>
				<p>경기 화성시 동탄공원로 3길 14-13</p>
			</div>
		</div>
		<div class="column Desert">
			<div class="content">
				<img src="../img/versailles.jpg" alt="versailles" style="width: 100%">
				<h4>
					베르사유 3.0 <a href="versailles information.html"> <span
						class="glyphicon glyphicon-triangle-right"></span>
					</a>
				</h4>
				<p>경기 화성시 동탄대로14길 6-29</p>
			</div>
		</div>
		<!-- END GRID -->
	</div>

	<!-- END MAIN -->
</div>

<script>
	filterSelection("Show all")
	function filterSelection(c) {
		var x, i;
		x = document.getElementsByClassName("column");
		if (c == "Show all")
			c = ""
		for (i = 0; i < x.length; i++) {
			w3RemoveClass(x[i], "show");
			if (x[i].className.indexOf(c) > -1)
				w3AddClass(x[i], "show");
		}
	}

	function w3AddClass(element, name) {
		var i, arr1, arr2;
		arr1 = element.className.split(" ");
		arr2 = name.split(" ");
		for (i = 0; i < arr2.length; i++) {
			if (arr1.indexOf(arr2[i]) == -1) {
				element.className += " " + arr2[i];
			}
		}
	}

	function w3RemoveClass(element, name) {
		var i, arr1, arr2;
		arr1 = element.className.split(" ");
		arr2 = name.split(" ");
		for (i = 0; i < arr2.length; i++) {
			while (arr1.indexOf(arr2[i]) > -1) {
				arr1.splice(arr1.indexOf(arr2[i]), 1);
			}
		}
		element.className = arr1.join(" ");
	}

	// Add active class to the current button (highlight it)
	var btnContainer = document.getElementById("myBtnContainer");
	var btns = btnContainer.getElementsByClassName("btn");
	for (var i = 0; i < btns.length; i++) {
		btns[i].addEventListener("click", function() {
			var current = document.getElementsByClassName("active");
			current[0].className = current[0].className.replace(" active", "");
			this.className += " active";
		});
	}
</script>

<!-- article 끝 -->

