Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F85201113
	for <linux-staging@lists.linux.dev>; Sun, 21 Jun 2026 13:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782048836; cv=none; b=gfxnwKw85zQYGNhvNS1Nf1DK242ghgJg8PM3hjTYq//oZ+eneJMi9/rsMr9ttsCnI4bY2T1NkAN6XhTNqiXVgsfuIz7nlIDW+TjHIb+3fufsuTTjnfnJlZJ0OMxKQAN2K4aB1mRKUVnVSw8z5qxRLHppi1Am3FosMJkZa3FgHjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782048836; c=relaxed/simple;
	bh=DtegwQ/lcIT7sDNklzF6t2vZq6M5y1/DsszHICIfGt0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gxQ8z0kNoHzJQhG3XpzTuEnocmttPjQ0fyXGm99UH2plBTRH5a11ATlNaufAS/7QnpxsxcrbOa2PTwyPAX696Y3vjMFKZp4Szx5jl1bF6lIEOhAcqD6aqZS4cYALx5bJ3qQ9KakSjRKqjZWhycf8iN/xRZtgZwuwJLQB5ajUbm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Np1o5x84; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Np1o5x84"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-490ac357c55so38323455e9.1
        for <linux-staging@lists.linux.dev>; Sun, 21 Jun 2026 06:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782048833; x=1782653633; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VBZqzqsvffj6NeLXb19hVFi5fifS6sZJ8/eNWZ3Rw5M=;
        b=Np1o5x847jwcqjGeszdIP6rTOHEC6tLW35/4/kpoM1PH60UN9D6N9oU7PLHBmpwrAh
         JGifJAqXK30skmtuTx3ZIFCO0ikU0L5jgswCXjEEe3uGyyEgzTOyWHzOknD6ZTqIx5nd
         3HYspQ5yO0GoQzC51P2QfVPwNMOJbHPXfUYrKRabL4ECCUbNMMSX4fEZtTwDE+H/zTsd
         d+Ic6ks/d3qToWUdGRCd+T6CdAJ8n5p8HkM28lh1VG3Sxri7NljPMW2bGYhz3X3FKM0u
         htYMZrIfLvpMeZLjTQxtj29fV57P14JCchVy6roUVGMhHlE3pa+YmWlA4eQrHVLTWbgZ
         ofHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782048833; x=1782653633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VBZqzqsvffj6NeLXb19hVFi5fifS6sZJ8/eNWZ3Rw5M=;
        b=PhJ7DgnbhLueaDUvQxxSkbV+6J1hKh8JAAI//CFYZyAThQMlqOUnFJAD0SDhJiTftC
         JABTIG6kq1NT15Qq+HfOfWIYWPnEKRZ7N3ITFNlJxXEhO5eyz+4LnARKb4q6ym+nN3eY
         U7kvXIFmeGUW+THQc4bPN1AE01RHGNFEyI0YzzowoF/SXhSaRjEO2g4/G7y1MHSJHEwi
         +VA68XSFmaLmteV7y31FXKaAFg5WjplVp9q8Yhv1PZGaF9vdKTgAus0y8V3Xu8ImAhNl
         xJw2awg5/v0xgWb06mVJYPDY2Hz08LE8AawswUo3fZlq0736BquE94R/g4hzC1GNVSa6
         NjDg==
X-Gm-Message-State: AOJu0YwRIE/SJZk3C5z+/ygiX3qx4rH/sAVV6qh5mvbViq6faMpk0asF
	obkIY0Jw6SmJcKDWvZ/J596KDMfbQ8Gwdv3IiXGf3CfgIEVIL1QzXV/8
X-Gm-Gg: AfdE7clfRSQ1hX6wcpHjWRf4MFvnAPnr1fPYeMw5jxbyYDtcwjgszcA4ezzY8lGQ/rh
	VKkOEYctHQpHKrcBskNWPRiadcjwKQt39YDoa2VRBi0w0kfqqnG0pab4oicuOUi4/ckhVFq4XAA
	TPjXeyZq3vZoRc/5k/El2rG4Ovyrw0Yc/FQ/n4pNcHL31SDxzdLilFXWNYFXpfIBn2F8OSQ42L+
	Jk5/EvRH20U+ZIX+lQRxx4IfULZfnQ9to3FaUJyF8tQeJGFiljZDPD5vxIjUqnHPC7f/kJ6cfpI
	0rl1/ykvpNvfF9DUObd1YVJY26QREffXkJKUoIbiozcIABc55HfCk7T2SMUujGhme8XkyZUY1qi
	itqjAN36SWGHhTyKpBkvlGlMNZQt8Uom0+F9+16rbPNydjuf/f3Psbn/eoocU2fLvUQ5HX5Q=
X-Received: by 2002:a05:600c:1550:b0:490:e913:656a with SMTP id 5b1f17b1804b1-49240e6c72dmr173100305e9.27.1782048833106;
        Sun, 21 Jun 2026 06:33:53 -0700 (PDT)
Received: from fedora ([212.253.214.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49240f054e3sm216544855e9.2.2026.06.21.06.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 06:33:51 -0700 (PDT)
From: Serhat Kumral <serhatkumral1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Serhat Kumral <serhatkumral1@gmail.com>
Subject: [PATCH] staging: rtl8723bs: avoid duplicate size computation in rtw_spt_band_alloc
Date: Sun, 21 Jun 2026 16:33:01 +0300
Message-ID: <20260621133301.13855-1-serhatkumral1@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a local variable to store the channel array size and reuse it
for both the allocation and the bitrates pointer offset, replacing a
redundant open-coded multiplication with the same array_size() result.

Resolves the Coccinelle warning:
WARNING: array_size is already used (line 124) to compute the same size

Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 1484336d7..2e65788ee 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -111,7 +111,7 @@ static struct ieee80211_supported_band *rtw_spt_band_alloc(
 {
 	struct ieee80211_supported_band *spt_band = NULL;
 	int n_channels, n_bitrates;
-	size_t alloc_sz;
+	size_t alloc_sz, channels_sz;
 
 	if (band == NL80211_BAND_2GHZ) {
 		n_channels = RTW_2G_CHANNELS_NUM;
@@ -120,15 +120,16 @@ static struct ieee80211_supported_band *rtw_spt_band_alloc(
 		goto exit;
 	}
 
+	channels_sz = array_size(n_channels, sizeof(struct ieee80211_channel));
 	alloc_sz = sizeof(*spt_band);
-	alloc_sz = size_add(alloc_sz, array_size(n_channels, sizeof(struct ieee80211_channel)));
+	alloc_sz = size_add(alloc_sz, channels_sz);
 	alloc_sz = size_add(alloc_sz, array_size(n_bitrates, sizeof(struct ieee80211_rate)));
 	spt_band = kzalloc(alloc_sz, GFP_KERNEL);
 	if (!spt_band)
 		goto exit;
 
 	spt_band->channels = (struct ieee80211_channel *)(((u8 *)spt_band) + sizeof(struct ieee80211_supported_band));
-	spt_band->bitrates = (struct ieee80211_rate *)(((u8 *)spt_band->channels) + sizeof(struct ieee80211_channel) * n_channels);
+	spt_band->bitrates = (struct ieee80211_rate *)(((u8 *)spt_band->channels) + channels_sz);
 	spt_band->band = band;
 	spt_band->n_channels = n_channels;
 	spt_band->n_bitrates = n_bitrates;
-- 
2.54.0

