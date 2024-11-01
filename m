Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DB11CEAB0
	for <linux-staging@lists.linux.dev>; Fri,  1 Nov 2024 17:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730483274; cv=none; b=f93+pvRJbVEKs1gINomD0iib/ilHi9TNnR73kt9/1RujbibNVTbxMNGNRBcKtGkDiI1M0vtbFKKqycPm9fmwjQwSgLDJpINJlNC3tjjIXd7VGq/gKIi9+6RDu5xPrKp3KkJQZCmwmYJv1jCCVRZCT1ZO4BNiAlZo9UgyAgW0RrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730483274; c=relaxed/simple;
	bh=E8GpDid0z0L+scbV3cTbbzBQ8cibWDg9h1nXglwEYuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KCIFSjkcCcxznH60SB1+tFazXthnGKAJ2Xg3Ujy9kLO41vzrKukVdMXeiKouc2E88K0qvZED5XwKQMZA6TjGxjA+UbS9TJ9OlyxWbkMyPthLBiXev4z1l6ssHyD+1PE+zk9whGI+UKRw9oQzLX9I94BGYuWxp6Q5Az5MGa1vReY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KvQ6iTI2; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KvQ6iTI2"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4315baa51d8so19589535e9.0
        for <linux-staging@lists.linux.dev>; Fri, 01 Nov 2024 10:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730483270; x=1731088070; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6c+vWdnejyhzbmDbcfsvQBCmeK/se4a+fgFkV5D6jqQ=;
        b=KvQ6iTI2OtJ90UYTtSllLX97f7SNhsBDPmg48P+pQyW9Y+NcT56T+Z9OvQW5xFMxaJ
         K8OmXAxap8E/W7JrsrLjkVa2lODGJgT2DuM1imtsnO/Yhtd8PqN7qzyRtieVwLkmRWRx
         QQ35+2ONKKTESsBIzkmJGxWcFXvF6k2KAUa54XsS3WUOS0NmqwFWmJUYh5XhLkpu2f0J
         Vqzr+X5UaHwjbNns6OzfRfu/FwdW4c/LI8CTxzY+EnokIpAXNU4KW1WGUrsLYrMEY6Oo
         yue+9E2+KyjRpAFaRcPb6ktqjj0fzzkLLn0XFt+IvkgR4eaOhQBMIbDj0qR+ZQFtPsAb
         UR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730483270; x=1731088070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6c+vWdnejyhzbmDbcfsvQBCmeK/se4a+fgFkV5D6jqQ=;
        b=UGtq+3iuRl48cgl5/elLestGPwhz+RQ17qDgK4cPpiE9t895hpNdjOPOiY2l1PhSzz
         J32VGXbx1dCa5wxSYjFcMcMQHRd4QFHwHCYtM8BbNlSEet2oXvEX1QLbdkYlMx0B+yh5
         aViP1SDlf8VWh+AIOXs1MPaeZNeGrpiuiuBdHq7WwCg1fyHyN0Ldw1+mQ6oOQ18hSd2s
         wfTVFQ2FgmH4f/ba3l4tM+AaPHp1saTnXLlqFrNamn5iFiTtRLz10Ob4xpoH+MMqKowe
         Hh9190jiAzx8ifCFaMIm7jeAvetx4rNzIhREVn53uKgGsSCEv7R3eymdreoyKw45Gmo1
         rmig==
X-Forwarded-Encrypted: i=1; AJvYcCWijNXXIUu7b2cJ+5nzH1rok9OP8fUAnITOkzxiwFZJv+SPeICRCh9LJYvEySy84DfCU/qvimf7p8ZKnXku@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1X3EoY5e9bitUPe3p45OOtwFMjnlk7g6bJzcbqdMVUOeGDv0p
	FaNOPzMF6zXYxvp4YBb/EnlEQQ+MAUZEZCGo2HvZhxysZOX7ZaysR4S+xpMs
X-Google-Smtp-Source: AGHT+IG8JrW9cZ5ghpR/F8uKmVF8GGUEafLV+lott5rbv8LEwgWvK92GtmiULMRy+tMKkTaaHRtv7A==
X-Received: by 2002:a05:600c:1c93:b0:42c:b9c7:f54b with SMTP id 5b1f17b1804b1-4327b70150fmr64121935e9.16.1730483270482;
        Fri, 01 Nov 2024 10:47:50 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c1185b4bsm5732933f8f.112.2024.11.01.10.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 10:47:49 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	arnd@arndb.de,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 8/9] Rationalize lookup tables
Date: Fri,  1 Nov 2024 18:47:04 +0100
Message-ID: <20241101174705.12682-9-dpenkler@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241101174705.12682-1-dpenkler@gmail.com>
References: <20241101174705.12682-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

   Remove bcm2837 table as the only difference is GPIO14 and GPIO15
   which are not used with the current pin maps.
   Remove GPIO14 and GPIO15 lines from the two other tables.
   Re-order the tables so that the bcm27xx table is used first
   as these devices are more popular and numerous than the older ones.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 85 +++++++-----------------
 1 file changed, 24 insertions(+), 61 deletions(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 8c03e91c01dc..e7a5248ee80d 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -203,41 +203,39 @@ int gpios_vector[] = {
 /* Lookup table for general GPIOs */
 
 static struct gpiod_lookup_table gpib_gpio_table_0 = {
-	// for bcm2835/6
 	.dev_id = "",	 // device id of board device
 	.table = {
-		GPIO_LOOKUP_IDX("GPIO_GCLK",  U16_MAX, NULL,  4, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO5",	  U16_MAX, NULL,  5, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO6",	  U16_MAX, NULL,  6, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("SPI_CE1_N",  U16_MAX, NULL,  7, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("SPI_CE0_N",  U16_MAX, NULL,  8, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("SPI_MISO",	  U16_MAX, NULL,  9, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("SPI_MOSI",	  U16_MAX, NULL, 10, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("SPI_SCLK",	  U16_MAX, NULL, 11, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO12",	  U16_MAX, NULL, 12, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO13",	  U16_MAX, NULL, 13, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("TXD0",	  U16_MAX, NULL, 14, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("RXD0",	  U16_MAX, NULL, 15, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO16",	  U16_MAX, NULL, 16, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO17",	  U16_MAX, NULL, 17, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO18",	  U16_MAX, NULL, 18, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO19",	  U16_MAX, NULL, 19, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO20",	  U16_MAX, NULL, 20, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO21",	  U16_MAX, NULL, 21, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO22",	  U16_MAX, NULL, 22, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO23",	  U16_MAX, NULL, 23, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO24",	  U16_MAX, NULL, 24, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO25",	  U16_MAX, NULL, 25, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO26",	  U16_MAX, NULL, 26, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO27",	  U16_MAX, NULL, 27, GPIO_ACTIVE_HIGH),
+		// for bcm27xx based pis (b b+ 2b 3b 3b+ 4 5)
+		GPIO_LOOKUP_IDX("GPIO4",  U16_MAX, NULL,  4, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("GPIO5",  U16_MAX, NULL,  5, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("GPIO6",  U16_MAX, NULL,  6, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("GPIO7",  U16_MAX, NULL,  7, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("GPIO8",  U16_MAX, NULL,  8, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("GPIO9",  U16_MAX, NULL,  9, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("GPIO10", U16_MAX, NULL, 10, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("GPIO11", U16_MAX, NULL, 11, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("GPIO12", U16_MAX, NULL, 12, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("GPIO13", U16_MAX, NULL, 13, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("GPIO16", U16_MAX, NULL, 16, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("GPIO17", U16_MAX, NULL, 17, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("GPIO18", U16_MAX, NULL, 18, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("GPIO19", U16_MAX, NULL, 19, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("GPIO20", U16_MAX, NULL, 20, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("GPIO21", U16_MAX, NULL, 21, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("GPIO22", U16_MAX, NULL, 22, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("GPIO23", U16_MAX, NULL, 23, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("GPIO24", U16_MAX, NULL, 24, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("GPIO25", U16_MAX, NULL, 25, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("GPIO26", U16_MAX, NULL, 26, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("GPIO27", U16_MAX, NULL, 27, GPIO_ACTIVE_HIGH),
 		{ }
 	},
 };
 
 static struct gpiod_lookup_table gpib_gpio_table_1 = {
+	// for bcm2835/6
 	.dev_id = "",	 // device id of board device
 	.table = {
-		// for bcm2837 based pis (3a+ 3b 3b+ )
 		GPIO_LOOKUP_IDX("GPIO_GCLK",  U16_MAX, NULL,  4, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIO5",	  U16_MAX, NULL,  5, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIO6",	  U16_MAX, NULL,  6, GPIO_ACTIVE_HIGH),
@@ -248,8 +246,6 @@ static struct gpiod_lookup_table gpib_gpio_table_1 = {
 		GPIO_LOOKUP_IDX("SPI_SCLK",	  U16_MAX, NULL, 11, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIO12",	  U16_MAX, NULL, 12, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIO13",	  U16_MAX, NULL, 13, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("TXD1",	  U16_MAX, NULL, 14, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("RXD1",	  U16_MAX, NULL, 15, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIO16",	  U16_MAX, NULL, 16, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIO17",	  U16_MAX, NULL, 17, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIO18",	  U16_MAX, NULL, 18, GPIO_ACTIVE_HIGH),
@@ -266,42 +262,9 @@ static struct gpiod_lookup_table gpib_gpio_table_1 = {
 	},
 };
 
-static struct gpiod_lookup_table gpib_gpio_table_2 = {
-	.dev_id = "",	 // device id of board device
-	.table = {
-		// for bcm27xx based pis (b b+ 2b 3b 3b+ 4 5)
-		GPIO_LOOKUP_IDX("GPIO4",  U16_MAX, NULL,  4, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO5",  U16_MAX, NULL,  5, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO6",  U16_MAX, NULL,  6, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO7",  U16_MAX, NULL,  7, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO8",  U16_MAX, NULL,  8, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO9",  U16_MAX, NULL,  9, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO10", U16_MAX, NULL, 10, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO11", U16_MAX, NULL, 11, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO12", U16_MAX, NULL, 12, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO13", U16_MAX, NULL, 13, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO14", U16_MAX, NULL, 14, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO15", U16_MAX, NULL, 15, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO16", U16_MAX, NULL, 16, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO17", U16_MAX, NULL, 17, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO18", U16_MAX, NULL, 18, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO19", U16_MAX, NULL, 19, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO20", U16_MAX, NULL, 20, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO21", U16_MAX, NULL, 21, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO22", U16_MAX, NULL, 22, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO23", U16_MAX, NULL, 23, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO24", U16_MAX, NULL, 24, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO25", U16_MAX, NULL, 25, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO26", U16_MAX, NULL, 26, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO27", U16_MAX, NULL, 27, GPIO_ACTIVE_HIGH),
-		{ }
-	},
-};
-
 static struct gpiod_lookup_table *lookup_tables[] = {
 	&gpib_gpio_table_0,
 	&gpib_gpio_table_1,
-	&gpib_gpio_table_2,
 	0
 };
 
-- 
2.46.2

