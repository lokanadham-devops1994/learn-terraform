variable "ingress_rules" {
default = {
    ssh = {
        port_no = 22
        cidr_blocks = ["0.0.0.0/0"]
        description = " Opening port 22 to allow ssh access for all IP address "
    },
    tcp = {     # mongodb 
        port_no = 27017
        cidr_blocks = ["0.0.0.0/0"]
        description = " Opening port 27017 to allow mongodb database access for all IP address "
    },
    tcp = {     # redis 
        port_no = 6379
        cidr_blocks = ["0.0.0.0/0"]
        description = " Opening port 6379 to allow redis database access for all IP address "
    },
    tcp = {     # mysql 
        port_no = 3306
        cidr_blocks = ["0.0.0.0/0"]
        description = " Opening port 3306 to allow mysql database access for all IP address "
    },
    tcp = {     # rabbitmq 
        port_no = 5672
        cidr_block = ["0.0.0.0/0"]
        description = " Opening port 5672 to allow rabbitmq database access for all IP address "
    },
    tcp = {     # catalogue 
        port_no = 8080
        cidr_blocks = ["0.0.0.0/0"]
        description = " Opening port 8080 to allow catalogue backend access for all IP address "
    },
    tcp = {     # user 
        port_no = 8080
        cidr_blocks = ["0.0.0.0/0"]
        description = " Opening port 8080 to allow user backend access for all IP address "
    },
    tcp = {     # cart 
        port_no = 8080
        cidr_blocks = ["0.0.0.0/0"]
        description = " Opening port 8080 to allow cart backend access for all IP address "
    },
    tcp = {     # shipping
        port_no = 8080
        cidr_blocks = ["0.0.0.0/0"]
        description = " Opening port 8080 to allow shipping backend access for all IP address "
    },
    tcp = {     # payment 
        port_no = 8080
        cidr_blocks = ["0.0.0.0/0"]
        description = " Opening port 8080 to allow payment backend access for all IP address "
    },
    http = {     # frontend 
        port_no = 80
        cidr_blocks = ["0.0.0.0/0"]
        description = " Opening port 80 to allow frontend access for all IP address "
    }
}
}