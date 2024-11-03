Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAF2192592
	for <linux-staging@lists.linux.dev>; Sun,  3 Nov 2024 21:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730669204; cv=none; b=GdFJabrIEnP1DQ9Fem3YiYtwExIFOF+VtlyB74/Qy8lujsYSIuQA3yBdcuwmV3Qnc9gW5zUro4N9xdqrvVKukTrnBZ6U5ClbSGZjrhM5Kmn7hJDMq9OKdTsk7UjBJ71nABhpN5eGxEwUN8l2GEc7SUsoY7RuP5ok1V09fCMh8BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730669204; c=relaxed/simple;
	bh=8gIEE5erXu36bvNvc+z4d5bEU5WInaaHUZh7cwyNQlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E0ELiWVZ8mYclDBoX6XRZm93TDEHDK7W+vOgcugIspj0UjDf9041md04Ig3w+lKbwAHF/jJ0sHHgQ6abEjUCuhExMPL38d+2qYgdXb99XjKthzA/9PLFIFPgRBGbUqUV4eUS20qYAFFKE4+jjutYOVIgFWp+OwyFm/XDTAOuJF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=arEWmy+B; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="arEWmy+B"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-431ac30d379so29287785e9.1
        for <linux-staging@lists.linux.dev>; Sun, 03 Nov 2024 13:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730669201; x=1731274001; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYNa6oziVbKvDXACDgmoC/if6wLv2o++lD6SKYvehsE=;
        b=arEWmy+B9+aSxXLWIvsee8K8axUdXoA3lW7npUaWm03MS1HaYSdOFp76dK45uoDdgo
         YieYuQz6RRLrp9bOOo+f/gDtNvAbaHERiEcX8EJn06TB4YTpC75gemHRY3BIXTXwWydh
         q9Pv2SdVaGnw6jze317Gs6A78+w1GiiqDQWGtxIJv/EWT6JbluKgG0xk9dabfW7496r4
         yXT5WKnDZwEcg2yKocF/M6MqRhnWa2Huhs182tmGbDZ5QfYRQ6X3JJM6vsAD0vL76TM/
         92qFmiBwLAfD4WimMGjT7ZCg3GGpNNt+GFskGGCKeUnYTaUjUWAwhewaNZv/EUdIWYbV
         waMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730669201; x=1731274001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYNa6oziVbKvDXACDgmoC/if6wLv2o++lD6SKYvehsE=;
        b=JhF+6tP6oKNmBCLw+BRBIxqf5df3vShY1bXql6lMHYHxok/ZV8mSbTdVLQ1wydTiI2
         ZFuK/dCNPEPnK+DsFPq+9rcWAUpSaFjVw+het+xqTjwov4n92FgWsMm3f9M9PZidlSM+
         8XFjLVIi9CdcaZvteIGQnwy2I6cpd8wJBUkuwktmcXM6dmSc1X+ej6wJyMSfg/NooOXo
         z0q7bchTW6pYoTXyrMqBthoKE/mphJPU11Dby9fRSJ7ys1pHF2JUopjDZT0l8v5nNF5Y
         mwQpp3Nc1vBLcyjnwd09BPymveym/OED0SieHtrzbEtOZaEdk0faPrXibsmyXp65S1fb
         xpSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUinin7IkjTGnn2gsUlTmp2nKAs0Hj4FzaHIyCbUSdIqYMLyllD6mVUuxDQQYVkfg+tD3Z7nIoEtQQpCPIl@lists.linux.dev
X-Gm-Message-State: AOJu0YzrunhkKUcUVNvBV00KE+aQe6MjgMUCnn6N/2RvSQm07iPgi/u6
	VLgkxMIy9J3MjKo10GHQPtSAsqbrTYnzNUfIqoOuqQEcoZMZvjn7
X-Google-Smtp-Source: AGHT+IHb3YtEMHY1k6tmQKANEvYPRbKK2yHTsy4WyjwdvdVI0PZbmxznTKoqhcHA21dXqtRaUQHOrA==
X-Received: by 2002:a05:600c:4e8e:b0:42c:b45d:4a7b with SMTP id 5b1f17b1804b1-4319ad146ebmr272532335e9.25.1730669201064;
        Sun, 03 Nov 2024 13:26:41 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd910718sm166150385e9.12.2024.11.03.13.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 13:26:40 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@linaro.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 09/11] staging: gpib: Remove GPIO14 and GPIO15 lines in lookup tables
Date: Sun,  3 Nov 2024 22:26:15 +0100
Message-ID: <20241103212617.13076-10-dpenkler@gmail.com>
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

GPIO14 and GPIO15 are not used in the current pin maps

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index fc8502379c28..78032af5061c 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -216,8 +216,6 @@ static struct gpiod_lookup_table gpib_gpio_table_0 = {
 		GPIO_LOOKUP_IDX("SPI_SCLK",	  U16_MAX, NULL, 11, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIO12",	  U16_MAX, NULL, 12, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIO13",	  U16_MAX, NULL, 13, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("TXD0",	  U16_MAX, NULL, 14, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("RXD0",	  U16_MAX, NULL, 15, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIO16",	  U16_MAX, NULL, 16, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIO17",	  U16_MAX, NULL, 17, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIO18",	  U16_MAX, NULL, 18, GPIO_ACTIVE_HIGH),
@@ -248,8 +246,6 @@ static struct gpiod_lookup_table gpib_gpio_table_2 = {
 		GPIO_LOOKUP_IDX("GPIO11", U16_MAX, NULL, 11, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIO12", U16_MAX, NULL, 12, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIO13", U16_MAX, NULL, 13, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO14", U16_MAX, NULL, 14, GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP_IDX("GPIO15", U16_MAX, NULL, 15, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIO16", U16_MAX, NULL, 16, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIO17", U16_MAX, NULL, 17, GPIO_ACTIVE_HIGH),
 		GPIO_LOOKUP_IDX("GPIO18", U16_MAX, NULL, 18, GPIO_ACTIVE_HIGH),
-- 
2.46.2

