Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396987460
	for <linux-staging@lists.linux.dev>; Sat,  5 Mar 2022 21:32:24 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id u10so15988334wra.9
        for <linux-staging@lists.linux.dev>; Sat, 05 Mar 2022 13:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9IH5+QpuYr8xx7VseEHwb3B5cUXtUdnzvWAtsWC3Lqo=;
        b=jjohIZhvIlSjJYT5OU4GmDH7lyi5I14Gd5Leo4WCzgkFaN0zY3hfFz1iGgWe0x3rNp
         N7cu2YM2M4kmsLsQ76HEflqobBdlIucQ9Bi4Rt1ro46WtEeRg8+IgqKOpnZ5N8vz0BTg
         6UNWOQyJ3Sw2IkdhYB+o7HMqEYRVx4/BfexsE3fH86a6E3m7iacquC3FEW2EGe4zo2Gc
         VmE1aR17MIp4vunFL9JG7x3YMTs+sfN2SI956OsFcO/yHAjB0Qmyma4lFsnZhw2IfDOU
         oiWLfz8ROFsWBV22K1RGvFEC04OG7D3/K7Ghqvfg3U3i/O72n8Po/7C5VAB2jOhlWm4W
         QRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9IH5+QpuYr8xx7VseEHwb3B5cUXtUdnzvWAtsWC3Lqo=;
        b=XPP9rrhDaQNvPXqjN6h63sk91yF/0bJe9Y+VVLFokdZP9F0bqDQI6TA82K5Fx6hYIb
         ZXXGjQ255g0qhqFAUtNi08vO7UGg3exc/zi5GVU5Q1aprfk7KwkQWtQ3SM97Y69hoMyd
         gRGzbwOVgPoPmDOetFIJl+BbjgEwFgW/sVRP4LnMOCZ/VgRBhNgKTbsEgzaV9cTIgFtj
         F70ds4YrlEt6OkhC3YXiO0NM28SHWol+J84brhqKBM7E0AO1DEKu8tMm8Adl5TSTBQvB
         WTMcGXCRv10ANOuo5Q4r62YuRQ7iLil0RNWDS1MtDxPOxoLffAZCvYf+mz0WXRjjqyPe
         aAtw==
X-Gm-Message-State: AOAM533U4WRo1rafov4CKlXLP5gusyeJ3X8LkLSma6dt1agI7TdLUl8Q
	v1YGZZePcYIQ4hOliXRQu9g=
X-Google-Smtp-Source: ABdhPJzV5HWPYwTYCrqKU/3cUb4+hY5cPjIC2BdFXXdl50Tp9vTG7vFSAKADoYcLSC7M8LEa3kMvjQ==
X-Received: by 2002:a5d:4609:0:b0:1f1:de8a:af07 with SMTP id t9-20020a5d4609000000b001f1de8aaf07mr3180549wrq.549.1646515942625;
        Sat, 05 Mar 2022 13:32:22 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935aa6.dip0.t-ipconnect.de. [87.147.90.166])
        by smtp.gmail.com with ESMTPSA id c12-20020a05600c0a4c00b00381141f4967sm11472031wmq.35.2022.03.05.13.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Mar 2022 13:32:22 -0800 (PST)
Date: Sat, 5 Mar 2022 22:32:20 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] staging: vt6655: Remove unused byRFType in card.c
Message-ID: <5554b243ae285e3274d9968575aadd1a79806b01.1646512837.git.philipp.g.hortmann@gmail.com>
References: <cover.1646512837.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1646512837.git.philipp.g.hortmann@gmail.com>

Remove byRFType that support 5GHz band.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/card.c | 56 +----------------------------------
 1 file changed, 1 insertion(+), 55 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index ee2d145778ed..1110366fc415 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -183,32 +183,11 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 	unsigned char bySlot = 0;
 	unsigned char bySIFS = 0;
 	unsigned char byDIFS = 0;
-	unsigned char data;
 	int i;
 
 	/* Set SIFS, DIFS, EIFS, SlotTime, CwMin */
 	if (bb_type == BB_TYPE_11A) {
-		if (priv->byRFType == RF_AIROHA7230) {
-			/* AL7230 use single PAPE and connect to PAPE_2.4G */
-			MACvSetBBType(priv->port_offset, BB_TYPE_11G);
-			priv->abyBBVGA[0] = 0x20;
-			priv->abyBBVGA[2] = 0x10;
-			priv->abyBBVGA[3] = 0x10;
-			bb_read_embedded(priv, 0xE7, &data);
-			if (data == 0x1C)
-				bb_write_embedded(priv, 0xE7, priv->abyBBVGA[0]);
-
-		} else if (priv->byRFType == RF_UW2452) {
-			MACvSetBBType(priv->port_offset, BB_TYPE_11A);
-			priv->abyBBVGA[0] = 0x18;
-			bb_read_embedded(priv, 0xE7, &data);
-			if (data == 0x14) {
-				bb_write_embedded(priv, 0xE7, priv->abyBBVGA[0]);
-				bb_write_embedded(priv, 0xE1, 0x57);
-			}
-		} else {
-			MACvSetBBType(priv->port_offset, BB_TYPE_11A);
-		}
+		MACvSetBBType(priv->port_offset, BB_TYPE_11A);
 		bb_write_embedded(priv, 0x88, 0x03);
 		bySlot = C_SLOT_SHORT;
 		bySIFS = C_SIFS_A;
@@ -216,22 +195,6 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 		byCWMaxMin = 0xA4;
 	} else if (bb_type == BB_TYPE_11B) {
 		MACvSetBBType(priv->port_offset, BB_TYPE_11B);
-		if (priv->byRFType == RF_AIROHA7230) {
-			priv->abyBBVGA[0] = 0x1C;
-			priv->abyBBVGA[2] = 0x00;
-			priv->abyBBVGA[3] = 0x00;
-			bb_read_embedded(priv, 0xE7, &data);
-			if (data == 0x20)
-				bb_write_embedded(priv, 0xE7, priv->abyBBVGA[0]);
-
-		} else if (priv->byRFType == RF_UW2452) {
-			priv->abyBBVGA[0] = 0x14;
-			bb_read_embedded(priv, 0xE7, &data);
-			if (data == 0x18) {
-				bb_write_embedded(priv, 0xE7, priv->abyBBVGA[0]);
-				bb_write_embedded(priv, 0xE1, 0xD3);
-			}
-		}
 		bb_write_embedded(priv, 0x88, 0x02);
 		bySlot = C_SLOT_LONG;
 		bySIFS = C_SIFS_BG;
@@ -239,22 +202,6 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 		byCWMaxMin = 0xA5;
 	} else { /* PK_TYPE_11GA & PK_TYPE_11GB */
 		MACvSetBBType(priv->port_offset, BB_TYPE_11G);
-		if (priv->byRFType == RF_AIROHA7230) {
-			priv->abyBBVGA[0] = 0x1C;
-			priv->abyBBVGA[2] = 0x00;
-			priv->abyBBVGA[3] = 0x00;
-			bb_read_embedded(priv, 0xE7, &data);
-			if (data == 0x20)
-				bb_write_embedded(priv, 0xE7, priv->abyBBVGA[0]);
-
-		} else if (priv->byRFType == RF_UW2452) {
-			priv->abyBBVGA[0] = 0x14;
-			bb_read_embedded(priv, 0xE7, &data);
-			if (data == 0x18) {
-				bb_write_embedded(priv, 0xE7, priv->abyBBVGA[0]);
-				bb_write_embedded(priv, 0xE1, 0xD3);
-			}
-		}
 		bb_write_embedded(priv, 0x88, 0x08);
 		bySIFS = C_SIFS_BG;
 
@@ -417,7 +364,6 @@ void CARDbRadioPowerOff(struct vnt_private *priv)
 
 	case RF_AIROHA:
 	case RF_AL2230S:
-	case RF_AIROHA7230:
 		MACvWordRegBitsOff(priv->port_offset, MAC_REG_SOFTPWRCTL,
 				   SOFTPWRCTL_SWPE2);
 		MACvWordRegBitsOff(priv->port_offset, MAC_REG_SOFTPWRCTL,
-- 
2.25.1

