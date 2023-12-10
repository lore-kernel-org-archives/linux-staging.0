Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0D111702
	for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 15:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZpoQ6WGS"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40c2d50c0adso6104315e9.1
        for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 07:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702222020; x=1702826820; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Ghc9oNYnVV/LlJvVf4sjMAoSbSil2W5yyWhaZB5Vhg=;
        b=ZpoQ6WGSL2hszDhr+ZnMrdcyilLsiiMHCBpGXclio+zi0uCgiXYPICdJCx+25trpHu
         uIJNuVYl56LnPR0zDL+unFYgbtSqtvjox4UUw89NbBRW1w6fYzTnKGJLuoyKnQV9/oLH
         Lx8Z+KyUG6TsGPFJcX4zSC7Ds+1GH5j96epuz7RkQG9JOXHKFV9uGJpz0dbOzn1jXbN8
         jwiyqOM6HeqKQKTd/A1myvIoIYvCWUUNqTZxvxpJqyIZ+up7wUsWjoBa8UgPY/5L4jOB
         HmHtqylaXNog5uCIN44Lj16dcOFJXPGRBq7WXJSxUqHKgy1k5LvnDXRrcz5xRTEGV//v
         yotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702222020; x=1702826820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Ghc9oNYnVV/LlJvVf4sjMAoSbSil2W5yyWhaZB5Vhg=;
        b=PvpLxM/YqDyh3zGryxbsmcmltzTc2gHRQtoI7cU+jzUp3ZI9/jVorW6+sRemcVYK0F
         AcBYObnw5j9S/SnmJ0KWxFVX37f80jJ1c4wIF6AYDPG6mveEwu2229heZKH7N91886XF
         pB/pAi1vxfmMXCI/vR98T3Lg5ZGuVOx/7clKJxMjwusH49+l2Meid5JTsjxHvBFw+nbu
         85yvQiR/+qAUeorZuPAcHH5JqKWC1GDd+5V+PMwdXO7xpv27pyss+DRHreBAK1LwXKCK
         Bn9N+TZAaD/GJjBB6VlTlFDsKLbw9M9Mci7YmGEnty3nON0rktqu3PsXa0JMAkaqFgoR
         rAcw==
X-Gm-Message-State: AOJu0YyRkSDEAFR2eLbp7PJOGnZGPHtyV7vlFChPI8P3/3e8QgeH+A4B
	Ey74Rchg438/gCXd3FpQslk=
X-Google-Smtp-Source: AGHT+IF9JUkMMqyQF8K7oosTh16A72VikY5ePJs2iVpnR6eLhp3mf8J3VR1wwdV5HcMwFUUfMhiJ8A==
X-Received: by 2002:a05:600c:1913:b0:40c:287a:1bba with SMTP id j19-20020a05600c191300b0040c287a1bbamr4041201wmq.2.1702222019806;
        Sun, 10 Dec 2023 07:26:59 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id r20-20020a05600c459400b0040b349c91acsm12117696wmo.16.2023.12.10.07.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 07:26:59 -0800 (PST)
Date: Sun, 10 Dec 2023 16:26:58 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] staging: rtl8192e: Remove variable ht_info->bCurSuppCCK
Message-ID: <159a1a84c7bc90042bf1618a067f02ac123dd15d.1702212003.git.philipp.g.hortmann@gmail.com>
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

ht_info->bCurSuppCCK is set to 1 and unchanged. Therefore all equations
result accordingly and ht_info->bCurSuppCCK can be removed.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 1 -
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 4 ----
 drivers/staging/rtl8192e/rtllib_softmac.c | 5 +----
 3 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 670affe9d57b..416633b88446 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -97,7 +97,6 @@ struct rt_hi_throughput {
 	u8 cur_bw_40mhz;
 	u8 cur_short_gi_40mhz;
 	u8 cur_short_gi_20mhz;
-	u8 bCurSuppCCK;
 	enum ht_spec_ver ePeerHTSpecVer;
 	struct ht_capab_ele SelfHTCap;
 	struct ht_info_ele SelfHTInfo;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index ca9da96b6f6c..439b43faa2bb 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -471,8 +471,6 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
 	ht_info->cur_short_gi_20mhz = ((pPeerHTCap->ShortGI20Mhz == 1) ? true : false);
 	ht_info->cur_short_gi_40mhz = ((pPeerHTCap->ShortGI40Mhz == 1) ? true : false);
 
-	ht_info->bCurSuppCCK = true;
-
 	ht_info->bCurrent_AMSDU_Support = ht_info->amsdu_support;
 
 	nMaxAMSDUSize = (pPeerHTCap->MaxAMSDUSize == 0) ? 3839 : 7935;
@@ -549,8 +547,6 @@ void HTInitializeHTInfo(struct rtllib_device *ieee)
 	ht_info->cur_short_gi_40mhz = false;
 	ht_info->forced_short_gi = false;
 
-	ht_info->bCurSuppCCK = true;
-
 	ht_info->bCurrent_AMSDU_Support = false;
 	ht_info->nCurrent_AMSDU_MaxSize = ht_info->amsdu_max_size;
 	ht_info->current_mpdu_density = ht_info->mpdu_density;
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 5c89744b2bbe..416f89ec576c 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -173,10 +173,7 @@ static u8 MgntQuery_MgntFrameTxRate(struct rtllib_device *ieee)
 		rate = ieee->basic_rate & 0x7f;
 
 	if (rate == 0) {
-		if (ieee->mode == WIRELESS_MODE_N_24G && !ht_info->bCurSuppCCK)
-			rate = 0x0c;
-		else
-			rate = 0x02;
+		rate = 0x02;
 	}
 
 	return rate;
-- 
2.43.0

