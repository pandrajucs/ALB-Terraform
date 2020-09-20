resource "aws_lb_target_group_attachment" "tg1" {
  target_group_arn = "${aws_lb_target_group.htg.arn}"
  target_id        = "${aws_instance.server-1.id}"
  port             = 80
}

resource "aws_lb_target_group_attachment" "tg2" {
  target_group_arn = "${aws_lb_target_group.htg.arn}"
  target_id        = "${aws_instance.server-2.id}"
  port             = 80
}

resource "aws_lb_target_group_attachment" "tg3" {
  target_group_arn = "${aws_lb_target_group.htg.arn}"
  target_id        = "${aws_instance.server-3.id}"
  port             = 80
}

resource "aws_lb_target_group_attachment" "tg4" {
  target_group_arn = "${aws_lb_target_group.mtg.arn}"
  target_id        = "${aws_instance.server-4.id}"
  port             = 80
}

resource "aws_lb_target_group_attachment" "tg5" {
  target_group_arn = "${aws_lb_target_group.mtg.arn}"
  target_id        = "${aws_instance.server-5.id}"
  port             = 80
}

resource "aws_lb_target_group_attachment" "tg6" {
  target_group_arn = "${aws_lb_target_group.mtg.arn}"
  target_id        = "${aws_instance.server-6.id}"
  port             = 80
}

resource "aws_lb_target_group_attachment" "tg7" {
  target_group_arn = "${aws_lb_target_group.stg.arn}"
  target_id        = "${aws_instance.server-7.id}"
  port             = 80
}

resource "aws_lb_target_group_attachment" "tg8" {
  target_group_arn = "${aws_lb_target_group.stg.arn}"
  target_id        = "${aws_instance.server-8.id}"
  port             = 80
}

resource "aws_lb_target_group_attachment" "tg9" {
  target_group_arn = "${aws_lb_target_group.stg.arn}"
  target_id        = "${aws_instance.server-9.id}"
  port             = 80
}


resource "aws_lb_listener" "web" {
  load_balancer_arn = "${aws_lb.alb.arn}"
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.htg.arn}"
  }
}

resource "aws_lb_listener_rule" "static" {
  listener_arn ="${aws_lb_listener.web.arn}" 

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.mtg.arn}"
  }

  condition {
    path_pattern {
      values = ["/movies/"]
    }
   }

  }

  resource "aws_lb_listener_rule" "static1" {
  listener_arn ="${aws_lb_listener.web.arn}" 

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.stg.arn}"
  }

  condition {
    path_pattern {
      values = ["/shows/"]
    }
   }

  }


/* resource "aws_route53_record" "www" {
  zone_id = "Z0880630DSDGCDTP0JHD"
  name    = "www.pandrajucs.in"
  type    = "A"

  alias {
    name                   = "${aws_lb.alb.dns_name}"
    zone_id                = "${aws_lb.alb.zone_id}"
    evaluate_target_health = false
  }
} */