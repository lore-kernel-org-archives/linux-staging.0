Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1ECD6139
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 15:02:11 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-65055aa4ed7so4406221b3a.3
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 08:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686150131; x=1688742131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zG5lPa3pt3CBh78GFYF12trQ1TmiLPYaWhXfF67zHG0=;
        b=fvS9ICf7N5XMNdzgrh45C2R3ReuaMK6GJBriQnHXs0Czvd5kFAFdhB2MeUD11cgxww
         Y9juJb9+7UyrACHWPXzuyF4j3BtDCEnCpxOEaD2Zmn9+xYt9zKPCyhS54JSo3FJpeLtD
         paBmgmY+Og8RqX9BHdfL7KguvfxIsK8DXboc8CvH4tz1gk1kL3gfaV/0k8lRJ9dseVkO
         ZTay6y56HSk2Vag9sf3Ok3MqubW3yh8OX67pXgHoxS5tT14V7YcJtrZx3MQ6QiS2j0WD
         3ZOJvzK9jx7W0SFciPjJKsXqQFJjoNS2M9F8oxFpLfC5QZNxiJDwxNXvLkFothhoTuOf
         V7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686150131; x=1688742131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zG5lPa3pt3CBh78GFYF12trQ1TmiLPYaWhXfF67zHG0=;
        b=d7bRjjMK7TeAsiMKhANx91ZaxxfWW9R/wvGURTl1d8hmlT+F98tzhxsk1G3wt1oFFw
         I/2BrpP9T0aW2ocrigxWzDYrvItzv+6pmnn3p4feh1O9m+iF3YPBQhlMfIdOlCf3Gwhw
         SSOL5WAoBPIUp00WBp/dS9Xf3P0kaAYCOw/TKLePdmbzhBOWE//y75XFlZ0yECUMP3Wf
         opFyQaB7nxB80IaT6532DVx7p7sW172a/LGwVdNeUQ/HDYw5REWpP1WhG37dGR828jnC
         zLnLyoWqgyc2R5lHhvWBGnPEnWYxBeE78VFQHtkFgnoTvmDHc9jPUQGpyPuyEtm2vteW
         jGqA==
X-Gm-Message-State: AC+VfDyz5BqL4kf91hY13f2WVb00ZlM1mCn0i7RAI1i+pdfo1+92AVlw
	g20LD6To5UYpPfD2yzq1RGe7mBDgSOY=
X-Google-Smtp-Source: ACHHUZ6h3Y9+P1svH1XAJ9BG/1uE9rCcobjW9vR+sGhuY7lgwDoF35Dt2eX4NYdlDEjqipeESYwzBQ==
X-Received: by 2002:a05:6a00:2284:b0:64d:6c6f:84f2 with SMTP id f4-20020a056a00228400b0064d6c6f84f2mr3234856pfe.19.1686150130489;
        Wed, 07 Jun 2023 08:02:10 -0700 (PDT)
Received: from yogi-Zephyrus ([103.251.210.211])
        by smtp.gmail.com with ESMTPSA id c14-20020aa78e0e000000b0063d24fcc2besm8524214pfr.125.2023.06.07.08.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 08:02:10 -0700 (PDT)
Date: Wed, 7 Jun 2023 20:32:06 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] staging: rtl8192e: Remove variable SetBWModeHandler
Message-ID: <0af9595916447a28e27c249f3696fe107382ca53.1686149467.git.yogi.kernel@gmail.com>
References: <cover.1686149467.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1686149467.git.yogi.kernel@gmail.com>

The variable SetBWModeHandler is set in only one place throughout the
driver. This patch removes the variable and calls the real function
directly instead, eliminating the unnecessary indirection.
Additionally, the removal of the variable aligns with the checkpatch
guidelines by removing the use of CamelCase.

Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
---

v2: Removed the variable and called the function direction instead of
    just renaming the variable as suggested by Greg Kroah-Hartman
    <gregkh@linuxfoundation.org>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 1 -
 drivers/staging/rtl8192e/rtl819x_HTProc.c    | 8 ++++----
 drivers/staging/rtl8192e/rtllib.h            | 3 ---
 drivers/staging/rtl8192e/rtllib_softmac_wx.c | 6 +++---
 4 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index bbe0864e1348..6f6c31344441 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -717,7 +717,6 @@ static void _rtl92e_init_priv_handler(struct net_device *dev)
 	priv->rtllib->handle_assoc_response	= _rtl92e_handle_assoc_response;
 	priv->rtllib->handle_beacon		= _rtl92e_handle_beacon;
 	priv->rtllib->LeisurePSLeave		= rtl92e_leisure_ps_leave;
-	priv->rtllib->SetBWModeHandler		= rtl92e_set_bw_mode;
 	priv->rf_set_chan			= rtl92e_set_channel;
 
 	priv->rtllib->start_send_beacons = rtl92e_start_beacon;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index fe30a291e64c..ad92a8230055 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -6,6 +6,8 @@
  */
 #include "rtllib.h"
 #include "rtl819x_HT.h"
+#include "rtl8192e/r8192E_phy.h"
+
 u8 MCS_FILTER_ALL[16] = {
 	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
 	0xff, 0x1f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
@@ -835,12 +837,10 @@ static void HTSetConnectBwModeCallback(struct rtllib_device *ieee)
 			ieee->set_chan(ieee->dev,
 				       ieee->current_network.channel);
 
-		ieee->SetBWModeHandler(ieee->dev, HT_CHANNEL_WIDTH_20_40,
-				       ht_info->CurSTAExtChnlOffset);
+		rtl92e_set_bw_mode(ieee->dev, HT_CHANNEL_WIDTH_20_40, ht_info->CurSTAExtChnlOffset);
 	} else {
 		ieee->set_chan(ieee->dev, ieee->current_network.channel);
-		ieee->SetBWModeHandler(ieee->dev, HT_CHANNEL_WIDTH_20,
-				       HT_EXTCHNL_OFFSET_NO_EXT);
+		rtl92e_set_bw_mode(ieee->dev, HT_CHANNEL_WIDTH_20, HT_EXTCHNL_OFFSET_NO_EXT);
 	}
 
 	ht_info->sw_bw_in_progress = false;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 68a3b8af3119..d22a586043f2 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1706,9 +1706,6 @@ struct rtllib_device {
 
 	/* check whether Tx hw resource available */
 	short (*check_nic_enough_desc)(struct net_device *dev, int queue_index);
-	void (*SetBWModeHandler)(struct net_device *dev,
-				 enum ht_channel_width bandwidth,
-				 enum ht_extchnl_offset Offset);
 	bool (*GetNmodeSupportBySecCfg)(struct net_device *dev);
 	bool (*GetHalfNmodeSupportByAPsHandler)(struct net_device *dev);
 	u8   (*rtllib_ap_sec_type)(struct rtllib_device *ieee);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index d85a32d2d050..9fb4fee93990 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -15,6 +15,7 @@
 
 #include "rtllib.h"
 #include "dot11d.h"
+#include "rtl8192e/r8192E_phy.h"
 /* FIXME: add A freqs */
 
 const long rtllib_wlan_frequencies[] = {
@@ -359,8 +360,7 @@ void rtllib_wx_sync_scan_wq(void *data)
 		b40M = 1;
 		chan_offset = ieee->ht_info->CurSTAExtChnlOffset;
 		bandwidth = (enum ht_channel_width)ieee->ht_info->bCurBW40MHz;
-		ieee->SetBWModeHandler(ieee->dev, HT_CHANNEL_WIDTH_20,
-				       HT_EXTCHNL_OFFSET_NO_EXT);
+		rtl92e_set_bw_mode(ieee->dev, HT_CHANNEL_WIDTH_20, HT_EXTCHNL_OFFSET_NO_EXT);
 	}
 
 	rtllib_start_scan_syncro(ieee, 0);
@@ -372,7 +372,7 @@ void rtllib_wx_sync_scan_wq(void *data)
 			ieee->set_chan(ieee->dev, chan - 2);
 		else
 			ieee->set_chan(ieee->dev, chan);
-		ieee->SetBWModeHandler(ieee->dev, bandwidth, chan_offset);
+		rtl92e_set_bw_mode(ieee->dev, bandwidth, chan_offset);
 	} else {
 		ieee->set_chan(ieee->dev, chan);
 	}
-- 
2.25.1

