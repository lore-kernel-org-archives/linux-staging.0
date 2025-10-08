Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935C22253EE
	for <linux-staging@lists.linux.dev>; Wed,  8 Oct 2025 07:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908684; cv=none; b=kecAALl+Ek7kwHVhG95YbeAMDrbc4b73RTWW0zjuvKxJFXKCTmqhCBjg0JYQstDh6FFezQ/ZegfDSz6rnZnb5Hmf87y2thMDWrLTbXCjnXziKnDyG+Uk6wviPSebmp3c6gfBUl6Id2OTc1c9cS6yOtoYOmmqv0b06ZWX6UkHb9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908684; c=relaxed/simple;
	bh=FZOaPk/XiWFhkp3zMB+0dvCF3erehg3z6+zK/HzLAY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IRGlqAdptgoWOBMKE9IbtuFdH6EP4Kha87JwzTsRCp8JK6927AnlGkxqUz+I1nBPkohNly0KcxUNnpzPreBtruHAoi4rrZDrLxgwG4opJPDBnz+925ylbM+tsxwA2/VanP3XTx0CN0eWuMqQhzfrXsYRbhAOh/BsmMuBNyJiduA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvSM/Nx5; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvSM/Nx5"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59070c9111eso574972e87.3
        for <linux-staging@lists.linux.dev>; Wed, 08 Oct 2025 00:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908680; x=1760513480; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pg0HJx9UF6cc43KSohy1sFUTcyD1/BLQvc4mTLXMxcE=;
        b=dvSM/Nx57G6vfiDV/DEFya59o4ej0C5wItWANTlGrKCwHIHRMJCoMlKuCIpMf3xyyH
         MR85IquyRkLTVGUdk1zGt1Jj/MH6glo+EVTMJQawADI3nqlME43MFl7cBdiovvzTAKJo
         L1MoU0UWM0rGivO59r5ypM9IUX60EqIp1hi2hDRGRC2BilO6V1ASELi2ccUgycDemfLa
         kHJbSFJrmu7abntAlFCGVZ166vLRT0Hm6qQbUNGeJJcivha5/549bpHBy8vssT8eMez6
         cBJWCZCNQcEDuzcUU8+hz0iOAHrmk+T6+9awsj1KLhWHJBRzkVbUPMNusm4ME589wdeW
         nxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908680; x=1760513480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pg0HJx9UF6cc43KSohy1sFUTcyD1/BLQvc4mTLXMxcE=;
        b=BKbXQ5J4lenJsRrcIVY52TjF6SveBuQG9CaDLk0Qs0fJQzCvhtwIhBy7Ir0ff5r2aw
         3H0AUxoTPNVukXFH9tZRBsAtsAsjRucn1yegzLM5yO2Dresy3yhJq91iAHSmcuSpWwRj
         IE2/OOFZ9oE9Fa/4mBBo9fn1bKGwJNc8wqfaW8PG6dP7VSAwp4bbQ7jSnRm8rDFibvfa
         ZYRtILp/O1JIxQBKkGi+3XmoEOPo4lTYIDpXiA7Tu8V8retc7Zt97nq8lM3gz/D6RH8X
         EQd+kAH9O6L94wT32GWexY4q61EGxyt1yPpva3g2ngFVTSZwNlLEAnIFvXUIj7TzGd0b
         iRNA==
X-Forwarded-Encrypted: i=1; AJvYcCWOkponxviJ4p5MT1500R6Arzi4hc3XWdjkRap7bOm647QUmjYMtM54UePu9L4tQCWKo4bJVwCQxHxlkUc1@lists.linux.dev
X-Gm-Message-State: AOJu0YwspIWo1Trl8bWua5izwp/OgZaCdxgn3ckCLtue6TnsojRSb3nU
	YiaBJHt1kVvM9PDaKdSRaRztZ3MIwXUE0ponidFqT5F9rbQHfQjPo5QA
X-Gm-Gg: ASbGnctv4BB+Y4rZeX+60qkt2CYhxKZN7fzLaPdrnUiyeLUHCz9xaQOZ4KU07tXbzCD
	Fg9sSnTiI+KptdQfd87ST6U/1zoIemXdSWC/X4ydqmUDeKhtKOtljkCejmbLlXRTJJ1gINKhsxi
	YqiJOqJnHqbfihQnSMStpTtTMUQIBy32JQL+K1wZQlHPfeGW9zKAuZlKm6sz9u7hvzaIBT/pNBP
	mTkbVX95VStW6/LzpnMVOZETgSbOju0mX22hhrMxk45WFrzz0UzYcTD4k9DFR8KHWlJScxqZ6cL
	ZRK8UpW3FTXJJ0brlu/4uy7LH5kytvst/LqD4YYVkii3FBiulX43UThcaHfslUh6xnDlFXWD0dV
	8lnDrTIztx1Nsbw0717sxdzEcWsS/ha6M3vPpTwOy78DRj5LB
X-Google-Smtp-Source: AGHT+IEZP4fCBr+12IlYOXrH9a+CoFe5hewGhtwyyj6VYBFCCNVd4VpYfDkKVBWv8lYOk7dl7gjLUg==
X-Received: by 2002:a05:6512:2312:b0:590:6598:4edf with SMTP id 2adb3069b0e04-5906d9e92camr655190e87.47.1759908680085;
        Wed, 08 Oct 2025 00:31:20 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:19 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 04/24] clk: tegra30: add CSI pad clock gates
Date: Wed,  8 Oct 2025 10:30:26 +0300
Message-ID: <20251008073046.23231-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tegra30 has CSI pad bits in both PLLD and PLLD2 clocks that are required
for the correct work of the CSI block. Add CSI pad A and pad B clock gates
with PLLD/PLLD2 parents, respectively. Add a plld2 spinlock, like one plld
uses, to prevent simultaneous access since both the PLLDx and CSIx_PAD
clocks use the same registers

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/clk/tegra/clk-tegra30.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index ca738bc64615..61fe527ee6c1 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -154,6 +154,7 @@ static unsigned long input_freq;
 
 static DEFINE_SPINLOCK(cml_lock);
 static DEFINE_SPINLOCK(pll_d_lock);
+static DEFINE_SPINLOCK(pll_d2_lock);
 
 #define TEGRA_INIT_DATA_MUX(_name, _parents, _offset,	\
 			    _clk_num, _gate_flags, _clk_id)	\
@@ -859,7 +860,7 @@ static void __init tegra30_pll_init(void)
 
 	/* PLLD2 */
 	clk = tegra_clk_register_pll("pll_d2", "pll_ref", clk_base, pmc_base, 0,
-			    &pll_d2_params, NULL);
+			    &pll_d2_params, &pll_d2_lock);
 	clks[TEGRA30_CLK_PLL_D2] = clk;
 
 	/* PLLD2_OUT0 */
@@ -1008,6 +1009,16 @@ static void __init tegra30_periph_clk_init(void)
 				    0, 48, periph_clk_enb_refcnt);
 	clks[TEGRA30_CLK_DSIA] = clk;
 
+	/* csia_pad */
+	clk = clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_RATE_PARENT,
+				clk_base + PLLD_BASE, 26, 0, &pll_d_lock);
+	clks[TEGRA30_CLK_CSIA_PAD] = clk;
+
+	/* csib_pad */
+	clk = clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET_RATE_PARENT,
+				clk_base + PLLD2_BASE, 26, 0, &pll_d2_lock);
+	clks[TEGRA30_CLK_CSIB_PAD] = clk;
+
 	/* csus */
 	clk = tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
 					     clk_base, 0, TEGRA30_CLK_CSUS,
-- 
2.48.1

