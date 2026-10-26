Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793031099;
	b=S9CVUNv6KsgE5E6daqNaiKr0mZQDV2nWA2NAn+9dku4xP9VfxIcmLglTdTiNYOXWSaj9
	 M7y/xyX/4Rexsrf9owDEgLN+G0XcbTzqSDtiez/qMhExBh62kIQPvu0yXluT/YhYuLdaW
	 uSAQot3Uq1ALGYeapMkN8zjs25PxCSo5fAApSBkxrpJulQWQcOWvSEGLareE8BNQIHhOy
	 qnbfNs3kPxzafiqg9CzQwlcTdIJCkZpnaeiSL5UI9zmq9FlGBtlAMpzBptV6gAKw4nmJz
	 Qswk1MSXJeJjTaWvU4dkyckLK9S2sS6t9Woe7AdjEESEqJJN2mArs4L+yw8mEA0xU4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793031099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LG6AcmX2/N2qOVHT7pnuXKdlfVeXe/kESoYcfDBWLAA=;
	b=VHCj4FE/AZNlg198vLNPDN62emodMajGWCzTSfRTZq8Yo9X2EgMtsJeZtZQjSc+hBpHr
	 yrNdVsYiJqF1wzVPoBcQa5e2AKe6U77vcSO55/fHZF4lfeU/uixtUkpgRsFVjofsgbSPF
	 3ZqsRU5R7nDzuRxW9e1pC+qoeZWQ1Su79mmzg2tcJHXkP6ZqcxLqyUvtSg4PO8nGIWpuL
	 MLxa66gnrMLqJTtobDCbxHcu2kge4sxm9fEGRDeGu7DItx1kc6rWFmdQsfrNf9e3C10l0
	 g2x1BqmsaQqFprU6HpQsbLXHrxJ7M7XLibw0yIc7W422TFoD/AxzhNopIJh985GEU0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WOAcgW+L;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D69B606A31E
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 16:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D69B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WOAcgW+L
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35c76e9614aso5114721eec.0
        for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 09:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793031098; x=1793635898; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LG6AcmX2/N2qOVHT7pnuXKdlfVeXe/kESoYcfDBWLAA=;
        b=WOAcgW+LLINauEQD9Qcok0u3kJwhyainrYQOiCMwdDrPeqdwrRmR12ZQFnM59QgVWI
         VEWyIjayUkS+Om5XAk7XP2zRGnDwEzEpQm9zQKmbxgohlf86Hq74EHH0QV4Tr67N8uf9
         KZ4YHWsTQz2ORVKaXyStl0ljPm5ycIXBIRLo7XSlsuCToJQC5Jfuh5Z68vvzSZT5qgj3
         4Kxr0qnnwUK9xwoYabxDWOeDGF1Ci78jUglRbrSu0zqhzJaDnlpCSFJEPpRJtlaac0tx
         LFHwMvWhswHNOlvk+/BRy4bnJFhg+5TX6kcQpUZE6ndO05yZQ/D2GJJ+edGEhEqT16/u
         lAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793031098; x=1793635898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LG6AcmX2/N2qOVHT7pnuXKdlfVeXe/kESoYcfDBWLAA=;
        b=1TJETlvVT4LChO4vNIS1PW4l65OQsJr3TCJXryMEqR1GxdqLTvYIjxjJFnAyknebs7
         itnIfYGzE9Gd6gsOM5YTwoyxX7vyAE0FVf9UU7JB1NjFGxH3+N+Akeh3+TTnBNh28UmG
         8HQgrCpQdj8w1kG/aoL/vOIu3bYlr6Yy4/0opl8EfYV0G58MZssZyzyA1tKLGnyc20PG
         v9pPhb8iyc9pKmDQ5Pl1OgRLBU9Afp0iw+LHb9zgq8/fYvOO2d/WwRwVoMVM8HyBRAvg
         4jImDDaDbVrMVJi5bUPA4psGiKHJh3zoaHHYfud2mHJmNpHUnGklupRVFpxhYOzegVD3
         E4Rw==
X-Forwarded-Encrypted: i=1; AKwUvBx5UF6V4MK5onyT26OaMtdQIYysYz3xle764oCcrpvUBVvS8EBUVEcoLJ5R4il1FJxhQS3VqWS7YzM/EnIy@lists.linux.dev
X-Gm-Message-State: AFq9FYIYkrgFVylaxExL5fczZjHM4knYs9j8qr+r5aHVENlEesEUo0B3
	ASTFW/IMH7H/MhoQ86OfQt1AeLkM5qcm/SxkI9Z6RtAVU/jHuDoIC9RL
X-Gm-Gg: AYBFou3CONgXMVc6X0Omvgsy69LzUh2U2dC+8Jbq8YmHqI6dUnw7iD/1x1Z0quGoYTm
	OYQy5ypwh1RkoMQnrroCukFhQHfwR6rLslFAKddpiwagsqWgrJaQWPJcjSSVJ72Ere9VBK8sFw1
	v1plak+n0Emhox3F29aNeFZuMR2R/eMFF6spfdllLCGke9AkqgZdnUhTIzkjNe4LkuNfgnYKxjY
	kpmam6eviXSXZofsCtkz/mdVU9WhmFX91pmqyt/xApgodckcU9qzRRjWg48OA+UAgMFpmiUnyhr
	a4ObJGTz/C3d9JXWnhLGVG1ZGbGq7aosI+AxDC1V0ixhKWuayE6tDL/cG0VqOCpPiw6KAZ0zGch
	jD4K0cZnJWJLsGZqeAQKcsqcUFpUeBvpycnjxa/moZ+cgCeJtAR8/Z6VTuqMoZtSWEK2MS9j76Z
	vNlqNW4aArolH0eO0kApwJ3nzsLgNY02z5bRJ6SVC6f0mLeUuZDF6TBP1kvQnKdT1EJWU2BhRSj
	Z32RdnHdkln3ErbDXW+Lx0yypSeOa5GqozbfOmz9U9ZcB0b5mvCgoN+0KA0p3ZtMButwYcQT8KK
	GSXnFGY343OsO25MijlotGUA1IP7xYSVk/C+xCFmpGUG+NZlxA==
X-Received: by 2002:a05:7301:fa6:b0:369:f64e:7feb with SMTP id 5a478bee46e88-369f64e83damr7407400eec.2.1793031098200;
        Mon, 26 Oct 2026 09:11:38 -0700 (PDT)
Received: from localhost ([103.204.210.88])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369ff5a4d68sm11702809eec.14.2026.10.26.09.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:11:37 -0700 (PDT)
From: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
Subject: [PATCH] drivers/staging/media/atomisp: Initialize curr_rules in atomisp_freq_scaling
Date: Mon, 26 Oct 2026 16:10:58 +0000
Message-ID: <20261026161058.25031-1-sifat.yt.2.0c@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The local structure 'curr_rules' is declared on the stack but is
not initialized. Initialize it to zero using empty brackets '{}'
to prevent potential information leakage of stack garbage values.

Signed-off-by: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index e66a7d1c7a0e..d4de2bd9a0a5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -170,7 +170,6 @@ static int write_target_freq_to_hw(struct atomisp_device *isp,
 		dev_err(isp->dev, "DFS target freq is rejected by HW.\n");
 		return -EINVAL;
 	}
-
 	return 0;
 }
 
@@ -180,7 +179,8 @@ int atomisp_freq_scaling(struct atomisp_device *isp,
 {
 	const struct atomisp_dfs_config *dfs;
 	unsigned int new_freq;
-	struct atomisp_freq_scaling_rule curr_rules;
+	struct atomisp_freq_scaling_rule curr_rules = {};
+
 	int i, ret;
 	unsigned short fps = 0;
 
-- 
2.53.0

