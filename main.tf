resource "aws_db_subnet_group" "db_subnet" {
  name       = "db_subnet"
  subnet_ids = var.subnet_group_name_list

  tags = {
    Name = "db-subnet-${var.db_name}"
  }
}

resource "aws_db_instance" "db_instance" {

  identifier             = var.identifier
  db_name                = var.db_name
  instance_class         = var.instance_class
  allocated_storage      = var.storage_size
  engine                 = var.engine
  engine_version         = var.engine_version
  skip_final_snapshot    = true
  publicly_accessible    = true
  vpc_security_group_ids = [var.security_group_id]
  db_subnet_group_name   = "${aws_db_subnet_group.db_subnet.name}"
  username               = var.username
  password               = var.password
  parameter_group_name = var.parameter_group_name

  tags = {
    "Name" = "db-instance-${var.db_name}-${var.engine}-${var.engine_version}"
	  }
}