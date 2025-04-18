Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF2421C9ED
	for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 17:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744997703; cv=none; b=lQJ3WCGzkqEty4WUubocNKfeby8XcczhNdwCOeQHoN23p97EzO5Ia+lSRGiSuWI3pFlMwWreWEInpttuC9or0nI0pMntGvhh5/heswDIB1I484Ox52Dd+Q3wYpI5t92WrC8H0HRrm8YOK5z++ARtgMYAtqd644ypu1vWHBIfZYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744997703; c=relaxed/simple;
	bh=+WmW+6HPnaBorUvAq2/XnG6ifzmTnOmW9gIoOcNOA1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UKePbcRfmyiB1P6OI4IZQah3g5l3wN+SJ+o5iwSxKz6wxvASUIjDLwhnOg8NSXfBXCumuRk6TbPVYEbVhtkg4PsqCNRhO4Q4fQ/e1S9FEexbFO2fMOkUiXVRbA7mYI5h4oXb5kkKhfHuaPavvEq9ji9IrUX0oY3ROUSJ0znd1m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dxcPGgJf; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dxcPGgJf"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39d83782ef6so2193492f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 18 Apr 2025 10:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744997700; x=1745602500; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZEqkL8XJqU+TI/zwsYZcQCUdyQHjs1e4Dkw85FOadI=;
        b=dxcPGgJf07mjfmvX8W/qXzFqjUHXCQoWP9glUWDDEomjkW0Kr186OQjg1vjWoAC+XZ
         eVFDoLPnVTMHZz6+wIWKoW1kP0h8/7R8MspcAlIwS0AjQrDJzvOw7XOCUvSE69Y3Uxo2
         27Z7qfRAp8dGxyvhyIxFv8lpk52jiMcGR1IKl9I0CweHqX+EALcrb7DgNBNjLsWQrd9x
         qsPXKP9VcFt/6+cGUdSCUMZ7KVrSsIE9NVY2YMdUYwGcYmPxb1PYtw/hGCGPUYSyhEzL
         IR3g4Z5n5OKMccf0iX69tZVfdnRTqUVAdOoLKHssqiFxxBvZLlFrwhSx9d9HOWxplUyv
         IPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744997700; x=1745602500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZEqkL8XJqU+TI/zwsYZcQCUdyQHjs1e4Dkw85FOadI=;
        b=gahqYU64YKmRfRoHQaYynB1tLEsmwf+LMfJXL7OZN6p+kdCZSIbfXNTpVrIdwImGyj
         FrFFP/1fOIk4bgywdS1jKTGdNhasToJ6GLMfVVFubvKwc5qkuMXIwrCLJ6uKfiCZ8xgM
         QQvPbj/PkgZkzomjVgi0Sj+g0H+DZcn2L2j+d05DC/u/4mz1zy+e8rAtxTUJusLY8KK0
         nMXrjlsnT6bA5GWAT0NjxrrirbDwurAWCnQd3jomGvyT6mVV60q04moltrHZqlvNsW9q
         3JTeNhIzaaHVMW8o0EkMZax8hqUIIj3DruZz2BaXu/SDf49KE3jLJt6PNpnlGuXyAyJ9
         a8BA==
X-Forwarded-Encrypted: i=1; AJvYcCUQE/qsGNqjAS+aM5Z32WB0bzVqDLZC+0qiU3qwdU4kLF2lfjNXy5Y3+p/1aBJklHfwKVzy3zIbFhBwrv0h@lists.linux.dev
X-Gm-Message-State: AOJu0YxSmOpBYR84vKdipfR2mnxVx5Wm2wtdwPoTQBGqGE74ysm/A/7Z
	/igkDKyjpD95d3PV5APJvfmQXTPiXsSjibcchc/yqV9lApdEqvJy
X-Gm-Gg: ASbGncsY25Xax8Cpf0bg0dDcsM2L7uE9vX4h6JPeajwKunlPxwp91Gu9zPlOdFrYGD4
	NjTSNBldz3aFKofNZOC0auvkbOoilyYWTzNt0AMjtMKW6St5SGXIoQ/KJ45cK38ZfrpxmohtsRj
	Il2BDd6pckCAAitraud4g9hUbx8BnQLxmWKzlCTMqbnsauhETfbsLXJGPMg1iY9vn6Fe1cU7Y8a
	FbE+VZkfhUVFGMhan1RWz6eLIKMk6TkIDk1jW9QYrSjbsOU607nSKHvmIjyDxS4G9NZZ/9v5Azj
	NCQQE+v9IbqkKHF7VO2PRbiyZnU3KV9g1hHy5sOx7wRl/rGSVmto62rMbz8abnAoryrlDzkeXk4
	I
X-Google-Smtp-Source: AGHT+IFSe4AzT6s51bwigohequdK5BUemML8iVqbH7ehZkk5hrV4pgmN0v+Fey9j138PiYxkJ/eRCA==
X-Received: by 2002:a05:6000:1449:b0:390:f116:d220 with SMTP id ffacd0b85a97d-39efbd6a39dmr2452869f8f.17.1744997699538;
        Fri, 18 Apr 2025 10:34:59 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4332f8sm3287320f8f.40.2025.04.18.10.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:34:58 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: marcello.carla@gmx.com,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 4/8] staging: gpib: Remove dependency on LED subsystem
Date: Fri, 18 Apr 2025 19:34:30 +0200
Message-ID: <20250418173434.2892-5-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418173434.2892-1-dpenkler@gmail.com>
References: <20250418173434.2892-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The yoga pin map is compatible with the others so that its led
can be used as the activity led. Using the LED subsytem required
adding a dtoverlay to the boot config as well as setting up the
activity led via sysfs. To simplify the setup we remove the
dependency on the LED subsystem and use the on board led as for
the other pin maps.

Tested-by: Dave Penkler <dpenkler@gmail.com>
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index ac9ecb6e0aad..caa8361da696 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -66,7 +66,6 @@
 #include <linux/gpio/machine.h>
 #include <linux/gpio.h>
 #include <linux/irq.h>
-#include <linux/leds.h>
 
 static int sn7516x_used = 1, sn7516x;
 module_param(sn7516x_used, int, 0660);
@@ -136,19 +135,14 @@ enum lines_t {
 #define SN7516X_PINS 4
 #define NUM_PINS (GPIB_PINS + SN7516X_PINS)
 
-DEFINE_LED_TRIGGER(ledtrig_gpib);
-#define ACT_LED_ON do {							\
+#define ACT_LED_ON do {						\
 		if (ACT_LED)					\
-			gpiod_direction_output(ACT_LED, 1);		\
-		else							\
-			led_trigger_event(ledtrig_gpib, LED_FULL); }	\
-	while (0)
-#define ACT_LED_OFF do {						\
+			gpiod_direction_output(ACT_LED, 1);	\
+	} while (0)
+#define ACT_LED_OFF do {					\
 		if (ACT_LED)					\
-			gpiod_direction_output(ACT_LED, 0);		\
-		else							\
-			led_trigger_event(ledtrig_gpib, LED_OFF); }	\
-	while (0)
+			gpiod_direction_output(ACT_LED, 0);	\
+	} while (0)
 
 static struct gpio_desc *all_descriptors[GPIB_PINS + SN7516X_PINS];
 
@@ -1180,8 +1174,6 @@ static int allocate_gpios(struct gpib_board *board)
 	}
 	if (lookup_table)
 		gpiod_remove_lookup_table(lookup_table);
-	// Initialize LED trigger
-	led_trigger_register_simple("gpib", &ledtrig_gpib);
 	return retval;
 }
 
@@ -1193,8 +1185,6 @@ static void bb_detach(struct gpib_board *board)
 	if (!board->private_data)
 		return;
 
-	led_trigger_unregister_simple(ledtrig_gpib);
-
 	bb_free_irq(board, &priv->irq_DAV, NAME "_DAV");
 	bb_free_irq(board, &priv->irq_NRFD, NAME "_NRFD");
 	bb_free_irq(board, &priv->irq_NDAC, NAME "_NDAC");
@@ -1254,7 +1244,6 @@ static int bb_attach(struct gpib_board *board, const struct gpib_board_config *c
 		gpios_vector[&(D06) - &all_descriptors[0]] = YOGA_D06_pin_nr;
 		gpios_vector[&(PE)  - &all_descriptors[0]] = -1;
 		gpios_vector[&(DC)  - &all_descriptors[0]] = -1;
-		gpios_vector[&(ACT_LED)	 - &all_descriptors[0]] = -1;
 	} else {
 		dev_err(board->gpib_dev, "Unrecognized pin map %s\n", pin_map);
 		goto bb_attach_fail;
-- 
2.49.0

