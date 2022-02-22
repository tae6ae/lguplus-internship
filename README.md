# lguplus-internship Assignment 3
Terraform을 이용해 AWS 네트워크 리소스 구성

## 네트워크 리소스 목록
* Provider
* VPC
* Subnet
* Internet Gateway
* Routing Table
* Security Group

## 과제 이외 추가적으로 구성한 인스턴스
* Target Group
* Load Balancer

## Dependencies
```
> terraform graph
digraph {
        compound = "true"
        newrank = "true"
        subgraph "root" {
                "[root] aws_default_route_table.route_table (expand)" [label = "aws_default_route_table.route_table", shape = "box"]
                "[root] aws_default_security_group.security_group (expand)" [label = "aws_default_security_group.security_group", shape = "box"]
                "[root] aws_internet_gateway.igw (expand)" [label = "aws_internet_gateway.igw", shape = "box"]
                "[root] aws_lb.lb (expand)" [label = "aws_lb.lb", shape = "box"]
                "[root] aws_lb_listener.main (expand)" [label = "aws_lb_listener.main", shape = "box"]
                "[root] aws_lb_listener.test (expand)" [label = "aws_lb_listener.test", shape = "box"]
                "[root] aws_lb_target_group.target_group-main (expand)" [label = "aws_lb_target_group.target_group-main", shape = "box"]
                "[root] aws_lb_target_group.target_group-test (expand)" [label = "aws_lb_target_group.target_group-test", shape = "box"]
                "[root] aws_subnet.subnet-01 (expand)" [label = "aws_subnet.subnet-01", shape = "box"]
                "[root] aws_subnet.subnet-02 (expand)" [label = "aws_subnet.subnet-02", shape = "box"]
                "[root] aws_vpc.vpc-01 (expand)" [label = "aws_vpc.vpc-01", shape = "box"]
                "[root] provider[\"registry.terraform.io/hashicorp/aws\"]" [label = "provider[\"registry.terraform.io/hashicorp/aws\"]", shape = "diamond"]
                "[root] aws_default_route_table.route_table (expand)" -> "[root] aws_internet_gateway.igw (expand)"
                "[root] aws_default_security_group.security_group (expand)" -> "[root] aws_vpc.vpc-01 (expand)"
                "[root] aws_internet_gateway.igw (expand)" -> "[root] aws_vpc.vpc-01 (expand)"
                "[root] aws_lb.lb (expand)" -> "[root] aws_default_security_group.security_group (expand)"
                "[root] aws_lb.lb (expand)" -> "[root] aws_subnet.subnet-01 (expand)"
                "[root] aws_lb.lb (expand)" -> "[root] aws_subnet.subnet-02 (expand)"
                "[root] aws_lb_listener.main (expand)" -> "[root] aws_lb.lb (expand)"
                "[root] aws_lb_listener.main (expand)" -> "[root] aws_lb_target_group.target_group-main (expand)"
                "[root] aws_lb_listener.test (expand)" -> "[root] aws_lb.lb (expand)"
                "[root] aws_lb_listener.test (expand)" -> "[root] aws_lb_target_group.target_group-test (expand)"
                "[root] aws_lb_target_group.target_group-main (expand)" -> "[root] aws_vpc.vpc-01 (expand)"
                "[root] aws_lb_target_group.target_group-test (expand)" -> "[root] aws_vpc.vpc-01 (expand)"
                "[root] aws_subnet.subnet-01 (expand)" -> "[root] aws_vpc.vpc-01 (expand)"
                "[root] aws_subnet.subnet-02 (expand)" -> "[root] aws_vpc.vpc-01 (expand)"
                "[root] aws_vpc.vpc-01 (expand)" -> "[root] provider[\"registry.terraform.io/hashicorp/aws\"]"
                "[root] provider[\"registry.terraform.io/hashicorp/aws\"] (close)" -> "[root] aws_default_route_table.route_table (expand)"
                "[root] provider[\"registry.terraform.io/hashicorp/aws\"] (close)" -> "[root] aws_lb_listener.main (expand)"
                "[root] provider[\"registry.terraform.io/hashicorp/aws\"] (close)" -> "[root] aws_lb_listener.test (expand)"
                "[root] root" -> "[root] provider[\"registry.terraform.io/hashicorp/aws\"] (close)"
        }
}
```
