Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F734381D5
	for <linux-staging@lists.linux.dev>; Fri, 24 Nov 2023 21:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFYuPCWZ"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5451faa3aa7so697755a12.0
        for <linux-staging@lists.linux.dev>; Fri, 24 Nov 2023 13:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700861449; x=1701466249; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xoZLCfy84gUYPbI3uqvkOab7elap9QZSeyk50KS8zLU=;
        b=SFYuPCWZpeBV7jEYGtgpGY6q0cDOWM5SmbTpyc0CHYmfCg4gJ1vV3ToL9lu9szEvoG
         /CD3nQhk8zfTtHBDC1amOibrL5zpKIsQzLH0aC22rrFcBlUi/8+5+VY1inT3fFgc0GZe
         k/9Q/JR3omK7+Ef8mGiYvXsy5QFvAgHscO9R7NeaS6d0cLo/D6DTmv2Vjwc+Cb+VSN01
         Md9EwirvJzE4/2dmjpxYWYUux1Ukuc0uEBnW5rliS/iob2aDRptfUf3i4ujVDsIs35hw
         WPFKyF1Cgu/cB+q+YfVOMIRQdk5yBmroHe4Z/NXnRuVRKaCyRXloHhB3NS8XqhS2JqQp
         TFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700861449; x=1701466249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xoZLCfy84gUYPbI3uqvkOab7elap9QZSeyk50KS8zLU=;
        b=qQlOKFQfYAJgi3V+dl1/SB603aS/sum1aF9nQ/fMShC44enBggOMWEUCVRQiGELibZ
         2qBdbRLFV32FW2mjhx+KLxdns0c1s+aOjcHxkD2XNwYKTxwYehXNLQeCurI8VkGhlIbY
         kaXWYMAV3P/btfuv2GM2Qrzcrx0ql7UBCLxueKAUujGhv/zDG6dXpMXV3RnRswwo2A2A
         a7+e7wytATqEXJEwZG1L8Man4yzEURQYSoOY/Hq3J5iVIsXJKeqwOl6vud0FLRDV+715
         z7ImWhebwn4W4RfH76CMKhG18lIvVG7iobehySjiEN6iiwlHfqhwipp5ocMhzx8BPY1E
         GpHQ==
X-Gm-Message-State: AOJu0Yz4qAyX5O1T9UrP6bGOo/hvN288g0woUszu3oTZRckBRIbwBzDy
	YskJNBGShDPpkvrcE1BntctlWpvxRDU=
X-Google-Smtp-Source: AGHT+IExYU05LokiyAqdqqUl1BXlu3JcZIXnjwyodpQNEFEEwHrckfNTeYD3GXE+m1aWcsGb3gIwHA==
X-Received: by 2002:a17:907:b00f:b0:9b2:bf2d:6b65 with SMTP id fu15-20020a170907b00f00b009b2bf2d6b65mr2305143ejc.4.1700861449489;
        Fri, 24 Nov 2023 13:30:49 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id bv8-20020a170906b1c800b009fc927023bcsm2527152ejb.34.2023.11.24.13.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 13:30:49 -0800 (PST)
Date: Fri, 24 Nov 2023 22:30:47 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] staging: rtl8192e: Remove unused timer beacon_timer
Message-ID: <b16b6b4525ede8e2a218cb39d23f9ef2a3a745a9.1700860759.git.philipp.g.hortmann@gmail.com>
References: <cover.1700860758.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1700860758.git.philipp.g.hortmann@gmail.com>

Driver does not support AP Mode therefore no beacons need to be send.
Remove unused timer beacon_timer.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h         |  1 -
 drivers/staging/rtl8192e/rtllib_softmac.c | 17 -----------------
 2 files changed, 18 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 835b407ab180..b7f4d7e2ea26 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1418,7 +1418,6 @@ struct rtllib_device {
 	struct timer_list associate_timer;
 
 	/* used if IEEE_SOFTMAC_BEACONS is set */
-	struct timer_list beacon_timer;
 	u8 need_sw_enc;
 	struct work_struct associate_complete_wq;
 	struct work_struct ips_leave_wq;
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 0ad08165fd85..430951c88123 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -365,21 +365,6 @@ static void rtllib_send_beacon(struct rtllib_device *ieee)
 		softmac_mgmt_xmit(skb, ieee);
 		ieee->softmac_stats.tx_beacons++;
 	}
-
-	if (ieee->beacon_txing && ieee->ieee_up)
-		mod_timer(&ieee->beacon_timer, jiffies +
-			  (msecs_to_jiffies(ieee->current_network.beacon_interval - 5)));
-}
-
-static void rtllib_send_beacon_cb(struct timer_list *t)
-{
-	struct rtllib_device *ieee =
-		from_timer(ieee, t, beacon_timer);
-	unsigned long flags;
-
-	spin_lock_irqsave(&ieee->beacon_lock, flags);
-	rtllib_send_beacon(ieee);
-	spin_unlock_irqrestore(&ieee->beacon_lock, flags);
 }
 
 /* Enables network monitor mode, all rx packets will be received. */
@@ -2328,8 +2313,6 @@ int rtllib_softmac_init(struct rtllib_device *ieee)
 
 	timer_setup(&ieee->associate_timer, rtllib_associate_abort_cb, 0);
 
-	timer_setup(&ieee->beacon_timer, rtllib_send_beacon_cb, 0);
-
 	INIT_DELAYED_WORK(&ieee->link_change_wq, (void *)rtllib_link_change_wq);
 	INIT_WORK(&ieee->associate_complete_wq, (void *)rtllib_associate_complete_wq);
 	INIT_DELAYED_WORK(&ieee->associate_procedure_wq, (void *)rtllib_associate_procedure_wq);
-- 
2.42.0

