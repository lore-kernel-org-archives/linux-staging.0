Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41F641C87
	for <linux-staging@lists.linux.dev>; Fri,  8 Dec 2023 18:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g17xt2s8"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a1cc518c5bbso65170866b.1
        for <linux-staging@lists.linux.dev>; Fri, 08 Dec 2023 10:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702059575; x=1702664375; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kTX3lMeAIKadkUoJwz/Rosz/NiJGwf6YHqZeimpRp6A=;
        b=g17xt2s8M60yBqr64d2qntRV5+kHpClt+KA7xB+my+FancW4OUHkPE/8fxV5a5VhZF
         /dbJssK9SQx+CwioSOkIhrEXI+teF1Rq8WJ7Am+3P45mIyExcKKuzfHGsxHI96uZHaPV
         drQ4QCP6H4BQJzvfZjp1nYY01ge+JWMFZN0jFIDAQ9cMtam8OHXKK7r0oQI59GjSzHjg
         1gemf/9OPOOyqNrkxCqXOO0lvgI6mY1G9FZqRbwdUvXmV0apks3IJpJkf1+3Kad8oqqQ
         dStGqjk2/0aiAnCFAytTBgg1oCQxvv14rEhVzvCtQRfASbUpZsULYJRY3fFVZP2U5s/Y
         qjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702059575; x=1702664375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTX3lMeAIKadkUoJwz/Rosz/NiJGwf6YHqZeimpRp6A=;
        b=YZ6HSNHnpQdiggMzbt4Ky4KZ6002pBG27FCOdDJbfSQFcSD7/M3VZiVLkbbUacwzzN
         m+1RitT0CFAycf6Et0rIJZ2DYCtNV6kqWmqH+C1ZyNMYeJrz4k0uqmSlqBFmjUI5XKBe
         ux7/8nJ+IH0TTQUb483BVWw0Z8megMJOZstZh9X1mXEd39JiC3Ie8MkGze/ITu909Ids
         rGaWkIbP/Zswc0wEcsHjaTONhbwiDqBMjZRtl/cWmamZdn0oAEkdiwviJ22xlutvtRRD
         JRiqhT6ZNKqguHtmUANOc+44wsJqnUGB9HkesoHwoVxIMEernc1R7UA6PBdt443uOjCK
         rxzw==
X-Gm-Message-State: AOJu0YyaHyHpkSFe866qGyIde1KkFflflhBXT0w4wBItgxypzqpblalB
	x4JvQs21SCEnnDBbuMaEVaVnFikNaA8=
X-Google-Smtp-Source: AGHT+IEa2gyOJV1MQMCzieEEmtEXsvhMMp5A3m//mLOsFG8g1bj4IJth0spuTtuBYjsKzVHut3WiYQ==
X-Received: by 2002:a17:907:d30a:b0:a1c:dce4:1daf with SMTP id vg10-20020a170907d30a00b00a1cdce41dafmr445458ejc.2.1702059574759;
        Fri, 08 Dec 2023 10:19:34 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id rd12-20020a170907a28c00b00a11b2677acbsm1266784ejc.163.2023.12.08.10.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 10:19:34 -0800 (PST)
Date: Fri, 8 Dec 2023 19:19:32 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] staging: rtl8192e: Remove function
 rtllib_update_active_chan_map()
Message-ID: <bae3ddeffe96e4ac7d929127ce3a72cd23fae8dd.1701989555.git.philipp.g.hortmann@gmail.com>
References: <cover.1701989555.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1701989555.git.philipp.g.hortmann@gmail.com>

Remove function rtllib_update_active_chan_map() as "active_channel_map"
and "channel_map" have the same content.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index d20970652432..fdb0e76d20b0 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -394,12 +394,6 @@ static void rtllib_send_probe_requests(struct rtllib_device *ieee)
 	}
 }
 
-static void rtllib_update_active_chan_map(struct rtllib_device *ieee)
-{
-	memcpy(ieee->active_channel_map, GET_DOT11D_INFO(ieee)->channel_map,
-	       MAX_CHANNEL_NUMBER + 1);
-}
-
 /* this performs syncro scan blocking the caller until all channels
  * in the allowed channel map has been checked.
  */
@@ -408,8 +402,6 @@ static void rtllib_softmac_scan_syncro(struct rtllib_device *ieee)
 	union iwreq_data wrqu;
 	short ch = 0;
 
-	rtllib_update_active_chan_map(ieee);
-
 	ieee->be_scan_inprogress = true;
 
 	mutex_lock(&ieee->scan_mutex);
@@ -475,8 +467,6 @@ static void rtllib_softmac_scan_wq(void *data)
 				     struct rtllib_device, softmac_scan_wq);
 	u8 last_channel = ieee->current_network.channel;
 
-	rtllib_update_active_chan_map(ieee);
-
 	if (!ieee->ieee_up)
 		return;
 	if (rtllib_act_scanning(ieee, true))
@@ -2042,8 +2032,6 @@ void rtllib_start_protocol(struct rtllib_device *ieee)
 	short ch = 0;
 	int i = 0;
 
-	rtllib_update_active_chan_map(ieee);
-
 	if (ieee->proto_started)
 		return;
 
-- 
2.43.0

