Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9B42F56
	for <linux-staging@lists.linux.dev>; Tue, 15 Mar 2022 22:40:40 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id r190-20020a1c2bc7000000b0038a1013241dso438650wmr.1
        for <linux-staging@lists.linux.dev>; Tue, 15 Mar 2022 15:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eF7Ju9bnYULQUD4TwuczuGatyNZQSDGQVXAZ0n/JqVM=;
        b=JzvlDbj0rGw2ex9OZz3+XQ9aH3k/b0BEu3N9rMMDnaT0HhAo1N1AdPu3yyufQX1dvU
         o5Q00Dh3e6lanAiOLLA3lX5CELdRGeJkjL6jGi8RjWnaVzugda0WFu49sR+D6t7Je/2e
         2cMt2c/in3BrNJ21ftvLJy70SXbii8cHUsjBCKniu1m1yZ18mTVSNLlOO84jiwgsA+jD
         pzz+fcoTk2tJH8k4sWHysC1QW+pL3LnhK2Ag0j/jpiFLyNlzHCHdfu64qPuZMk4Ejme4
         TrCq/reqlXcPq2IcCh8RcbjRh+uO3jtf7ksrlZbvzukZGWAeKpJGdSS56+Dpa2aGgubN
         inyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eF7Ju9bnYULQUD4TwuczuGatyNZQSDGQVXAZ0n/JqVM=;
        b=obdWxqnMlgtu5whS210jj++9Ou41+NB/0h/hhTxpxmrIsdKnpyuiNXJNgvtF7Mje6l
         e9MHWUUshHO69Q+xgmdtN6IvyM79PT+tTjUihQHCM0kCjUT5r6zMIv7cT9ea3/WZw2+D
         GamRX2pfMn2es7fx0gQ0tN0sEcgqV6pcO2sde2ttsnhMVDkqz2eUhzTHIW8bX6/YNsFC
         QzoKsITWChwKvVQeGXqGNoNMPjhdB9AaqzZril5KQHXjuV3bAWAV+p1/+JwJlHOUdg25
         nPSoYThppSLmVfhLCHPIF6FGoZU4owC2IS0BHFwExvXZUMj8zNSUyQVVfqegKXgtlAf9
         LQAQ==
X-Gm-Message-State: AOAM530EZGxnEJ1zpHngxITVZhUoHNLJq6H1mkVss85prIm4jcBV1T0B
	gSpJxh8//keZGpcyhvw7xBE=
X-Google-Smtp-Source: ABdhPJw2MXRwi/73MA6L129wuYZTRDb820LGgWutg815SGiu09p+4S6TbWm6HQDHIY1UlND+YA6fQA==
X-Received: by 2002:a05:600c:4408:b0:388:a042:344f with SMTP id u8-20020a05600c440800b00388a042344fmr5099652wmn.52.1647384038341;
        Tue, 15 Mar 2022 15:40:38 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id f22-20020a1cc916000000b00380d3e49e89sm102234wmb.22.2022.03.15.15.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 15:40:38 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192e: Fix spelling mistake "RESQUEST" -> "REQUEST"
Date: Tue, 15 Mar 2022 22:40:37 +0000
Message-Id: <20220315224037.2962063-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a netdev_dbg message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index e3d0a361d370..eb904b42f9c6 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -2732,7 +2732,7 @@ static void rtllib_rx_mgt(struct rtllib_device *ieee,
 			      (struct rtllib_probe_response *)header, stats);
 		break;
 	case RTLLIB_STYPE_PROBE_REQ:
-		netdev_dbg(ieee->dev, "received PROBE RESQUEST (%d)\n",
+		netdev_dbg(ieee->dev, "received PROBE REQUEST (%d)\n",
 			   WLAN_FC_GET_STYPE(le16_to_cpu(header->frame_ctl)));
 		if ((ieee->softmac_features & IEEE_SOFTMAC_PROBERS) &&
 		    ((ieee->iw_mode == IW_MODE_ADHOC ||
-- 
2.35.1

