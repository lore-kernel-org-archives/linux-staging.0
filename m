Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDBC7B
	for <linux-staging@lists.linux.dev>; Sun,  5 Feb 2023 00:20:50 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id q19so8473146edd.2
        for <linux-staging@lists.linux.dev>; Sat, 04 Feb 2023 16:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GY8/P9l9Caihn9Hiicbt/6BSgViin12Oe6TkL4wIics=;
        b=nN03Gx1hmTuF+CVXCwgxctcIJEzsu1uG2pU3DfJ0xCGe1io6jS9vSITZFeacxjzK5Z
         LFCGQbLHT3rOrz3P/iZrshMj/cbwyLl86dQF3waXOkWGkxj/HFkXqUkA6rzdVIFy6h5Z
         SIi2jQ65fp5LwkvC9LmjIW6hGC/vQr3y1idbq03CO+jF6qO42Ji4G+DUC9atmyrHF/W5
         pebrby37vWj9xfGdNWkBcDX+xNtLBOUjwFDLnQporWAZp+IHhrycmBb9DFcsLk6sBNUh
         y4+kj+UnL9mFKHm7HqXULvjqEYzJKoRaFhMz97SZ1132/QrF071/4NYl+Kligsrfk78f
         VyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GY8/P9l9Caihn9Hiicbt/6BSgViin12Oe6TkL4wIics=;
        b=V+U9GFZpjSzxZjjzCeHodgxgeE5lALdzw9ggwd0jRXo3IMlrAyYvH8LLyu84Bo+aLC
         8uTfWoKh6/w7L25869DDUO6MBAamg8UOcblhXg2Z81XqCvm4SuK3pSXpl8U2YOmrXwX0
         2WahG0Vywva/AP4CWVLad/6jvsa4RNTcBLxlk034jF+bBN1BbHhlZS+zvGf3lPBEPqel
         pchwKvJXP+VCuw+LpSJiajlyuDPviPBk6yHdm5qVNCSdXms817IHhzzDN1FCL2eflu8k
         U6YlQYegPV4q1KUcV+ivQl5BowH9LTzl+y4f2shdfB7gYUXVqWNKK7E74TKH04uJun+r
         Ar8g==
X-Gm-Message-State: AO0yUKWQ8h12k05KgG8p+Yw9UnCPYyceLo/YefqEI9ijMdXxpTcBuR5c
	o85WFzxfu4iMzO3fzkR45c4=
X-Google-Smtp-Source: AK7set/NmG93J27JyZowzhc/A9jv2XZnyWUKeCDviTrY1RsaVhx8czCrMF7tSGnQXEom1CIeptJ6Jg==
X-Received: by 2002:aa7:d953:0:b0:499:9d31:8490 with SMTP id l19-20020aa7d953000000b004999d318490mr17559418eds.24.1675556448331;
        Sat, 04 Feb 2023 16:20:48 -0800 (PST)
Received: from combine-ThinkPad-S1-Yoga (c-8ff371d5.879159-0-69706f6e6c79.bbcust.telenor.se. [213.113.243.143])
        by smtp.gmail.com with ESMTPSA id u2-20020aa7d982000000b004a18f2ffb86sm3137656eds.79.2023.02.04.16.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 16:20:47 -0800 (PST)
Date: Sun, 5 Feb 2023 01:20:46 +0100
From: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: vt6655: Macro with braces issue change to inline
 function
Message-ID: <Y972XuIWckKE3ZcX@combine-ThinkPad-S1-Yoga>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch is to fix checkpatch warning: "Macro argument 'iobase' may be better
as '(iobase)' to avoid precedence issues changed to inline function.

Signed-off-by: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
---
Changes in v2:
        - Macros with one statement that calls 'iowrite8' function changed
        to inline function as reviewed by gregkh@linuxfoundation.org.
	In relation to this, names of the callers of macro are modified
	to call this function.
---
 drivers/staging/vt6655/card.c        |  5 +++--
 drivers/staging/vt6655/channel.c     |  4 ++--
 drivers/staging/vt6655/device_main.c | 12 ++++++------
 drivers/staging/vt6655/mac.c         |  8 ++++----
 drivers/staging/vt6655/mac.h         | 12 +++++++++---
 5 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index c680925b9c92..a6ff496b01b6 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -545,7 +545,7 @@ void CARDvSetRSPINF(struct vnt_private *priv, u8 bb_type)
 	spin_lock_irqsave(&priv->lock, flags);
 
 	/* Set to Page1 */
-	VT6655_MAC_SELECT_PAGE1(priv->port_offset);
+	vt6655_mac_select_page1(priv->port_offset);
 
 	/* RSPINF_b_1 */
 	vnt_get_phy_field(priv, 14,
@@ -643,7 +643,8 @@ void CARDvSetRSPINF(struct vnt_private *priv, u8 bb_type)
 				   &byRsvTime);
 	iowrite16(MAKEWORD(byTxRate, byRsvTime), priv->port_offset + MAC_REG_RSPINF_A_72);
 	/* Set to Page0 */
-	VT6655_MAC_SELECT_PAGE0(priv->port_offset);
+        vt6655_mac_select_page0(priv->port_offset);
+
 
 	spin_unlock_irqrestore(&priv->lock, flags);
 }
diff --git a/drivers/staging/vt6655/channel.c b/drivers/staging/vt6655/channel.c
index 4122875ebcaa..e9a44bcebe32 100644
--- a/drivers/staging/vt6655/channel.c
+++ b/drivers/staging/vt6655/channel.c
@@ -116,12 +116,12 @@ bool set_channel(struct vnt_private *priv, struct ieee80211_channel *ch)
 		spin_lock_irqsave(&priv->lock, flags);
 
 		/* set HW default power register */
-		VT6655_MAC_SELECT_PAGE1(priv->port_offset);
+		vt6655_mac_select_page1(priv->port_offset);
 		RFbSetPower(priv, RATE_1M, priv->byCurrentCh);
 		iowrite8(priv->byCurPwr, priv->port_offset + MAC_REG_PWRCCK);
 		RFbSetPower(priv, RATE_6M, priv->byCurrentCh);
 		iowrite8(priv->byCurPwr, priv->port_offset + MAC_REG_PWROFDM);
-		VT6655_MAC_SELECT_PAGE0(priv->port_offset);
+	        vt6655_mac_select_page0(priv->port_offset);
 
 		spin_unlock_irqrestore(&priv->lock, flags);
 	}
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 45e5eccadb44..beb31a55abe1 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -400,11 +400,11 @@ static void device_init_registers(struct vnt_private *priv)
 	}
 
 	if (priv->local_id > REV_ID_VT3253_B1) {
-		VT6655_MAC_SELECT_PAGE1(priv->port_offset);
+		vt6655_mac_select_page1(priv->port_offset);
 
 		iowrite8(MSRCTL1_TXPWR | MSRCTL1_CSAPAREN, priv->port_offset + MAC_REG_MSRCTL + 1);
 
-		VT6655_MAC_SELECT_PAGE0(priv->port_offset);
+		vt6655_mac_select_page0(priv->port_offset);
 	}
 
 	/* use relative tx timeout and 802.11i D4 */
@@ -1586,21 +1586,21 @@ static void vnt_configure(struct ieee80211_hw *hw,
 			spin_lock_irqsave(&priv->lock, flags);
 
 			if (priv->mc_list_count > 2) {
-				VT6655_MAC_SELECT_PAGE1(priv->port_offset);
+				vt6655_mac_select_page1(priv->port_offset);
 
 				iowrite32(0xffffffff, priv->port_offset + MAC_REG_MAR0);
 				iowrite32(0xffffffff, priv->port_offset + MAC_REG_MAR0 + 4);
 
-				VT6655_MAC_SELECT_PAGE0(priv->port_offset);
+				vt6655_mac_select_page0(priv->port_offset);
 			} else {
-				VT6655_MAC_SELECT_PAGE1(priv->port_offset);
+				vt6655_mac_select_page1(priv->port_offset);
 
 				multicast =  le64_to_cpu(multicast);
 				iowrite32((u32)multicast, priv->port_offset +  MAC_REG_MAR0);
 				iowrite32((u32)(multicast >> 32),
 					  priv->port_offset + MAC_REG_MAR0 + 4);
 
-				VT6655_MAC_SELECT_PAGE0(priv->port_offset);
+				vt6655_mac_select_page0(priv->port_offset);
 			}
 
 			spin_unlock_irqrestore(&priv->lock, flags);
diff --git a/drivers/staging/vt6655/mac.c b/drivers/staging/vt6655/mac.c
index b4ebc7d31961..357df6031adb 100644
--- a/drivers/staging/vt6655/mac.c
+++ b/drivers/staging/vt6655/mac.c
@@ -188,13 +188,13 @@ static void vt6655_mac_save_context(struct vnt_private *priv, u8 *cxt_buf)
 	/* read page0 register */
 	memcpy_fromio(cxt_buf, io_base, MAC_MAX_CONTEXT_SIZE_PAGE0);
 
-	VT6655_MAC_SELECT_PAGE1(io_base);
+	vt6655_mac_select_page1(io_base);
 
 	/* read page1 register */
 	memcpy_fromio(cxt_buf + MAC_MAX_CONTEXT_SIZE_PAGE0, io_base,
 		      MAC_MAX_CONTEXT_SIZE_PAGE1);
 
-	VT6655_MAC_SELECT_PAGE0(io_base);
+	vt6655_mac_select_page0(io_base);
 }
 
 /*
@@ -215,12 +215,12 @@ static void vt6655_mac_restore_context(struct vnt_private *priv, u8 *cxt_buf)
 {
 	void __iomem *io_base = priv->port_offset;
 
-	VT6655_MAC_SELECT_PAGE1(io_base);
+	vt6655_mac_select_page1(io_base);
 	/* restore page1 */
 	memcpy_toio(io_base, cxt_buf + MAC_MAX_CONTEXT_SIZE_PAGE0,
 		    MAC_MAX_CONTEXT_SIZE_PAGE1);
 
-	VT6655_MAC_SELECT_PAGE0(io_base);
+	vt6655_mac_select_page0(io_base);
 
 	/* restore RCR,TCR,IMR... */
 	memcpy_toio(io_base + MAC_REG_RCR, cxt_buf + MAC_REG_RCR,
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index a33af2852227..b9a7ca0fe604 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -537,9 +537,15 @@
 
 /*---------------------  Export Macros ------------------------------*/
 
-#define VT6655_MAC_SELECT_PAGE0(iobase) iowrite8(0, (iobase) + MAC_REG_PAGE1SEL)
-
-#define VT6655_MAC_SELECT_PAGE1(iobase) iowrite8(1, (iobase) + MAC_REG_PAGE1SEL)
+static inline void vt6655_mac_select_page0(void __iomem *iobase)
+{
+        iowrite8(0, iobase + MAC_REG_PAGE1SEL);
+}
+
+static inline void  vt6655_mac_select_page1(void __iomem *iobase)
+{
+        iowrite8(1, iobase + MAC_REG_PAGE1SEL);
+}
 
 #define MAKEWORD(lb, hb) \
 	((unsigned short)(((unsigned char)(lb)) | (((unsigned short)((unsigned char)(hb))) << 8)))
-- 
2.34.1


-- 
Thanks & Regards,
Guru
