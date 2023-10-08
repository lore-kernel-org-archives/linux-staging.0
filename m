Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4677011715
	for <linux-staging@lists.linux.dev>; Sun,  8 Oct 2023 19:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEa3ddq4"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3ae2ec1a222so2719339b6e.2
        for <linux-staging@lists.linux.dev>; Sun, 08 Oct 2023 12:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696791730; x=1697396530; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SDMbv3k5QVUvMxg0CJCYgtxG7nCL9hfaOwK90RooPk=;
        b=EEa3ddq4Hxlg9mdiYzqP0kUsl9e4283zRqw1S4X6/OpSU/gdRJNMF52UvRGndfVeZB
         +P2PQksr/hOac1ke90iRDBViJFE9HHybJviQUGub7Ea/AoXrvgqZqxEADG5gZgT2A+5k
         UZd86VxDjekKKA1GMP8wwt7PSwHiHVcM8C0oxWFv7mk5l7kZp+9bwrf3nTskbslDHT9D
         hgW+dU+5Rt5SNFS6TDgvlNuRD/mNhBvrInMNUndvHtT/Pv2t8r3IXt+88D+Ga99QN57i
         W70/iBD+ZQRIZQCpqOtsZoTdXjxduMTUqYN2UvH6fToWYD/l6gCpQB0/vruwETSHLt3L
         +TpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696791730; x=1697396530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1SDMbv3k5QVUvMxg0CJCYgtxG7nCL9hfaOwK90RooPk=;
        b=VC8E6r2/NQ1monahrHaBkuh7/5SE+GIsAp4ypqMhoAxWMQFDyHl33FAuaC15ls52v7
         YrPoH8qOZblplCS4FF6OLTt7WUqAYrJhCx4AuqU6Gq8ZsmFYEqj3dRX6xEE/hO5S1B8u
         AcVugYoXixmyHPNmaNIOvyiozHVGIl1oJT6OGSIuzzkIgUxuBgQAe0THBO1zLJtU2rdw
         qgNfI/xeR1LizhaXpI4hq0Ed7kea02N1SWoPWuuKbWapiy/XK801Wl8hDxxPYQZG8wr3
         XLWyb8u6Znzd1IKVzB7ty8hsgITE1yY6D3vb9dGd75feitOCinUGJS1unbsyZjv71DgG
         fq1A==
X-Gm-Message-State: AOJu0YzYaftgK1oApmkt+tnqtfxzP/CACyF0euTudEBT0jtGC1O5q9m6
	PnTd3HAVaXjW/aN11j1AyaU=
X-Google-Smtp-Source: AGHT+IESYqvj1uKMsOFlZ7x4hvx/Lwfocvzc5y54TVPlmcmVMjH+YkzudjLXS8/QkCt0BBzzgHy3tQ==
X-Received: by 2002:a05:6808:1484:b0:3af:6c30:f206 with SMTP id e4-20020a056808148400b003af6c30f206mr19079473oiw.10.1696791730217;
        Sun, 08 Oct 2023 12:02:10 -0700 (PDT)
Received: from ubuntu.. ([223.178.246.252])
        by smtp.gmail.com with ESMTPSA id g12-20020a63be4c000000b00577e62e13c5sm6018165pgo.32.2023.10.08.12.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 12:02:09 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH v5 2/3] staging: vt6655: Type encoding info dropped from variable name "byBBVGACurrent"
Date: Mon,  9 Oct 2023 00:31:49 +0530
Message-Id: <f0dfd4d2460f858540d465dd8bcfc920c219e94d.1696791459.git.opensource206@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696791459.git.opensource206@gmail.com>
References: <cover.1696791459.git.opensource206@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

variable name "byBBVGACurrent" updated like below:

a.type encoding info dropped from name
b.camelcase name replaced by snakecase

Issue found by checkpatch

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
v1 -> v2 : 1.cover letter added
           2.patches sent as attachments in a single mail for review

v2 -> v3 : patches sending in a single mail intead of attachments

v3 -> v4 : version info updated in patchset subject

v4 -> v5 : sending all patches in a series

 drivers/staging/vt6655/baseband.c    |  2 +-
 drivers/staging/vt6655/channel.c     |  6 +++---
 drivers/staging/vt6655/device.h      |  2 +-
 drivers/staging/vt6655/device_main.c | 10 +++++-----
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
index a19a75f5d761..7d47b266b87e 100644
--- a/drivers/staging/vt6655/baseband.c
+++ b/drivers/staging/vt6655/baseband.c
@@ -2146,7 +2146,7 @@ void bb_set_vga_gain_offset(struct vnt_private *priv, unsigned char by_data)
 		by_bb_rx_conf &= 0xDF; /* 1101 1111 */
 	else
 		by_bb_rx_conf |= 0x20; /* 0010 0000 */
-	priv->byBBVGACurrent = by_data;
+	priv->bbvga_current = by_data;
 	bb_write_embedded(priv, 0x0A, by_bb_rx_conf); /* CR10 */
 }
 
diff --git a/drivers/staging/vt6655/channel.c b/drivers/staging/vt6655/channel.c
index e20701815db9..6ac7d470c041 100644
--- a/drivers/staging/vt6655/channel.c
+++ b/drivers/staging/vt6655/channel.c
@@ -87,10 +87,10 @@ bool set_channel(struct vnt_private *priv, struct ieee80211_channel *ch)
 
 	/* Set VGA to max sensitivity */
 	if (priv->bUpdateBBVGA &&
-	    priv->byBBVGACurrent != priv->bbvga[0]) {
-		priv->byBBVGACurrent = priv->bbvga[0];
+	    priv->bbvga_current != priv->bbvga[0]) {
+		priv->bbvga_current = priv->bbvga[0];
 
-		bb_set_vga_gain_offset(priv, priv->byBBVGACurrent);
+		bb_set_vga_gain_offset(priv, priv->bbvga_current);
 	}
 
 	/* clear NAV */
diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index b662c74a2dc7..9ae7171d02ee 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -249,7 +249,7 @@ struct vnt_private {
 	bool bUpdateBBVGA;
 	unsigned int	uBBVGADiffCount;
 	unsigned char byBBVGANew;
-	unsigned char byBBVGACurrent;
+	unsigned char bbvga_current;
 	unsigned char bbvga[BB_VGA_LEVEL];
 	long                    dbm_threshold[BB_VGA_LEVEL];
 
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 385848df8848..6990129ceb10 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -424,8 +424,8 @@ static void device_init_registers(struct vnt_private *priv)
 	bb_vt3253_init(priv);
 
 	if (priv->bUpdateBBVGA) {
-		priv->byBBVGACurrent = priv->bbvga[0];
-		priv->byBBVGANew = priv->byBBVGACurrent;
+		priv->bbvga_current = priv->bbvga[0];
+		priv->byBBVGANew = priv->bbvga_current;
 		bb_set_vga_gain_offset(priv, priv->bbvga[0]);
 	}
 
@@ -1058,7 +1058,7 @@ static void vnt_check_bb_vga(struct vnt_private *priv)
 		}
 	}
 
-	if (priv->byBBVGANew == priv->byBBVGACurrent) {
+	if (priv->byBBVGANew == priv->bbvga_current) {
 		priv->uBBVGADiffCount = 1;
 		return;
 	}
@@ -1072,7 +1072,7 @@ static void vnt_check_bb_vga(struct vnt_private *priv)
 		dev_dbg(&priv->pcid->dev,
 			"First RSSI[%d] NewGain[%d] OldGain[%d] Count[%d]\n",
 			(int)dbm, priv->byBBVGANew,
-			priv->byBBVGACurrent,
+			priv->bbvga_current,
 			(int)priv->uBBVGADiffCount);
 	}
 
@@ -1080,7 +1080,7 @@ static void vnt_check_bb_vga(struct vnt_private *priv)
 		dev_dbg(&priv->pcid->dev,
 			"RSSI[%d] NewGain[%d] OldGain[%d] Count[%d]\n",
 			(int)dbm, priv->byBBVGANew,
-			priv->byBBVGACurrent,
+			priv->bbvga_current,
 			(int)priv->uBBVGADiffCount);
 
 		bb_set_vga_gain_offset(priv, priv->byBBVGANew);
-- 
2.34.1

