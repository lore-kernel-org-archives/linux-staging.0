Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051B838DE6
	for <linux-staging@lists.linux.dev>; Tue,  3 Oct 2023 19:33:44 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9ae3d4c136fso43726766b.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Oct 2023 12:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696361623; x=1696966423; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UFQqJ8FnoiDbXQTYRHGl9/H4vusMfHOBvbL9wqGrJ38=;
        b=azUKc5VktKScWgmAN4of+p55FVs97Yjbrf2WpYbjk+zx9v1Hgjcxkflkn30Nq7UcEd
         RsuJHoppeD901EQXpH5j87I25XwrF09ShdGNUPQNgsrGFaw9mFjOpr0G2rFSd4/zY2Dc
         uVD3YjhRhIinBYZ9UkpgoCh3nLOjsHeDDhOQp0JULhmU2AhX0E10oWmbcM7tc4ldaMG8
         A1SA6cYXl8YAyr7MNtiAokNbJJqmMCm0S7mqC5eaPmPmNb3xry2J2VxcfKAwjBCtAM5V
         jwFbbE2vf8LrWYuGrFGys85D7oZf88J7SP607fWw5xdgt7HcpHUZcyKRbYsjGucaslcx
         KFYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696361623; x=1696966423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFQqJ8FnoiDbXQTYRHGl9/H4vusMfHOBvbL9wqGrJ38=;
        b=gLk7toviTJwu1T4h7QzzAnbfeES7azGyGz0JaTqrAJgoac5bXXa+VUJU88bIKGcVF4
         ZHWf0xUTvVmGxDvsvN/NXYuecJETY3rNue4EL+cwwVLUiDIkktTb8TsYMkIwxm12xB+7
         zB9fom4l2QR8qTQ5WlbD0jZ/WEM+vOIWOvrcKJT3Wn2BYa1qoJd65Ymdqf45nXG7nAuK
         GD58cdibaRFfht4FwjeHsEJxf4SK5psgDuAWnFSJ10tQvWi+ASzim2X0irjVsDpajQmr
         xrUZpG/mz7q8BB6tx7iCrB4OD6vJyFh+tiV8+PNijSzJlccfs1EWDaes4JcgmmsLDvM8
         sw0Q==
X-Gm-Message-State: AOJu0YwNBPora7nDMlhWls+mphn6Tdgi73me2+wEo8K+5DkcuyhHYuGe
	tvLzpqaYXVMKkrbi6DibQRs=
X-Google-Smtp-Source: AGHT+IH4AYER4e688ISlr0WZqOzbOyZdBBQyVL67QhBsYHL/n9LhNaolKHGGmZxBsp2V8wGoFQGcww==
X-Received: by 2002:a17:906:109e:b0:9a1:f96c:4bb9 with SMTP id u30-20020a170906109e00b009a1f96c4bb9mr77552eju.6.1696361623196;
        Tue, 03 Oct 2023 12:33:43 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id j24-20020a170906411800b009b65a698c16sm1489645ejk.220.2023.10.03.12.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 12:33:42 -0700 (PDT)
Date: Tue, 3 Oct 2023 21:33:41 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] staging: rtl8192e: Remove function
 _rtl92e_wx_set_promisc_mode()
Message-ID: <d318afeae38f14db36da9f2b229ff61535b815c8.1696360404.git.philipp.g.hortmann@gmail.com>
References: <cover.1696360403.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1696360403.git.philipp.g.hortmann@gmail.com>

Remove function _rtl92e_wx_set_promisc_mode() as this functionality is
not commonly used and the tool to access it is deprecated.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 47 +---------------------
 drivers/staging/rtl8192e/rtllib.h          |  4 +-
 drivers/staging/rtl8192e/rtllib_softmac.c  | 43 --------------------
 3 files changed, 2 insertions(+), 92 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index f28e70a0da4f..2f5acdd71339 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -918,48 +918,6 @@ static int _rtl92e_wx_get_gen_ie(struct net_device *dev,
 	return ret;
 }
 
-#define OID_RT_INTEL_PROMISCUOUS_MODE	0xFF0101F6
-
-static int _rtl92e_wx_set_promisc_mode(struct net_device *dev,
-				       struct iw_request_info *info,
-				       union iwreq_data *wrqu, char *extra)
-{
-	struct r8192_priv *priv = rtllib_priv(dev);
-	struct rtllib_device *ieee = priv->rtllib;
-
-	u32 info_buf[3];
-
-	u32 oid;
-	u32 promiscuous_on;
-	u32 fltr_src_sta_frame;
-
-	if (copy_from_user(info_buf, wrqu->data.pointer, sizeof(info_buf)))
-		return -EFAULT;
-
-	oid = info_buf[0];
-	promiscuous_on = info_buf[1];
-	fltr_src_sta_frame = info_buf[2];
-
-	if (oid == OID_RT_INTEL_PROMISCUOUS_MODE) {
-		ieee->intel_promiscuous_md_info.promiscuous_on =
-					(promiscuous_on) ? (true) : (false);
-		ieee->intel_promiscuous_md_info.fltr_src_sta_frame =
-			(fltr_src_sta_frame) ? (true) : (false);
-		(promiscuous_on) ?
-		(rtllib_EnableIntelPromiscuousMode(dev, false)) :
-		(rtllib_DisableIntelPromiscuousMode(dev, false));
-
-		netdev_info(dev,
-			    "=======>%s(), on = %d, filter src sta = %d\n",
-			    __func__, promiscuous_on,
-			    fltr_src_sta_frame);
-	} else {
-		return -1;
-	}
-
-	return 0;
-}
-
 static int _rtl92e_wx_get_promisc_mode(struct net_device *dev,
 				       struct iw_request_info *info,
 				       union iwreq_data *wrqu, char *extra)
@@ -1037,9 +995,6 @@ static const struct iw_priv_args r8192_private_args[] = {
 		SIOCIWFIRSTPRIV + 0xb,
 		IW_PRIV_TYPE_INT | IW_PRIV_SIZE_FIXED | 1, IW_PRIV_TYPE_NONE,
 		"lps_force"
-	}, {
-		SIOCIWFIRSTPRIV + 0x16,
-		IW_PRIV_TYPE_INT | IW_PRIV_SIZE_FIXED | 3, 0, "setpromisc"
 	}, {
 		SIOCIWFIRSTPRIV + 0x17,
 		0, IW_PRIV_TYPE_CHAR | IW_PRIV_SIZE_FIXED | 45, "getpromisc"
@@ -1070,7 +1025,7 @@ static iw_handler r8192_private_handler[] = {
 	(iw_handler)NULL,
 	(iw_handler)NULL,
 	(iw_handler)NULL,
-	(iw_handler)_rtl92e_wx_set_promisc_mode,
+	(iw_handler)NULL,
 	(iw_handler)_rtl92e_wx_get_promisc_mode,
 };
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 546eedfeb43e..a02e8c976ca0 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1701,9 +1701,7 @@ void rtllib_stop_protocol(struct rtllib_device *ieee);
 
 void rtllib_EnableNetMonitorMode(struct net_device *dev, bool bInitState);
 void rtllib_DisableNetMonitorMode(struct net_device *dev, bool bInitState);
-void rtllib_EnableIntelPromiscuousMode(struct net_device *dev, bool bInitState);
-void rtllib_DisableIntelPromiscuousMode(struct net_device *dev,
-					bool bInitState);
+
 void rtllib_softmac_stop_protocol(struct rtllib_device *ieee);
 void rtllib_softmac_start_protocol(struct rtllib_device *ieee);
 
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 11395dbc9d4d..206f8e05d5d0 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -406,49 +406,6 @@ void rtllib_DisableNetMonitorMode(struct net_device *dev,
 	ieee->AllowAllDestAddrHandler(dev, false, !bInitState);
 }
 
-/* Enables the specialized promiscuous mode required by Intel.
- * In this mode, Intel intends to hear traffics from/to other STAs in the
- * same BSS. Therefore we don't have to disable checking BSSID and we only need
- * to allow all dest. BUT: if we enable checking BSSID then we can't recv
- * packets from other STA.
- */
-void rtllib_EnableIntelPromiscuousMode(struct net_device *dev,
-		bool bInitState)
-{
-	bool bFilterOutNonAssociatedBSSID = false;
-
-	struct rtllib_device *ieee = netdev_priv_rsl(dev);
-
-	netdev_info(dev, "========>Enter Intel Promiscuous Mode\n");
-
-	ieee->AllowAllDestAddrHandler(dev, true, !bInitState);
-	ieee->SetHwRegHandler(dev, HW_VAR_CECHK_BSSID,
-			     (u8 *)&bFilterOutNonAssociatedBSSID);
-
-	ieee->net_promiscuous_md = true;
-}
-EXPORT_SYMBOL(rtllib_EnableIntelPromiscuousMode);
-
-/* Disables the specialized promiscuous mode required by Intel.
- * See MgntEnableIntelPromiscuousMode for detail.
- */
-void rtllib_DisableIntelPromiscuousMode(struct net_device *dev,
-		bool bInitState)
-{
-	bool bFilterOutNonAssociatedBSSID = true;
-
-	struct rtllib_device *ieee = netdev_priv_rsl(dev);
-
-	netdev_info(dev, "========>Exit Intel Promiscuous Mode\n");
-
-	ieee->AllowAllDestAddrHandler(dev, false, !bInitState);
-	ieee->SetHwRegHandler(dev, HW_VAR_CECHK_BSSID,
-			     (u8 *)&bFilterOutNonAssociatedBSSID);
-
-	ieee->net_promiscuous_md = false;
-}
-EXPORT_SYMBOL(rtllib_DisableIntelPromiscuousMode);
-
 static void rtllib_send_probe(struct rtllib_device *ieee)
 {
 	struct sk_buff *skb;
-- 
2.42.0

