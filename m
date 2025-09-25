Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182502E54D3
	for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 15:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758813441; cv=none; b=e8ZqxN4Rk3belC1lQ5RwYxEhw7kXebHFQHTWosAV5WTRvNsqWmxguDGnO6IGQnlhr9PNycfg1AZKHNcFvqEhkVFNpHrlKJVqB17tsNN0zcmR8lpkJ5Nwa17tornE2u54S/CF0ETeSnkaAXYiwWvlHZvoaKISFDeXp1E1KiOV0wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758813441; c=relaxed/simple;
	bh=FZOaPk/XiWFhkp3zMB+0dvCF3erehg3z6+zK/HzLAY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vBrsFSxcazQt5sIr+9f/9/8vT+sLxJDhhzQ9KIVA+T5NDe7P+m0h+a2gCKAfgOIuR8GpGJzwIfEuPjMFms2LS4ysb2wqiDIvsRzQKNoimBNqtsK7CR6p9yk85eDfjNFAK7pqgbpmRBfgMc8kirJ7p4NHp7oNG/o5ysXHZx8Xf9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ckUFgX/Q; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ckUFgX/Q"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-57b8fc6097fso1343772e87.1
        for <linux-staging@lists.linux.dev>; Thu, 25 Sep 2025 08:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758813437; x=1759418237; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pg0HJx9UF6cc43KSohy1sFUTcyD1/BLQvc4mTLXMxcE=;
        b=ckUFgX/QcrL/DIrxMhvs1FhudOanJimY4GshumeEwLo53xX/vY9uvDCG0yfCd9apCy
         ZnXKpyvZ2Ertij9OTxXhM6qHLpFeurv9go0mBCvQ2Sf4DBiMs4A1rGBNKFpI2eo2zlxq
         0Jt+ROU3Ocwfx029rTuNOixhcNbruTq2QDYgkj1uvTe9kG7hWpwLvFB6rj6v0G+4k1aj
         4cKHO4anGLGdA52gToOtRcaMp+8aqtVABioHezRWVmeT5nT9mpwAPtpNfeGBSZes/gvL
         UUC+8hxbVweUeLsa94jv1IICRFfCtwUd+dt5wGa3Ga5n5qFz/HpBC4c/Kunvos+Frx9a
         fzww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758813437; x=1759418237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pg0HJx9UF6cc43KSohy1sFUTcyD1/BLQvc4mTLXMxcE=;
        b=gan5EYO0Kt6hazVpZjKAKxEDMrzMSuLjsVe6NFhU/GRbnCeoUhUoRUK3ijHj16kJz9
         AqwrgneA/G52SG3R29NtBNS1U4ubfKhtJnjjVfTwK+IGj8+M+q6/4SKyeTTPk9mrf7PP
         xGz5MLypbK/8kTymR4cjR2vZc58Q6N+bGNySGGiHY1kZdOSaWH2gnTGXSIuBZE6YcFY7
         nubqJsTGOtTu+NzKesVAMQsSMfkwD6ggkQ7bwfISGnyFP/6S8g773bjQt4kGFVTdPew+
         4qnSH32JheCaJ05j4kol+trx4nSM7WyKxQrXNWbjrY5P0r5li63MHojeEaQtqVtmwzy5
         Frdg==
X-Forwarded-Encrypted: i=1; AJvYcCXCW1lnm1VNzBN49eJec4agKH8uC5qscpuq4i/I7vvvYL9Cu5DY9zMmc5KC4+zfK2nZqPZCg4R5wgV699jb@lists.linux.dev
X-Gm-Message-State: AOJu0YzNX246CGBJbSqSiGi3XQiyk872PJS0JKU9vCiMK9DaXEReYS5Y
	rLMIELK+v1C63Ykii1yVYmsXKwRRs0hbd3XwA7qFS74PIDTj+7CZCp/d
X-Gm-Gg: ASbGncu49STsjE9sqQXtiioP39HxvvuRjr5YgzfOFi7wtRPpWa2OlZr0IC2twPvxY4m
	j4HhzYp9XpLjhlMzhVNiH2XgDsf6vv05imj5Bx2fm2DzxnAVkB8vT4Vq9q/v0VR8Zr/6evkyX2s
	IJHsR9gtaWpUy6vV0FOyjM/yLVBkxngtY6r/Hz+GmbdHvDaNtv1qS9Cd+k//dGcMy2LR7+JZO7Q
	d7fvEXzKWTLpL+QsowzpOgHyqELPUjE39sEaPNM5K0cvUzNxrSrRjkMmVhc+EfZiuWAXrgRUkJm
	H6/Rb7okW1T262hj9u7unnWM1BwHBeOBTcvAFgzOeMK2rcHz94HPP4IkyXIq9h1tZvd/ln4BdQm
	IyZLAw0VDefB2Zel5OpbK531r
X-Google-Smtp-Source: AGHT+IE0utS+jecb/LkEfFuQRpDoO+zVGhi+NkEAr1FLNmKoWaS6Wce1hEkVKYRO90wTwE672u05Dg==
X-Received: by 2002:a05:6512:3e11:b0:57a:de0d:d9ce with SMTP id 2adb3069b0e04-582d2f273a4mr1035976e87.44.1758813436654;
        Thu, 25 Sep 2025 08:17:16 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:17:16 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
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
Subject: [PATCH v3 03/22] clk: tegra30: add CSI pad clock gates
Date: Thu, 25 Sep 2025 18:16:29 +0300
Message-ID: <20250925151648.79510-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
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

