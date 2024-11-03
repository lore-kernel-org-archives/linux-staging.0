Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FCF18E364
	for <linux-staging@lists.linux.dev>; Sun,  3 Nov 2024 21:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730669203; cv=none; b=I1gUBS3ZG80WkkRKTArNZrpf+wjBugWarWNZIgpsCmjyw8hDmnsk28MdXySPPNxyRgfPEVhpoyvpccWHBOIfyzyzcTsXWk4VTKKgshWpZo0VEGIXDPLki59oJ7OQvV8QFK3SZz7yx+WtyacvPztcngt2wJdP3hgfDgw0hXd1ep0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730669203; c=relaxed/simple;
	bh=pLnkhpeYKMc1lxFV3xV4m3dNh7n0yiuHjAX660xk0n8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JuXxcJ82a/l+slBkcqgAxUmBM/XTT903GNUuA4Kcx1KedmtEthdAFXGxUyYeFNzJTth5B5sSjkJQYfRtK1JSZqRD3qnoc6M8zcPHctAU41kFgo5iZdf/QBGulBm3bZ+Mtp8sriIKxJHRdPdD3IjLeNxClTMvmWVuqnTKrwnEooQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U7D5fHVJ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U7D5fHVJ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-431616c23b5so20688705e9.0
        for <linux-staging@lists.linux.dev>; Sun, 03 Nov 2024 13:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730669200; x=1731274000; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4LeEghsieJmKHP01xof54mT4MI7YKin+O0LeMS7tsE=;
        b=U7D5fHVJBco6E5rDuHA1teGgfrfU9+VFjBr73tcfhfBTMTsioeYewtokbR8tRvcpcr
         4cVNQ1JHxlDmIayUcw+gTg+3/KrtonB8NSjBgJeCw7e9CSgqguhs+d5xK2ERXoSY4P4z
         uZYtAY01SPRWVA/uqCI4+aJLpWaBNQsmI7P/7jLSO6BLPNIE///2G2r+5hOwQUgsTMsB
         LqQMyvlLArzNFyDDkAjVY3d/b3RQrG+k2LfkZRr1+EAHJzSq6VXoJ1TOmzG8udokMhC0
         dowMErffwJkpggAXzNUwQwzrpAzeoc/rA2Kx98sAIkSWp2gUCjFFEy2Coq1m4q+DWusA
         fCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730669200; x=1731274000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U4LeEghsieJmKHP01xof54mT4MI7YKin+O0LeMS7tsE=;
        b=Feh4vTxVVNjTS0NM314KUAJg2AJPq1KOtWZ/1il8dNiDKklMV2Eqt2Oxc2vzSrWdJa
         XHSQizlHmhfRoRfO66n2WokSYALkww2wQ9Y1CG8fsLlzvBI3cRfkGu75lDfJ0s8tGquV
         ZgrpHAAkXS0A/oS28JMFO+s42YYL000aJUJGBo8XJPfUNSYPQz4rtkzFMajxoHgWFKKj
         ZhX+TmYsdwCZEEE9CDjgSxydKeMElDJ5/Diy+Uz50qZW0WS+LxOh/xqDiAe5ItTgT+UC
         gVYuuqSn1poL3OiYd6oqYxFiNfQfnxv//Qx/DWmde/LJPKO/3NEBKilm6uzqZvhZK757
         ggUg==
X-Forwarded-Encrypted: i=1; AJvYcCVk0GtGbcJM0LqFahrLFeYoW4mby+2DalULo8GgAHQjCQuIZN3H9s9L4hynrpu9H4Wdzehl+jdC950I65Ch@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7sA4LmJ1IMHLR2RVfLxSXQAQzGumgdGNui0BY1NHX8mv2F+wm
	uoNvig9Fah0zSqyEjZbuP1a7k4+md6dYkh9BqQePYvJrW6rqCSHu
X-Google-Smtp-Source: AGHT+IGCfoYcl/WTaMgKFNtbr1A1yYIsaop2G+srrkYcg7Rm1TPsNrDpmn2KsdRG4SdPzS+P/PuuhQ==
X-Received: by 2002:a05:600c:3549:b0:431:416e:2603 with SMTP id 5b1f17b1804b1-43282fe1df2mr79967675e9.3.1730669199664;
        Sun, 03 Nov 2024 13:26:39 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd910718sm166150385e9.12.2024.11.03.13.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 13:26:38 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@linaro.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 08/11] staging: gpib: Remove unneeded lookup table
Date: Sun,  3 Nov 2024 22:26:14 +0100
Message-ID: <20241103212617.13076-9-dpenkler@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241103212617.13076-1-dpenkler@gmail.com>
References: <20241103212617.13076-1-dpenkler@gmail.com>
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

