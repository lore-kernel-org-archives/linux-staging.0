Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3BD11702
	for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 15:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mpq+YOfL"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40c362efc2dso3854015e9.0
        for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 07:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702221972; x=1702826772; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IXZChcAWYyXJ3xwEo34Bj3n8r/lOSA4PWuJHfRPgZ7U=;
        b=mpq+YOfL/2sKmIjshmMeyDNjqtm2vCj+VPuQgNO/W+nvQpEsegBjm2aK5KhdMiuREi
         pRLygsWhHvJSj9GC2KplBhJCbhj1LLR5yCT8aKMSlaon+ZCcK1MshDbaWnLLmN3pV0XX
         X3bDPnFgpfFueD625Jr+nGBfIi7TqD80k1XGp6+sDh9wHxwBvEi3LoNhDspXCpHbAepo
         XEeYRFtFlOg9Q0Rtr1tkPa/uUkO4qmJGyNAZCfMIiHoU8wxX/BoI8iJ9R6QVtckwDRni
         UL8mJnqJTpa+Z+1DU6Rk+tQriPbA3U1+K6o2BgTSiL7SeXi4SS9bHYU+l3k+pKNvWT3x
         l9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702221972; x=1702826772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXZChcAWYyXJ3xwEo34Bj3n8r/lOSA4PWuJHfRPgZ7U=;
        b=QiMihShNaeOBc2n4OKaTWrXgev37mASdVbx0+2ezQyq6ZGS8Du1H48rxfEqlQyHJmj
         bihSSnQhSMiBoY06LWpNLMEBl7aW5dsKS9uHeaMNxmv4iyxJGuekmBVO59HlwcaOppLE
         Bi+P5TlfOUQKyBwnJd7L7UECU3IssFZCtvCa7Q/jY/S0NscMbdynGy94wsmj81Z/kSCi
         1/J06zFqyVMLscuIClceA0U8mIrHuDDouqQ9gNI+BpCbyIJJxjbVheAHU6RSpbX5jzN+
         9YMzl9YvV5bSeOl9uEAUwUR9Nh2cdUQvVmx+BEDK4zGRvjqI/jCIHV8OUmFBIhsXOUy5
         Xhhw==
X-Gm-Message-State: AOJu0Yyz1pUMYGvp+VG4rOoqwwjAm3z5z6LIc0QRixCvk8QumP+reh0d
	o+Uqn+k2qWORJGRTk7t+tbqyOj3sy5w=
X-Google-Smtp-Source: AGHT+IGqLnNPjUYQ+YdfgFxcsr4GPTxHvUrBPwPPACa9RwN6TVPv8JLz4sYFmXnX/YuMpO+AmBVXKg==
X-Received: by 2002:a05:600c:35d6:b0:405:358c:ba75 with SMTP id r22-20020a05600c35d600b00405358cba75mr4025647wmq.0.1702221971674;
        Sun, 10 Dec 2023 07:26:11 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id k40-20020a05600c1ca800b0040b45356b72sm12132495wms.33.2023.12.10.07.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 07:26:11 -0800 (PST)
Date: Sun, 10 Dec 2023 16:26:10 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 02/10] staging: rtl8192e: Remove variable
 ht_info->reg_bw_40mhz
Message-ID: <4ff7afdc2ada8095c95f053381834cea9f5796bf.1702212003.git.philipp.g.hortmann@gmail.com>
References: <cover.1702212003.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1702212003.git.philipp.g.hortmann@gmail.com>

ht_info->reg_bw_40mhz is set to 1 and unchanged. Therefore all equations
result accordingly and ht_info->reg_bw_40mhz can be removed.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     |  1 -
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 14 +++-----------
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index c004020099e3..bbfdfb79c6f2 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -94,7 +94,6 @@ enum ht_aggre_mode {
 struct rt_hi_throughput {
 	u8 enable_ht;
 	u8 current_ht_support;
-	u8 reg_bw_40mhz;
 	u8 cur_bw_40mhz;
 	u8 reg_short_gi_40mhz;
 	u8 cur_short_gi_40mhz;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 99626be899fd..f81d9ba9c9f5 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -74,12 +74,7 @@ void ht_update_default_setting(struct rtllib_device *ieee)
 	ht_info->reg_short_gi_20mhz = 1;
 	ht_info->reg_short_gi_40mhz = 1;
 
-	ht_info->reg_bw_40mhz = 1;
-
-	if (ht_info->reg_bw_40mhz)
-		ht_info->reg_supp_cck = 1;
-	else
-		ht_info->reg_supp_cck = true;
+	ht_info->reg_supp_cck = 1;
 
 	ht_info->amsdu_max_size = 7935UL;
 	ht_info->amsdu_support = 0;
@@ -275,7 +270,7 @@ void HTConstructCapabilityElement(struct rtllib_device *ieee, u8 *posHTCap,
 	if (ieee->GetHalfNmodeSupportByAPsHandler(ieee->dev))
 		pCapELE->ChlWidth = 0;
 	else
-		pCapELE->ChlWidth = (pHT->reg_bw_40mhz ? 1 : 0);
+		pCapELE->ChlWidth = 1;
 
 	pCapELE->MimoPwrSave		= pHT->self_mimo_ps;
 	pCapELE->GreenField		= 0;
@@ -286,7 +281,7 @@ void HTConstructCapabilityElement(struct rtllib_device *ieee, u8 *posHTCap,
 	pCapELE->RxSTBC			= 0;
 	pCapELE->DelayBA		= 0;
 	pCapELE->MaxAMSDUSize = (MAX_RECEIVE_BUFFER_SIZE >= 7935) ? 1 : 0;
-	pCapELE->DssCCk = ((pHT->reg_bw_40mhz) ? (pHT->reg_supp_cck ? 1 : 0) : 0);
+	pCapELE->DssCCk = (pHT->reg_supp_cck ? 1 : 0);
 	pCapELE->PSMP = 0;
 	pCapELE->LSigTxopProtect = 0;
 
@@ -734,9 +729,6 @@ void HTSetConnectBwMode(struct rtllib_device *ieee,
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
 
-	if (!ht_info->reg_bw_40mhz)
-		return;
-
 	if (ieee->GetHalfNmodeSupportByAPsHandler(ieee->dev))
 		bandwidth = HT_CHANNEL_WIDTH_20;
 
-- 
2.43.0

