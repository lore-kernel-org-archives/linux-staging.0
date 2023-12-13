Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C8F2FC21
	for <linux-staging@lists.linux.dev>; Wed, 13 Dec 2023 16:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7bTaGRb"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-54cea1f30cbso1538294a12.1
        for <linux-staging@lists.linux.dev>; Wed, 13 Dec 2023 08:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702486360; x=1703091160; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QpGgf4XklN8es0KYbSGNNm5QQAnGIuhX/jA7OD+Idx8=;
        b=W7bTaGRba6bBncZ5RBJJcVg4pd4Pm0RRjvcWXU+eTTvJUdEBLQ5aFCHAsIIxdxdIqd
         g+VoVIV244RRMcYCmVIx3NZ7ZXwdnm7b/0ynOn5dbZimsEbLSB0BLNphbe15cYYkhfR+
         YCdv7OT62oK5x/b9VK5CA24mHCBBftzTmrWjp8u8GgTpvCadsL3J9g0b7PeFHq/k5wxk
         7zs9iaaOAYjIJRRFMPaIdUyeBy/7N3bs0m6Z5GkgKGJf0bDqTUR+E+XxyAxe5St7CICj
         00bKd1czzQ7+9U1IkfB4/GbVegWzV4WWHyPQOW/QPDnf3cfser7iwL0het0MeIna8k2f
         4c9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702486360; x=1703091160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QpGgf4XklN8es0KYbSGNNm5QQAnGIuhX/jA7OD+Idx8=;
        b=S9V0prXXYoQ7jxeqkTIOZrgEAVw/sMZqRqpE43pODkkZczWrLSO5PoJxNciRdxwAN3
         eb+2jmQ0Joy6NL/zCj2rjx7STI5BeRmqlmMvc29gfTC+aRMYrP2j3rdj/SIv2B0yVvLH
         2v5a+oxFSMSUQ8iTcg6AXhPOluqlXQxRD58MUIL4o/Pp5I9ZOQNvk4TiBrotNuggvSKN
         ar18rFVjoVzd6lMjTUVWJyHZN1k35sajrMKgC8Ba/bSqiPyt+O/sqnLWj52QavEI3olt
         fywijh61+G+xnfbRmbH4wnfW62J/vqDZiyvmlsJ0nUOgSZkvDWIJ10sWNGjId4naz3S5
         uX4A==
X-Gm-Message-State: AOJu0YyCJPALirR3LgONGJGOxaf6lu0WDVcIykwxkP3TaBD+qYowlOXM
	GqJNoQT0WWdC7/dVyLUQxTk=
X-Google-Smtp-Source: AGHT+IEPaoMNNeCr5kGtxS+NwpcCbGmmQ8u4TTb5xnRZH/gXRuLX9rjNxxBjeloggYEEAJl4I944OQ==
X-Received: by 2002:a50:bae9:0:b0:552:6202:41e1 with SMTP id x96-20020a50bae9000000b00552620241e1mr31473ede.1.1702486360316;
        Wed, 13 Dec 2023 08:52:40 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id l12-20020a50cbcc000000b0054b53aacd86sm5771950edi.65.2023.12.13.08.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 08:52:40 -0800 (PST)
Date: Wed, 13 Dec 2023 17:52:38 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 08/10] staging: rtl8192e: Remove variable
 ht_info->RT2RT_HT_Mode
Message-ID: <b6253e56cdb346045a234d1f545d7ef92cdd220d.1702406712.git.philipp.g.hortmann@gmail.com>
References: <cover.1702406712.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1702406712.git.philipp.g.hortmann@gmail.com>

Remove variable ht_info->RT2RT_HT_Mode as it is always set but never
evaluated.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 1 -
 drivers/staging/rtl8192e/rtl819x_HT.h        | 1 -
 drivers/staging/rtl8192e/rtl819x_HTProc.c    | 4 ----
 3 files changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 72e89ccfb184..bef042233117 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -287,7 +287,6 @@ static void _rtl92e_update_beacon(void *data)
 	if (ieee->ht_info->current_ht_support)
 		HT_update_self_and_peer_setting(ieee, net);
 	ieee->ht_info->current_rt2rt_long_slot_time = net->bssht.bd_rt2rt_long_slot_time;
-	ieee->ht_info->RT2RT_HT_Mode = net->bssht.rt2rt_ht_mode;
 	_rtl92e_update_cap(dev, net->capability);
 }
 
diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 1da56f1c04eb..315905fa4b2c 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -113,7 +113,6 @@ struct rt_hi_throughput {
 	u8 cur_tx_bw40mhz;
 	u8 sw_bw_in_progress;
 	u8 reg_rt2rt_aggregation;
-	u8 RT2RT_HT_Mode;
 	u8 current_rt2rt_aggregation;
 	u8 current_rt2rt_long_slot_time;
 	u8 sz_rt2rt_agg_buf[10];
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 14e6f46a65ed..6bd4afe32f61 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -540,7 +540,6 @@ void HTInitializeHTInfo(struct rtllib_device *ieee)
 
 	ht_info->current_rt2rt_aggregation = false;
 	ht_info->current_rt2rt_long_slot_time = false;
-	ht_info->RT2RT_HT_Mode = (enum rt_ht_capability)0;
 
 	ht_info->iot_peer = 0;
 	ht_info->iot_action = 0;
@@ -601,11 +600,9 @@ void HTResetSelfAndSavePeerSetting(struct rtllib_device *ieee,
 				 pNetwork->bssht.bd_rt2rt_aggregation;
 			ht_info->current_rt2rt_long_slot_time =
 				 pNetwork->bssht.bd_rt2rt_long_slot_time;
-			ht_info->RT2RT_HT_Mode = pNetwork->bssht.rt2rt_ht_mode;
 		} else {
 			ht_info->current_rt2rt_aggregation = false;
 			ht_info->current_rt2rt_long_slot_time = false;
-			ht_info->RT2RT_HT_Mode = (enum rt_ht_capability)0;
 		}
 
 		ht_iot_peer_determine(ieee);
@@ -621,7 +618,6 @@ void HTResetSelfAndSavePeerSetting(struct rtllib_device *ieee,
 		ht_info->current_ht_support = false;
 		ht_info->current_rt2rt_aggregation = false;
 		ht_info->current_rt2rt_long_slot_time = false;
-		ht_info->RT2RT_HT_Mode = (enum rt_ht_capability)0;
 
 		ht_info->iot_action = 0;
 		ht_info->iot_ra_func = 0;
-- 
2.43.0

