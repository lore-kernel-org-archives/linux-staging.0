Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FFA1E496
	for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 20:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSEyXWMj"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-407acb21f27so7000355e9.0
        for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 12:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701204225; x=1701809025; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ikCgusC8eEFeJmPuPKC5u+Kpxfzr4U1dFEb8bUETbj8=;
        b=CSEyXWMjuFTJhgCyGe4KR6EgRfUu4dc9CZddSNdCUtQkuUjIb0S1aGBYep0B4h1Za+
         KdTA17ovotpx8R2pZwyY6oElF1lbkjIalW3QMNSLi99pQexUu8MFrWBQ9Ae5HoK6FJAA
         pjJGXczJMeBcRayzfJKsnA7aN/XLlVTBn+Ed4vfPkJmXZwWoJpnKcsbGyyhD/WW/O1r5
         aqBV7t5Km9c8HcKgacegtVmkK8NcUQ2ZQEFloofLBgG4nUFicFH7yjysWq7ffATVcvCh
         NoVD+nk4pGcGbvCHznQwyJDpAbc842As1ABrYjeM7CF+X+1L7aak6joBYB6wUdDnEFh3
         7kzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701204225; x=1701809025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikCgusC8eEFeJmPuPKC5u+Kpxfzr4U1dFEb8bUETbj8=;
        b=mMFNJ2P7rPm+V14n2dncTfacW1j/Bat23WVRMZsZSMpd15E0CAu1LXJAFya4YKVZ46
         ligrOTA1uN/8Q8P0lsYb0hFG0XKdamk6xFhC4gxK5Cy1IlVhsALeRsxnei9ERudQge8a
         VSF6jfO6QOghKEj5rdoq2q26agELOkLJ/T+PqsOQ6x7an3pAeaXsNOMBrym0dOy3BrgA
         AOD3a+GmqI/g7sYuA9/lVAAKFBqiLz5m/8/f14gTuMIejbSp4pa+vpCysK1/yY2qMHg5
         ozMas8Ecj7PcQeov0dIZPnUnx+TUqQtQ9yWVahdvQdzMNZgS47nk+ZTRLLxv9SEtNUpf
         98Ow==
X-Gm-Message-State: AOJu0YwZ68CBV9fbDF1R2bEQhB5n5eNEmqADc+0opNKgMw61oYCzuDeo
	SeKribROJ0BYI8iGXRNOy4c=
X-Google-Smtp-Source: AGHT+IG+4DL5U+lBnGJYFFLiUW6H+Qu8GWLXVcDnIS9VLc8WKNgCpoFJhfyEg8tWzM5MQyaV3LR3CA==
X-Received: by 2002:a05:600c:54f0:b0:40b:4b69:b1a0 with SMTP id jb16-20020a05600c54f000b0040b4b69b1a0mr2379669wmb.3.1701204224692;
        Tue, 28 Nov 2023 12:43:44 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id a15-20020a05600c348f00b0040b33222a39sm19690937wmq.45.2023.11.28.12.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 12:43:44 -0800 (PST)
Date: Tue, 28 Nov 2023 21:43:43 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] staging: rtl8192e: Remove unused function
 rtllib_rx_DELBA()
Message-ID: <566083b9cba530e3b17074bd3410e686c1778f0d.1701202700.git.philipp.g.hortmann@gmail.com>
References: <cover.1701202700.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1701202700.git.philipp.g.hortmann@gmail.com>

Remove unused function rtllib_rx_DELBA().

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 62 -----------------------
 drivers/staging/rtl8192e/rtllib.h         |  1 -
 2 files changed, 63 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 4dadeb43b9a2..725139eb2deb 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -199,68 +199,6 @@ static void rtllib_send_DELBA(struct rtllib_device *ieee, u8 *dst,
 		netdev_dbg(ieee->dev, "Failed to generate DELBA packet.\n");
 }
 
-int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb)
-{
-	struct ieee80211_hdr_3addr *delba = NULL;
-	union delba_param_set *pDelBaParamSet = NULL;
-	u8 *dst = NULL;
-
-	if (skb->len < sizeof(struct ieee80211_hdr_3addr) + 6) {
-		netdev_warn(ieee->dev, "Invalid skb len in DELBA(%d / %d)\n",
-			    (int)skb->len,
-			    (int)(sizeof(struct ieee80211_hdr_3addr) + 6));
-		return -1;
-	}
-
-	if (!ieee->current_network.qos_data.active ||
-	    !ieee->ht_info->current_ht_support) {
-		netdev_warn(ieee->dev,
-			    "received DELBA while QOS or HT is not supported(%d, %d)\n",
-			    ieee->current_network. qos_data.active,
-			    ieee->ht_info->current_ht_support);
-		return -1;
-	}
-
-#ifdef VERBOSE_DEBUG
-	print_hex_dump_bytes("%s: ", DUMP_PREFIX_NONE, skb->data,
-			     __func__, skb->len);
-#endif
-	delba = (struct ieee80211_hdr_3addr *)skb->data;
-	dst = (u8 *)(&delba->addr2[0]);
-	pDelBaParamSet = (union delba_param_set *)&delba->seq_ctrl + 2;
-
-	if (pDelBaParamSet->field.initiator == 1) {
-		struct rx_ts_record *ts;
-
-		if (!rtllib_get_ts(ieee, (struct ts_common_info **)&ts, dst,
-			   (u8)pDelBaParamSet->field.tid, RX_DIR, false)) {
-			netdev_warn(ieee->dev,
-				    "%s(): can't get TS for RXTS. dst:%pM TID:%d\n",
-				    __func__, dst,
-				    (u8)pDelBaParamSet->field.tid);
-			return -1;
-		}
-
-		rx_ts_delete_ba(ieee, ts);
-	} else {
-		struct tx_ts_record *ts;
-
-		if (!rtllib_get_ts(ieee, (struct ts_common_info **)&ts, dst,
-			   (u8)pDelBaParamSet->field.tid, TX_DIR, false)) {
-			netdev_warn(ieee->dev, "%s(): can't get TS for TXTS\n",
-				    __func__);
-			return -1;
-		}
-
-		ts->using_ba = false;
-		ts->add_ba_req_in_progress = false;
-		ts->add_ba_req_delayed = false;
-		del_timer_sync(&ts->ts_add_ba_timer);
-		tx_ts_delete_ba(ieee, ts);
-	}
-	return 0;
-}
-
 void rtllib_ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *ts,
 			   u8 policy, u8	overwrite_pending)
 {
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 7d64855d835d..f1cd9eb96a7e 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1776,7 +1776,6 @@ u8 HTCCheck(struct rtllib_device *ieee, u8 *pFrame);
 void HTResetIOTSetting(struct rt_hi_throughput *ht_info);
 bool is_ht_half_nmode_aps(struct rtllib_device *ieee);
 u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate);
-int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb);
 void rtllib_ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *ts,
 			   u8 policy, u8 overwrite_pending);
 void rtllib_ts_init_del_ba(struct rtllib_device *ieee,
-- 
2.42.0

