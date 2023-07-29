Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7171FB0
	for <linux-staging@lists.linux.dev>; Sat, 29 Jul 2023 07:53:48 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5221ee3dd76so833210a12.0
        for <linux-staging@lists.linux.dev>; Sat, 29 Jul 2023 00:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690617227; x=1691222027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hVWQ1qgQBZbo3g2eHf7eEhO2KwwCTOPLq8N55bF/Iys=;
        b=ry2S7MIBiphN89rqme7WRSPfdaAdnoEu30RE/Jrl3LOfUaDLdiok5B7orZFJWzl5rP
         N92XktACc8wSfi8qpVNaRAKLHXib+NuPQE2fJP5QTIMk832xXqN0StkFuyVhHsIq6Suz
         Kjg7s6tXCx0mvet4eA/xhbDHYtjZW4i8n+UTvKwRCjDSiV+qG1c8cIQ85J+MVXTNqlJN
         OMWbZ17eTkaKTSvLaPDNPM7PBZCyrY9o3+krnh7bg7yJuSiW7r8tRHE6QMxhv/h0b+vm
         YhqaTuiaZB1ipi1yUg3G9DlyqKj1HxOLziFhfoz2MIxGmnu9InS/gZIztFe/cRgM8YOP
         4Rog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690617227; x=1691222027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hVWQ1qgQBZbo3g2eHf7eEhO2KwwCTOPLq8N55bF/Iys=;
        b=ibshw96/GNdnCJoI9EZbFJLjb1lgJjlSOPG2DnOxf2q2qEAFkZZQGqFGKCZiFdtHRG
         9ytJZZdr5x3XaoL4jSO1efLBV0IxrjRER58hKor2OjYeE64fJNJGsw7NbhG1UphF2m+3
         WUwsIe9tcKWp3y6V5UENWjp9HWPukQvWPfdUv6v+Jjq9gdMLDRZxCmTqW43H/lU1jYr+
         TF16UNEOjFfD3UZQPsb9rkGqQ+IoclM+ORjh04r1NXnPUFK8jfwTBDoXL/GSAz0nNf/9
         oR4876DEGDspedeHaNw8/nK84Vypvh185oasx9LReTeWb7/rHMABSiCqEet67vJrMsVx
         guWw==
X-Gm-Message-State: ABy/qLaFb8STqu5+BK9zyrmax8NsIpf8v71GPRiZAN3iDIsaUJ5Cgqgq
	lIn85EYmeZaWbCyAQBW3dKKnZQbsPFI=
X-Google-Smtp-Source: APBJJlEc+PkwdkqIq/G7SBlX2NW2HCabzZ3kTPcZVXqqe5S4l7PuL9tYBNb31Kn7cISVhi5Owy9NtA==
X-Received: by 2002:a05:6402:430b:b0:521:d2fb:caa1 with SMTP id m11-20020a056402430b00b00521d2fbcaa1mr1970432edc.0.1690617226701;
        Sat, 29 Jul 2023 00:53:46 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id bf19-20020a0564021a5300b0051ded17b30bsm2633934edb.40.2023.07.29.00.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 00:53:46 -0700 (PDT)
Date: Sat, 29 Jul 2023 09:53:43 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] staging: rtl8192e: Remove is_mesh from
 rtllib_start_scan_syncro
Message-ID: <6050a1d7764364190dda252f79d75c7cc47143de.1690615475.git.philipp.g.hortmann@gmail.com>
References: <cover.1690615475.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1690615475.git.philipp.g.hortmann@gmail.com>

Function rtllib_start_scan_syncro() has parameter is_mesh which is in all
calls 0. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c   | 2 +-
 drivers/staging/rtl8192e/rtllib.h            | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c    | 6 +++---
 drivers/staging/rtl8192e/rtllib_softmac_wx.c | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index 88975dc804c6..74747348b573 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -428,7 +428,7 @@ static int _rtl92e_wx_set_scan(struct net_device *dev,
 
 			ieee->ScanOperationBackupHandler(ieee->dev, SCAN_OPT_BACKUP);
 
-			rtllib_start_scan_syncro(priv->rtllib, 0);
+			rtllib_start_scan_syncro(priv->rtllib);
 
 			ieee->ScanOperationBackupHandler(ieee->dev, SCAN_OPT_RESTORE);
 		}
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index aa8abec390ca..9603a3485868 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1887,7 +1887,7 @@ void rtllib_disassociate(struct rtllib_device *ieee);
 void rtllib_stop_scan(struct rtllib_device *ieee);
 bool rtllib_act_scanning(struct rtllib_device *ieee, bool sync_scan);
 void rtllib_stop_scan_syncro(struct rtllib_device *ieee);
-void rtllib_start_scan_syncro(struct rtllib_device *ieee, u8 is_mesh);
+void rtllib_start_scan_syncro(struct rtllib_device *ieee);
 void rtllib_sta_ps_send_null_frame(struct rtllib_device *ieee, short pwr);
 void rtllib_sta_ps_send_pspoll_frame(struct rtllib_device *ieee);
 void rtllib_start_protocol(struct rtllib_device *ieee);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 614f19603af1..7b866b3a46ef 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -707,7 +707,7 @@ static void rtllib_start_scan(struct rtllib_device *ieee)
 }
 
 /* called with wx_mutex held */
-void rtllib_start_scan_syncro(struct rtllib_device *ieee, u8 is_mesh)
+void rtllib_start_scan_syncro(struct rtllib_device *ieee)
 {
 	if (IS_DOT11D_ENABLE(ieee)) {
 		if (IS_COUNTRY_IE_VALID(ieee))
@@ -715,7 +715,7 @@ void rtllib_start_scan_syncro(struct rtllib_device *ieee, u8 is_mesh)
 	}
 	ieee->sync_scan_hurryup = 0;
 	if (ieee->softmac_features & IEEE_SOFTMAC_SCAN)
-		rtllib_softmac_scan_syncro(ieee, is_mesh);
+		rtllib_softmac_scan_syncro(ieee, 0);
 }
 EXPORT_SYMBOL(rtllib_start_scan_syncro);
 
@@ -2500,7 +2500,7 @@ static void rtllib_start_ibss_wq(void *data)
 	 * associated.
 	 */
 	if (ieee->link_state == MAC80211_NOLINK)
-		rtllib_start_scan_syncro(ieee, 0);
+		rtllib_start_scan_syncro(ieee);
 
 	/* the network definitively is not here.. create a new cell */
 	if (ieee->link_state == MAC80211_NOLINK) {
diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index 1a7575ab9d6d..aad91dad134c 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -310,7 +310,7 @@ void rtllib_wx_sync_scan_wq(void *data)
 
 	mutex_lock(&ieee->wx_mutex);
 	if (!(ieee->softmac_features & IEEE_SOFTMAC_SCAN)) {
-		rtllib_start_scan_syncro(ieee, 0);
+		rtllib_start_scan_syncro(ieee);
 		goto out;
 	}
 
@@ -339,7 +339,7 @@ void rtllib_wx_sync_scan_wq(void *data)
 				       HT_EXTCHNL_OFFSET_NO_EXT);
 	}
 
-	rtllib_start_scan_syncro(ieee, 0);
+	rtllib_start_scan_syncro(ieee);
 
 	if (b40M) {
 		if (chan_offset == HT_EXTCHNL_OFFSET_UPPER)
-- 
2.41.0

