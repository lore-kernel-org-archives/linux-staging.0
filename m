Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1823034C122
	for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 14:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761142894; cv=none; b=JMGw2QiqkwXYThe/yuf/RFFSOlaGuTCGiLU0VAhT5D0wq/jcwZ2EGnBOJfISNWXuy0XhwKte6fkwKPsvjhKzMyfgScr9pZn3klE7OMHNAjav0dvXQAksExBRlbldnOfiWgGtiELbbmXI70s1znmLlPwAgZ7vG9ylVYunwlMu0Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761142894; c=relaxed/simple;
	bh=FZOaPk/XiWFhkp3zMB+0dvCF3erehg3z6+zK/HzLAY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LTDfiEvMUlGuk9obRbGHOwtUn9/KQgH/ZWeC1KoMMTSBa3/d5ye/pnm7KGbR4vsoCkWQu8Q/d+hn0ImG0Z5jpr/wAvZ2BxF9ipF88ZZ18ZzjxS9Qzmyq43Zb4yDLJxd012hL9qP4ZuE9pgsshbHFbPBvsDGXt/SaqvV1kdrV4rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfNJFlDn; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfNJFlDn"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso6525005f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 07:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761142888; x=1761747688; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pg0HJx9UF6cc43KSohy1sFUTcyD1/BLQvc4mTLXMxcE=;
        b=SfNJFlDni6dQ3ZfQfnU47ILR0GONEquhLtysoN6QYpDO8mYqVNKX5Bt/Wb/G3ep4pR
         nKwjJWqU8STYj26aOvFOJ/erdhtEoz14KeRrgmiWtv3diVKoKQTYLW2QYBaR1i3WkSy5
         +taTWWLDs/O+cufy/GoFTCC2J7EjZ1mlFkgjqCQ/FxYjk7KSDDaaa+bpB9b9CfTbvna5
         7JTyVMccmKkByDINoPLqXvCGdIeuXKaS8sP/BPJzH/BrbjDK9S0kRdfnstsxQeUORK0A
         xGwd4Gamxh5a9ImlkAlRARWmk10/xPofYV07+mZCe4NXAPFjlV62sQcOWAR82g3CUkWV
         LJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761142888; x=1761747688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pg0HJx9UF6cc43KSohy1sFUTcyD1/BLQvc4mTLXMxcE=;
        b=Nq3k6EWFOQ96lzV10lhsdJaUOzzs0M9lzSsQsVQ79Y9r/NYbbV2m2ppAkRctdMs13z
         801dKbZ4T2UPN3NzmXJ/nTGMt7DNxYMLmQK5wGRvvf15YOUpUc8Bn/kc7ShXSdrrdIYR
         ZEOX6nmYyDsTNiMNA/Ahq6YsJNAidWU1QHjCwzJUPzkgb+nki4kOjW4bletd1B6reYol
         s7M6/7H4hNI7gLGEPA8+RoryQE8o5aNe723uj2EI70aOE0EvHt5E0pHAhwkRN907huW7
         66QbiHj0IacUawhppyIJWlzUEZkMmRG92e91awtI+iVrpcxF1bpqE/1lOFB8KFcPW82p
         VAKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuj9kbnZDEZj/AWkkZs6ikedEjIYCt9CtM+xEOpZ/pie5ldpiO7jb/8i7CRL5pefPWMjGe4n2IDp2x6fYj@lists.linux.dev
X-Gm-Message-State: AOJu0Ywr7GpP6uu+S7pq7MCArd4xj6Dst8yQvWMjDd80XjVrAt16SIAv
	UXUPH9I6uZy9QGq74+oVJ0N3Vix+QIlvG0L1YxupLi173b+fVt9tRq2l
X-Gm-Gg: ASbGnct5QF/UkM9ZzDQs55BtwycvCoIS3OGpGFnowx5Cny3NV5NyP/MtoIObh1uHqf+
	XVnPOotvFnFE4G75fMx9vqZ54fmq0jON8v+Cw76MxN6BQgtsEaa9g/rIwIgi5dLBMj3kAlu312p
	0amtsm6YJO6swJUnUPbihPivKcFDFWPB/UZsMgBc1dM+Z/+ZJzf05qGHKzSy0nRlGooMp6pnku9
	MDddwHFYfRzqqyU+e1D96qXoTuerA0uuHPUX59fT4ESEvJ0cQ7yb3mjkj9LsgtguS75fMFHEvkv
	FWQx5sdNhritGRzs82IkZ4SXwhk+yro2hihpm315iQsMZIVIbFteRdUHHGeBooTvzUW+CP1dpKc
	9+mw/M5sGPx7O8GickA3EFiCGlxOE+iGUWt5By7aYOOYR8uk45nAhwyqTm7YJgpzKs592KoryeS
	iHlw==
X-Google-Smtp-Source: AGHT+IEE/9i/67mFO6AX8/n+bNXkAiepciOEweVLIX/eQExePA3iiemiXfxV633d+lCMS0Zt6gY3Sg==
X-Received: by 2002:a05:6000:41c4:b0:428:5659:81d6 with SMTP id ffacd0b85a97d-428565a6ce5mr1254038f8f.37.1761142887849;
        Wed, 22 Oct 2025 07:21:27 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 07:21:27 -0700 (PDT)
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
	linux-staging@lists.linux.dev
Subject: [PATCH v5 03/23] clk: tegra30: add CSI pad clock gates
Date: Wed, 22 Oct 2025 17:20:31 +0300
Message-ID: <20251022142051.70400-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
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

