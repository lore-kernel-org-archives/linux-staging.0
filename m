Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABCC2FC21
	for <linux-staging@lists.linux.dev>; Wed, 13 Dec 2023 16:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDzNZRiY"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a1d9a736510so218271466b.0
        for <linux-staging@lists.linux.dev>; Wed, 13 Dec 2023 08:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702486369; x=1703091169; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QsDC6cnDlhoPFsKvfa+aFC6albQxgKIcluRdn1hA6pw=;
        b=PDzNZRiYnAGQxRzxZ2JVYCAd2QUcSZdxOzc82dCD/tE7Mod56M/Vs1PMPszPPAxQGN
         3+eOFWX4A8ceM2q+c7rVyozPnp6gx/pMCF97cDkdI0/2R2THDJsDErBYuPW3S2T6bY7H
         KOUZlivmxXylJ7LaCMuSx2hM/Muuci4Q1B/WyHz8KHT39Wj21VxlmaRkZO3QnH8ALqCd
         CzTU/vzaC0lojHR3htRd5tjXBOYJneZSdAV343chU14NYAwRZBLVaPkY5I9jnmBBoiIn
         pkAjELRgpe29mhxAacYhAFCoqn+JE12/2pMsmfhYWQjIp0aIx26WgJ04q1SwSbGRGnfG
         f55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702486369; x=1703091169;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QsDC6cnDlhoPFsKvfa+aFC6albQxgKIcluRdn1hA6pw=;
        b=rnreJZY5ndqCZGrj/l/5hx0o4SupuhmsBrNZqDsN0dc7P8uAbg5W2Bv7XauAdejjd0
         OnebSW71j+J7NPWX7fMebB41PrYAg/E4TuM20awDA8aU5i1PQ++2GIzgiDqlXafgAePe
         WgDEQGiKp0co3uZOGXRU8RpvftuaaiF8STSbazO2hyNlGAPpmrk6GEA80zzYR4i8lSdy
         dxww4nxjkic1crhb5Um5Hx06meGDr2bnVoxVUxaV62RY8r6j+CpkIZ2752tGsCN6xoUa
         jYWpnM9SR02++gDVNY8h2i+Po2vnb1IQsBhtdYjJG7Pycyonl/x3WnLli9XTjkGtGihf
         Qw9w==
X-Gm-Message-State: AOJu0YwBTSQ82h/NVKZnZTk9ThyXC+zTBdmObl4KDxAig42e+Gc8DNkS
	L0vj8nSsjq3OX9JMwRq6eBQ=
X-Google-Smtp-Source: AGHT+IGiLZB6J8iZW9hDz38oOTk+lx19cmC2hpUGX8EXkOEEpEKEYPXqrJS9OR/tvG214l7oaDTRuw==
X-Received: by 2002:a17:907:d30a:b0:a1d:65d:c1b1 with SMTP id vg10-20020a170907d30a00b00a1d065dc1b1mr8031014ejc.2.1702486368388;
        Wed, 13 Dec 2023 08:52:48 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id cx12-20020a170907168c00b00a1caa9dd507sm8111138ejd.52.2023.12.13.08.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 08:52:48 -0800 (PST)
Date: Wed, 13 Dec 2023 17:52:46 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] staging: rtl8192e: Remove constant variable
 reg_rt2rt_aggregation
Message-ID: <07a0954cc6fd730d9d42054fa36346d1de07cd06.1702406712.git.philipp.g.hortmann@gmail.com>
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

ht_info->reg_rt2rt_aggregation is set to 1 and unchanged. Therefore all
equations result accordingly and ht_info->reg_rt2rt_aggregation can be
removed.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     |  1 -
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 37 +++++++----------------
 2 files changed, 11 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 315905fa4b2c..514ac9e1f3f8 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -112,7 +112,6 @@ struct rt_hi_throughput {
 	enum ht_extchnl_offset CurSTAExtChnlOffset;
 	u8 cur_tx_bw40mhz;
 	u8 sw_bw_in_progress;
-	u8 reg_rt2rt_aggregation;
 	u8 current_rt2rt_aggregation;
 	u8 current_rt2rt_long_slot_time;
 	u8 sz_rt2rt_agg_buf[10];
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 6bd4afe32f61..d9561e3a76d6 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -79,8 +79,6 @@ void ht_update_default_setting(struct rtllib_device *ieee)
 
 	ieee->tx_enable_fw_calc_dur = 1;
 
-	ht_info->reg_rt2rt_aggregation = 1;
-
 	ht_info->reg_rx_reorder_enable = 1;
 	ht_info->rx_reorder_win_size = 64;
 	ht_info->rx_reorder_pending_time = 30;
@@ -471,25 +469,17 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
 			ht_info->current_ampdu_enable = false;
 	}
 
-	if (!ht_info->reg_rt2rt_aggregation) {
-		if (ht_info->ampdu_factor > pPeerHTCap->MaxRxAMPDUFactor)
+	if (ieee->current_network.bssht.bd_rt2rt_aggregation) {
+		if (ieee->pairwise_key_type != KEY_TYPE_NA)
 			ht_info->CurrentAMPDUFactor =
-						 pPeerHTCap->MaxRxAMPDUFactor;
+					 pPeerHTCap->MaxRxAMPDUFactor;
 		else
-			ht_info->CurrentAMPDUFactor = ht_info->ampdu_factor;
-
+			ht_info->CurrentAMPDUFactor = HT_AGG_SIZE_64K;
 	} else {
-		if (ieee->current_network.bssht.bd_rt2rt_aggregation) {
-			if (ieee->pairwise_key_type != KEY_TYPE_NA)
-				ht_info->CurrentAMPDUFactor =
-						 pPeerHTCap->MaxRxAMPDUFactor;
-			else
-				ht_info->CurrentAMPDUFactor = HT_AGG_SIZE_64K;
-		} else {
-			ht_info->CurrentAMPDUFactor = min_t(u32, pPeerHTCap->MaxRxAMPDUFactor,
-							    HT_AGG_SIZE_32K);
-		}
+		ht_info->CurrentAMPDUFactor = min_t(u32, pPeerHTCap->MaxRxAMPDUFactor,
+						    HT_AGG_SIZE_32K);
 	}
+
 	ht_info->current_mpdu_density = pPeerHTCap->MPDUDensity;
 	if (ht_info->iot_action & HT_IOT_ACT_TX_USE_AMSDU_8K) {
 		ht_info->current_ampdu_enable = false;
@@ -595,15 +585,10 @@ void HTResetSelfAndSavePeerSetting(struct rtllib_device *ieee,
 			       pNetwork->bssht.bd_ht_info_buf,
 			       pNetwork->bssht.bd_ht_info_len);
 
-		if (ht_info->reg_rt2rt_aggregation) {
-			ht_info->current_rt2rt_aggregation =
-				 pNetwork->bssht.bd_rt2rt_aggregation;
-			ht_info->current_rt2rt_long_slot_time =
-				 pNetwork->bssht.bd_rt2rt_long_slot_time;
-		} else {
-			ht_info->current_rt2rt_aggregation = false;
-			ht_info->current_rt2rt_long_slot_time = false;
-		}
+		ht_info->current_rt2rt_aggregation =
+			 pNetwork->bssht.bd_rt2rt_aggregation;
+		ht_info->current_rt2rt_long_slot_time =
+			 pNetwork->bssht.bd_rt2rt_long_slot_time;
 
 		ht_iot_peer_determine(ieee);
 
-- 
2.43.0

