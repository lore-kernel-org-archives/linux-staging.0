Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C3F15A9
	for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 05:00:30 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id j22so17880359ejs.2
        for <linux-staging@lists.linux.dev>; Tue, 12 Jul 2022 22:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0wMftk2eQcprvM9x6LRj/pysT2hw03/2wElXHcPO8jg=;
        b=lrrQiEyMaox3Gj63Ughmo5lWDHzHzoJXlgjo9adVErpfy50EMQ8br7b9VJxwUvsK4R
         iOHITYRRJ9EKUzhLc97rnwSyEhmbB9WhVpQFrY98/9ukjGDmsFLVP2nwjKuQP7579d15
         6v21Y5uhmQPuJpPcgmIioY0aOvNK06tx1wE4gu2cgs8gKm/sH8/cZMqEGWgo7qzMZw1P
         fmaDfsSAYGKmn2/9aoLJudDzVQCWPHq1iN//ib07rFk7fDyZSfWenIC0Btpi+WJ6AllG
         9W0GuwO4URrXYCHxM5h+fA34KY191e7vECavYoa0+yYt5cCBtblfIQEGtwwiOS0Kukbt
         tqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0wMftk2eQcprvM9x6LRj/pysT2hw03/2wElXHcPO8jg=;
        b=s2eFREWFoEuj6i/jmLdgABvrtD/PnOI1/MXFhqZpWXPysJpOX2t2oCcVKf7CUS7YFr
         vERQ04SiRfjt5ZN8TD3keoqT2kQHdC5EOVvslBuOX2aQBYk/+qIO2rQJSAN1chNv+ZCa
         /EMlV/GAGwsl7fpXFUm4GjE+2xnExU/XArncEUZLSn71SknSU5kwq1sYXC4vmNwE1nYF
         ylu3wxBryloUw0mdIh6kUUnqEUyRPt6SO7leKiXKBFnthYUI96ffmNazF3VUPTUGw2Vp
         0WOZbz1FliDZob+IkCrfkitM6ZqcjvTk4i7mwohpuh5DGl2r8+5ZHq0ZYNgyKl1LUfaR
         ykfw==
X-Gm-Message-State: AJIora+EDRK/kKavwwUYowhoIcYJ0/q228FBh3FWOWZcSysRTzus2T6T
	LjRLX8OOyVMsWRiCpEspXC4=
X-Google-Smtp-Source: AGRyM1vfv/UZHhjJF7CmI/nIqwPMjmwOfmIqSrq1u2iLudBWUXCPzqAxcdkjeJLhjKoIfmCE3JwUlg==
X-Received: by 2002:a17:906:3f49:b0:722:e1d2:f857 with SMTP id f9-20020a1709063f4900b00722e1d2f857mr1524582ejj.15.1657688429063;
        Tue, 12 Jul 2022 22:00:29 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id i8-20020a170906a28800b0072b13fa5e4csm4543451ejz.58.2022.07.12.22.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 22:00:28 -0700 (PDT)
Date: Wed, 13 Jul 2022 07:00:25 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 07/13] staging: vt6655: Rename MACvWordRegBitsOn
Message-ID: <b3873e1103d642a804d42c945dc0c73d94b0c1cf.1657657918.git.philipp.g.hortmann@gmail.com>
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
 drivers/staging/vt6655/card.c        |  4 ++--
 drivers/staging/vt6655/device_main.c |  4 ++--
 drivers/staging/vt6655/mac.h         |  4 ++--
 drivers/staging/vt6655/rf.c          | 14 +++++++-------
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 220b47106855..54a12c97aa16 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -354,8 +354,8 @@ void CARDbRadioPowerOff(struct vnt_private *priv)
 	case RF_RFMD2959:
 		MACvWordRegBitsOff(priv->port_offset, MAC_REG_SOFTPWRCTL,
 				   SOFTPWRCTL_TXPEINV);
-		MACvWordRegBitsOn(priv->port_offset, MAC_REG_SOFTPWRCTL,
-				  SOFTPWRCTL_SWPE1);
+		vt6655_mac_word_reg_bits_on(priv->port_offset, MAC_REG_SOFTPWRCTL,
+					    SOFTPWRCTL_SWPE1);
 		break;
 
 	case RF_AIROHA:
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 1a202e5fa39f..bcf35a89730e 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -359,8 +359,8 @@ static void device_init_registers(struct vnt_private *priv)
 	}
 
 	/* use relative tx timeout and 802.11i D4 */
-	MACvWordRegBitsOn(priv->port_offset,
-			  MAC_REG_CFG, (CFG_TKIPOPT | CFG_NOTXTIMEOUT));
+	vt6655_mac_word_reg_bits_on(priv->port_offset, MAC_REG_CFG,
+				    (CFG_TKIPOPT | CFG_NOTXTIMEOUT));
 
 	/* set performance parameter by registry */
 	MACvSetShortRetryLimit(priv, priv->byShortRetryLimit);
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 4e15174ca2ee..3303b9ba3bee 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -544,7 +544,7 @@ do {									\
 	iowrite8(reg_value | (bit_mask), iobase + reg_offset);		\
 } while (0)
 
-#define MACvWordRegBitsOn(iobase, reg_offset, bit_mask)		\
+#define vt6655_mac_word_reg_bits_on(iobase, reg_offset, bit_mask)	\
 do {									\
 	unsigned short reg_value;					\
 	reg_value = ioread16(iobase + reg_offset);			\
@@ -661,7 +661,7 @@ do {									\
 } while (0)
 
 #define MACvSetRFLE_LatchBase(iobase)                                 \
-	MACvWordRegBitsOn(iobase, MAC_REG_SOFTPWRCTL, SOFTPWRCTL_RFLEOPT)
+	vt6655_mac_word_reg_bits_on(iobase, MAC_REG_SOFTPWRCTL, SOFTPWRCTL_RFLEOPT)
 
 #define MAKEWORD(lb, hb) \
 	((unsigned short)(((unsigned char)(lb)) | (((unsigned short)((unsigned char)(hb))) << 8)))
diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index 99850367293a..6953afc0be34 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -209,8 +209,8 @@ static bool RFbAL2230Init(struct vnt_private *priv)
 	/* 3-wire control for normal mode */
 	iowrite8(0, iobase + MAC_REG_SOFTPWRCTL);
 
-	MACvWordRegBitsOn(iobase, MAC_REG_SOFTPWRCTL, (SOFTPWRCTL_SWPECTI  |
-							 SOFTPWRCTL_TXPEINV));
+	vt6655_mac_word_reg_bits_on(iobase, MAC_REG_SOFTPWRCTL,
+				    (SOFTPWRCTL_SWPECTI | SOFTPWRCTL_TXPEINV));
 	/* PLL  Off */
 	MACvWordRegBitsOff(iobase, MAC_REG_SOFTPWRCTL, SOFTPWRCTL_SWPE3);
 
@@ -222,7 +222,7 @@ static bool RFbAL2230Init(struct vnt_private *priv)
 	MACvTimer0MicroSDelay(priv, 30); /* delay 30 us */
 
 	/* PLL On */
-	MACvWordRegBitsOn(iobase, MAC_REG_SOFTPWRCTL, SOFTPWRCTL_SWPE3);
+	vt6655_mac_word_reg_bits_on(iobase, MAC_REG_SOFTPWRCTL, SOFTPWRCTL_SWPE3);
 
 	MACvTimer0MicroSDelay(priv, 150);/* 150us */
 	ret &= IFRFbWriteEmbedded(priv, (0x00d80f00 + (BY_AL2230_REG_LEN << 3) + IFREGCTL_REGW));
@@ -232,10 +232,10 @@ static bool RFbAL2230Init(struct vnt_private *priv)
 	ret &= IFRFbWriteEmbedded(priv,
 				  al2230_init_table[CB_AL2230_INIT_SEQ - 1]);
 
-	MACvWordRegBitsOn(iobase, MAC_REG_SOFTPWRCTL, (SOFTPWRCTL_SWPE3    |
-							 SOFTPWRCTL_SWPE2    |
-							 SOFTPWRCTL_SWPECTI  |
-							 SOFTPWRCTL_TXPEINV));
+	vt6655_mac_word_reg_bits_on(iobase, MAC_REG_SOFTPWRCTL, (SOFTPWRCTL_SWPE3    |
+								 SOFTPWRCTL_SWPE2    |
+								 SOFTPWRCTL_SWPECTI  |
+								 SOFTPWRCTL_TXPEINV));
 
 	/* 3-wire control for power saving mode */
 	iowrite8(PSSIG_WPE3 | PSSIG_WPE2, iobase + MAC_REG_PSPWRSIG);
-- 
2.37.0

