Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F2C30DECB
	for <linux-staging@lists.linux.dev>; Fri,  2 Jan 2026 11:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767354365; cv=none; b=lD4pa4xYJtSPFu1AYYGm74c9NPP7cnfa5buN6Cbp6uvQih92hNxIqWfCIQRTW3SpUAn4Wglp7wwf3oHReIsWGd/cI0ZJ2DnAdmKQJ0si/WyKIj+AFDpDqNW36KO92l+zDWJilei8lhwwl7/5Dt64qfcNeTxFKkNcnfqJXUA8wiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767354365; c=relaxed/simple;
	bh=DnZtX8FMWL3xUvEx9ZwEljqS0Zqi/7F7spPDPYn9XhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GgE34JkeZpPPYFi7eN5Q+9PwmGfxEhgw27pDWwI1K4PCnxGPkrnwONv0FtCd4Xbb/Y0H/o3PrXw+LhQ+bt/PitsmbNZlBL0UC6MW1dilLAuw5Eu/IkasyyBrQQ5jQ/U+NekXOCSHEmIbrYxE9fOry1KvHmJllphyrEW5JM1GbVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZT3/XXg; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZT3/XXg"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-78fc7893c93so85054137b3.2
        for <linux-staging@lists.linux.dev>; Fri, 02 Jan 2026 03:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767354363; x=1767959163; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASzrwnWe1LPCoc7Xrbs0jLsSOmeBARD1j4LP7Uc0+4E=;
        b=GZT3/XXgOQqbyZCENXQZQ2TxFWKG6zG47uVxbBbWoaxzk4vQYzMtBNhn2RzYMjK1BH
         Wwd5TmSq/70P883PcOq9GH3RCaMe0Yn9p9us6W6bkW/hgqWkvor9eIEn2xiWa3ta/xEq
         Ai4JuEY3HBRAKJ8iIiUD0rOef5smHn+6Pb9+7EIHJnYXueskuSIrOs5jLF4xYc+HUYxC
         66sJn9kcGuGZm1XpD7M/fUm6UAiZOPRCM0vxDgcDkANC6cDQHte3yvmCN4KkKnGiO5oY
         QhWEaxwJAa+z8Sy9E429Xg4dIYZbidHO7WI+PfIT2m4MNC/VYMbhMgopoZorzCvSeAYq
         d+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767354363; x=1767959163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ASzrwnWe1LPCoc7Xrbs0jLsSOmeBARD1j4LP7Uc0+4E=;
        b=vP2pQesXrpwrnyTo0bdwqNrtZoTLIRIVSw/jOYzR3RrJACFHOCpeQpxu6wAe77kMKr
         ByDvRe4qJTnybAC9F23hHBeS6MiPMIYxQ4ukleMleQr/xKWj4K5P2C36kIO24qKRhF7i
         JU2xcY2ajGJ+1zyR9HW7usliYjpecSVXeftFz1cnPnZW+HXfcrr1WSu9D8vFwVn0d10T
         tvd2EHHj7ldNwgreE/Jx8NOD7+A5VewUXpi3KfEOhAmMGsvAFrBn8RQRSKQS+3J7vS5t
         PJnwq+Zq9G6OXn384/Fqgiv0S64i++NxKYQph45JGNLZZT4+HLk5cBeUzs7q3a7yyT/C
         4p7g==
X-Forwarded-Encrypted: i=1; AJvYcCXsPxmR7vKyGEiCyQvB3W6DDbyLOJx4wscuWrQd7rLOHctnDX3DDPexdZoBzKWqCJ32O41/5LzpaMkWZAM8@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2/juk/YTLwkvcFHrylw6/hyDJ3vbFg7+k4mm7TvrDwp+3iqta
	HfglzUQHrm8Gt0Ivk4ezAj+F9lupwmmYoWFl5/gCDViAVmHulMRjkqKK
X-Gm-Gg: AY/fxX5sieX2FGQK3kc2uGXxwrrrAvU8v2hXvT8JiqTEpkF6P8oRocBg9Smmo/v5rFV
	1/Y5si3ta4I+/1PDeZt7dFgP5uV9ccQaOEZGwRPL/X/TaxJ6TNhCqzlw0lRmcOVx+dWyAW8h03g
	BsDrOxrkSoGP3+a2qu834K2CY3tcXYGOV2lUfrgPaN9w8GwMYb7+85KaY0aKRynEV1NRhvoeKzC
	zXccMKQJbGiqpucfjb4RnsDo4keHqsAubHtgUDDR7amvt58SA75eug6fNTJy7x8/dL7cHmG+axG
	pB++8xpiZ8XxbeA3BCMYVi3y3fRQ2J7f/hSV5JBfMEav+ALcBCDvKWfBU+iELjbqqr9ikjISDZB
	taE9INcjE3po/P3bGwI/LZpYzaPyP1f4bd5KcAaH/IqjdRM6H4Lv7EV8Zat9eEfCprMt8jDAfvn
	Mh1qxzyclp8ZQXZA+XwoArSMYExibW70+Vs0ym25EjMeqo1EIFkbHKM8hSe600drCWqwIE5e9ci
	EGCgyE=
X-Google-Smtp-Source: AGHT+IGAb1LvYCKPkrw6Jp7sMEujxcREGH2IZa4Xr5bo9nugfnsGpFXZASy+0aYsNgKqGokZhA8vng==
X-Received: by 2002:a53:a9cd:0:b0:63f:bb1d:e529 with SMTP id 956f58d0204a3-6466a8f31e2mr23590058d50.48.1767354362981;
        Fri, 02 Jan 2026 03:46:02 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb4562df4sm156230587b3.55.2026.01.02.03.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 03:46:02 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v3 2/2] staging: media: tegra-video: move tegra20_vip_soc declaration to vip.h
Date: Fri,  2 Jan 2026 19:45:01 +0800
Message-ID: <20260102114501.42312-3-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260102114501.42312-1-sun.jian.kdev@gmail.com>
References: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
 <20260102114501.42312-1-sun.jian.kdev@gmail.com>
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

