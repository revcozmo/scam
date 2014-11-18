CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `title` varchar(255) NOT NULL,
  `state` TINYINT(1) NOT NULL DEFAULT 0,
  `price` decimal(65,30) NOT NULL,
  `amount` int(11) NOT NULL,
  `shipping_info` text,
  `finish_text` text,
  `buyer_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `product_id` int(11),
  `shipping_option_id` int(11),
  # timestamp trick from: http://gusiev.com/2009/04/update-and-create-timestamps-with-mysql/
  created_at timestamp default '0000-00-00 00:00:00',
  updated_at timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  FOREIGN KEY (buyer_id) REFERENCES users(id),
  FOREIGN KEY (vendor_id) REFERENCES users(id),
  FOREIGN KEY (product_id) REFERENCES products(id)  ON DELETE SET NULL,
  FOREIGN KEY (shipping_option_id) REFERENCES shipping_options(id) ON DELETE SET NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;