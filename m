Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAD01D684
	for <linux-staging@lists.linux.dev>; Wed, 13 Dec 2023 16:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dw6gUxCb"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50bf82f6accso1812648e87.1
        for <linux-staging@lists.linux.dev>; Wed, 13 Dec 2023 08:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702486307; x=1703091107; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kpLILZybMq8C7TrSiZZZTJ8Dy9Fx0ctVyqk92THT1n4=;
        b=Dw6gUxCbMKs7vHPsEBIPP0uM4HQKuG2Q+bpewJRvUZFH74qiS4VPhUiX0R4shZ9vxu
         7q7BMJcGnKc2itx/iKOTyBGhNova/4itzaKedVmL5aJR1/kDz7Ma90KjxrOn/c1Rt/Y9
         kgzWiz29E2+aknu2dZwnfhF9BtYIHs+Zes0xGML87vjQDzSav7c97DqCcUDrPh9yOZQR
         fc7t92RUaf+yvRAcuBLLIcXie+McRqz8hmYw55h5VHYyDcRex4sM3Cb/yIR4z4cBu4El
         Q555Db7NpmkGZJzw22pad4d5gdS0qeXpLXVA85B75fGcwt1kHh7PRqCSkWVUr7jLc1Jy
         FbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702486307; x=1703091107;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpLILZybMq8C7TrSiZZZTJ8Dy9Fx0ctVyqk92THT1n4=;
        b=MgULK1wvqr2pHUGiiQBMhft5JycDimy5/uDudM0011EPb0RPILYrLAwLwaCbUNf/GZ
         B5rorFFJLMwWjqvjkrYsJsA5c2YbslP9ZFuI35Y2rDEXGmyt1bopZImC0PwSp+bl7OM0
         6/ZEB6Nvt2ms53gY2NNW/J33MQlsREzRNJTGYHOPvpeC3laRktR20dIcBOkmzuYUG77I
         DOnugK7yZwGUUdAkx4/RYbbI86hW9o36zsRCDX0SoNJFLyNrG8VFrFe+MWK1SyJBcysy
         713qyEekvcn2QPnlJxAbO6Gul/5B9tBTF6f6YkLS187Is7Qsozx7VdqVnAMQJnK6Q1Fr
         Yemw==
X-Gm-Message-State: AOJu0Yymf8Ol3qe9kRmZbij4RjTjZlrA7QvmH9X4c7iH8hnmI5bRBHmU
	4gZ9h9mglv7G82W5/flNaJYiPJmK8o4=
X-Google-Smtp-Source: AGHT+IHegFYCIVbFE9geK7mbBeYfgRPIjFQzEeqpn4vOr5F8BpRRP1ziLsP6Pyc0LaeWlqJduRfhrg==
X-Received: by 2002:a19:4f0a:0:b0:50c:1bc:33e3 with SMTP id d10-20020a194f0a000000b0050c01bc33e3mr6387897lfb.2.1702486307057;
        Wed, 13 Dec 2023 08:51:47 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id sk13-20020a170906630d00b00a1d232b39b3sm8172682ejc.145.2023.12.13.08.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 08:51:46 -0800 (PST)
Date: Wed, 13 Dec 2023 17:51:45 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 02/10] staging: rtl8192e: Remove unused variable nMaxAMSDUSize
Message-ID: <4df74fda70535ddbdfc90ba7c98e9d4a773f944d.1702406712.git.philipp.g.hortmann@gmail.com>
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

Remove unused variables nMaxAMSDUSize and amsdu_max_size.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 1 -
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 4 ----
 2 files changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index bf87106dd784..ff0eb0d01022 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -102,7 +102,6 @@ struct rt_hi_throughput {
 	u8 PeerHTCapBuf[32];
 	u8 PeerHTInfoBuf[32];
 	u8 amsdu_support;
-	u16 amsdu_max_size;
 	u8 ampdu_enable;
 	u8 current_ampdu_enable;
 	u8 ampdu_factor;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index cb8150137858..379934a71f87 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -71,7 +71,6 @@ void ht_update_default_setting(struct rtllib_device *ieee)
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
 
-	ht_info->amsdu_max_size = 7935UL;
 	ht_info->amsdu_support = 0;
 
 	ht_info->ampdu_enable = 1;
@@ -436,7 +435,6 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
 	struct ht_capab_ele *pPeerHTCap = NULL;
 	struct ht_info_ele *pPeerHTInfo = NULL;
-	u16 nMaxAMSDUSize = 0;
 	u8 *pMcsFilter = NULL;
 
 	static const u8 EWC11NHTCap[] = { 0x00, 0x90, 0x4c, 0x33 };
@@ -471,8 +469,6 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
 	ht_info->cur_short_gi_20mhz = ((pPeerHTCap->ShortGI20Mhz == 1) ? true : false);
 	ht_info->cur_short_gi_40mhz = ((pPeerHTCap->ShortGI40Mhz == 1) ? true : false);
 
-	nMaxAMSDUSize = (pPeerHTCap->MaxAMSDUSize == 0) ? 3839 : 7935;
-
 	ht_info->current_ampdu_enable = ht_info->ampdu_enable;
 	if (ieee->rtllib_ap_sec_type &&
 	    (ieee->rtllib_ap_sec_type(ieee) & (SEC_ALG_WEP | SEC_ALG_TKIP))) {
-- 
2.43.0

