Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E012E17E5
	for <linux-staging@lists.linux.dev>; Sun, 28 Aug 2022 06:54:57 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id nc14so5181061ejc.4
        for <linux-staging@lists.linux.dev>; Sat, 27 Aug 2022 23:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc;
        bh=gktJznCv9/y7G5o2Zo2F57sjIQ5okEiEz9FlVIJ7urs=;
        b=iTgbWzq5Rg/QSWnm9yi87WrT4Bp8dlzNpuhGkz/p33zCkSCIoRwR60+I2kpwzbCzhC
         IOhvx2cgeFenJNupHnhBzDAGSxITXHotLInWPHaaQDOEoTI+8KITvFgFPYy1TdV8iSZH
         H+j55bu2RMtLJWBkmYQf3Jl6clTwU/qhbgRk5TfS4k76s03ixxzpL63U7j7OZR97pZit
         BMnZveCvzwAMtkPBQYu32wEUrY145U8QtPbg+YLGP4DNrsP3ZjFiuJ1ZXSkhKMmO9ZVo
         8MbDBxcHNRYHpU9QixKd957RKmejlOLlqqoJJLTonABGfwjuTcD9yEDbiOs+/i9sULgp
         R2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc;
        bh=gktJznCv9/y7G5o2Zo2F57sjIQ5okEiEz9FlVIJ7urs=;
        b=2vxjkPTGmcNU7JjtWIPQjxa+vJGj+YoTH1z5EOAKTIb4jgPzpaUHz/Q2GXUSGlOJZz
         JJzdhqDRfYfGZpFN48q/KdCPoMjNQ7mZIOpVGL9T7G7GkgFSni2OQ+1TT7bOn+ay2NoR
         ZWDuJPP+83Cx1V5UzyGZGc1+808OCwGQ0OVGrYB9lCvvLs5YRzx9w3DzdimeoM2SCh36
         ulWzcGRvEIX1jCPyZr6v27aBCYuFb1uikBabJr15w0iMCva6raEt09gdr+unA2Icivpb
         dtrx5WHwNod0KGi0yRt2QXXPpOrKQfem9YBpsdqOjURCSjHxeKTQg2jdo1/Ig4ce6O0Z
         vcgw==
X-Gm-Message-State: ACgBeo1lCW8Akt4EMEcZrpWnjxpboag16oPL70BXDPcqdMF+v+upw/XV
	mNVPMX3FxeeTQ1ulIMOamCca8ZvoRqA=
X-Google-Smtp-Source: AA6agR6HV4azfJBjstnh1Hr50/sUq3w8Bu9T9RcEpQUmKaOmWyqgo97WjoLDQIu+2Fr0gLl7SKke+g==
X-Received: by 2002:a17:907:6d8c:b0:731:6c60:eced with SMTP id sb12-20020a1709076d8c00b007316c60ecedmr10154012ejc.266.1661669696097;
        Sat, 27 Aug 2022 23:54:56 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id t1-20020a17090616c100b0073100dfa7b5sm2936279ejd.33.2022.08.27.23.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 23:54:54 -0700 (PDT)
Date: Sun, 28 Aug 2022 08:54:52 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] staging: vt6655: Rename function MACvSetShortRetryLimit
Message-ID: <d04b82510853607f439b4d969d4ce4b1883e9de8.1661666677.git.philipp.g.hortmann@gmail.com>
References: <cover.1661666677.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1661666677.git.philipp.g.hortmann@gmail.com>

Rename function MACvSetShortRetryLimit to vt6655_mac_set_short_retry_limit
and byRetryLimit to retry_limit to avoid CamelCase which is not accepted
by checkpatch.pl.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/device_main.c | 2 +-
 drivers/staging/vt6655/mac.c         | 9 ++++-----
 drivers/staging/vt6655/mac.h         | 3 +--
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index cd748b1665bb..3397c78b975a 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -412,7 +412,7 @@ static void device_init_registers(struct vnt_private *priv)
 				    (CFG_TKIPOPT | CFG_NOTXTIMEOUT));
 
 	/* set performance parameter by registry */
-	MACvSetShortRetryLimit(priv, priv->byShortRetryLimit);
+	vt6655_mac_set_short_retry_limit(priv, priv->byShortRetryLimit);
 	MACvSetLongRetryLimit(priv, priv->byLongRetryLimit);
 
 	/* reset TSF counter */
diff --git a/drivers/staging/vt6655/mac.c b/drivers/staging/vt6655/mac.c
index edd941c4f9ee..d056df1220d3 100644
--- a/drivers/staging/vt6655/mac.c
+++ b/drivers/staging/vt6655/mac.c
@@ -11,7 +11,7 @@
  *
  * Functions:
  *      vt6655_mac_is_reg_bits_off - Test if All test Bits Off
- *      MACvSetShortRetryLimit - Set 802.11 Short Retry limit
+ *      vt6655_mac_set_short_retry_limit - Set 802.11 Short Retry limit
  *      MACvSetLongRetryLimit - Set 802.11 Long Retry limit
  *      MACvSetLoopbackMode - Set MAC Loopback Mode
  *      MACvSaveContext - Save Context of MAC Registers
@@ -109,19 +109,18 @@ static bool vt6655_mac_is_reg_bits_off(struct vnt_private *priv,
  * Parameters:
  *  In:
  *      io_base    - Base Address for MAC
- *      byRetryLimit- Retry Limit
+ *      retry_limit - Retry Limit
  *  Out:
  *      none
  *
  * Return Value: none
  *
  */
-void MACvSetShortRetryLimit(struct vnt_private *priv,
-			    unsigned char byRetryLimit)
+void vt6655_mac_set_short_retry_limit(struct vnt_private *priv, unsigned char retry_limit)
 {
 	void __iomem *io_base = priv->port_offset;
 	/* set SRT */
-	iowrite8(byRetryLimit, io_base + MAC_REG_SRT);
+	iowrite8(retry_limit, io_base + MAC_REG_SRT);
 }
 
 /*
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index cc5d2493375b..a70e75ff78cd 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -549,8 +549,7 @@ void vt6655_mac_word_reg_bits_on(void __iomem *iobase, const u8 reg_offset, cons
 void vt6655_mac_reg_bits_off(void __iomem *iobase, const u8 reg_offset, const u8 bit_mask);
 void vt6655_mac_word_reg_bits_off(void __iomem *iobase, const u8 reg_offset, const u16 bit_mask);
 
-void MACvSetShortRetryLimit(struct vnt_private *priv,
-			    unsigned char byRetryLimit);
+void vt6655_mac_set_short_retry_limit(struct vnt_private *priv, unsigned char retry_limit);
 
 void MACvSetLongRetryLimit(struct vnt_private *priv, unsigned char byRetryLimit);
 
-- 
2.37.2

