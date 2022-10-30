Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCED62F38
	for <linux-staging@lists.linux.dev>; Sun, 30 Oct 2022 13:32:09 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id v4-20020a17090a088400b00212cb0ed97eso8230948pjc.5
        for <linux-staging@lists.linux.dev>; Sun, 30 Oct 2022 06:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ect7CUW3whk/jekELT8ewhs/AbnHcthL4OWXL1M6vak=;
        b=YxPCTAMe6zNXtmgdkxtzZrNqFcbZ2o5OFLTbvKNpsFWubS76jl9jrtCVbQ5Fa9zzw1
         2zOzjI3M6aafgnGr90feo6vu/balKHzYpRQg0LbcouFqwzrCtb2mk1JLeoZKX9S43tqN
         uORP8YmpZ5xrlXKhZeQfz7FGgDTPRWSnpplDF87sObok+cUn/fkDZMhElhMri6qXAwA8
         S3jBQ/AsoNtheX78saj4xzLSzwUyODD0EA1aBOqjPCaAJIFsf4U3hKWouAZ/n8P1TMdI
         1k7PLDwJd8TBORxIr5pc+Yc21S18CsJTZP0EzVsNpGgBn7ZbLGjDuTyU6qnW5Hn05nyZ
         uboA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ect7CUW3whk/jekELT8ewhs/AbnHcthL4OWXL1M6vak=;
        b=zsYAce9HVEfSjBBdjDXtCaAVZ+6fFYddPep8CMEeTgPhKCD31+/KYmQYIpnYqFNxZj
         +oFh8r1CICy3wMQQbV5ahS+yx1fPDgeRTI0yF5u+h6RrpKi/FZQ+yrCzA9/9Tzz4uCBW
         gFV85lSpO3auCVSj8V2lyTkqtUm6C4ah3jVZ3UmQk5a7A2ex1J5I7DK8319/nBmC94Wc
         +BGy1FwhqM1yM99u9MfOUjyZ8xxx27QPM2GJqNDuK3LGXQUrIAfeWXwY5LtleFxEIRnp
         haZc2GBEmk1uEHIGm5iaM71mYtPhvmVvX56muUA4O4TRCM7+W1kpn3ErdTs8ezv+zM8G
         BCBg==
X-Gm-Message-State: ACrzQf1FTkKpFuvjzK9Hsv0iX8HTxwwkgYXcqbpEU37KPfn7lmJpXCyZ
	Z09S7xkmOP5wFGfJRNvvYhE=
X-Google-Smtp-Source: AMsMyM65sWppqQzriWx34rWiG10j1Ed9QUGrX196o3lTNfKYqQZ2tUA1CVjS1RNJg0WFY5qhv0HmGw==
X-Received: by 2002:a17:90b:1c06:b0:20a:f070:9f3c with SMTP id oc6-20020a17090b1c0600b0020af0709f3cmr9817614pjb.151.1667136729343;
        Sun, 30 Oct 2022 06:32:09 -0700 (PDT)
Received: from zephyrus ([103.251.210.204])
        by smtp.gmail.com with ESMTPSA id s2-20020a63ff42000000b00439f027789asm2392858pgk.59.2022.10.30.06.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 06:32:08 -0700 (PDT)
Date: Sun, 30 Oct 2022 19:02:04 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192e: Rename variables rateIndex and rateBitmap
 to avoid CamelCase
Message-ID: <20221030133204.GA416592@zephyrus>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename variables
* rateIndex to rate_index
* rateBitmap to rate_bitmap
to avoid CamelCase which is not accepted by checkpatch.pl .

Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index c9e495538e2c..767c746fc73d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -2121,8 +2121,8 @@ static void _rtl92e_dm_end_sw_fsync(struct net_device *dev)
 static void _rtl92e_dm_start_sw_fsync(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
-	u32			rateIndex;
-	u32			rateBitmap;
+	u32 rate_index;
+	u32 rate_bitmap;
 
 	priv->rate_record = 0;
 	priv->ContinueDiffCount = 0;
@@ -2136,12 +2136,12 @@ static void _rtl92e_dm_start_sw_fsync(struct net_device *dev)
 		priv->rtllib->fsync_firstdiff_ratethreshold = 200;
 		priv->rtllib->fsync_seconddiff_ratethreshold = 200;
 	}
-	for (rateIndex = 0; rateIndex <= 27; rateIndex++) {
-		rateBitmap  = 1 << rateIndex;
-		if (priv->rtllib->fsync_rate_bitmap & rateBitmap)
+	for (rate_index = 0; rate_index <= 27; rate_index++) {
+		rate_bitmap  = 1 << rate_index;
+		if (priv->rtllib->fsync_rate_bitmap & rate_bitmap)
 			priv->rate_record +=
 				 priv->stats.received_rate_histogram[1]
-				[rateIndex];
+				[rate_index];
 	}
 	if (timer_pending(&priv->fsync_timer))
 		del_timer_sync(&priv->fsync_timer);
-- 
2.25.1

