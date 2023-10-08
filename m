Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7082915B1
	for <linux-staging@lists.linux.dev>; Sun,  8 Oct 2023 02:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HEs5x8aA"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-352308c0799so13827525ab.2
        for <linux-staging@lists.linux.dev>; Sat, 07 Oct 2023 19:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696731077; x=1697335877; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXHgrXhZFzgapXNvMU3dUuHbHovI6TQ/QGyf0MdOP1Q=;
        b=HEs5x8aAuJjewE7PvRarNI/i9HILze86ssIkI/S6luZg/2lEPCAZrPo+Ij9BJl7Asq
         vSxiRy9h1xbZ6f74dbA8LbZRcrDV+tTF0awIjuWKlLPcwAKJ86hVeOEBB+crmh3tnh4+
         mxQW5JOcS2bzXnuy7zO6MXHonbcMJi7xOhNHX+I0f5NKgFDw3dtMKqjEiD6rbVUFEaA0
         uo1uR/cFptCK8NzNmTbpiO/ohFPH2d+NJpgkqMvVUC9jtn17BRosNrLYQmKB3WHhKSZK
         9xocaJcp3L7OohFmeKR2Wu+Ewbvl2QoBcHL91oxGo2sIKv5xrGLcQyhbNYzXN8Rerf6i
         CH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696731077; x=1697335877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rXHgrXhZFzgapXNvMU3dUuHbHovI6TQ/QGyf0MdOP1Q=;
        b=Ts/1+LeM5xZaWgbt5oSe31jyqggR4x6MGM4bK6EIzHxM7g1CweaJFXXIm1xaeMULoH
         WBGMGN5DMaCFuW+vmvMz/CLttZO4aWKPycKeHuLruUUc/8kE9qTxpMCr00Us5dyL4JWo
         zK2GW+zjzD8SYhe5CpD1kT+3QuThJtxNsjDdU+wtW1isUgb8nv7v/5WYzrs1yRNeUryr
         11lJAPHNNVUpZkZfpJW4cEHs+oxGvnkl/RwWXe7XXxjWFI363Ta86TDtSXYFEzNnzVSO
         /uh1Pn7GfGzKpnVfr963hLWUYUy3VMYdXq6KbF9wN3mMxvOk4fk70Yjff2cksNZW+dGd
         R/mQ==
X-Gm-Message-State: AOJu0YyQeeeq6mo9jvGdSWoK5rAjyeU48puA8WwIjhIqkcqIZ6AKsJ23
	ZNc1IHoAN5Ena1af7rVcbjI=
X-Google-Smtp-Source: AGHT+IGn9RTWMsfxsnp6EnAnErexE1tZ7hMbJXXNYaPVtDuC/hUmU6I3AcRxCVlpkrnquAcMNpyGBw==
X-Received: by 2002:a05:6e02:1786:b0:351:22a2:bbe7 with SMTP id y6-20020a056e02178600b0035122a2bbe7mr17345623ilu.0.1696731077580;
        Sat, 07 Oct 2023 19:11:17 -0700 (PDT)
Received: from ubuntu.. ([223.178.246.252])
        by smtp.gmail.com with ESMTPSA id x8-20020aa784c8000000b00690fdeb5c0dsm3746125pfn.2.2023.10.07.19.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 19:11:17 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Pavan Bobba <pavanbobba206@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH
Date: Sun,  8 Oct 2023 07:40:54 +0530
Message-Id: <d40eb60e6cccf2b5432904abb74bc009fac5e2e1.1696729776.git.opensource206@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696729776.git.opensource206@gmail.com>
References: <cover.1696729776.git.opensource206@gmail.com>
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

