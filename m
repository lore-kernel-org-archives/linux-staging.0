Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A193E1E496
	for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 20:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCpTIjMA"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40b2a628c25so4631725e9.1
        for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 12:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701204205; x=1701809005; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=njp3hQuRezyJWSCVkGDJUsCKh4qNw0wNTvM+MC2XVcU=;
        b=iCpTIjMAaeXOwWJbo0FozcwuuPN/XuysdBE5EnpaMId2uFc0ZErWu2q61dISInxmW9
         LkiJ2G7fPmJGs7rq7yd/9OAwSImCSGdjVx8B6FM5docllQEnek3JTmNp8sqv4zhvtaPh
         tLBh/XQLo9X3pn/AjpE/7Kq7e4YlNqd1Emo+EVkdMll9gfN9oWTePVNKa0ssAxoQVQJL
         txQSfAnlzPjh3l6MiJVxLNi7xEfhCfcWfHgtbDYsjPG4qGV6iUVzhY3i6nVuF4pkJdNU
         mFkOQrzrLfjxKdnMf+FsVKGA/B9fQb5yojafGrv5N2WzS1ndsjGqWVltJ3gSUfLd86ZT
         24Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701204205; x=1701809005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=njp3hQuRezyJWSCVkGDJUsCKh4qNw0wNTvM+MC2XVcU=;
        b=UDDgvxU77lzPgaZPAibe/SBaTr0FN38voa+CTBe9s4gpsTZKSbm44zB45afC0+DKO5
         iyG4tcAYBKRO2tbUJQF+WhMNhuI88Qkkwr0nJOTjb9WkM1wLpA9v0NbAYGkmmyKuYPnr
         IXnRoPTwcDKCAS4p0UQD9jL8cpjnVSuRRkQk1vIyrXFZnuvS70a4TsmrXMjCmPP/7piS
         jIDxTVeZVusaJ/V1faVORfMb311h2uWF8BHnS4MKExlej1qaHqCBTnFSM+4HYOQvsQQO
         0+DdckIx2S85sIgPfLhPL3QdijAgi8v9hapIw1hNUGTz8az3fmMglgGgg8OZUSpWDuNN
         yYgg==
X-Gm-Message-State: AOJu0YzG68RWs61tcl2Lc9rhV34l/e58qxz+4zO/szCllkHweoBjGOfi
	4l8KdOt1mN3LAGOXXYzUW3+AvpTE49c=
X-Google-Smtp-Source: AGHT+IEQfvjYlyaAeEil/4U/m1nR0QEYZPOaulItD2Mjk+Gd1cU3ERzypFclLTg8QTfW8LrBULR8nA==
X-Received: by 2002:a05:600c:1d06:b0:40b:5150:c046 with SMTP id l6-20020a05600c1d0600b0040b5150c046mr404729wms.3.1701204204641;
        Tue, 28 Nov 2023 12:43:24 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id t6-20020a05600c450600b0040b379e8526sm12609152wmo.25.2023.11.28.12.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 12:43:24 -0800 (PST)
Date: Tue, 28 Nov 2023 21:43:23 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] staging: rtl8192e: Remove unused function
 rtllib_rx_ADDBAReq()
Message-ID: <a6ca4855f64f7dea9d05e33d030a05f86ab58c19.1701202700.git.philipp.g.hortmann@gmail.com>
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

Remove unused function rtllib_rx_ADDBAReq().

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 89 -----------------------
 drivers/staging/rtl8192e/rtllib.h         |  1 -
 2 files changed, 90 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 58a950ef77ce..7e4aeb10a2db 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -211,95 +211,6 @@ static void rtllib_send_DELBA(struct rtllib_device *ieee, u8 *dst,
 		netdev_dbg(ieee->dev, "Failed to generate DELBA packet.\n");
 }
 
-int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb)
-{
-	struct ieee80211_hdr_3addr *req = NULL;
-	u16 rc = 0;
-	u8 *dst = NULL, *dialog_token = NULL, *tag = NULL;
-	struct ba_record *ba = NULL;
-	union ba_param_set *ba_param_set = NULL;
-	u16 *ba_timeout_value = NULL;
-	union sequence_control *pBaStartSeqCtrl = NULL;
-	struct rx_ts_record *ts = NULL;
-
-	if (skb->len < sizeof(struct ieee80211_hdr_3addr) + 9) {
-		netdev_warn(ieee->dev, "Invalid skb len in BAREQ(%d / %d)\n",
-			    (int)skb->len,
-			    (int)(sizeof(struct ieee80211_hdr_3addr) + 9));
-		return -1;
-	}
-
-#ifdef VERBOSE_DEBUG
-	print_hex_dump_bytes("%s: ", DUMP_PREFIX_NONE, __func__,
-			     skb->data, skb->len);
-#endif
-
-	req = (struct ieee80211_hdr_3addr *)skb->data;
-	tag = (u8 *)req;
-	dst = (u8 *)(&req->addr2[0]);
-	tag += sizeof(struct ieee80211_hdr_3addr);
-	dialog_token = tag + 2;
-	ba_param_set = (union ba_param_set *)(tag + 3);
-	ba_timeout_value = (u16 *)(tag + 5);
-	pBaStartSeqCtrl = (union sequence_control *)(req + 7);
-
-	if (!ieee->current_network.qos_data.active ||
-	    !ieee->ht_info->current_ht_support ||
-	    (ieee->ht_info->iot_action & HT_IOT_ACT_REJECT_ADDBA_REQ)) {
-		rc = ADDBA_STATUS_REFUSED;
-		netdev_warn(ieee->dev,
-			    "Failed to reply on ADDBA_REQ as some capability is not ready(%d, %d)\n",
-			    ieee->current_network.qos_data.active,
-			    ieee->ht_info->current_ht_support);
-		goto OnADDBAReq_Fail;
-	}
-	if (!rtllib_get_ts(ieee, (struct ts_common_info **)&ts, dst,
-		   (u8)(ba_param_set->field.tid), RX_DIR, true)) {
-		rc = ADDBA_STATUS_REFUSED;
-		netdev_warn(ieee->dev, "%s(): can't get TS\n", __func__);
-		goto OnADDBAReq_Fail;
-	}
-	ba = &ts->rx_admitted_ba_record;
-
-	if (ba_param_set->field.ba_policy == BA_POLICY_DELAYED) {
-		rc = ADDBA_STATUS_INVALID_PARAM;
-		netdev_warn(ieee->dev, "%s(): BA Policy is not correct\n",
-			    __func__);
-		goto OnADDBAReq_Fail;
-	}
-
-	rtllib_FlushRxTsPendingPkts(ieee, ts);
-
-	deactivate_ba_entry(ieee, ba);
-	ba->dialog_token = *dialog_token;
-	ba->ba_param_set = *ba_param_set;
-	ba->ba_timeout_value = *ba_timeout_value;
-	ba->ba_start_seq_ctrl = *pBaStartSeqCtrl;
-
-	if (ieee->GetHalfNmodeSupportByAPsHandler(ieee->dev) ||
-	   (ieee->ht_info->iot_action & HT_IOT_ACT_ALLOW_PEER_AGG_ONE_PKT))
-		ba->ba_param_set.field.buffer_size = 1;
-	else
-		ba->ba_param_set.field.buffer_size = 32;
-
-	activate_ba_entry(ba, 0);
-	rtllib_send_ADDBARsp(ieee, dst, ba, ADDBA_STATUS_SUCCESS);
-
-	return 0;
-
-OnADDBAReq_Fail:
-	{
-		struct ba_record BA;
-
-		BA.ba_param_set = *ba_param_set;
-		BA.ba_timeout_value = *ba_timeout_value;
-		BA.dialog_token = *dialog_token;
-		BA.ba_param_set.field.ba_policy = BA_POLICY_IMMEDIATE;
-		rtllib_send_ADDBARsp(ieee, dst, &BA, rc);
-		return 0;
-	}
-}
-
 int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 {
 	struct ieee80211_hdr_3addr *rsp = NULL;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 0a8c44e497f5..44a937953db8 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1776,7 +1776,6 @@ u8 HTCCheck(struct rtllib_device *ieee, u8 *pFrame);
 void HTResetIOTSetting(struct rt_hi_throughput *ht_info);
 bool is_ht_half_nmode_aps(struct rtllib_device *ieee);
 u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate);
-int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb);
 int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb);
 int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb);
 void rtllib_ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *ts,
-- 
2.42.0

