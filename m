Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AC227707
	for <linux-staging@lists.linux.dev>; Fri, 22 Sep 2023 13:29:52 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-405101a02bcso7332075e9.1
        for <linux-staging@lists.linux.dev>; Fri, 22 Sep 2023 06:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695389390; x=1695994190; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HcI62QI75qSosGu186RGvSHgdJGB0VnvRx/uN1ATU0o=;
        b=FPliFGXhBRe8IpmFz+Su5r2vcRxv63AEp6TjjJC0kChhPvtb9SGnRF8/chsB3V9wqR
         JvqU2EqYALDOf2a2MB8lspwPx/TcW/9JoDNxNqciqwfqd0KuZX83OJRineh4Ip2GcqUj
         VXSedEZ7eUiLGzY6EbuWPCMcQHvrcvNZfd8xdb+OOszlI61xiHHBGzEGw4aszZUSyotV
         w6QcQJeX8jyYF7S2yez4KfvSwbJ/0PKRqKLUx5S2S1gpoHagw/lSGJ6mnz7QSN+E3wMO
         P4ptL8EnY3uLPQlmvej49SEkruGc1R8hMdbq3t8Lyoe0GLKjlaxAzabeUsM+Qtskwq3F
         KoGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695389390; x=1695994190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcI62QI75qSosGu186RGvSHgdJGB0VnvRx/uN1ATU0o=;
        b=iya8dklUtJv23LUJROXOiVie1taDai4m5DsLrUd53KzD0MyxalXNWePjMoJXkHKkMf
         J13uxht9in5Od4m+CaEIGIJbo7M5YqSsmJo43aRQ1orO2igZvmmb0RlRttG1+L225vxf
         8XUNly9ukFaraBE//33TbgLeI4xI9I1QSPV/mU0Pz2ksb1rzNae8CPaQN/esL2KRs1lW
         VpUF0BtmgRg1ZaWFxGuWDoR28WJ61cg8NGX+dqEqFGekLeY4BzLL7SDrobq3ICkFxX9X
         IPSqKQ/syjGd+6lSqP2VZifesUjDIv1wPVtZM9/Z2MaH2N8kmiFgwrroFm0ITfWhv0Sj
         mVWA==
X-Gm-Message-State: AOJu0Yx+/17NCu0Rt38YKyHXhyoqcMl5oRn4Ky/1QnqBdGCRZRf5S8/R
	PEjAj6UWVCZbinHUWhVX+Ihs9eKFeG33jQ==
X-Google-Smtp-Source: AGHT+IGQRQFe9jhqT8lg62fGPGY2Cu7F6rL0aH6007Agc6Zo4ZJv0iyyy6y5hM8I+tmjSHPdUV+1Zw==
X-Received: by 2002:a5d:5443:0:b0:317:8fd:f01a with SMTP id w3-20020a5d5443000000b0031708fdf01amr7696229wrv.7.1695389390611;
        Fri, 22 Sep 2023 06:29:50 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id p5-20020a056000018500b0031c855d52efsm4449243wrx.87.2023.09.22.06.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 06:29:50 -0700 (PDT)
Date: Fri, 22 Sep 2023 15:29:47 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] staging: rtl8192e: Remove mode IW_MODE_ADHOC from
 rtllib_softmac.c
Message-ID: <4259c06deaf2e3f3cc615e8c55bcf6f70ce4e277.1695387832.git.philipp.g.hortmann@gmail.com>
References: <cover.1695387832.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1695387832.git.philipp.g.hortmann@gmail.com>

Remove unsupported mode IW_MODE_ADHOC from rtllib_softmac.c.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h         |  1 -
 drivers/staging/rtl8192e/rtllib_softmac.c | 45 +----------------------
 2 files changed, 1 insertion(+), 45 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 7dde428313c9..d10fddd4f9ad 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1702,7 +1702,6 @@ void rtllib_softmac_new_net(struct rtllib_device *ieee,
 void SendDisassociation(struct rtllib_device *ieee, bool deauth, u16 asRsn);
 void rtllib_softmac_xmit(struct rtllib_txb *txb, struct rtllib_device *ieee);
 
-void rtllib_start_ibss(struct rtllib_device *ieee);
 int rtllib_softmac_init(struct rtllib_device *ieee);
 void rtllib_softmac_free(struct rtllib_device *ieee);
 void rtllib_disassociate(struct rtllib_device *ieee);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index d8d9d59664ed..434690eeed5c 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -901,8 +901,6 @@ static struct sk_buff *rtllib_probe_resp(struct rtllib_device *ieee,
 	}
 
 	if (wpa_ie_len) {
-		if (ieee->iw_mode == IW_MODE_ADHOC)
-			memcpy(&ieee->wpa_ie[14], &ieee->wpa_ie[8], 4);
 		memcpy(tag, ieee->wpa_ie, ieee->wpa_ie_len);
 		tag += ieee->wpa_ie_len;
 	}
@@ -1437,14 +1435,7 @@ inline void rtllib_softmac_new_net(struct rtllib_device *ieee,
 	    WLAN_CAPABILITY_ESS))
 		return;
 
-	if ((ieee->iw_mode == IW_MODE_ADHOC) && !(net->capability &
-	     WLAN_CAPABILITY_IBSS))
-		return;
-
-	if ((ieee->iw_mode == IW_MODE_ADHOC) &&
-	    (net->channel > ieee->ibss_maxjoin_chal))
-		return;
-	if (ieee->iw_mode == IW_MODE_INFRA || ieee->iw_mode == IW_MODE_ADHOC) {
+	if (ieee->iw_mode == IW_MODE_INFRA) {
 		/* if the user specified the AP MAC, we need also the essid
 		 * This could be obtained by beacons or, if the network does not
 		 * broadcast it, it can be put manually.
@@ -2308,11 +2299,6 @@ static void rtllib_start_ibss_wq(void *data)
 	mutex_unlock(&ieee->wx_mutex);
 }
 
-inline void rtllib_start_ibss(struct rtllib_device *ieee)
-{
-	schedule_delayed_work(&ieee->start_ibss_wq, msecs_to_jiffies(150));
-}
-
 /* this is called only in user context, with wx_mutex held */
 static void rtllib_start_bss(struct rtllib_device *ieee)
 {
@@ -2546,9 +2532,6 @@ void rtllib_start_protocol(struct rtllib_device *ieee)
 	case IW_MODE_INFRA:
 		rtllib_start_bss(ieee);
 		break;
-	case IW_MODE_ADHOC:
-		rtllib_start_ibss(ieee);
-		break;
 	case IW_MODE_MONITOR:
 		rtllib_start_monitor_mode(ieee);
 		break;
@@ -2745,30 +2728,6 @@ u8 rtllib_ap_sec_type(struct rtllib_device *ieee)
 	}
 }
 
-static void rtllib_MgntDisconnectIBSS(struct rtllib_device *rtllib)
-{
-	u8	OpMode;
-	u8	i;
-	bool	bFilterOutNonAssociatedBSSID = false;
-
-	rtllib->link_state = MAC80211_NOLINK;
-
-	for (i = 0; i < 6; i++)
-		rtllib->current_network.bssid[i] = 0x55;
-
-	rtllib->OpMode = RT_OP_MODE_NO_LINK;
-	rtllib->SetHwRegHandler(rtllib->dev, HW_VAR_BSSID,
-				rtllib->current_network.bssid);
-	OpMode = RT_OP_MODE_NO_LINK;
-	rtllib->SetHwRegHandler(rtllib->dev, HW_VAR_MEDIA_STATUS, &OpMode);
-	rtllib_stop_send_beacons(rtllib);
-
-	bFilterOutNonAssociatedBSSID = false;
-	rtllib->SetHwRegHandler(rtllib->dev, HW_VAR_CECHK_BSSID,
-				(u8 *)(&bFilterOutNonAssociatedBSSID));
-	notify_wx_assoc_event(rtllib);
-}
-
 static void rtllib_MlmeDisassociateRequest(struct rtllib_device *rtllib,
 					   u8 *asSta, u8 asRsn)
 {
@@ -2816,8 +2775,6 @@ bool rtllib_MgntDisconnect(struct rtllib_device *rtllib, u8 asRsn)
 		rtllib->sta_wake_up(rtllib->dev);
 
 	if (rtllib->link_state == MAC80211_LINKED) {
-		if (rtllib->iw_mode == IW_MODE_ADHOC)
-			rtllib_MgntDisconnectIBSS(rtllib);
 		if (rtllib->iw_mode == IW_MODE_INFRA)
 			rtllib_MgntDisconnectAP(rtllib, asRsn);
 	}
-- 
2.42.0

