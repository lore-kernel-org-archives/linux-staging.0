Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E021E33EB0B
	for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 12:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605810; cv=none; b=O/BSnnCTkE9Q0MxgeDSEc1pxsAuTfAamtf/vjHBZUPOuLr+ZCaCu3HnFpY88CDbKkTjNflR8BjfA4gwpRnPB7+gkvOM0uBiMKEuw/3gSWiB/HIzbCvrohjBrKgwJytIwae33Q+6ZvEnCZSoyg11W3+on/q1h/qbMCQoicWCLres=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605810; c=relaxed/simple;
	bh=A6JDE2qj6/Tmrwz2kzL3eYIsuA6v/5h7ZSerj7GfmtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jBZAijF2PYrrwnv193hg45INWCbI1EpPZT3Saqb5MdYlmt3AJTRJWMaHNMxm22qQJ9McXhCu6h78bZb9BAbVTtNfquh/vG57Q5aHjt1W59QoStkUXJm2IwsHs3gtfBvOFXPlhQP+kIIZKIlHoiJoiFgIM+guGkXvx7IOSKtM9R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8q/Z4z+; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8q/Z4z+"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb78e70c5so812712566b.1
        for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 05:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605807; x=1756210607; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7iBp08QNR8Td2vyYWnu87FXoNEPHv9ZHxpFhDONz5Gs=;
        b=L8q/Z4z+Zq9rY0wYLZSA5N4mMLvFOitX2tdrSHymv4UnsTqpGka8Od7dadh/thIyBu
         46itapYOH66TaVKTL4+C7jElCT8i9JaG/+RVpg4MWMpgf1+KpnX8S85SRmWuziiP4H4U
         8QFAySzfHCCmitN+gMhxMwGiTGdinxvOrbFZQQCwQErydwyE8S+nftLlS1U+BVZTQv20
         6ARKRvMTovYMgHRA2Dqnv5/Nihc+X5KeN7uXuWlDXU00PPnN7Mcp6ocIjSJ7+CIUyrN8
         oW8OG70P7+GHJKY8tLdkxzX2nYEWIQqG6I+4dHfSrpCXqP05Qx6278k6ZLUL1hA2NoKs
         mfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605807; x=1756210607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7iBp08QNR8Td2vyYWnu87FXoNEPHv9ZHxpFhDONz5Gs=;
        b=xGmgcMNdVcQq3EQbiPMRIYGtu4jeYCEmfzYMCov8/TQHRzJeERgEYsG9KpV0YHqPDg
         sSPYYxDifHd8tXWxlOhdhoxQHNSHW6EJMp3gIJvd2g34KXZ0nCaXMt0NuycKoD/Rqgj9
         fXjxU0+Apj8uzWOqmJdLvFi1YeHf6NBkgEXcQwYU1spx6DdQn5WHxyngioh5Sep6lM7r
         Sg22F9RfgUL1F/2QjJfLIouSqWW+8HmmOFRV1tV8i8KcgVaxw2RgRSXntXgu5MDOev+E
         7R8iLlXXiYGCJzmac8nnvlPIAc8oTpCctZb3a8DIUN+ySCBq6uZaINtHjrflaIalmahI
         356g==
X-Forwarded-Encrypted: i=1; AJvYcCW0lQzbOmwh7HPISX4YBrcZN1s7US/czIlv6/6fLv6gCJ+xztberQFalFDkcfI/wja+XzebcGzdPSXTCdvO@lists.linux.dev
X-Gm-Message-State: AOJu0YzeGWeJIfBp8hT8ebqjdOGBHtgf+si9b4fn5AKYiss9JnEzDbFA
	My0Dv3V7bluX0XsRYq3oztC45IJpxJ/CaAPmd3OwYBfVogKurE6T4B2K
X-Gm-Gg: ASbGnctHcexMatSxTxmaFLXt+YzWH0PF2DqvLrbBVhXnSspnwJnPKqEgt27rIzrghdk
	pOaAFbCkjUX5R8drYBrABUjk4FFz8E+d4I9RIqDoEOOM99snG3JK7Ok+Sq0NGr/iCQ3W54APNPF
	J85yCtT+hOV1kCqqY48HNCGwvkl44iH8exxHOdB4gv5/uY0/093CKTTJtFKZp0km0nN9QRe9Rtr
	kFnVp4SGTW9HXJ/yAYMLR6yxQ/2ub4IdHiERixy/5wc+rqhlH5ySKZYDzZbDrZ7mdhzDXjzc+qE
	L0tF3gL03DoYQS2iBie/owughiYfwz7ioI2beIk/7o8BHzK6hqVXuNyJiUTS/7mF9fj4ByXg88N
	fcYrGSIWxndR80g==
X-Google-Smtp-Source: AGHT+IEYZ39tq8yeh7XOkopLmn5iOqMcjzDRT5nnlaEu9RQqze9ng8oVmePY8pq8xmtyZEUdZCdUDQ==
X-Received: by 2002:a17:907:3e0b:b0:ae0:d332:f637 with SMTP id a640c23a62f3a-afddd0c699cmr229709166b.31.1755605806678;
        Tue, 19 Aug 2025 05:16:46 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:16:46 -0700 (PDT)
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
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 03/19] clk: tegra30: add CSI PAD clock gates
Date: Tue, 19 Aug 2025 15:16:15 +0300
Message-ID: <20250819121631.84280-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819121631.84280-1-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tegra30 has CSI PAD bits in both PLLD and PLLD2 clocks, that are required
for correct work of CSI block.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra30.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 70e85e2949e0..f033eb1ac26a 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -153,6 +153,7 @@ static unsigned long input_freq;
 
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
@@ -1008,6 +1009,18 @@ static void __init tegra30_periph_clk_init(void)
 				    0, 48, periph_clk_enb_refcnt);
 	clks[TEGRA30_CLK_DSIA] = clk;
 
+	/* csia_pad */
+	clk = clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_RATE_PARENT,
+				clk_base + PLLD_BASE, 26, 0, &pll_d_lock);
+	clk_register_clkdev(clk, "csia_pad", NULL);
+	clks[TEGRA30_CLK_CSIA_PAD] = clk;
+
+	/* csib_pad */
+	clk = clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET_RATE_PARENT,
+				clk_base + PLLD2_BASE, 26, 0, &pll_d2_lock);
+	clk_register_clkdev(clk, "csib_pad", NULL);
+	clks[TEGRA30_CLK_CSIB_PAD] = clk;
+
 	/* pcie */
 	clk = tegra_clk_register_periph_gate("pcie", "clk_m", 0, clk_base, 0,
 				    70, periph_clk_enb_refcnt);
-- 
2.48.1

