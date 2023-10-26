Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7579F9C7
	for <linux-staging@lists.linux.dev>; Thu, 26 Oct 2023 05:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+LhzcYE"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9bfbc393dfaso12036666b.1
        for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 22:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698299028; x=1698903828; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=88V44OaMqzEfkeGrh8z6B90RbiCDqgJggaF2dntJGPk=;
        b=T+LhzcYEtxtZo3Egym8TKMOCbL+j38//GamTyhgdjApcf+kKEh+GLIv/s8oPSwFcvx
         5SEqTeiY1pNqAzJqY2B4tNCSUmFv1LRpBxnjSgXEz3TIs/MCiJXhI7PExubucfUfPPkY
         KvmwwZGVQzVsC73llqixjN8uVdIR4lzQPd8dtH5YxZuHq6xmBAi13JyOdR+98cEmwZhi
         +m8JWt+4ylXuq8quTlWMzFyt+k1uVxghVwdW6k1bSXNnAB2ZSZSkriIB7kmRcowfsKuX
         3CSxNQT1TVOImx3pjGwSwo4MFn5sFjtHroKYsV2n+j2CRHM6RmQk3u2mvTMgeUlj7wLY
         pGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698299028; x=1698903828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88V44OaMqzEfkeGrh8z6B90RbiCDqgJggaF2dntJGPk=;
        b=sXmZsDGjYZaPuUhFidLacQnpZ7qkt+MC80joxd3cho/TzNJKKDqI4Pe4Sb2uyHPbsF
         V6psxfiKM03j3q1rJXInMb3MF69xnldSumuoD+mTKv4jApSwriwBkyZLobdYmmrUEogR
         Y+lLu/FIxWkKzIpxke14jdgotrQHOo8x+FGajo9ZJVDOPzjHPcVqSkXO0lTkD3+WtbA1
         wQn7bsq+yLXNWTBC+wcmAH9AglV1q7dWiLzqpiffpmmx3ha3j4Fl9kbPTmj6NTLqLgKy
         xEXgks2FykXGLZ9NyDo2RmiQLj8dtfo2mplkHpH/JcII8Hg85Tzx5hPrT+m2Kf782FPu
         nRvQ==
X-Gm-Message-State: AOJu0YwjINxX9t//mte2SsRxMwIRK4iedGiyT7iEdyoz3ExrWFDD0Ieg
	vFk0dh0x2iuug3aD9fRakh0=
X-Google-Smtp-Source: AGHT+IEh+u4jpdjbIJqbo2Ldz4i9wPwoXV0a9R2mNz6qXxFITxd6hw61qP7e1ejbDjR3G/RPhadrMA==
X-Received: by 2002:a17:906:ac7:b0:9cb:b7d3:bcf0 with SMTP id z7-20020a1709060ac700b009cbb7d3bcf0mr5815415ejf.1.1698299027935;
        Wed, 25 Oct 2023 22:43:47 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id t11-20020a1709066bcb00b009be14e5cd54sm10978154ejs.57.2023.10.25.22.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 22:43:47 -0700 (PDT)
Date: Thu, 26 Oct 2023 07:43:46 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 03/10] staging: rtl8192e: Remove
 HTIOTActIsDisableMCSTwoSpatialStream()
Message-ID: <a446837ff1107c81f52d3cf9e727d6ef4e2678af.1698295861.git.philipp.g.hortmann@gmail.com>
References: <cover.1698295861.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1698295861.git.philipp.g.hortmann@gmail.com>

Remove HTIOTActIsDisableMCSTwoSpatialStream() as it always returns false
which leads to one evaluation that is always false. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index ea01cfce77d8..3cbadd6a0aef 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -207,11 +207,6 @@ static void HTIOTPeerDetermine(struct rtllib_device *ieee)
 	netdev_dbg(ieee->dev, "IOTPEER: %x\n", ht_info->IOTPeer);
 }
 
-static bool HTIOTActIsDisableMCSTwoSpatialStream(struct rtllib_device *ieee)
-{
-	return false;
-}
-
 static u8 HTIOTActIsDisableEDCATurbo(struct rtllib_device *ieee,
 				     u8 *PeerMacAddr)
 {
@@ -686,10 +681,6 @@ void HTResetSelfAndSavePeerSetting(struct rtllib_device *ieee,
 		HTIOTPeerDetermine(ieee);
 
 		ht_info->iot_action = 0;
-		bIOTAction = HTIOTActIsDisableMCSTwoSpatialStream(ieee);
-		if (bIOTAction)
-			ht_info->iot_action |= HT_IOT_ACT_DISABLE_ALL_2SS;
-
 		bIOTAction = HTIOTActIsDisableEDCATurbo(ieee, pNetwork->bssid);
 		if (bIOTAction)
 			ht_info->iot_action |= HT_IOT_ACT_DISABLE_EDCA_TURBO;
-- 
2.42.0

