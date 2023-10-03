Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7959938DE6
	for <linux-staging@lists.linux.dev>; Tue,  3 Oct 2023 19:33:22 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-98273ae42d0so50504866b.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Oct 2023 12:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696361601; x=1696966401; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=72i878pEVOruzqTmXw4X4pHlqTkys0N/rw2142cAbGA=;
        b=H7d8m6t9EwKr6piB39CwzVhx4XLrdTpIkOKg+uOEkMhyj8/aZot3hGfFjofeiZaPhj
         y/+OeP4B2vgEHEK9hK8zI686Ragpw+sUGuFBEPK/6wPm9macRe7g4CmrfXAD/TKRPF3g
         cAapldOk1n6ZCoyAb1B8CBlj9cfiovXrT3E46okAPJ5vxHxajLcgEipHlr8msMKjvhEH
         nLPQS1fEmgOsXLngjEaUMHsmNLxqJiPMQUlEURvShALibEnPDx9Hw9MJecHz7wwOPA7G
         z/NpBNDGP8J2HZEXH6Pq7hBul66edXELsYepVJJnICSNJoWh7dnPTJZsygTizSb9qwhp
         ahOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696361601; x=1696966401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72i878pEVOruzqTmXw4X4pHlqTkys0N/rw2142cAbGA=;
        b=WqppOWQDQfLAuMZDyl3kcvixoAkIOmtOzIl4Upn+JRqJkHFU1hX0/yx9AhztLTnQfT
         VkWONDCs3iuuNEZlMsUifWZcx6MXyosivHl15FX8l8IPTtJlelnTI+8jKscICyXWsttd
         Gc01QbwkMwpuf6AfQmdfPgHm322Sx5otwelRgqkHlh3+Js6FX/my3fEqr2nr24xu/YJI
         /kgAy6b31wjlTQJejwFFDUSCpNiu62oqEnmLvkiVzhdGiMCoeWWeqwSdRgGTmYdHnLtx
         SVOoUVlE9Txuo/mQRMo+XsgVyZnHjQuiXJ87I5Qg7yBPz46BKA8mQz9X+zhkVXoiF4XC
         j3yg==
X-Gm-Message-State: AOJu0YxCVt9R8duV5G7Z4OPKR9Hi6Rrq1HIEk3pDQjF9Ug6dm9V95R7J
	kXUrdp8P6Oc8aWHZ+1uSa+A=
X-Google-Smtp-Source: AGHT+IEmi67FrdM1NuXU+t/SD4DGznx8tAeslFCpU6FRXUgLi99wj69uxin13zeljNNF6+BESyUWFw==
X-Received: by 2002:a17:906:530b:b0:9a1:d915:6372 with SMTP id h11-20020a170906530b00b009a1d9156372mr113828ejo.4.1696361600729;
        Tue, 03 Oct 2023 12:33:20 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id gr11-20020a170906e2cb00b0099bc80d5575sm1477043ejb.200.2023.10.03.12.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 12:33:20 -0700 (PDT)
Date: Tue, 3 Oct 2023 21:33:19 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 03/11] staging: rtl8192e: Remove function
 rtllib_start_monitor_mode()
Message-ID: <0031b5f9150851e5ec86a56c1ffad5488fa065f4.1696360403.git.philipp.g.hortmann@gmail.com>
References: <cover.1696360403.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1696360403.git.philipp.g.hortmann@gmail.com>

Remove equation with raw_tx in function rtllib_start_monitor_mode() as it
is always false. rtllib_start_monitor_mode() is then empty and can be
removed as well.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index de1808b372d9..babd48aa327d 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2135,13 +2135,6 @@ void rtllib_wake_all_queues(struct rtllib_device *ieee)
 	netif_tx_wake_all_queues(ieee->dev);
 }
 
-static void rtllib_start_monitor_mode(struct rtllib_device *ieee)
-{
-	/* reset hardware status */
-	if (ieee->raw_tx)
-		netif_carrier_on(ieee->dev);
-}
-
 /* this is called only in user context, with wx_mutex held */
 static void rtllib_start_bss(struct rtllib_device *ieee)
 {
@@ -2371,9 +2364,6 @@ void rtllib_start_protocol(struct rtllib_device *ieee)
 	case IW_MODE_INFRA:
 		rtllib_start_bss(ieee);
 		break;
-	case IW_MODE_MONITOR:
-		rtllib_start_monitor_mode(ieee);
-		break;
 	}
 }
 
-- 
2.42.0

