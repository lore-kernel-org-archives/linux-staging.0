Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D41F2FB0B3
	for <linux-staging@lists.linux.dev>; Sun,  4 Jan 2026 13:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767533332; cv=none; b=Ba2m16gUzHOPetjNuTZcLQJtqJRE6nVFMoWGTTzJkgLYD9cubTa+qRzp36tNylub/8p+Bdn1peRyTBULwSTLnZguYjMxbFoyJwVbEgmHfGg3tXN/GGZ0W5bIjC3B4/f9iC3/3DWOE+0aP4jnyiQ+/Lmt4CC3St1oZIixdPLVP7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767533332; c=relaxed/simple;
	bh=r72y57tOJYQfxN332OCY0HXrjg3U56+PMxHm7qhJkk4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GYLu0+sheYyhT4xKaH42GY89WMblL1FamzRc1EBf56XcxEhSJbFJgqONUCxhY68fY+TFyRv6wYWRSx1BcwELtrteUrgr0Bti06UN1cMcuKEgrrn8SFCL14/lWNvEolSIsaXYXLdPyDzBDwHe2e1akPH8AXvZ/Ge3IzZs7IUv9qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l1tKOteR; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1tKOteR"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43277900fb4so451990f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 04 Jan 2026 05:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767533329; x=1768138129; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L1AIJWb3/kCj7L5oXmqEXiTeY73sTXhIcnG/l34jjK4=;
        b=l1tKOteRihpllTCzLVezRcclPO2oPvNArojNF1azTnB3ZSsgVGvlds5zl/gutJYYiG
         aDlnMWhL78gjiUvne9WLtqqx6I+myq5l2JmlY/I0PTAeua1n25PnOMEfMSdRmWixnTh+
         t4ZPStpNhmbJJSS0x13GYDkALSnbTuI/e9oBEGZVrBb3u7cJVPRVhQ93sUMfoR5zLE+f
         iUXsYRNerQgmJirETf5o2XppofA5SfD15r0lFoaXfmiHxecnBCTm5qhsiWWkZyUOGUVN
         XgiJwo01+678sHhamdxg0qsu/MQUVD13Ezz9iPSMYBn0xKoKn7zhbX1BbytNWA5UYN6I
         mwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767533329; x=1768138129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1AIJWb3/kCj7L5oXmqEXiTeY73sTXhIcnG/l34jjK4=;
        b=McNQIfpzH8XZQALRPg2YDWpIpSS5hhV6tDq0DynPmXPqsqBCfO3tkxu6deEWJzgnH3
         tQASh/XlIc+EQChrttxzcmB0utmHbwPfgwuUaH4DDJpTxSNuX8rH6/jkzAxcgS9vbDGt
         xUVmGh+sMJGALhFsaR0YjB3NHFcGXBoaq3LHPmPGMsNc6yGOSYgmrmVlGyW+d18ApIbS
         fpW7M/KplbC/ZOZgEUdPXkRuX+Oi+k6OwCo/lMI9P8e/OdF0++ENP+gtZ3ELzVCjI7Gg
         hcnUbASFbQLoimZPIWxxj/ksV2zRIujawzG/PFbFTdD1ILf6GWah4ic8AXIfQneZmt2x
         cBDw==
X-Forwarded-Encrypted: i=1; AJvYcCUb/kvQ0yd1MuuqEfkvyAHyCa92y7UmA8mfbvUw0U97C5P3pr5RwrBPhPGzpMkqlb6tOZpIArkCVgBlUGEW@lists.linux.dev
X-Gm-Message-State: AOJu0Yyc03fjfV3cgm5/XbxmXz5qbho/p8FvdTkZ1ahOkYbvi5C+lNfr
	EAwGhnPxT+5DrueFHfqEkaJQIt2LzR2nsj2miHYPditZqD0mR1V7K5Ee
X-Gm-Gg: AY/fxX6zdTlRlyixTmSIQ2zSPiBqBgzZoFX5/DFaspCEbV0041nHxGFwHIFqU6Jonjk
	j6pyxoJMrzl0b0WblrULwrShcbIY4uvcLewEuTj0Llkgcn9ehCvsPx6A0dE1b0PSDDXiirg9R1R
	+fkf7hPyAzJk5s4Zoi20KG8iIk6EECBpq4h42KTxJ3NZXf3fMRFm8alPGRdaUkVzdus2oVhliqZ
	YJvBgidibQn7BFv0bE4AA5dx0okKmv9uhK1yPjXOKlA6FaunmlLcweRvpfuQOVqFAu+6lzyRZ/Z
	o2V8nhOwgD2hceecTJFXppkBYnkwxc29P3GFOAMo35IgUntP9xPzBWKAYvgrY+ynUj5GMpGMB3h
	HEDPw7TG7N5Z50SSpuw+gsDakNtA5gyXaXLss209E1qMLWgyWci1Dz9WOJI/h+Q563VOwBFVUkF
	r7Twr4B/5Ulx5AXGptT5N+pZiZQcS9QxnCqRz/RFyZ/rF9
X-Google-Smtp-Source: AGHT+IGffU+JSijY0LRNw9f2vpdBTi86ITqmDz41R3hlIyzt3/GBlJ2coTvZzB4BGBrp8UzDBrVE6Q==
X-Received: by 2002:a05:600c:1e1c:b0:471:5c0:94fc with SMTP id 5b1f17b1804b1-47d6ba81c6dmr65059865e9.6.1767533329365;
        Sun, 04 Jan 2026 05:28:49 -0800 (PST)
Received: from ubuntu.localdomain ([129.122.44.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6be6b202sm37356965e9.6.2026.01.04.05.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 05:28:49 -0800 (PST)
From: Gideon Adjei <gideonadjei.dev@gmail.com>
To: Vaibhav Hiremath <hvaibhav.linux@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gideon Adjei <gideonadjei.dev@gmail.com>
Subject: [PATCH] staging: greybus: replace WD_STATE_COLDBOOT_TRIG with state
Date: Sun,  4 Jan 2026 05:25:41 -0800
Message-Id: <20260104132541.17989-1-gideonadjei.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

use state temporary variable to replace WD_STATE_COLDBOOT_TRIG argument
in arche_platform_set_wake_detect_state. This keeps lines under 80
columns and satisfies kernel style guidelines.

Signed-off-by: Gideon Adjei <gideonadjei.dev@gmail.com>
---
 drivers/staging/greybus/arche-platform.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index 8aaff4e45660..bb9b3c3c7a2d 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -155,6 +155,7 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
 {
 	struct arche_platform_drvdata *arche_pdata = devid;
 	unsigned long flags;
+	int state;
 
 	spin_lock_irqsave(&arche_pdata->wake_lock, flags);
 
@@ -179,8 +180,8 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
 				 */
 				if (arche_pdata->wake_detect_state !=
 						WD_STATE_COLDBOOT_START) {
-					arche_platform_set_wake_detect_state(arche_pdata,
-									     WD_STATE_COLDBOOT_TRIG);
+					state = WD_STATE_COLDBOOT_TRIG;
+					arche_platform_set_wake_detect_state(arche_pdata, state);
 					spin_unlock_irqrestore(&arche_pdata->wake_lock,
 							       flags);
 					return IRQ_WAKE_THREAD;
-- 
2.34.1

