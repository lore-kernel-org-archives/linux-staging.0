Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09A7D528
	for <linux-staging@lists.linux.dev>; Mon, 21 Oct 2024 02:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729477942; cv=none; b=qVAZp1lhNWeQBNvPuKiwd5PF5k9lps/MIwzTteuz61XkXFO8EnVgf9tvLbyYg1m/UMcBgt3c/c1BIkjmubSNghLMrBiTxu7wN41K+R2RTstH0lIjOGwI2XMlqi2vtXFW1EYR4G6QlGbaWcHvhByLwxMoeDhT2V/35mrgxOQzYXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729477942; c=relaxed/simple;
	bh=Daju35WUgjpPsBoONAp6Pf6fDAJSepgSnT6QIpluYV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZwjLF8ipH/fwtI4+PHxl/4xYmRiXMDYUXF2t5BdTjSz4ewJ5Vu57QIKWvKL8v/lP6MEzM6M1/GmiREq1wQqPqtcJXU2EAsauM2e/QXrk8yGwZqmjDb5dcS0ZAe7QHdwuJsEH5H2tB3QTy5mxgd9eiLxSMehi8l74ZolAXqVnZ40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDDT9zhJ; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDDT9zhJ"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7ead1edbf1dso980589a12.0
        for <linux-staging@lists.linux.dev>; Sun, 20 Oct 2024 19:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729477940; x=1730082740; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JWG/7LkAlgP90UDcguaLP9EXEksqFk5VlcNJRKMNtNM=;
        b=TDDT9zhJvuZgV+io8k2abEyAhIXnKBkJRrjt6p96c6OVN7KjaxB/fyg36LF46SOdaH
         UmqmAeSqvzSXSZt3WD1eCAp/QnqeL1NAMUgtQbZ3dosh7rwKw0aL954kASz8ADfbU+YO
         MbzAscHf62gIWWAOSTeeNZn8MksgKWhNb0fpcehln3oBwOgO55cfUvY8XtKwNv+RvHkP
         aJM7EATbpHG425bPZOm+J4zwBOV8b9qX3hwpoYOPa9YIiJG2nZyEVBSOT/QmBIux7R0w
         P1Qt14GLMJz9K+TqDKl/Vhvahij+s/OXSjg0Har4eV1V532bzj/ZK4G5PMtGserThQx/
         yTyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729477940; x=1730082740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JWG/7LkAlgP90UDcguaLP9EXEksqFk5VlcNJRKMNtNM=;
        b=G8oHqfRbc4CjBvnpEt68ysV3Gq/2c7k1jTjSAS503cO6ld+kgIVPiZxVUDOFRtQ41a
         gtUpjeWVP5xIkU8nIh00Hp+Tt/U7WgspLJza7OFolhAX2hBhEierE6QzUlbdH0Po6VOr
         +vqO4aCC4pUFOXAp3sFp5Ro5i5oLXvGlGxF6EX6Izn7Wx5mb1U5pJYjws8tFZ8vjhMKQ
         a6ceu1sVW3gDufjq8OBVcQdsdjjdqcfNcnMb/3GJ44E1drSBMa99cZ80KFZZeBehvwHw
         CiBJLbi9F7+fu489LAY+yDJrfVJUUQ8c1QD4UFrcg8HeDjG+v4ghclJBg1ZX/sI0emvv
         T/jw==
X-Gm-Message-State: AOJu0Yzy2GSjGTjNCQeL1bf3SxiVvxqnjbTxjBtx1IPBA81PjXXaAlHk
	K3rdAlXQRArKelY5DUAQLDx+TJAJ66mIclCB2Q1JoOwjwe7bQX+iTvw1McmB
X-Google-Smtp-Source: AGHT+IFYyk8CVrDwkRticBp6a2dhSCiUkF6YX3DPNYLpCeSb/uvVMWqMV67+Y7VVEu3+lA81yhm5ag==
X-Received: by 2002:a05:6a20:e605:b0:1d9:ce8:35aa with SMTP id adf61e73a8af0-1d92c590f39mr13959549637.49.1729477939747;
        Sun, 20 Oct 2024 19:32:19 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f64cfsm15969195ad.284.2024.10.20.19.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 19:32:19 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org (moderated list:GREYBUS SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] staging: greybus: gpio: use gpiochip_get_data
Date: Sun, 20 Oct 2024 19:32:17 -0700
Message-ID: <20241021023217.319545-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of container_of, we can populate gpiochip_add_data 's last
parameter and use gpiochip_get_data. It seems to be the standard.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/staging/greybus/gpio.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
index 9b26e148d40f..16bcf7fc8158 100644
--- a/drivers/staging/greybus/gpio.c
+++ b/drivers/staging/greybus/gpio.c
@@ -42,11 +42,6 @@ struct gb_gpio_controller {
 	struct mutex		irq_lock;
 };
 
-static inline struct gb_gpio_controller *gpio_chip_to_gb_gpio_controller(struct gpio_chip *chip)
-{
-	return container_of(chip, struct gb_gpio_controller, chip);
-}
-
 static struct gpio_chip *irq_data_to_gpio_chip(struct irq_data *d)
 {
 	return d->domain->host_data;
@@ -278,7 +273,7 @@ static void _gb_gpio_irq_set_type(struct gb_gpio_controller *ggc,
 static void gb_gpio_irq_mask(struct irq_data *d)
 {
 	struct gpio_chip *chip = irq_data_to_gpio_chip(d);
-	struct gb_gpio_controller *ggc = gpio_chip_to_gb_gpio_controller(chip);
+	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
 	struct gb_gpio_line *line = &ggc->lines[d->hwirq];
 
 	line->masked = true;
@@ -288,7 +283,7 @@ static void gb_gpio_irq_mask(struct irq_data *d)
 static void gb_gpio_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *chip = irq_data_to_gpio_chip(d);
-	struct gb_gpio_controller *ggc = gpio_chip_to_gb_gpio_controller(chip);
+	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
 	struct gb_gpio_line *line = &ggc->lines[d->hwirq];
 
 	line->masked = false;
@@ -298,7 +293,7 @@ static void gb_gpio_irq_unmask(struct irq_data *d)
 static int gb_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *chip = irq_data_to_gpio_chip(d);
-	struct gb_gpio_controller *ggc = gpio_chip_to_gb_gpio_controller(chip);
+	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
 	struct gb_gpio_line *line = &ggc->lines[d->hwirq];
 	struct device *dev = &ggc->gbphy_dev->dev;
 	u8 irq_type;
@@ -336,7 +331,7 @@ static int gb_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 static void gb_gpio_irq_bus_lock(struct irq_data *d)
 {
 	struct gpio_chip *chip = irq_data_to_gpio_chip(d);
-	struct gb_gpio_controller *ggc = gpio_chip_to_gb_gpio_controller(chip);
+	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
 
 	mutex_lock(&ggc->irq_lock);
 }
@@ -344,7 +339,7 @@ static void gb_gpio_irq_bus_lock(struct irq_data *d)
 static void gb_gpio_irq_bus_sync_unlock(struct irq_data *d)
 {
 	struct gpio_chip *chip = irq_data_to_gpio_chip(d);
-	struct gb_gpio_controller *ggc = gpio_chip_to_gb_gpio_controller(chip);
+	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
 	struct gb_gpio_line *line = &ggc->lines[d->hwirq];
 
 	if (line->irq_type_pending) {
@@ -407,21 +402,21 @@ static int gb_gpio_request_handler(struct gb_operation *op)
 
 static int gb_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
-	struct gb_gpio_controller *ggc = gpio_chip_to_gb_gpio_controller(chip);
+	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
 
 	return gb_gpio_activate_operation(ggc, (u8)offset);
 }
 
 static void gb_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
-	struct gb_gpio_controller *ggc = gpio_chip_to_gb_gpio_controller(chip);
+	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
 
 	gb_gpio_deactivate_operation(ggc, (u8)offset);
 }
 
 static int gb_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
-	struct gb_gpio_controller *ggc = gpio_chip_to_gb_gpio_controller(chip);
+	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
 	u8 which;
 	int ret;
 
@@ -435,7 +430,7 @@ static int gb_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 
 static int gb_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
-	struct gb_gpio_controller *ggc = gpio_chip_to_gb_gpio_controller(chip);
+	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
 
 	return gb_gpio_direction_in_operation(ggc, (u8)offset);
 }
@@ -443,14 +438,14 @@ static int gb_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 static int gb_gpio_direction_output(struct gpio_chip *chip, unsigned int offset,
 				    int value)
 {
-	struct gb_gpio_controller *ggc = gpio_chip_to_gb_gpio_controller(chip);
+	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
 
 	return gb_gpio_direction_out_operation(ggc, (u8)offset, !!value);
 }
 
 static int gb_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
-	struct gb_gpio_controller *ggc = gpio_chip_to_gb_gpio_controller(chip);
+	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
 	u8 which;
 	int ret;
 
@@ -464,7 +459,7 @@ static int gb_gpio_get(struct gpio_chip *chip, unsigned int offset)
 
 static void gb_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
-	struct gb_gpio_controller *ggc = gpio_chip_to_gb_gpio_controller(chip);
+	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
 
 	gb_gpio_set_value_operation(ggc, (u8)offset, !!value);
 }
@@ -472,7 +467,7 @@ static void gb_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 static int gb_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 			      unsigned long config)
 {
-	struct gb_gpio_controller *ggc = gpio_chip_to_gb_gpio_controller(chip);
+	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
 	u32 debounce;
 
 	if (pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE)
@@ -579,7 +574,7 @@ static int gb_gpio_probe(struct gbphy_device *gbphy_dev,
 	if (ret)
 		goto exit_line_free;
 
-	ret = gpiochip_add_data(gpio, NULL);
+	ret = gpiochip_add_data(gpio, ggc);
 	if (ret) {
 		dev_err(&gbphy_dev->dev, "failed to add gpio chip: %d\n", ret);
 		goto exit_line_free;
-- 
2.47.0

