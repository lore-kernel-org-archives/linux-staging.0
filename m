Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25472EDD75
	for <linux-staging@lists.linux.dev>; Sat,  6 Sep 2025 13:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757166847; cv=none; b=ku7D7GKD2ldTWwolMIYN+zZft3VnWJT1VlqRXtiPqblgtWTEqKDtb0xcOIAPRmNhjIhyMpl4UOg8vITuaFlVIkZQrlmM/NFqGwEFKUo8WC3OXl5FFJgw9nITs/mwRbCIjLDkiAJAwG94xORyxyqtT5gVwCpNFWhcqQzcZ+sACTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757166847; c=relaxed/simple;
	bh=oRIHbapBkvIFjd8VdjV2tS2YmyYnsoUP9A054AJ6f48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VsJ1/JtCzxE9XeVEARZDoou+OD+fdCLRL11cqPmscJlwq2qkrVwGy17SoVkBVkUPP38PRCIh82A1/iUAi9mI9nyKANWrzYPe+cz/+At64dQEfMbwoN9QJhkIzMpoChX4XxwjNSMVhjm87mBZ0RbXgfGSa0xTYW0/Ni0hgK0qvNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2NcPj1+; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2NcPj1+"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-336b071e806so27342421fa.1
        for <linux-staging@lists.linux.dev>; Sat, 06 Sep 2025 06:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757166844; x=1757771644; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4lbvGVubD56OxVIYTjbgJT72UrL69nk9Yl7GjbDpm4=;
        b=F2NcPj1+qubdmaBNp6Dnmcuz3xwgyH7iMBYHcBYsM1/YmRo+OXMhHCJmUATHrgXiAa
         606hkcHYWWAQ3mtE8tA0EKmZFjNUe5sVhZtgMojZAbtkrdjY2OPcrrmgQLXzTZI6fnI2
         k+yi6EEGVzc0Xy+Sehd6wzGM9Alh7aYv5rW9doC9IhEpnhKsCgMesvFxHE973e6DQp7z
         vbYJwh7q7qsmGrBgHqunb5c03mFTlhezw2fBNUdmPa4+fK+v/vuonEl7ji5fbkTRBS2s
         lXmJnTr2u4nMceHI9kOCDjqHcX4l3vRur7c5qW+IqPRLKqHWxVDBq2t/J3NpSzASrtQL
         fMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757166844; x=1757771644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4lbvGVubD56OxVIYTjbgJT72UrL69nk9Yl7GjbDpm4=;
        b=JSf+P0gT9vBhoHSJpWobuyGYQuAWi8VKcXEYFcJ0V8YiydN5awBik5i6U+IwTPG8NQ
         LkvbXc8GxzqeB4Sg3fQYWKATuwNCcUQLNFxuOyUMgr3Oh04zuP1TV1xh1J8ksro+O54l
         mS4WrAv5stcFkUsOIVxc4gPRE8D5AsWyrGuJAI7oN4qeT9UmNR4W5RAdXWvsk14ZtLtN
         MxYAHRTZSMG2gdIx8VlCHYEHoLdMjvxzlAI2XB9wRuGiVagnE4VvXXNok9vwCf8+0nda
         kVKYXonjdZv3y9P+oiJzkUOh0vVPTe+m+v1e+u2CeUptXaQqRqatFIIAuTU70wDISqQ0
         HeXg==
X-Forwarded-Encrypted: i=1; AJvYcCWXWTqVT+PPKEc5k6zk9Jp5P9o6DudglD6aXDNYAOeQoWLzyXD0lWG3C0m81FcE/9DNGXiwgrU1j0+WPIhL@lists.linux.dev
X-Gm-Message-State: AOJu0YyEUfCb4oR43nX7MpvPFhCZziCZU82Ckvx/YKnP++aQkie9prIE
	j3tCDohT2bnGD6CPtZll+uhvq02HgbRe2HryqE+xKQE4KTdRAxPSVN5G
X-Gm-Gg: ASbGncsueTHjjhdBJPKQwwsehlkraTHR7z+JNWjCLZV5ybhJFSmCxnmDBB3zRd420TJ
	PJILhByvy47KZI9XufYWsTn3jQMx/+lMw/HBbUi549RI+5i912lCtXzFbokI5Ws/IVb0TERpgm0
	x2w6ucG/2LqQGZ7aXvhPG4dAHSJYlHmpqSjUonVUj5V1qzquysggjAeff2Sn6wZ8LvZ+gvykz2L
	QrbgLHudL95qvk0846uWwuRE5GTspCtNgCbo5PCFWDRSStYFyY9LLdnL4cnCcpfxiWoaLgLqnNs
	I0VXFZxOz13F/URQTABZslC9M03a+4nMkiVtgGpK7eaNaHaQ9J6e1qlngsDi7SaZu8mzLrJUqQj
	lcA51j4E1FbR6ow==
X-Google-Smtp-Source: AGHT+IFbSjW+2df8ovhvrvEYVHwTDb6GcdY+zCQF41mbNwIX4MyigO2GWVmHYoRhEYpkxCfyDxwxvw==
X-Received: by 2002:ac2:51ce:0:b0:55f:48db:813a with SMTP id 2adb3069b0e04-56263ba3098mr617510e87.54.1757166843736;
        Sat, 06 Sep 2025 06:54:03 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ace9c65sm2357467e87.85.2025.09.06.06.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 06:54:03 -0700 (PDT)
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
Subject: [PATCH v2 01/23] clk: tegra: set CSUS as vi_sensors gate for Tegra20, Tegra30 and Tegra114
Date: Sat,  6 Sep 2025 16:53:22 +0300
Message-ID: <20250906135345.241229-2-clamor95@gmail.com>
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

CSUS clock which is camera MCLK, is also a clock gate for vi_sensor so
lets model it by creating CSUS grate with vi_sensor as a parent.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra114.c | 7 ++++++-
 drivers/clk/tegra/clk-tegra20.c  | 7 ++++++-
 drivers/clk/tegra/clk-tegra30.c  | 7 ++++++-
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 186b0b81c1ec..00282b0d3763 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -691,7 +691,6 @@ static struct tegra_clk tegra114_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_tsec] = { .dt_id = TEGRA114_CLK_TSEC, .present = true },
 	[tegra_clk_xusb_host] = { .dt_id = TEGRA114_CLK_XUSB_HOST, .present = true },
 	[tegra_clk_msenc] = { .dt_id = TEGRA114_CLK_MSENC, .present = true },
-	[tegra_clk_csus] = { .dt_id = TEGRA114_CLK_CSUS, .present = true },
 	[tegra_clk_mselect] = { .dt_id = TEGRA114_CLK_MSELECT, .present = true },
 	[tegra_clk_tsensor] = { .dt_id = TEGRA114_CLK_TSENSOR, .present = true },
 	[tegra_clk_i2s3] = { .dt_id = TEGRA114_CLK_I2S3, .present = true },
@@ -1047,6 +1046,12 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
 					     0, 82, periph_clk_enb_refcnt);
 	clks[TEGRA114_CLK_DSIB] = clk;
 
+	/* csus */
+	clk = tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
+					     clk_base, 0, TEGRA114_CLK_CSUS,
+					     periph_clk_enb_refcnt);
+	clks[TEGRA114_CLK_CSUS] = clk;
+
 	/* emc mux */
 	clk = clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
 			       ARRAY_SIZE(mux_pllmcp_clkm),
diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 2c58ce25af75..bf9a9f8ddf62 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -530,7 +530,6 @@ static struct tegra_clk tegra20_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_rtc] = { .dt_id = TEGRA20_CLK_RTC, .present = true },
 	[tegra_clk_timer] = { .dt_id = TEGRA20_CLK_TIMER, .present = true },
 	[tegra_clk_kbc] = { .dt_id = TEGRA20_CLK_KBC, .present = true },
-	[tegra_clk_csus] = { .dt_id = TEGRA20_CLK_CSUS, .present = true },
 	[tegra_clk_vcp] = { .dt_id = TEGRA20_CLK_VCP, .present = true },
 	[tegra_clk_bsea] = { .dt_id = TEGRA20_CLK_BSEA, .present = true },
 	[tegra_clk_bsev] = { .dt_id = TEGRA20_CLK_BSEV, .present = true },
@@ -807,6 +806,12 @@ static void __init tegra20_periph_clk_init(void)
 	clk_register_clkdev(clk, NULL, "dsi");
 	clks[TEGRA20_CLK_DSI] = clk;
 
+	/* csus */
+	clk = tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
+					     clk_base, 0, TEGRA20_CLK_CSUS,
+					     periph_clk_enb_refcnt);
+	clks[TEGRA20_CLK_CSUS] = clk;
+
 	/* pex */
 	clk = tegra_clk_register_periph_gate("pex", "clk_m", 0, clk_base, 0, 70,
 				    periph_clk_enb_refcnt);
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 82a8cb9545eb..ca367184e185 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -779,7 +779,6 @@ static struct tegra_clk tegra30_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_rtc] = { .dt_id = TEGRA30_CLK_RTC, .present = true },
 	[tegra_clk_timer] = { .dt_id = TEGRA30_CLK_TIMER, .present = true },
 	[tegra_clk_kbc] = { .dt_id = TEGRA30_CLK_KBC, .present = true },
-	[tegra_clk_csus] = { .dt_id = TEGRA30_CLK_CSUS, .present = true },
 	[tegra_clk_vcp] = { .dt_id = TEGRA30_CLK_VCP, .present = true },
 	[tegra_clk_bsea] = { .dt_id = TEGRA30_CLK_BSEA, .present = true },
 	[tegra_clk_bsev] = { .dt_id = TEGRA30_CLK_BSEV, .present = true },
@@ -1008,6 +1007,12 @@ static void __init tegra30_periph_clk_init(void)
 				    0, 48, periph_clk_enb_refcnt);
 	clks[TEGRA30_CLK_DSIA] = clk;
 
+	/* csus */
+	clk = tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
+					     clk_base, 0, TEGRA30_CLK_CSUS,
+					     periph_clk_enb_refcnt);
+	clks[TEGRA30_CLK_CSUS] = clk;
+
 	/* pcie */
 	clk = tegra_clk_register_periph_gate("pcie", "clk_m", 0, clk_base, 0,
 				    70, periph_clk_enb_refcnt);
-- 
2.48.1

