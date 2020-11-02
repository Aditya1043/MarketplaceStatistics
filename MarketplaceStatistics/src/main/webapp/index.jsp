<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
		<meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>Dashboard</title>        
  <style>
      .ch-grid {
	margin: 20px 0 0 0;
	padding: 0;
	list-style: none;
	display: block;
	text-align: center;
	width: 100%;
}

.ch-grid:after,
.ch-item:before {
	content: '';
    display: table;
}

.ch-grid:after {
	clear: both;
}

.ch-grid li {
	width: 220px;
	height: 220px;
	display: inline-block;
	margin: 20px;
}
      
      .ch-item {
	width: 100%;
	height: 100%;
	border-radius: 50%;
	position: relative;
	box-shadow: 0 1px 2px rgba(0,0,0,0.1);
	cursor: default;
}

.ch-info-wrap{
	position: absolute;
	width: 180px;
	height: 180px;
	border-radius: 50%;

	-webkit-perspective: 800px;
	-moz-perspective: 800px;
	-o-perspective: 800px;
	-ms-perspective: 800px;
	perspective: 800px;

	-webkit-transition: all 0.4s ease-in-out;
	-moz-transition: all 0.4s ease-in-out;
	-o-transition: all 0.4s ease-in-out;
	-ms-transition: all 0.4s ease-in-out;
	transition: all 0.4s ease-in-out;

	top: 20px;
	left: 20px;
	box-shadow: 
		0 0 0 20px rgba(255,255,255,0.2), 
		inset 0 0 3px rgba(115,114, 23, 0.8);

}

.ch-info{
	position: absolute;
	width: 180px;
	height: 180px;
	border-radius: 50%;

	-webkit-transition: all 0.4s ease-in-out;
	-moz-transition: all 0.4s ease-in-out;
	-o-transition: all 0.4s ease-in-out;
	-ms-transition: all 0.4s ease-in-out;
	transition: all 0.4s ease-in-out;
		
	-webkit-transform-style: preserve-3d;
	-moz-transform-style: preserve-3d;
	-o-transform-style: preserve-3d;
	-ms-transform-style: preserve-3d;
	transform-style: preserve-3d;

}

.ch-info > div {
	display: block;
	position: absolute;
	width: 100%;
	height: 100%;
	border-radius: 50%;
	background-position: center center;

	-webkit-backface-visibility: hidden;
	-moz-backface-visibility: hidden;
	-o-backface-visibility: hidden;
	-ms-backface-visibility: hidden;
	backface-visibility: hidden;
}

.ch-info .ch-info-back {
	-webkit-transform: rotate3d(0,1,0,180deg);
	-moz-transform: rotate3d(0,1,0,180deg);
	-o-transform: rotate3d(0,1,0,180deg);
	-ms-transform: rotate3d(0,1,0,180deg);
	transform: rotate3d(0,1,0,180deg);
	
	background: orange;
}

.ch-info .ch-info-back1 {
	-webkit-transform: rotate3d(0,1,0,180deg);
	-moz-transform: rotate3d(0,1,0,180deg);
	-o-transform: rotate3d(0,1,0,180deg);
	-ms-transform: rotate3d(0,1,0,180deg);
	transform: rotate3d(0,1,0,180deg);
	
	background: lightblue;
}      
      
.ch-img-1 { 
	background-image: url(data:image/png;base64,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);
}

.ch-img-2 { 
	background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAbFBMVEVUrNL///9OqtFKqNCbzeTy+fz5/P5Ep8/3+/1jstVst9iMxN/R5/K73e1YsdeOyOTq9Pnj8PeDwt6j0Ofb7fVkttq02OnJ4e52vdvB4vGt1eik0uaVyuLX6vTO5vFuudlHotKVxOY4os18wN9OKfBHAAAVZ0lEQVR4nN2d6YKzLLKAtXDDLWqMGmPMmTf3f48DuOGComJ3z6n5Md+bTtRHoKooikLTrxbTjKK4DkrDqL5FI9/KMMqgjqPINC+/v3bhtZ3Yf5ZGUmCwEQIiWif0HwjZgIvEKJ9+7Fz4FJcRpqVXuFgjaNqaEFANu4VXplc9yAWETuS/XNJssM424gTSoO7Ljy5oTNWEVp15eKPdxO2Jvay2FD+RWsLaKMIdTbfUmGFh1EqfSR2hmd41+2DrjVvS1oy3Oh2rijDNklONN6GEJFOletQQ+h5WyNcwYs9X8mwKCKMA22rxWkgbB9EfIIxfnyvwWsjPK/5lQtPA6DI+KggbJ5XOKcL4dUn3HAvY59rxBGH0wtfzMUb8OjEejxNm7s/wMUY3+2lC533x+JsKwkfduWOEcaX9XAM2Alp1zAc4RJj90ACcMOJDXfUAYVr8bAcdBBXvHyB0fqcBGwEt2z2D3EsYFb+G10ix1zjuI7Seih3s/QLw3KdUdxE6xi/jNVLt8uP2EMYX+th7BD57euoOwmf4NwCpwgkuILTK3+YayUt6MMoSmtUFDXhCbYH0YJQkjK+w8uhb4RM/lhyMcoSX6BgwzPrMz105RClC/3EF4Eu3Tr04wFKBVRnC+gIzz9Rhbp+7BsggShD6xweL+OHcnFz59IWxRMBxm7C+ABAVVBOW57tGuG0YNwnrK4agR61ZpEJ92ZuIW4SXdNEXmwJlSgxQuNVRNwgv6KIQPtmlTUXX29Ko64TvC5Ro5za/VPkQsN6Kq4Sx+oAhctvQZ6zskvBYNf1rhFGhHBCSzp1U6Oeuz6ZWCE31gFrQTQl6f03FPaBYccPFhFal2tkGLe+v7rUXx4mKu6BKPJkSEyqwx2MBdwjpvlt/DSonUdKK5X7Cp4L7jgQl3GjpjBBYeqqmqzz3EsahkvsOAvw6YPf6EH31npLOEoq0jYDQUT4h5CPyZtczMX2sSMnLhI8gVrxMaBmK8w7wqBNl7dXb0RMouRkYy9pmmTBXcctBkDtyO5zuc9xYfyUuuCYaiouEkeIWTMYdyGh1C0q6NlWjbGBxpXiJUI0C7wVPNHnvr0GvHBIlN4JiaSguEWYqAZE2XdjsxjhUQ6dRNIVZWmBcIEyVzpi8adfxu79gDj1TczO8sEy8QKjSHYVyquCszl8Dg/tUkQ8MhQxhoNAdRTNAPe3ia+HofT/VvFY0D2rMCFUNCSp4QX+73bNU488/im45c22mhJa6eRt4C6Mi6P5qT8ZnqsZNhNksY0r4VnIfKmimY4iY306RetM/qXKjpskMU0Jl/igYS8apt+3hrH1jd/V60vfF64TBuTj7IOFrgU93+llTNf+jIosxjaCOCU1F4x0+yyG+Ib62lBijqP+445DGmFDRvB7c5VzCXk/PRyEVf/Wi8ncfd58RYfxQc4tEkCzZKxO0OF111MyFJxZjRPhS1E0E0+33ehMqW0IYNyJPaKpRMwt+xaQJ54p0+o1zYvMjUVN//am67qT31+ZWuRNH0TDhXV6O0FRjkJBopeTbv0BxhqGiiRs/EjlCNYoUPEFEaIhyC0Yhe8uK5hjcpHsgVBQtwYIG6v01gSJtJVfjnnLmaiB8Kpk1CcdY3gOuNCHx/JVE+TU0zGoGQkUeheDJzb5thIq0EUWzt8ecMFViKoSWone5xYq0lbuSN23377EnNFT0DuEylzXo6a1U7VhJIw6uvab0uvgtaKD+/a0p0laC1VtIP0rXiB2hksj6NDIxtEvfhKuKtBE1FgO6yGJLqMbptUVLseWOJiTuqRLCzi63hEryBkC04yP+131lQ5G2ouR1QzoiLBXoGfFqeiWtSBtREpXqZhgtoRI9I1qG5Wa2kntelMwBME8YKzCGS6EXJqY3dJB5hHhRIhWJPK1JbAhVON1ItAtylAicWVKMKlR7200bwu/5C6K74GEnC+a1LoWooBHhOxAqWG2Cjyl48ud4BEAqRagiKtVMczRVfUKkZqbzalEcbiIqDDQEHaGC7Cf4inbNzeK8UEg14vt8v2oypShhdD58ASJnbGEfA/o6MowKAn+su1DC9PS1kCF4TGvJlYCXDKKjQDmkLeH5VIj5ql33mMvfL2UU6nntwFKuKOF5X16kZiyBvrBzwQ94MU/bMGYvKOHpCwkdUrEZkvHAz0eloCGMzrpstvBxxf6lsF/zcjqvhy40a+dTE4QO6RBfW/gRjraHonm2EWnYSDsfoRGrmTWrDYnICeLkbFSK6njtdF+Yp8x08l59dWhxlXgsZ+0YJJTwpL1fTiZjfWzDe5ZAPJ0ZQmy+dtbttoX7OTZjZsLgKteIJ80+TgnhuVzSdoqyIPF27w+39w+e3VmTE8JzHo1Y62cSRij0N7XNOXWKMkJ4Sl+BcCxJaXqJqdQ5WwZ3XTs3mF2RN7Poci88QbJVq8Q8peqhcrRTEWYk9C9lVwmEC6q9nJrtE4dSO2Ms4CN6LEc6HgiiiVcvp+bnbqSdWq8Thj935I3A1lTqVIoIjrT4+BsSq5l9UZatgjNnAvJ2rJ0IBmORIrT2LbcuZWfzciY+TAiPL98jYemtndsZINywGSdm++h5nHApa7xtwmCnmYZiHdE6bjEI4XGLKnRII2/vNcFbr8WS/tu+huDKpXZ0dogEG6mOdSrw1hXqYbcEGdrRhSyxQ3rI/tjrq1KH0wzgMCESbEt1DmdSCzeBMjm6Onac0F1+EDNK30czqVdXT4+mFR4mhFS3HDOOY7+u8zwPgqwsX68qSRL3YNFBhMQhOyr1MX0B1dE2fFWel7gfF5CNmLDTDmB/rR56RoJthx+j3KjgfXCGUBzWNHCAhv8tAi3EGLtemaeRI7GQcXCvy3HCQ0K4SJPhIvEqg5LtqoB47EmTHyJkB3bYWlLds7xOI/PIKQ+HLMbxcSh19b4v4qTM60hq2XBFjswxjluLrQuTvvj5JpXxyt+xsnMODuS5X0aY1P7BvrgmB7ZhUsIrigL/339M0yFiUqH/YY3kKOGBTebEL1WT3j0VsAcJPy7psLwYvLwyJkEj+Uj8dy/EuzDj/QkakJ2YPe260UgQL0ufdRL2gl3ymg54bmR+mP9W6er9ckRjEEIVSXt/WGgk6q+Uzr1GUHwuXvr3BUeaqo2xf1RcQqi2kMkfE7puYV1i8v+KQGVp6quW/SWh64eKqjT9UYHg9Dr+Xxe6jq9mx9MfFZaL8f/aXHwiBTlRf1manChVdQb+otA1XG3vBmBhDBFG/3exsAjQttDtwNrOdfKPt3zQTNjN3r47LnZckrIuqf7YwGzzS/UdV6aZE0tbounnbC79cNTULViXZ5RnBn3V3oYh0BvCHaqGkixVw6cvixIiQ1FlhlV56PfmnGG8ntVCFQ0j3DEQCWG0kJ4OhR4zQkgUVYBZE/TsboLXc9ZYpgEl3LGBlBDeovdsmR6941fTS90faEL73a1hbBD2+y0ieZtPCBNj3q0fZmUoLWW3KnbaVVLfIPx0e2Z2JHESQk+LZ5HZwPzXtiGn3YhdCUPeukD3Mff3ifFB09/Q76HRZ4D+pXHYxOIIoS22G81OHkYoXxWZEtrGJLxORuHdTpyG0Oi6MCrKp+/XgdFBux79VCuMT4N7D3LfD/iDTFF4D2rfzzO+k6BvSb73zL7N94rKMKLodWdS6rVxvwujqP3etR25xpQQHlE9Uqdwdz7gmo21MBt6sANHf5ZGEOtxwr4N1Zu8/yR2HKrZUBHreXkva928dRdDN/LlzLiXjpWGXf1IyCznWd6fpsXOm4Ikchxdb6LppkmsuWmKAqJNrlWzh1TaXjBClI1TeGw6x+wJmaqBwoyqZmEYyqaPgJHCN7LKB+tVT92gi4mAbM9qXzAK9IwtMAIq/HbHOkqIlrDpF+1H3TwmQv/eqcZWnm2NdB7h+fTQlLhtCKUzoRmh5o6mzfClwA0hfBtCN4qG9fwXWxcDI76ZdbNWzWDavyLPaXaehMMOFNB0n/V2bPbb+yDM2xcrqWnadJGGUHpjUENIDBJnFOyabqwYEaKU7xYQ0CUVurWmbsYkebvcK4LKevQvqnu6jO1NJr/kjinCURP6lCRsa0+2+/Fl7UVDSF7tcGXyEX3dfC8lqmeknsHMGGHUffAevVLk050j8HW4ZAQcG4i+CW/UWZpsWjuVsvhtem9LKNtNW0It4ELlzwhNCFEwyTy+kR/BrZunkYYezdhQxVrvwy/yQlHQJpxcp2b1+OUIu9TJri6GZDZhSwje0KNc4iROCCGaqDdqzMhMpm0QMmsbK29ofNqIqNWRKUSTMBnc2I5NQoi3CbV4ROhIpsZ1bRjGXW4xyprb8YTu0uZIO+3KXUAwOY3MNlk4jGh30ytCzoQ3L28Ql4VcpAihGtc2kS170xGiV9eI4DQ9jiMkvsQyYftfYTy5m+0zVxfwvTYtYtwrDK12nRCCSaO7cm3YbTnqCCVT9jtCAtZEIeHWbh3hCV9LCUxEA7b/hc0JIcravenE6CRGEOlmdGM9ZbpzkKksuXHY71Xp60TJRWt6QpQ19d1w1CopjhASa5VQe0/cRJs7RI8m3hDnoClLNAUIzZtkGw6bHHpCOZPYExI0Zv/Kzkcd+TTR5MYAPCGUk7OebJZlwfuiRBES3w4mKTSQOLTDyBDa8YxQLjNuIGzYcOo3z0DcNM5apOOtkVCSXsgRVpOb0Tm7Bjk/UIitt4lOHqsklJlIjpDb6zIQSp1eNRCSjl4j8PRb80/Uzp4aa5GM0pbBpcs/XC/V0ohvG/SkhzE8In7PKap0oLnRvMoiXg8DkiBE7wVCqe3vHCHKoxDSrnzFiJBoBP7lQ03HLHqm/QcvPhICOKIKBVJ+0ymqSBuSLsLPYlDdhLm2NQ2/f56rAihjMDhC0rdeZe+dTQjvutE/GrozN5uoj+Ey5lCHEnDKvDnSd3nPKqeExLMoh+skrbvOt+Hyyhlfk2tn/VKe0A4isz/rY0xIR2mFyeSJqMbwbrLo3IgQx3EC9PsAn9RsaO3cythviKIh1qyxu6UeuHR+BAhXTouD/H5EPcmbWpg9fcxFQpncP56QbpAdah/fR4T0aKA4e30/r+AdNV8isyfuOm4Q5dXn80ly89mrnTv5TVl8PmXwTtsDspGRRgH5opelvTPLERZ+lAeziOIozX5Uq3J7IMItHaY4YTC0iub6rMNi/9Ex3E0yFdetspsofsYrlZ+AzdLrZDATgF/0N6YeG3joxJVJJvK6+epHKSR934TQq+NZCAx0EaFEjVuwebM1mgM190Hjr/J9aHL1Ljd8cnn6oT1Stewz/r68ez75MvsoExKqOrTnd2WyuXhcUVVN2clflklxwzGhc8GBgD8t0yIPk6q49f9+Hp89KWMwrfurplDxL8qsyMOUUNFhKL8ns/qhs9rN/+Or+vPd1zPC8yucv/qK5kUe5vW3D24Sa67/dsy3mnLVx2ShyMNChfHjFQvbKsG/p4+X6r0vEB4/57gNHSg86nefwNLZIUtV4g8fskpLvUdb9aGulKWdtot18A/W2qBVkcxERbG8YwK3JZhFQuvYTtcHaT9Pq8+6t0dfD+DFfVbLZxkcOtKG1u7yQ3p4BldYFybSfsQ9V/eP9o/hp80CQoAfjwdG0v0JL5dAEJzWcCQ1mt6BzDDp3KWLFsDXH+1jqksa4KjrQV3jPGc1Jsg3awNBWL4jVhMIwKhTKrms3hJVWhGdR7HfP4WvxUYgG43dodTTkUEm5/Q4+8Fkum1FKfrNp82qpVj0IsXgfEVS/RYlgi1xwhM3dpsMWriNRTWoRu2Wbb4xa4g0jlP68PQsoAmhNRAGrABI9P6wt6XHeRAEFDSVeBYQVqwSnsu9eyhSsBtteXr8Qd2HHOkeWTqgHlST01COmDAlP3waxYMYbvK4uUtzEWjkRiZXRFz6TXy2+k6rSFM5HdY5aaLObJ8K8qz2IGUxISvTQvUNHdHvVp+zOuHbG13F5fvEhDs3FtMh1ISH4WvODAbQBKxnuEEYFc0FEv4V2Rn518ajrJVgXCHcZfjR3WIqgkk+naLAI+1bZYWwjfVRXcVnOjhbe5xRtbLjeI1wz5YoOg7y1vrZs45Fq6N3uktM2N2PHgTCIdHC46svG5K13eJrhLpZSGcSUafev7cSWOOzh+BJe2Bn2YWEUYtl01u/n51QHbK20xV9VrfDrxLqsaz7Ng3/6HyyNDs389uf4iEm7KL28wdZIYSNksTrhHoqGyNeeSh2CNqQciBHGI9F7GOBu1ELbYNQcrLIsnMyTt7DqEKGoztc9Geb0CZ6I7RHIn6IrWJvm4S6L1OkJSQdxf837DK3qWZslk/QzRkXQxgR0tXoOeF7rEuRPVuaGK62WeR1k1B/b7ciOyDHmytPTWvKd44W0MeE1QIhzaPgEgFQFsf3ZUTA21VstwmXjjeYCPVBxgcWM0+EzAqgiKdlvWmwqPuETelmhGyBsx95iPaH5QDg5hiUJCRu4brRYGHmyXLzw2QGg3bf6DOeHlL/o0kbRh86pZsT0miEk5DBR/5n0wKny3UY0eYYlCXU4/UFGzZfmnwF+YyDpkT434IIK4bx/RCakDoggYux+7L0xTZszk/JvuQ7H1oYc/lAa/jIVK6XIyR6cbUV9Xm5X5bQksLUFtMcjDYtkqZr69F3QZdSYfP1tgxKvmiV0aons5dQN1fcJlZXf/aW6UqzNX8INmO/t0uYZuli0oy918bdAxtdA6XlMmAlWdhHkpCMfHETho/HwgSOfPrQ2MyQky5B73Ej8qHL1bj7LR5fBDSXfueLBTN8Qc2/E4T682CpuWWR2UAI45gV/xe8XoPwGKHuu39lbRG5wsqipwiVnQx+VtZnS2cIyWBU2lMP8mHpIXiAkMzTf7unItGRyooIdaf61RVQ0OTOiDxBqOv1LyoccOV16HFCPfakdopfwIc8KT/tNCG1G7+BCHtsxElC3Xz9uMZBLPr9Y4T0jJWVyIJ6ATs50EFPEdJJ0Y9pVdC+hzroSULdCX5oNRu+wYkqmicIyXDM8eV9lXjowakCqKcIiTyLS/sqaEV2snLtWULSV5PjRaG3+CA50z8VEdIlhmv0KrKTt4ICvQoIdRaOUNxZkeaWauoPqyGkSsdQp3XAxkauqr6yKkJdt+Ig+afAYwX0Lwnik+qFE3WEVMzAc7UTlIA0nJwzDjNRS6jTHJGyCA9BAgqLMj/qnAlFOaFOD7nIb9i2kbQVobtkbHzLI7Wt18gVhEwsv/QKF1OfRAzKYorYLbxy+5jAo3IZIRUn9p+Z4X0xBnuoa93WtrYB469nZE8/Vl27fSSXEjbimFEUx3VAYDvJnkEdx5H6uvQL8l8ZjhYPe8h1MgAAAABJRU5ErkJggg==);
}

.ch-info h3 {
	color: #fff;
	text-transform: uppercase;
	letter-spacing: 2px;
	font-size: 14px;
	margin: 0 15px;
	padding: 40px 0 0 0;
	height: 90px;
	font-family: 'Open Sans', Arial, sans-serif;
	text-shadow: 
		0 0 1px #fff, 
		0 1px 2px rgba(0,0,0,0.3);
}

.ch-info p {
	color: #fff;
	padding: 10px 5px;
	font-style: italic;
	margin: 0 30px;
	font-size: 12px;
	border-top: 1px solid rgba(255,255,255,0.5);
}

.ch-info p a {
	display: block;
	color: #fff;
	color: rgba(255,255,255,0.7);
	font-style: normal;
	font-weight: 700;
	text-transform: uppercase;
	font-size: 9px;
	letter-spacing: 1px;
	padding-top: 4px;
	font-family: 'Open Sans', Arial, sans-serif;
}

.ch-info p a:hover {
	color: #fff222;
	color: rgba(255,242,34, 0.8);
}

.ch-item:hover .ch-info-wrap {
	box-shadow: 
		0 0 0 0 rgba(255,255,255,0.8), 
		inset 0 0 3px rgba(115,114, 23, 0.8);
}

.ch-item:hover .ch-info {
	-webkit-transform: rotate3d(0,1,0,-180deg);
	-moz-transform: rotate3d(0,1,0,-180deg);
	-o-transform: rotate3d(0,1,0,-180deg);
	-ms-transform: rotate3d(0,1,0,-180deg);
	transform: rotate3d(0,1,0,-180deg);
}
      
      @import url('https://fonts.googleapis.com/css?family=Quicksand');

html,body {
  height: 100%;
}

.wrapper {
  height: 100%;
  font-family: 'Quicksand', sans-serif;
  line-height: 1.5;
  word-spacing: 4px;
  letter-spacing: 1px;
}

.fixed-bg {
  background-attachment: fixed;
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center center;
  height: 80%; 
  width: 100%;
  color: white;
  text-align: center;
  display: table;
    
}

.fixed-bg h1 {
  display: table-cell;
  vertical-align: middle;
}

.scroll-bg {
  background-color: white;
  padding: 10px 70px;
  color: white;
}

/* first section */

.bg-1 {
  background-image: url('https://i.pinimg.com/474x/aa/89/8f/aa898f8a047e4cf45d9cff6d34b93c0e.jpg');
}


        </style>
    </head>
    <body>
        
        
        <div class="wrapper"> <!-- wrapper div starts -->
  
  <div class="fixed-bg bg-1">
    <h1 style="border: 5px solid white;">Marketplace Statistics</h1>
  </div>
  
  <div class="scroll-bg">
        <div class="container">
			<section class="main">
			
				<ul class="ch-grid">
                    <li>
						<div class="ch-item ch-img-1">				
							<div class="ch-info-wrap">
								<div class="ch-info">
									<div class="ch-info-front ch-img-1"></div>
									<div class="ch-info-back">
										<h3>Amazon Web Services Report</h3>
										<p><a href="aws.jsp">Click Here</a></p>
									</div>	
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="ch-item ch-img-2">
							<div class="ch-info-wrap">
								<div class="ch-info">
									<div class="ch-info-front ch-img-2"></div>
									<div class="ch-info-back1">
										<h3>Microsoft Azure Report</h3>
										<p><a href="azure.jsp">Click Here</a></p>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
				
			</section>
			
        </div>
            </div>
        </div>
    </body>
</html>