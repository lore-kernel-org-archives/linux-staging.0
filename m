Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D0C2FC21
	for <linux-staging@lists.linux.dev>; Wed, 13 Dec 2023 16:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L32Rq0qo"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a1e25a49603so189631566b.1
        for <linux-staging@lists.linux.dev>; Wed, 13 Dec 2023 08:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702486294; x=1703091094; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1UMQD+xxxwGpCckGrKfQ1npPt/no2ggj6N88c7tmbIE=;
        b=L32Rq0qoSUQXsi+ERbGumBEYpkWSRXYNtBukP9hdoNTZsMNNC4SFK+B+F5MNMNAN9M
         P2DNCqqWw6BeGpNawEAfhmw9xsPWphPCZizndLhRuapdmRXq2jzoesMUcwuGrdB8a7oE
         9XUzy8zYhKezHSWVEY0w1XeOO1oB+RW34NRoVwRnTIe5t910eI/VBhym7zg8/KkRLEKx
         7sp1BNZI8IWZPUiVu0khpR14g2wUGQ2zffsPya0e0IrzVw+uqyhOeYBl/hbxWY/WIs+e
         9KzkHk/HTh+bC2WNe84MbRgdLHV2FojdGANXMEP5OhBpRbyCD8wL+MhPT5IXWuTnoWd9
         uxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702486294; x=1703091094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1UMQD+xxxwGpCckGrKfQ1npPt/no2ggj6N88c7tmbIE=;
        b=hSusjbGtDCGxdfnNCy184w2q+XRHrYskgf7mNW+H+mzRy58wozeZFTgMUdvWpl14tZ
         qiEEMF26v6Y/K8H9rHWoXlajSGAAbNP+29BLsSnh8VwQIbIv9Jh+leIL5vQY8ztC0r0i
         Q//IaZFLNGkpRMXAmtbWArvKRiihUJdKJbvqbJsXx4vYVw/Rl0GyVZ4QnFF0Sv0NZXoy
         WxPcZHyve0uabMbxA7jyBCNHSCCVqbM/yfMeZnQI3q7hf3iaFS8dLdM0S/7lbjnfYll2
         ENBqbfH10knAt+xKZARCBCI7d+J+yXY8Z5Uw4qGURAC7wJUcMO0tE1fOYNXkGmOCeSAm
         2INg==
X-Gm-Message-State: AOJu0YzMrQ8pIeQV0kmYle5I/lcMxb9ArMfG3QrWNhMvdzrDn+qFJGUN
	Hycu7oaWhLedZRabH1zGbU87kJn9qQE=
X-Google-Smtp-Source: AGHT+IEFCFZ3TSUggaDoIU8TzPXxoQxJJ/nuyOO0ToCi4OsWR6nB8kAy6NYouBZiLkaM4++W/cFoGQ==
X-Received: by 2002:a17:907:d404:b0:a01:b8e5:d4b7 with SMTP id vi4-20020a170907d40400b00a01b8e5d4b7mr7922559ejc.1.1702486294303;
        Wed, 13 Dec 2023 08:51:34 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id ty6-20020a170907c70600b00a1d71c57cb1sm8116418ejc.68.2023.12.13.08.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 08:51:34 -0800 (PST)
Date: Wed, 13 Dec 2023 17:51:32 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 01/10] staging: rtl8192e: Remove variable
 bCurrent_AMSDU_Support
Message-ID: <d2711450dbc62974162abd4db070e34c9828997d.1702406712.git.philipp.g.hortmann@gmail.com>
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

bCurrent_AMSDU_Support and nCurrent_AMSDU_MaxSize are set but never
evaluated.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 2 --
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 9 ---------
 2 files changed, 11 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 0f27c820ffc5..bf87106dd784 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -103,8 +103,6 @@ struct rt_hi_throughput {
 	u8 PeerHTInfoBuf[32];
 	u8 amsdu_support;
 	u16 amsdu_max_size;
-	u8 bCurrent_AMSDU_Support;
-	u16 nCurrent_AMSDU_MaxSize;
 	u8 ampdu_enable;
 	u8 current_ampdu_enable;
 	u8 ampdu_factor;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 0197782e0ab6..cb8150137858 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -471,15 +471,8 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
 	ht_info->cur_short_gi_20mhz = ((pPeerHTCap->ShortGI20Mhz == 1) ? true : false);
 	ht_info->cur_short_gi_40mhz = ((pPeerHTCap->ShortGI40Mhz == 1) ? true : false);
 
-	ht_info->bCurrent_AMSDU_Support = ht_info->amsdu_support;
-
 	nMaxAMSDUSize = (pPeerHTCap->MaxAMSDUSize == 0) ? 3839 : 7935;
 
-	if (ht_info->amsdu_max_size > nMaxAMSDUSize)
-		ht_info->nCurrent_AMSDU_MaxSize = nMaxAMSDUSize;
-	else
-		ht_info->nCurrent_AMSDU_MaxSize = ht_info->amsdu_max_size;
-
 	ht_info->current_ampdu_enable = ht_info->ampdu_enable;
 	if (ieee->rtllib_ap_sec_type &&
 	    (ieee->rtllib_ap_sec_type(ieee) & (SEC_ALG_WEP | SEC_ALG_TKIP))) {
@@ -547,8 +540,6 @@ void HTInitializeHTInfo(struct rtllib_device *ieee)
 	ht_info->cur_short_gi_40mhz = false;
 	ht_info->forced_short_gi = false;
 
-	ht_info->bCurrent_AMSDU_Support = false;
-	ht_info->nCurrent_AMSDU_MaxSize = ht_info->amsdu_max_size;
 	ht_info->current_mpdu_density = ht_info->mpdu_density;
 	ht_info->CurrentAMPDUFactor = ht_info->ampdu_factor;
 
-- 
2.43.0

