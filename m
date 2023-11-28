Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E9C1E496
	for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 20:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQ1s6ZX1"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40b3febbce3so4486015e9.1
        for <linux-staging@lists.linux.dev>; Tue, 28 Nov 2023 12:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701204220; x=1701809020; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V6Qf6Ds+xSBk1DuDIL8ubxSxi2PW7CPsIXUHtrOAG3o=;
        b=ZQ1s6ZX1wQV9Uia6pG6boSuRjxpY4HGfKJPr0XqTT5dO/hVapA151J4rOZiK3iCofb
         Ypb/fUe5YLyHjazxEHvJF1bHjbwzMamizIywdoRTqo7QbbK8Z4WxWhMsxEjoQtvxXqQA
         IoidbJ7bzuwZoAKEMZcC7r6+9peoFytKj+jHSxjxsAOEHiMHAbOn0R81gu/sfqXLV9dv
         3EmOiRuhrbQg7+A2Sfx1zhHMmjsQBLk419nMpR8UJ50jsECTyffVgrq2TvKzqw/+yFn7
         d3o8iyR2pBLM0jVu+hBiarpvfNHr+Liv0L07vFO0gkQnrdgRgArKNSCM2uuj8D2uwTyi
         whqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701204220; x=1701809020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6Qf6Ds+xSBk1DuDIL8ubxSxi2PW7CPsIXUHtrOAG3o=;
        b=g9wpoLLEsaG0FKrn7hFfySkO0FAlNfO89WkTI1KAi5TTAOyJI+o+bKI6+y9hVoV3mN
         0KKofGOGFgkPwFHIdoiOoYu7LgfDC3Fo+coD0sXaTeJYTYqdo7QeaW9XrK/fpgeYmx2O
         rC5+01HIif02DdFVPbn/w/emgFcvDM6L6g0aJoxsOBaDT9TaPvjj1ym/QiDJiYZTFfo6
         QCFaAgOHQXXZbH2rZ8viKpSVJvkRNK0r7m7lYSWsBCYPWh3fUqdY4LpaoqQ1FGd9m3nm
         DIN4hdr5STdTKx3TeoSQstYZZlJdOsjdmeyhLyIFRKijS4/ZRWJT1vHhL27zGf2aC1Ca
         FT3A==
X-Gm-Message-State: AOJu0Ywf6/kc/0E4ErQ1s5YSQHOBCTjpsAN+EOrHu7lKQFAzueE7baZo
	c3LNURJit20ejyh0iXDe4oo=
X-Google-Smtp-Source: AGHT+IHEPPikV4JDUR5JxX1PD4KRWwMnJ7GX2ocREky+rQtZml498ByDf3mWA64CYNJckjAX+Ri86A==
X-Received: by 2002:a05:600c:3b0c:b0:40b:2708:2a52 with SMTP id m12-20020a05600c3b0c00b0040b27082a52mr11322988wms.1.1701204219639;
        Tue, 28 Nov 2023 12:43:39 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id b5-20020a05600c4e0500b003feae747ff2sm19621595wmq.35.2023.11.28.12.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 12:43:39 -0800 (PST)
Date: Tue, 28 Nov 2023 21:43:38 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] staging: rtl8192e: Remove unused function
 rtllib_rx_ADDBARsp()
Message-ID: <988974fbec7d28455bb575eb52cfe1b974ce8293.1701202700.git.philipp.g.hortmann@gmail.com>
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

Remove unused function rtllib_rx_ADDBARsp().

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 99 -----------------------
 drivers/staging/rtl8192e/rtllib.h         |  1 -
 2 files changed, 100 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index fab7ced1b8c3..4dadeb43b9a2 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -199,105 +199,6 @@ static void rtllib_send_DELBA(struct rtllib_device *ieee, u8 *dst,
 		netdev_dbg(ieee->dev, "Failed to generate DELBA packet.\n");
 }
 
-int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
-{
-	struct ieee80211_hdr_3addr *rsp = NULL;
-	struct ba_record *pending_ba, *admitted_ba;
-	struct tx_ts_record *ts = NULL;
-	u8 *dst = NULL, *dialog_token = NULL, *tag = NULL;
-	u16 *status_code = NULL, *ba_timeout_value = NULL;
-	union ba_param_set *ba_param_set = NULL;
-	u16			reason_code;
-
-	if (skb->len < sizeof(struct ieee80211_hdr_3addr) + 9) {
-		netdev_warn(ieee->dev, "Invalid skb len in BARSP(%d / %d)\n",
-			    (int)skb->len,
-			    (int)(sizeof(struct ieee80211_hdr_3addr) + 9));
-		return -1;
-	}
-	rsp = (struct ieee80211_hdr_3addr *)skb->data;
-	tag = (u8 *)rsp;
-	dst = (u8 *)(&rsp->addr2[0]);
-	tag += sizeof(struct ieee80211_hdr_3addr);
-	dialog_token = tag + 2;
-	status_code = (u16 *)(tag + 3);
-	ba_param_set = (union ba_param_set *)(tag + 5);
-	ba_timeout_value = (u16 *)(tag + 7);
-
-	if (!ieee->current_network.qos_data.active ||
-	    !ieee->ht_info->current_ht_support ||
-	    !ieee->ht_info->current_ampdu_enable) {
-		netdev_warn(ieee->dev,
-			    "reject to ADDBA_RSP as some capability is not ready(%d, %d, %d)\n",
-			    ieee->current_network.qos_data.active,
-			    ieee->ht_info->current_ht_support,
-			    ieee->ht_info->current_ampdu_enable);
-		reason_code = DELBA_REASON_UNKNOWN_BA;
-		goto OnADDBARsp_Reject;
-	}
-
-	if (!rtllib_get_ts(ieee, (struct ts_common_info **)&ts, dst,
-		   (u8)(ba_param_set->field.tid), TX_DIR, false)) {
-		netdev_warn(ieee->dev, "%s(): can't get TS\n", __func__);
-		reason_code = DELBA_REASON_UNKNOWN_BA;
-		goto OnADDBARsp_Reject;
-	}
-
-	ts->add_ba_req_in_progress = false;
-	pending_ba = &ts->tx_pending_ba_record;
-	admitted_ba = &ts->tx_admitted_ba_record;
-
-	if (admitted_ba->b_valid) {
-		netdev_dbg(ieee->dev, "%s(): ADDBA response already admitted\n",
-			   __func__);
-		return -1;
-	} else if (!pending_ba->b_valid ||
-		   (*dialog_token != pending_ba->dialog_token)) {
-		netdev_warn(ieee->dev,
-			    "%s(): ADDBA Rsp. BA invalid, DELBA!\n",
-			    __func__);
-		reason_code = DELBA_REASON_UNKNOWN_BA;
-		goto OnADDBARsp_Reject;
-	} else {
-		netdev_dbg(ieee->dev,
-			   "%s(): Recv ADDBA Rsp. BA is admitted! Status code:%X\n",
-			   __func__, *status_code);
-		deactivate_ba_entry(ieee, pending_ba);
-	}
-
-	if (*status_code == ADDBA_STATUS_SUCCESS) {
-		if (ba_param_set->field.ba_policy == BA_POLICY_DELAYED) {
-			ts->add_ba_req_delayed = true;
-			deactivate_ba_entry(ieee, admitted_ba);
-			reason_code = DELBA_REASON_END_BA;
-			goto OnADDBARsp_Reject;
-		}
-
-		admitted_ba->dialog_token = *dialog_token;
-		admitted_ba->ba_timeout_value = *ba_timeout_value;
-		admitted_ba->ba_start_seq_ctrl = pending_ba->ba_start_seq_ctrl;
-		admitted_ba->ba_param_set = *ba_param_set;
-		deactivate_ba_entry(ieee, admitted_ba);
-		activate_ba_entry(admitted_ba, *ba_timeout_value);
-	} else {
-		ts->add_ba_req_delayed = true;
-		ts->disable_add_ba = true;
-		reason_code = DELBA_REASON_END_BA;
-		goto OnADDBARsp_Reject;
-	}
-
-	return 0;
-
-OnADDBARsp_Reject:
-	{
-		struct ba_record BA;
-
-		BA.ba_param_set = *ba_param_set;
-		rtllib_send_DELBA(ieee, dst, &BA, TX_DIR, reason_code);
-		return 0;
-	}
-}
-
 int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb)
 {
 	struct ieee80211_hdr_3addr *delba = NULL;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index b9ac313e5f97..7d64855d835d 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1776,7 +1776,6 @@ u8 HTCCheck(struct rtllib_device *ieee, u8 *pFrame);
 void HTResetIOTSetting(struct rt_hi_throughput *ht_info);
 bool is_ht_half_nmode_aps(struct rtllib_device *ieee);
 u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate);
-int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb);
 int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb);
 void rtllib_ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *ts,
 			   u8 policy, u8 overwrite_pending);
-- 
2.42.0

