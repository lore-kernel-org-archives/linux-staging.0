Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2B423D7E0
	for <linux-staging@lists.linux.dev>; Wed, 31 Dec 2025 12:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767184865; cv=none; b=YsRgs0BRZBYT5llm5GrWVzPGoRFfQwKVgobCMTJJnJPKq3I/nVaXtxf+d9Y7QQjD9m0ZACZxzFkC899g/mygypnI9X+QWe07KC8Xf1vPB/dOHXBoPBmZKDdFb094r9ELODPQK75cwFS5eElUW2QndW5mvq5KTwhEoLU2H6v/NpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767184865; c=relaxed/simple;
	bh=DnZtX8FMWL3xUvEx9ZwEljqS0Zqi/7F7spPDPYn9XhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LaRkHpEVl2KCkIyuOpa9MtaUveVNYDTPFUFdNxT/Iirn3drQIOxR8u3IGr9yFRVrTihYDcLwwgDUctIAbdYr67P3HpWRZOaEje9pfi4cny9c/ArMiEsvVJVK7DTJtQhD7kM9Jv+7YNfUZYGJugwJ9ETgk+voUrmsqze18XsvE14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m9TB0u5A; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m9TB0u5A"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-78c6a53187dso82050347b3.2
        for <linux-staging@lists.linux.dev>; Wed, 31 Dec 2025 04:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767184863; x=1767789663; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASzrwnWe1LPCoc7Xrbs0jLsSOmeBARD1j4LP7Uc0+4E=;
        b=m9TB0u5ATHWH6q4RNsQPp/QSTxgUOuRsGk6yrmFHQ16Nh956XaKTdd6odXZE57+THW
         nRGi/kWla9Y87RV0gLiRNVSm5nuaFmq8axKilDU1D6IcJMsoGvtRLOMFXmikVzB/b5Bw
         njqj3L9Y3/4znMaQzPwn1RR88mZPpcfN7by1R5mCemcYfOpzpwz8YXT0uC9ay5/rfgHk
         4dEAwTVmWmFtCMG+e2i7iL41BcgBWbwSIGj2g8qmcSjNBYG2vjAo4YfT+7Gtqh+TU6tW
         tpCSBfKDt3Q0B3Y+UN/01xeTV1XIRys8ZegbRVwx+KxUhGMfgNnNO74xpSOAUllQTZnU
         AAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767184863; x=1767789663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ASzrwnWe1LPCoc7Xrbs0jLsSOmeBARD1j4LP7Uc0+4E=;
        b=oIqtT7TXvxP/f+DiFMNHaWrom1a272zzH39+Ky4lzsxr7Xciai5LO0+Su3B5o97yFI
         vySX/YN/xw0+yRxDjmE8RK0Ri8cbMxoK/vC06nyPZ5cRqmJ1ty/j5FmtOzKhud+7T/2J
         5VDXebR0J+GIjZSFFHcnEZIl8XXGWTME8Hac24iDeGEZWBUCwUSUu3hn8ZfuCCitMegT
         sHu6rPCq9io+1cHNK1RumV989hV3kv4MBAS//n99j6g+RrEMVjuSf6JFrW6t+cjvbiJG
         nXxDU/lfamlGK8+57ISj38NlrYWTrKoIF1j9C9f2UrMTBHFRNIjGaF+mZ51ZTyUGYXv+
         9ThQ==
X-Gm-Message-State: AOJu0Yw172v4ntzrnDdeYgOY148Izhjw4KGgft5WnUvL/Y9oohMWv/bJ
	1r2t8x/xDqNO0uX2M69VQ8pP7ycQv3qqBR8h+/7V4EpdwvC/uA1KwTyn
X-Gm-Gg: AY/fxX71CleVI5u+bGHpaAsAbPWSJ9LqlB7lY2rPe9jYZtdWKkRFdoEfgpOcgrQPLtR
	/im7p8hRAFUSdGsoG4MNhScC6OVGCEiIgGy21D/D/AH5dFrDbMxCrAEvcdM1Z6PVTtZwuDOnORC
	voDTTZpqitGpY2wLUaPNGC8On65sYWeYD6Yu8pCuEvHdwvx1x/R/kK5lhm/CBiPMsP78242/m7o
	Ym9dFsV/mxM23fk92l+WNCABN9frvNgTrfp6jWT3GNkypdY6aMWpfVUZDcxE/WYntgLBVeQFWXO
	VF0wsXZtPNUnfxk97BKY6NSItlsg08ASgMRkEupPkrmFAr0eaSr2YV9GPPnJ4qPpuervLFnjzm7
	VWh01rdvkQzwEL0NdTZoATTHqee+vFCaPdmw4Q5MvcPWmvJJkSm5wLPkp2Px+J9CRaetJBP/Zzu
	D66atpxOgPgwLrirqA00lv76Kt9gwac3WcoXBJTObyICBtcfLBceKeFhgBNw+d/83yDqxYKyyBL
	MVf8kg=
X-Google-Smtp-Source: AGHT+IEFy0/xAx2AeDnYaJrJhM8NAx65XdkRXLMsI+QKt1RJUDYhZDfCV41A4Srcws0GZCL6Gfr8LA==
X-Received: by 2002:a05:690c:6307:b0:786:a3fa:cb92 with SMTP id 00721157ae682-78fb3ec89b0mr240437437b3.9.1767184863093;
        Wed, 31 Dec 2025 04:41:03 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb43b2690sm137555257b3.18.2025.12.31.04.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 04:41:02 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: luca.ceresoli@bootlin.com
Cc: linux-staging@lists.linux.dev,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	mchehab@kernel.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v2 2/2] staging: media: tegra-video: move tegra20_vip_soc declaration to vip.h
Date: Wed, 31 Dec 2025 20:39:55 +0800
Message-ID: <20251231123955.277384-3-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231123955.277384-1-sun.jian.kdev@gmail.com>
References: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
 <20251231123955.277384-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra20_vip_soc is shared across translation units but is currently
declared via an extern in vip.c. Move the declaration to vip.h so users get
it via the header and we avoid extern declarations in .c files, matching
the pattern already used by tegra20_vi_soc and tegra210_vi_soc.

Link: https://lore.kernel.org/linux-staging/DFCAOR6T9DPE.2MOL0K9O3HP1N@bootlin.com/T/
Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 drivers/staging/media/tegra-video/vip.c | 4 ----
 drivers/staging/media/tegra-video/vip.h | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vip.c b/drivers/staging/media/tegra-video/vip.c
index 5ec717f3afd5..80cd3b113125 100644
--- a/drivers/staging/media/tegra-video/vip.c
+++ b/drivers/staging/media/tegra-video/vip.c
@@ -263,10 +263,6 @@ static void tegra_vip_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
-extern const struct tegra_vip_soc tegra20_vip_soc;
-#endif
-
 static const struct of_device_id tegra_vip_of_id_table[] = {
 #if defined(CONFIG_ARCH_TEGRA_2x_SOC)
 	{ .compatible = "nvidia,tegra20-vip", .data = &tegra20_vip_soc },
diff --git a/drivers/staging/media/tegra-video/vip.h b/drivers/staging/media/tegra-video/vip.h
index 32ceaaccbba2..fdded00447e4 100644
--- a/drivers/staging/media/tegra-video/vip.h
+++ b/drivers/staging/media/tegra-video/vip.h
@@ -50,6 +50,10 @@ struct tegra_vip_soc {
 	const struct tegra_vip_ops *ops;
 };
 
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
+extern const struct tegra_vip_soc tegra20_vip_soc;
+#endif
+
 /**
  * struct tegra_vip - NVIDIA Tegra VIP device structure
  *
-- 
2.43.0

