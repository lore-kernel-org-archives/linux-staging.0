Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D92F1C9EC9
	for <linux-staging@lists.linux.dev>; Mon,  4 Nov 2024 17:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730742638; cv=none; b=bHNwPpKfFybHOSk438g81461sYH2nOypXUFCzRfEl1mullYwkw7NUREvV2WUGKOjHBSwZWJtvkkQ/OX7ER/qS1uBMomgPR1apbzapytKSuMTLNfmkN5iG2FuwVTSbPJ3fTCdmjPADNyfC/T9Lm8tK8qdkutN/xuAx711s8W31UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730742638; c=relaxed/simple;
	bh=pLnkhpeYKMc1lxFV3xV4m3dNh7n0yiuHjAX660xk0n8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=USOHMOKXP9Io8FjC/ZoHgfF8AiGU4hZ1ufgKD5ksTbcxm9vxetG1yejQxOYCulg/46zDnYQNGIwkIs6x8bjgyOTEVcVtAjbsb6NcEg9X/sLeQA0gUZNMYU6PiqMppKP3SXQGbaXEZyYa0OqK2yGKX5SQfUBVt+m+tG1jDiUSmSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kv1wFYVR; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kv1wFYVR"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4315c1c7392so39489445e9.1
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 09:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730742634; x=1731347434; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4LeEghsieJmKHP01xof54mT4MI7YKin+O0LeMS7tsE=;
        b=Kv1wFYVRVvedCvNWVAsKoLleKV7eU4GyhpkS8pwzK/4drFW6i0dvbwVrddGe0Z7130
         CRCOV9l0VZ8CBo4FgULxb/eeG3bi5WrZnEB7nlUeaRp4weZr2MBVEQ56yjbUO866dtT8
         htDwTg6IrWV8ReAz/Fm+72jRWcT5u7e67VDhPEwO1oSXmg0KRtZnBta8VJ37do2tQ36t
         eT+oFAsaFZ64pvN//7nesKiKJkbN1XtixtQnkgcHCN7pglVjHY79OblXMFl58YFTO585
         zFYHRdbuvRaSCeD3aRkx6owX3loQX/mbYLH0Z/lC9pNBRS/TDn/QoPTAlqcNj8NV9X9D
         73SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730742634; x=1731347434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U4LeEghsieJmKHP01xof54mT4MI7YKin+O0LeMS7tsE=;
        b=oxtBbFIFpyekpmbVsoramvuz8XmaMhdPZUw6Jnyb5uLBV/PqobE+Zw7p4E9UcekeBm
         J82VA6LqwDQ3tx0GeCrXDnP/1gGCda/E1BU526z6lt0pN2LJ28Z21fSRQsvrsR61lMJ+
         nACxZRJicAuRWKJ1xiMHUFyQXVGRqhEMO+ibbRXTu9d/eYnkLlQMbs0++DhgwU6bjrvJ
         /i4gjmXYPDD+lGbEk/ZXaY8mMKk8+1CrT+ed7sbK8oGYbjQpCt2360nE4hY6EW+IL90z
         6G+AxyKG3oxHnD2g4cg++c+l+kka1+C4YkU56OT1jCLKMkdamcsgjlQ5Ls1qWruL0ZPZ
         puig==
X-Forwarded-Encrypted: i=1; AJvYcCXNLGCA8BlaP12lXSQxt7+T/ErNd55P77bs3+zh5jAIY/S+Yypt3yTUzMOD43kksUiR/vLM9wiavlMcnB6S@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1Cgy6iogW/hfJhhuOovylizgbWTbPsM6TCJR2U8UdKKctvPit
	urmpxuaEOSWFJitTZwrD4uGeDMlZ2OyH64ZpIaOlRsnWt9rQpMcpz1jI3Shz
X-Google-Smtp-Source: AGHT+IGL8Hz6ldNQ7BGl+8qPvJkcLFeycE81fUs3UMeqJ1aqsq/l2/DaxtogxbGayXLaq0ktaorcQQ==
X-Received: by 2002:a5d:59af:0:b0:374:ca43:cda5 with SMTP id ffacd0b85a97d-381c796903amr9607821f8f.0.1730742634220;
        Mon, 04 Nov 2024 09:50:34 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7f80sm13839821f8f.20.2024.11.04.09.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 09:50:33 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@linaro.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH v3 09/12] staging: gpib: Remove unneeded lookup table
Date: Mon,  4 Nov 2024 18:50:10 +0100
Message-ID: <20241104175014.12317-10-dpenkler@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241104175014.12317-1-dpenkler@gmail.com>
References: <20241104175014.12317-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove bcm2837 table as the only difference is GPIO14 and GPIO15
which are not used with the current pin maps.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 33 ------------------------
 1 file changed, 33 deletions(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 8c03e91c01dc..fc8502379c28 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -234,38 +234,6 @@ static struct gpiod_lookup_table gpib_gpio_table_0 = {
 	},
 };
 
-static struct gpiod_lookup_table gpib_gpio_table_1 = {
-	.dev_id = "",	 // device id of board device
-	.table = {
-		// for bcm2837 based pis (3a+ 3b 3b+ )
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
-		GPIO_LOOKUP_IDX("TXD1",	  U16_MAX, NULL, 14, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("RXD1",	  U16_MAX, NULL, 15, GPIO_ACTIVE_HIGH),
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
-		{ }
-	},
-};
-
 static struct gpiod_lookup_table gpib_gpio_table_2 = {
 	.dev_id = "",	 // device id of board device
 	.table = {
@@ -300,7 +268,6 @@ static struct gpiod_lookup_table gpib_gpio_table_2 = {
 
 static struct gpiod_lookup_table *lookup_tables[] = {
 	&gpib_gpio_table_0,
-	&gpib_gpio_table_1,
 	&gpib_gpio_table_2,
 	0
 };
-- 
2.46.2

