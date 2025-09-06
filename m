Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF79D2F4A01
	for <linux-staging@lists.linux.dev>; Sat,  6 Sep 2025 13:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166850; cv=none; b=c6hoekCOjpv9i6OkugRc5kdvEk7aQMcALqxRu1ZYkz9yBui5b4CD8+XxXGjfQ82EqcOxFtn03694xzATERGd3SJ9kMSV6Mjrn3wwjJGGQ4xENkIi5oOuFq1uXqrU8BLjsQ7sr7QYWUOi3RSG/CD4NDhAJx2c6vD69ma6xnNtRzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166850; c=relaxed/simple;
	bh=cxJDHY7ksKyotUEe1ULZ+faokKja/+0d3tNVVflADFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mIGs+HnT7wLvKRkJPshotqJ4SyfDBjf/gHof8+zR7cQjxRwkJDMC+FrZ7SKHTEmrYpUhPugmgvg0aiyGGBHOav05lwRn4kiw91e1woOguQ1gIPzodySVBv37cXUKGSKR5GG4B4Si51AB+yie++LoaoMr2RPuT2yvLFkZLiRhIAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kcxURetV; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kcxURetV"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55f69cf4b77so3196704e87.2
        for <linux-staging@lists.linux.dev>; Sat, 06 Sep 2025 06:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166847; x=1757771647; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9i6OcQVl223L1rRsm8JFsKq6/v1CeE5Ws5ZJzPzHaTg=;
        b=kcxURetVUmvjYVUd8k3OvcgzAocxLxYlo2/nm5HQtrUxO9JEIKBXxOCa+rhxQ2itqO
         z+Whqlv43OSAgNvlKQyGonjCPwJvw6KobABPl3O1RfHdF1Rj/19+ozmmNnljosdQqVxX
         Enr89yXud2Ejl+FGAGNv6EPK0ATGr9qYNWzhxk9FcL0CPJHaDucmhKC7Q7AYKteN5vuO
         pBKS7WR2pk1DAkeQMKu7SZV1efu2AenUEACkOtCKn9hQ1pxEInBZo9zIpTdQeXnVgHiR
         HlRlYQH1x9oERp84qX7B2ULgDTj1/sT62WklSlQWV3CDLezpxvsddFZyqugcLBW7oqz8
         N/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166847; x=1757771647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9i6OcQVl223L1rRsm8JFsKq6/v1CeE5Ws5ZJzPzHaTg=;
        b=G+tHIa4pIUC7m+f7E1LUZwAH6w3u07d4eV3Sk67LZBIx7O3+H8KEn9md81TdZLy8hY
         2yjZ4jL6396y+hH5rxv87CO5j9ac83mTlQRgj1idmQ4vYQlDADAOx7bk1TeyVd1F2+W/
         Y6Xa5BMszxTC37Mey8GTzdRK/v93zUuH4fLfh2sJXSxMb8DuHL9bb3qybm6Hr0JyQVtJ
         rU2nz/8CSjRtZq5GxlLsAJlVCb3CnLMCTqq2LRz5xF13PBzkbepeDMimwBvyd5h8zYTz
         x2zXEXlOKfSNn/m+U2uB06haf3bvLFsyo7YiWx37rwBnG4emt5Rj7WGJ75rOYewN5fd3
         JQAw==
X-Forwarded-Encrypted: i=1; AJvYcCXXlRpZqrXUXS6rSai+GKRYvQOv0gB/y6OieVZi73bDLknX4ffe1xVn3WMLpaJZgtSzes4uDS1vnuZpyU4e@lists.linux.dev
X-Gm-Message-State: AOJu0YwZBbccMK6sYYW/dsb6xFFt8O3Hk9/FR0CUiryiQMGlzrC935Gh
	6MAz1bGfXDoAf7/5ANQa8qah3SZAt5Hc5hEZObAx73wLdYK1gb3/xpOH
X-Gm-Gg: ASbGncurNTf4cnqqMzZVIPqY1QzvC57wNb/vrXoXag5FAhZYBMvW8UcheCm9rnDcfQl
	ekgc40Stn3c3DTHD1imjKtxMxBIKkdHcHxiCNK45i1JFN/7CYw0ON7xhDnnAUrgsAUq3FNT/Jxl
	Uk1Djm1d/K1KBrhXKSBgL/Sw7GY+M93A7UwxjESdZdlPc3FFpunOMcmtX4QYfDgiPcN+gt7BsDE
	ZckXeot1m6ZQFwuY8qAIFtC3+E4K03fU3zp1hkOs4m/Jr1dNDzR1nsphmA4oaVrnXISChDkKqbk
	UC+LwMe0HJ+6jQKjpeyr9oF4zT1tRe6NqBrSb14tjA98pzzbivpJIL5g7WrmbviTtWdHAno7cF1
	VzJHN4xspcnBz5A==
X-Google-Smtp-Source: AGHT+IHOTXlLeFAX4PeEb0CFRrWklYJRkXCSL3HIOnLPeENoT5B3vXrzBWCpqmbQzCgd2aQkyH/8qw==
X-Received: by 2002:a05:6512:1188:b0:55f:572e:2417 with SMTP id 2adb3069b0e04-56263007fd8mr640516e87.56.1757166846889;
        Sat, 06 Sep 2025 06:54:06 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:06 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 03/23] clk: tegra30: add CSI pad clock gates
Date: Sat,  6 Sep 2025 16:53:24 +0300
Message-ID: <20250906135345.241229-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250906135345.241229-1-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tegra30 has CSI pad bits in both PLLD and PLLD2 clocks that are required
for the correct work of the CSI block. Add CSI pad A and pad B clock gates
with PLLD/PLLD2 parents, respectively. Add plld2 spinlock, like one plld
has to be used for clock gate registration.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
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

