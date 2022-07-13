Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9FF15A9
	for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 05:00:44 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id ez10so17819518ejc.13
        for <linux-staging@lists.linux.dev>; Tue, 12 Jul 2022 22:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Qt/TN6/jZlcLjYnewHjagu0VI5EFgbu0PZvM/L37ZrI=;
        b=a6/8mzVVmr6MIPVeRf2ePsV27rFkv64WIzTscddWlt+dJBM9eDwGZPXfaFVPlimXan
         lePfUH+dKvUoz+1HGPSzFQFrOXhuVN+yqO2P2NMsEZOkv2AC5eFypywVMnnL9yTZpGZs
         cx2oNQ1t+ZOcYqwuI6iND2UgshTs3c40FGoAeOd6yQVAwE6yY1AYw8WP6lda7UFGBy9y
         w6Ffy2S30slkSsw3EMeWARwALNeRvyy2xtgbBfNgF00rH2lkg6Is/cDj0usJkgSp9kTT
         V8oXZi7Z2Y2saGAkn5I5UzSi74myo2xnVJBIoDVrT3UjtZuGe5GQAjOtGeZnmgKFg8Y4
         OEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Qt/TN6/jZlcLjYnewHjagu0VI5EFgbu0PZvM/L37ZrI=;
        b=B9tPQaLVXUCjktuRZKXJH+CCajiyRjmAYuJFgjcv9pCCzLCj/B/hbkqCvyRHYAHYCf
         Y2EF07v9dW3/cwP83G17X35q1txvV6V8C/8YA5wpPwx9gXXdKrv7SAX5rOkMkAFohQ/C
         DYSLd2Gq9/xJOm8DzhOuWWbuwC+K1BQi2tRf8gl/WbT052GfP6EidXBPzQWBt2tfl8JI
         au1PGSpce0ZoPUQdBgXQGZHezHub4b6mf+zumnWLXo0uZHeBrB/UHxJVwEPnz3/IY0dH
         0ocoYWO30I5tMQFelAjBn7xhoTJxjVlfa4x8FXC4uLS6sUotSFIt62km7XzsKIJtCl6S
         TLWw==
X-Gm-Message-State: AJIora/ayC+DbKuWahAXfdVB55bi4DF3Fv0uiYygDANRIh4KhsWr1DSL
	sFRtHNaA/bgKx7FJxFCd9K4=
X-Google-Smtp-Source: AGRyM1vfgCCu127yUGmTdMvjIllU9TGdbEpoZTt2QVK6eMUM//xOG8jmKLB3vHW0VZIAcR867CasAA==
X-Received: by 2002:a17:907:2bd9:b0:72b:1752:aa52 with SMTP id gv25-20020a1709072bd900b0072b1752aa52mr1600128ejc.646.1657688443211;
        Tue, 12 Jul 2022 22:00:43 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id i20-20020aa7c714000000b0043580ac5888sm7281279edq.82.2022.07.12.22.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 22:00:42 -0700 (PDT)
Date: Wed, 13 Jul 2022 07:00:40 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 06/13] staging: vt6655: Rename MACvRegBitsOn
Message-ID: <7fb9627441ff97897d132c62d59676355b6d14ea.1657657918.git.philipp.g.hortmann@gmail.com>
References: <cover.1657657918.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1657657918.git.philipp.g.hortmann@gmail.com>

Fix name of a macro that uses CamelCase which is not
accepted by checkpatch.pl

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/baseband.c    |  8 ++++----
 drivers/staging/vt6655/card.c        | 14 ++++++--------
 drivers/staging/vt6655/channel.c     |  2 +-
 drivers/staging/vt6655/device_main.c |  9 ++++-----
 drivers/staging/vt6655/mac.h         |  2 +-
 drivers/staging/vt6655/power.c       | 15 +++++++--------
 drivers/staging/vt6655/rxtx.c        |  2 +-
 7 files changed, 24 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
index a5412ca0ea68..5de841cb776c 100644
--- a/drivers/staging/vt6655/baseband.c
+++ b/drivers/staging/vt6655/baseband.c
@@ -1912,7 +1912,7 @@ bool bb_read_embedded(struct vnt_private *priv, unsigned char by_bb_addr,
 	iowrite8(by_bb_addr, iobase + MAC_REG_BBREGADR);
 
 	/* turn on REGR */
-	MACvRegBitsOn(iobase, MAC_REG_BBREGCTL, BBREGCTL_REGR);
+	vt6655_mac_reg_bits_on(iobase, MAC_REG_BBREGCTL, BBREGCTL_REGR);
 	/* W_MAX_TIMEOUT is the timeout period */
 	for (ww = 0; ww < W_MAX_TIMEOUT; ww++) {
 		by_value = ioread8(iobase + MAC_REG_BBREGCTL);
@@ -1957,7 +1957,7 @@ bool bb_write_embedded(struct vnt_private *priv, unsigned char by_bb_addr,
 	iowrite8(by_data, iobase + MAC_REG_BBREGDATA);
 
 	/* turn on BBREGCTL_REGW */
-	MACvRegBitsOn(iobase, MAC_REG_BBREGCTL, BBREGCTL_REGW);
+	vt6655_mac_reg_bits_on(iobase, MAC_REG_BBREGCTL, BBREGCTL_REGW);
 	/* W_MAX_TIMEOUT is the timeout period */
 	for (ww = 0; ww < W_MAX_TIMEOUT; ww++) {
 		by_value = ioread8(iobase + MAC_REG_BBREGCTL);
@@ -2014,7 +2014,7 @@ bool bb_vt3253_init(struct vnt_private *priv)
 					byVT3253B0_AGC4_RFMD2959[ii][1]);
 
 			iowrite32(0x23, iobase + MAC_REG_ITRTMSET);
-			MACvRegBitsOn(iobase, MAC_REG_PAPEDELAY, BIT(0));
+			vt6655_mac_reg_bits_on(iobase, MAC_REG_PAPEDELAY, BIT(0));
 		}
 		priv->abyBBVGA[0] = 0x18;
 		priv->abyBBVGA[1] = 0x0A;
@@ -2054,7 +2054,7 @@ bool bb_vt3253_init(struct vnt_private *priv)
 				byVT3253B0_AGC[ii][1]);
 
 		iowrite8(0x23, iobase + MAC_REG_ITRTMSET);
-		MACvRegBitsOn(iobase, MAC_REG_PAPEDELAY, BIT(0));
+		vt6655_mac_reg_bits_on(iobase, MAC_REG_PAPEDELAY, BIT(0));
 
 		priv->abyBBVGA[0] = 0x14;
 		priv->abyBBVGA[1] = 0x0A;
diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 3380c7604e84..220b47106855 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -296,8 +296,7 @@ bool CARDbUpdateTSF(struct vnt_private *priv, unsigned char byRxRate,
 		qwTSFOffset =  le64_to_cpu(qwTSFOffset);
 		iowrite32((u32)qwTSFOffset, priv->port_offset + MAC_REG_TSFOFST);
 		iowrite32((u32)(qwTSFOffset >> 32), priv->port_offset + MAC_REG_TSFOFST + 4);
-		MACvRegBitsOn(priv->port_offset, MAC_REG_TFTCTL,
-			      TFTCTL_TSFSYNCEN);
+		vt6655_mac_reg_bits_on(priv->port_offset, MAC_REG_TFTCTL, TFTCTL_TSFSYNCEN);
 	}
 	return true;
 }
@@ -331,7 +330,7 @@ bool CARDbSetBeaconPeriod(struct vnt_private *priv,
 	qwNextTBTT =  le64_to_cpu(qwNextTBTT);
 	iowrite32((u32)qwNextTBTT, priv->port_offset + MAC_REG_NEXTTBTT);
 	iowrite32((u32)(qwNextTBTT >> 32), priv->port_offset + MAC_REG_NEXTTBTT + 4);
-	MACvRegBitsOn(priv->port_offset, MAC_REG_TFTCTL, TFTCTL_TBTTSYNCEN);
+	vt6655_mac_reg_bits_on(priv->port_offset, MAC_REG_TFTCTL, TFTCTL_TBTTSYNCEN);
 
 	return true;
 }
@@ -374,8 +373,7 @@ void CARDbRadioPowerOff(struct vnt_private *priv)
 
 	priv->radio_off = true;
 	pr_debug("chester power off\n");
-	MACvRegBitsOn(priv->port_offset, MAC_REG_GPIOCTL0,
-		      LED_ACTSET);  /* LED issue */
+	vt6655_mac_reg_bits_on(priv->port_offset, MAC_REG_GPIOCTL0, LED_ACTSET);  /* LED issue */
 }
 
 void CARDvSafeResetTx(struct vnt_private *priv)
@@ -734,7 +732,7 @@ u64 vt6655_get_current_tsf(struct vnt_private *priv)
 	unsigned char data;
 	u32 low, high;
 
-	MACvRegBitsOn(iobase, MAC_REG_TFTCTL, TFTCTL_TSFCNTRRD);
+	vt6655_mac_reg_bits_on(iobase, MAC_REG_TFTCTL, TFTCTL_TSFCNTRRD);
 	for (ww = 0; ww < W_MAX_TIMEOUT; ww++) {
 		data = ioread8(iobase + MAC_REG_TFTCTL);
 		if (!(data & TFTCTL_TSFCNTRRD))
@@ -800,7 +798,7 @@ void CARDvSetFirstNextTBTT(struct vnt_private *priv,
 	qwNextTBTT =  le64_to_cpu(qwNextTBTT);
 	iowrite32((u32)qwNextTBTT, iobase + MAC_REG_NEXTTBTT);
 	iowrite32((u32)(qwNextTBTT >> 32), iobase + MAC_REG_NEXTTBTT + 4);
-	MACvRegBitsOn(iobase, MAC_REG_TFTCTL, TFTCTL_TBTTSYNCEN);
+	vt6655_mac_reg_bits_on(iobase, MAC_REG_TFTCTL, TFTCTL_TBTTSYNCEN);
 }
 
 /*
@@ -827,6 +825,6 @@ void CARDvUpdateNextTBTT(struct vnt_private *priv, u64 qwTSF,
 	qwTSF =  le64_to_cpu(qwTSF);
 	iowrite32((u32)qwTSF, iobase + MAC_REG_NEXTTBTT);
 	iowrite32((u32)(qwTSF >> 32), iobase + MAC_REG_NEXTTBTT + 4);
-	MACvRegBitsOn(iobase, MAC_REG_TFTCTL, TFTCTL_TBTTSYNCEN);
+	vt6655_mac_reg_bits_on(iobase, MAC_REG_TFTCTL, TFTCTL_TBTTSYNCEN);
 	pr_debug("Card:Update Next TBTT[%8llx]\n", qwTSF);
 }
diff --git a/drivers/staging/vt6655/channel.c b/drivers/staging/vt6655/channel.c
index 652dcaf61169..e926f9829a15 100644
--- a/drivers/staging/vt6655/channel.c
+++ b/drivers/staging/vt6655/channel.c
@@ -94,7 +94,7 @@ bool set_channel(struct vnt_private *priv, struct ieee80211_channel *ch)
 	}
 
 	/* clear NAV */
-	MACvRegBitsOn(priv->port_offset, MAC_REG_MACCR, MACCR_CLRNAV);
+	vt6655_mac_reg_bits_on(priv->port_offset, MAC_REG_MACCR, MACCR_CLRNAV);
 
 	/* TX_PE will reserve 3 us for MAX2829 A mode only,
 	 * it is for better TX throughput
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 19840dddb4bf..1a202e5fa39f 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -417,7 +417,7 @@ static void device_init_registers(struct vnt_private *priv)
 	CARDvSafeResetTx(priv);
 
 	if (priv->local_id <= REV_ID_VT3253_A1)
-		MACvRegBitsOn(priv->port_offset, MAC_REG_RCR, RCR_WPAERR);
+		vt6655_mac_reg_bits_on(priv->port_offset, MAC_REG_RCR, RCR_WPAERR);
 
 	/* Turn On Rx DMA */
 	MACvReceive0(priv->port_offset);
@@ -1324,13 +1324,13 @@ static int vnt_add_interface(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
 	case NL80211_IFTYPE_ADHOC:
 		MACvRegBitsOff(priv->port_offset, MAC_REG_RCR, RCR_UNICAST);
 
-		MACvRegBitsOn(priv->port_offset, MAC_REG_HOSTCR, HOSTCR_ADHOC);
+		vt6655_mac_reg_bits_on(priv->port_offset, MAC_REG_HOSTCR, HOSTCR_ADHOC);
 
 		break;
 	case NL80211_IFTYPE_AP:
 		MACvRegBitsOff(priv->port_offset, MAC_REG_RCR, RCR_UNICAST);
 
-		MACvRegBitsOn(priv->port_offset, MAC_REG_HOSTCR, HOSTCR_AP);
+		vt6655_mac_reg_bits_on(priv->port_offset, MAC_REG_HOSTCR, HOSTCR_AP);
 
 		break;
 	default:
@@ -1476,8 +1476,7 @@ static void vnt_bss_info_changed(struct ieee80211_hw *hw,
 		if (conf->enable_beacon) {
 			vnt_beacon_enable(priv, vif, conf);
 
-			MACvRegBitsOn(priv->port_offset, MAC_REG_TCR,
-				      TCR_AUTOBCNTX);
+			vt6655_mac_reg_bits_on(priv->port_offset, MAC_REG_TCR, TCR_AUTOBCNTX);
 		} else {
 			MACvRegBitsOff(priv->port_offset, MAC_REG_TCR,
 				       TCR_AUTOBCNTX);
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 2a31c94156b2..4e15174ca2ee 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -537,7 +537,7 @@
 
 /*---------------------  Export Macros ------------------------------*/
 
-#define MACvRegBitsOn(iobase, reg_offset, bit_mask)			\
+#define vt6655_mac_reg_bits_on(iobase, reg_offset, bit_mask)		\
 do {									\
 	unsigned char reg_value;					\
 	reg_value = ioread8(iobase + reg_offset);			\
diff --git a/drivers/staging/vt6655/power.c b/drivers/staging/vt6655/power.c
index 0bd2ddc61648..c8a456305e1d 100644
--- a/drivers/staging/vt6655/power.c
+++ b/drivers/staging/vt6655/power.c
@@ -59,23 +59,23 @@ void PSvEnablePowerSaving(struct vnt_private *priv,
 	}
 
 	/* Set AutoSleep */
-	MACvRegBitsOn(priv->port_offset, MAC_REG_PSCFG, PSCFG_AUTOSLEEP);
+	vt6655_mac_reg_bits_on(priv->port_offset, MAC_REG_PSCFG, PSCFG_AUTOSLEEP);
 
 	/* Set HWUTSF */
-	MACvRegBitsOn(priv->port_offset, MAC_REG_TFTCTL, TFTCTL_HWUTSF);
+	vt6655_mac_reg_bits_on(priv->port_offset, MAC_REG_TFTCTL, TFTCTL_HWUTSF);
 
 	if (wListenInterval >= 2) {
 		/* clear always listen beacon */
 		MACvRegBitsOff(priv->port_offset, MAC_REG_PSCTL, PSCTL_ALBCN);
 		/* first time set listen next beacon */
-		MACvRegBitsOn(priv->port_offset, MAC_REG_PSCTL, PSCTL_LNBCN);
+		vt6655_mac_reg_bits_on(priv->port_offset, MAC_REG_PSCTL, PSCTL_LNBCN);
 	} else {
 		/* always listen beacon */
-		MACvRegBitsOn(priv->port_offset, MAC_REG_PSCTL, PSCTL_ALBCN);
+		vt6655_mac_reg_bits_on(priv->port_offset, MAC_REG_PSCTL, PSCTL_ALBCN);
 	}
 
 	/* enable power saving hw function */
-	MACvRegBitsOn(priv->port_offset, MAC_REG_PSCTL, PSCTL_PSEN);
+	vt6655_mac_reg_bits_on(priv->port_offset, MAC_REG_PSCTL, PSCTL_PSEN);
 	priv->bEnablePSMode = true;
 
 	priv->bPWBitOn = true;
@@ -104,7 +104,7 @@ void PSvDisablePowerSaving(struct vnt_private *priv)
 	MACvRegBitsOff(priv->port_offset, MAC_REG_TFTCTL, TFTCTL_HWUTSF);
 
 	/* set always listen beacon */
-	MACvRegBitsOn(priv->port_offset, MAC_REG_PSCTL, PSCTL_ALBCN);
+	vt6655_mac_reg_bits_on(priv->port_offset, MAC_REG_PSCTL, PSCTL_ALBCN);
 
 	priv->bEnablePSMode = false;
 
@@ -135,8 +135,7 @@ bool PSbIsNextTBTTWakeUp(struct vnt_private *priv)
 
 		if (priv->wake_up_count == 1) {
 			/* Turn on wake up to listen next beacon */
-			MACvRegBitsOn(priv->port_offset,
-				      MAC_REG_PSCTL, PSCTL_LNBCN);
+			vt6655_mac_reg_bits_on(priv->port_offset, MAC_REG_PSCTL, PSCTL_LNBCN);
 			wake_up = true;
 		}
 	}
diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 736681274296..537f54cf23c2 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -1424,7 +1424,7 @@ static int vnt_beacon_xmit(struct vnt_private *priv,
 
 	iowrite16(priv->wBCNBufLen, priv->port_offset + MAC_REG_BCNDMACTL + 2);
 	/* Set auto Transmit on */
-	MACvRegBitsOn(priv->port_offset, MAC_REG_TCR, TCR_AUTOBCNTX);
+	vt6655_mac_reg_bits_on(priv->port_offset, MAC_REG_TCR, TCR_AUTOBCNTX);
 	/* Poll Transmit the adapter */
 	iowrite8(BEACON_READY, priv->port_offset + MAC_REG_BCNDMACTL);
 
-- 
2.37.0

