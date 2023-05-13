Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615F66FA3
	for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 18:08:54 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9659dee48edso302716466b.0
        for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 11:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684001332; x=1686593332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5/2jtntFcCEy2HLu74Pr7lsSBwQYzCqz7UQ3TltHgMM=;
        b=I7um9lN73aB3KVdmHhTH3v+3GZKH1TEyOVqVzE3qOHH1iCW447Qp2KTVwX++rS88dh
         8kB+qG05V6xfO6mofnRgzfD8x9LW8ZGdQvrz+AVgCIzjznM4KidIqjNYIN8DnNVDvB1A
         /fnhWzH7EWRmjaeeUiIDx+l+X7UVyweDQo5kNMHY6/jopeAnaSNvkln2G1oNzs4OCb9T
         PrOuwuCra4E8/+Eg/WM8eAn4y8atBc7oNst+cSDZQ7Dg9CWpAjE+go6Z0PEODWW8qyEN
         d+re04MdYJCWWOanvrlQx8k9iOgRVqWvhHSjs4wEPljA89npi6no5rF5riWHFnwLCDj1
         a0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684001332; x=1686593332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/2jtntFcCEy2HLu74Pr7lsSBwQYzCqz7UQ3TltHgMM=;
        b=Fn7+fKHBZJ2YU4Xx/8H7mqElyihKS+54aHJ6gRiQjGf0ODgg8pVz1yeG3hPe9beIA4
         15E0GaD6wJk+0laNP19nEFaa3mOcGBK6gbT/qCjmrsRJTS7OCG2g+T5ujiFrApNEQdIp
         4/i+VlT5HPlk+j4JKNu3/UQgziUiH5QDQKO6O22PUesQSGfY1OI34bpmVmHYIHx7GfBr
         uUFgg52Al4bc88bYffMyyE1cMwAdDc2JYc6ftYp4LApzcB+86tywP6TAT33xm+kNCyk9
         US90qc9xPY7P77RKHUmRLHepocTNIrVnH4e7XmAa+rdkLKHDBwv3+DsVHspogTzuj/y7
         8LSg==
X-Gm-Message-State: AC+VfDwZL0f91DjsEZ6S2BqBWaEtMtiBTsXK9mQ39HT5uIZ1QTZ8wOg5
	ASpB/zyvFYDY6Slv+Lt9AhU+RU5Hcws=
X-Google-Smtp-Source: ACHHUZ4AcNbu25m6sJyt27XScjARpWHHXNOJ2uu2aSdEI+Rp+jk1TOoMGgmjiEM442HnQEuiN/Bkog==
X-Received: by 2002:a17:906:14e:b0:965:9602:3ee1 with SMTP id 14-20020a170906014e00b0096596023ee1mr22936127ejh.2.1684001332326;
        Sat, 13 May 2023 11:08:52 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935e01.dip0.t-ipconnect.de. [87.147.94.1])
        by smtp.gmail.com with ESMTPSA id va8-20020a17090711c800b0094f282fc29asm6887951ejb.207.2023.05.13.11.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 11:08:51 -0700 (PDT)
Date: Sat, 13 May 2023 20:08:50 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] staging: rtl8192e: Remove undefined function
 data_hard_resume
Message-ID: <07048d775759fffe1d1c63d0416214da8311129a.1683960684.git.philipp.g.hortmann@gmail.com>
References: <cover.1683960684.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1683960684.git.philipp.g.hortmann@gmail.com>

Remove function data_hard_resume as it is not defined.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h            |  3 ---
 drivers/staging/rtl8192e/rtllib_softmac.c    | 18 +-----------------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c | 10 +---------
 3 files changed, 2 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index b356cde80f84..9b49a15de889 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1682,9 +1682,6 @@ struct rtllib_device {
 	void (*softmac_data_hard_start_xmit)(struct sk_buff *skb,
 			       struct net_device *dev, int rate);
 
-	/* OK this is complementing to data_poll_hard_stop */
-	void (*data_hard_resume)(struct net_device *dev);
-
 	/* ask to the driver to retune the radio.
 	 * This function can sleep. the driver should ensure
 	 * the radio has been switched before return.
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 65eecbc94b93..fe36a52b4c91 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1546,10 +1546,6 @@ static void rtllib_associate_complete_wq(void *data)
 		netdev_info(ieee->dev, "silent reset associate\n");
 		ieee->is_silent_reset = false;
 	}
-
-	if (ieee->data_hard_resume)
-		ieee->data_hard_resume(ieee->dev);
-
 }
 
 static void rtllib_sta_send_associnfo(struct rtllib_device *ieee)
@@ -2534,22 +2530,14 @@ static void rtllib_start_master_bss(struct rtllib_device *ieee)
 	ieee->state = RTLLIB_LINKED;
 	ieee->link_change(ieee->dev);
 	notify_wx_assoc_event(ieee);
-
-	if (ieee->data_hard_resume)
-		ieee->data_hard_resume(ieee->dev);
-
 	netif_carrier_on(ieee->dev);
 }
 
 static void rtllib_start_monitor_mode(struct rtllib_device *ieee)
 {
 	/* reset hardware status */
-	if (ieee->raw_tx) {
-		if (ieee->data_hard_resume)
-			ieee->data_hard_resume(ieee->dev);
-
+	if (ieee->raw_tx)
 		netif_carrier_on(ieee->dev);
-	}
 }
 
 static void rtllib_start_ibss_wq(void *data)
@@ -2674,10 +2662,6 @@ static void rtllib_start_ibss_wq(void *data)
 	rtllib_start_send_beacons(ieee);
 
 	notify_wx_assoc_event(ieee);
-
-	if (ieee->data_hard_resume)
-		ieee->data_hard_resume(ieee->dev);
-
 	netif_carrier_on(ieee->dev);
 
 	mutex_unlock(&ieee->wx_mutex);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index d7166d6772df..371864f0087f 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -389,10 +389,6 @@ void rtllib_wx_sync_scan_wq(void *data)
 		ieee->link_detect_info.NumRecvBcnInPeriod = 1;
 		ieee->link_detect_info.NumRecvDataInPeriod = 1;
 	}
-
-	if (ieee->data_hard_resume)
-		ieee->data_hard_resume(ieee->dev);
-
 	if (ieee->iw_mode == IW_MODE_ADHOC || ieee->iw_mode == IW_MODE_MASTER)
 		rtllib_start_send_beacons(ieee);
 
@@ -505,12 +501,8 @@ int rtllib_wx_set_rawtx(struct rtllib_device *ieee,
 		    ieee->raw_tx ? "enabled" : "disabled");
 
 	if (ieee->iw_mode == IW_MODE_MONITOR) {
-		if (prev == 0 && ieee->raw_tx) {
-			if (ieee->data_hard_resume)
-				ieee->data_hard_resume(ieee->dev);
-
+		if (prev == 0 && ieee->raw_tx)
 			netif_carrier_on(ieee->dev);
-		}
 
 		if (prev && ieee->raw_tx == 1)
 			netif_carrier_off(ieee->dev);
-- 
2.40.1

