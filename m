Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D52936B11
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 05:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717998548; cv=none; b=HEU4f7gLj8y9jlxpZOLDKzchPY9WGp25kYZHfGfH2cWwXMprE4gY4YEpuYUpPYJJpwA4S294pdMIUI8Uee4W4r9KL6m3bPsEX+Zjz1CdPqAzl5oPW5wqPKoqrvhO7ID4eKyu2zovZ+bL0xQGs3qCsOOqFBi56zrsXvgbhpysgiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717998548; c=relaxed/simple;
	bh=LXSQLtGdpztQ5NZQkUH3nDahG9HFPpGPtqGERo1j2tc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=biWMEtFXBp4jZdkfIoPEBRY2O66P1dNtw42Sub9JcdSnKYvNz+f6ZnhvCaIm2yg4bZVm55s60KpMQGsPdjiCtJUznV8046CsWfHaqxM7OYIlG38Ip/+vfkQkLNwLcVR0+xTT3OnB/3doGILaZAogYDm80n85OdQ/1qcUqFOtdZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=avdmrdyw; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="avdmrdyw"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-6570bd6c3d7so2226663a12.0
        for <linux-staging@lists.linux.dev>; Sun, 09 Jun 2024 22:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1717998544; x=1718603344; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqxgjv78E9jKa0Z4QIgk8ZdfneN3AnYIge0hwsXYnyk=;
        b=avdmrdywQ6vucVOHZTHSEnr7cJCYomiY98AhrOPgAfwnoaMLhzw/NDM6ZyGNH2mb1c
         eN8/mzimiGp+l79RcDA8oh8OSt4TbwN/f+pE4U3FknBhoufmsOK2nUDe8R46r3WXexZ0
         3k38Z48rCsGrj4g9oRFklxGCTqh7Nyk3dpwxJykpTwDlZorBrQ4Aa0A9lqZn0nJfQgMb
         uZ189ViFqUbKLnZowfey80KT2jlbMthXgLgi/Zpb2yWJbpMkxJb+M9UxZBFItUI9bmPs
         tl5bCel2DVuemIKVOhzGSF00dM/8LFpmL8AhH3aouF478OwIRJ5KDLLez4LXscGg+C0r
         ry4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717998544; x=1718603344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqxgjv78E9jKa0Z4QIgk8ZdfneN3AnYIge0hwsXYnyk=;
        b=p87TrTnlZ49FRbA6bUeuoSmbjlphp/fkd/9cDaTCDkbwqmsnjOiWgIR6FynN7VrxiH
         SYYKCM2lzuan6rnJLMQZGps8HG+btS/D680cBBmR/sWwci4w2hC2ssNfkJSlYS+YMybZ
         Plhw/0urwP/SQIP62ahDlkoZ+PVsRo8LplGyJru4f2VHZ0V8j5z8ndd40vaXDQoOJ+9V
         Tx1yKGL1+wBOi5z2LaUi2ehsGMv38oG9gTZ1ROa+B4DG45GlLzeuh2WyiBeUjbPLNGt/
         GSgnhQw7GUXXHFpT0HsEfOOodfvDqTB4uhMpGv2hv+Gw/dQ6wJLie8l0NmFKn4Eae+XT
         t4Bg==
X-Gm-Message-State: AOJu0YwQ6nAydT0hu5Y6jsUffqwPlSYU/nNPPVrIlU5cPQ21v2xOho2+
	ysOVbccc1SyWqQJoOGRK4hSL4eTkN6j8B3xyVUSq0WnpMhiRt4jokpoxn+j6j5Q=
X-Google-Smtp-Source: AGHT+IElA0F+bHa14Wf0wCkBWA0BAvSmBkVIJNgh3l+MgkwnENYO4o14WCXklwcKklOrO3D1PH8cow==
X-Received: by 2002:a17:903:1cf:b0:1f6:6a94:76be with SMTP id d9443c01a7336-1f6d0377644mr107595415ad.46.1717998544631;
        Sun, 09 Jun 2024 22:49:04 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6f1aced64sm35653725ad.9.2024.06.09.22.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 22:49:04 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 09/24] Staging: rtl8192e: Rename variable bforced_tx20Mhz
Date: Sun,  9 Jun 2024 22:44:34 -0700
Message-Id: <20240610054449.71316-10-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240610054449.71316-1-tdavies@darkphysics.net>
References: <20240610054449.71316-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bforced_tx20Mhz to forced_tx_20mhz
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 8 ++++----
 drivers/staging/rtl8192e/rtllib.h          | 2 +-
 drivers/staging/rtl8192e/rtllib_tx.c       | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 5392d2daf870..7d5046b58cd1 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -377,7 +377,7 @@ static void _rtl92e_dm_init_bandwidth_autoswitch(struct net_device *dev)
 
 	priv->rtllib->bandwidth_auto_switch.threshold_20Mhzto40Mhz = BW_AUTO_SWITCH_LOW_HIGH;
 	priv->rtllib->bandwidth_auto_switch.threshold_40Mhzto20Mhz = BW_AUTO_SWITCH_HIGH_LOW;
-	priv->rtllib->bandwidth_auto_switch.bforced_tx20Mhz = false;
+	priv->rtllib->bandwidth_auto_switch.forced_tx_20mhz = false;
 	priv->rtllib->bandwidth_auto_switch.bautoswitch_enable = false;
 }
 
@@ -388,14 +388,14 @@ static void _rtl92e_dm_bandwidth_autoswitch(struct net_device *dev)
 	if (priv->current_chnl_bw == HT_CHANNEL_WIDTH_20 ||
 	    !priv->rtllib->bandwidth_auto_switch.bautoswitch_enable)
 		return;
-	if (!priv->rtllib->bandwidth_auto_switch.bforced_tx20Mhz) {
+	if (!priv->rtllib->bandwidth_auto_switch.forced_tx_20mhz) {
 		if (priv->undecorated_smoothed_pwdb <=
 		    priv->rtllib->bandwidth_auto_switch.threshold_40Mhzto20Mhz)
-			priv->rtllib->bandwidth_auto_switch.bforced_tx20Mhz = true;
+			priv->rtllib->bandwidth_auto_switch.forced_tx_20mhz = true;
 	} else {
 		if (priv->undecorated_smoothed_pwdb >=
 		    priv->rtllib->bandwidth_auto_switch.threshold_20Mhzto40Mhz)
-			priv->rtllib->bandwidth_auto_switch.bforced_tx20Mhz = false;
+			priv->rtllib->bandwidth_auto_switch.forced_tx_20mhz = false;
 	}
 }
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index bd18d866ce22..d0da16a86633 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1018,7 +1018,7 @@ struct tx_pending {
 struct bandwidth_autoswitch {
 	long threshold_20Mhzto40Mhz;
 	long	threshold_40Mhzto20Mhz;
-	bool bforced_tx20Mhz;
+	bool forced_tx_20mhz;
 	bool bautoswitch_enable;
 };
 
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index d376c35a5ad7..d9749d2c1668 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -362,7 +362,7 @@ static void rtllib_query_BandwidthMode(struct rtllib_device *ieee,
 	if ((tcb_desc->data_rate & 0x80) == 0)
 		return;
 	if (ht_info->cur_bw_40mhz && ht_info->cur_tx_bw40mhz &&
-	    !ieee->bandwidth_auto_switch.bforced_tx20Mhz)
+	    !ieee->bandwidth_auto_switch.forced_tx_20mhz)
 		tcb_desc->bPacketBW = true;
 }
 
-- 
2.30.2

