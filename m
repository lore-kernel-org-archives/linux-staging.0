Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE7B748C
	for <linux-staging@lists.linux.dev>; Sat,  9 Sep 2023 18:19:39 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-31f2ab21231so526560f8f.0
        for <linux-staging@lists.linux.dev>; Sat, 09 Sep 2023 11:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694283577; x=1694888377; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1aLXZJ8e8a6ZIeBJrLxOGJeFVq96U2uVqqm6oo+s6Dg=;
        b=ilR8bWSH38v8+HxK4ZuuoNlhPg3iNKZdKix8ZJbjh9EBucma4NTMUwAqPs500DADi0
         LBf9o124o/PKMs14lU1oXWCvNg98GpIZrgPLOyFMiKMZuJTxsUUwaj5NpFKDqKB52Dl8
         g6uJjVL3xUCU/2a8hO2dxpde2H00jRSS3YIwBg8/ldX3X5BEBWV5f31N25v0zEkqpyL1
         YUdXr/iqjNdm4iL0vz9vtIDgkdF9m8vqMbW3Oi0G/+dD5QhNyAWudV/sW5H/oevU6Mqz
         PNREzW+blhEUBbHyotBXLnOBW6zAaK75VHSedOROqm1JqPAXtCEvepU91yqTUy7iNTms
         4VmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694283577; x=1694888377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1aLXZJ8e8a6ZIeBJrLxOGJeFVq96U2uVqqm6oo+s6Dg=;
        b=wvN2UOwVMvIiKmjUuApbnh4Ss+JUQzYTq8M/BoaAO139tToX9PU5LN9ee4KzF+F8Og
         3LO5yZQ4fdDWFLo9bjOYa5dW/3DaMxSwf6SDJoiq1B5diQdxiahR+LUHjTBS34i4TRqM
         JHizhRBRBqTTa1lroO2dsDiaXeB36w30JD0m1J+UxBLJJShl/KZZnawZam12NUOZEXLw
         nBYbJgl/TVGlsIaShQjvq3vCLCeKUIN5Js/+eOfjxrakhpxZ/N+HXJZizq+g2a5/lpxZ
         i+yChG4lP433Vwij48mJqnxM8g5TIXANF021nR/4aFcXfu2p6+T8BvSMCSo2YD6efjtH
         dLVQ==
X-Gm-Message-State: AOJu0Yz4XkoAOtnsd9SjxPxPMUTOj64n82rBx2zab0ZYXDtFjZP83ZfI
	r46UkDtcQ6JIMNrjNWIHNwE=
X-Google-Smtp-Source: AGHT+IE0omFKM3JitdIp9lk4WPJ3b6Oj2Sakmb1uePpPNXbtLnIIY9lH+XCZgxIetNGRtwvsuEKi0Q==
X-Received: by 2002:adf:fec2:0:b0:31a:e21f:37ef with SMTP id q2-20020adffec2000000b0031ae21f37efmr4366455wrs.3.1694283577276;
        Sat, 09 Sep 2023 11:19:37 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id g9-20020adff409000000b00315af025098sm5408533wro.46.2023.09.09.11.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 11:19:37 -0700 (PDT)
Date: Sat, 9 Sep 2023 20:19:35 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] staging: rtl8192e: Use standard ieee80211 function in
 rtllib_rx_mgt()
Message-ID: <9cb9ffc25d558af2a0c6e1abb6ae92521ba7ab89.1694282907.git.philipp.g.hortmann@gmail.com>
References: <cover.1694282907.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1694282907.git.philipp.g.hortmann@gmail.com>

Replace WLAN_FC_GET_STYPE(le16_to_cpu(header->frame_ctl)) and comparison
with standard function to avoid proprietary code and to increase
readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 9f944eefa41e..108238aa61d9 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -2644,14 +2644,11 @@ static void rtllib_rx_mgt(struct rtllib_device *ieee,
 {
 	struct rtllib_hdr_4addr *header = (struct rtllib_hdr_4addr *)skb->data;
 
-	if ((WLAN_FC_GET_STYPE(le16_to_cpu(header->frame_ctl)) !=
-	    RTLLIB_STYPE_PROBE_RESP) &&
-	    (WLAN_FC_GET_STYPE(le16_to_cpu(header->frame_ctl)) !=
-	    RTLLIB_STYPE_BEACON))
+	if (!ieee80211_is_probe_resp(header->frame_ctl) &&
+	    (!ieee80211_is_beacon(header->frame_ctl)))
 		ieee->last_rx_ps_time = jiffies;
 
-	switch (WLAN_FC_GET_STYPE(le16_to_cpu(header->frame_ctl))) {
-	case RTLLIB_STYPE_BEACON:
+	if (ieee80211_is_beacon(header->frame_ctl)) {
 		netdev_dbg(ieee->dev, "received BEACON\n");
 		rtllib_process_probe_response(
 				ieee, (struct rtllib_probe_response *)header,
@@ -2661,20 +2658,15 @@ static void rtllib_rx_mgt(struct rtllib_device *ieee,
 		    ieee->iw_mode == IW_MODE_INFRA &&
 		    ieee->link_state == MAC80211_LINKED))
 			schedule_work(&ieee->ps_task);
-
-		break;
-
-	case RTLLIB_STYPE_PROBE_RESP:
+	} else if (ieee80211_is_probe_resp(header->frame_ctl)) {
 		netdev_dbg(ieee->dev, "received PROBE RESPONSE\n");
 		rtllib_process_probe_response(ieee,
 			      (struct rtllib_probe_response *)header, stats);
-		break;
-	case RTLLIB_STYPE_PROBE_REQ:
+	} else if (ieee80211_is_probe_req(header->frame_ctl)) {
 		netdev_dbg(ieee->dev, "received PROBE REQUEST\n");
 		if ((ieee->softmac_features & IEEE_SOFTMAC_PROBERS) &&
 		    (ieee->iw_mode == IW_MODE_ADHOC &&
 		    ieee->link_state == MAC80211_LINKED))
 			rtllib_rx_probe_rq(ieee, skb);
-		break;
 	}
 }
-- 
2.41.0

