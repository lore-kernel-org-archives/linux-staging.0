Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599227477
	for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 18:09:38 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-50a20bfe366so2790269a12.0
        for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 11:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684001376; x=1686593376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8VxLMT4xRiLk8QG1zBEjB+qxmXTQtCzKqJP+7ubfx9I=;
        b=T5BIobgx5E3zQz9zM+pzdOcJm+WOm1bdelItHUofUdvVj5cJILc8xgab7gnWVLqPF6
         PjAR3tB4wX7Q2oGD7uTeNVgjf8g8FggS4M/JUwUX2wrW+LPPCFK13Ec2xm5ACsVHZ2sv
         gWc0RKDgdLJ1Oe4PpSDMFiSBNaRgprrxVdrCbpcm0StORYi5ztrCM6j4x9qWaoJtKeQL
         rGO0GlhgWI3AsVlAM/6mBW+cglLS1sKAWLJYBeKUc3y9GTg/wRMRjZ7AsGWl9JXmPbge
         1HpeoeH2j/X6hfWdZT4p+c5EEJKoxQJy5P3fHPvmziF9pnI2j6QXmkPObvMDo98d4EWz
         y4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684001376; x=1686593376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VxLMT4xRiLk8QG1zBEjB+qxmXTQtCzKqJP+7ubfx9I=;
        b=VBCOrCCigZVkVtP6V/rBA07OzKXlb/S4nUhIMfc3F2D6w6hHLNeo4anv/BVgy/kl0C
         KqXyA2Jej6ifKcpr5kMGHZyDKZPHpDwaMO9zkn4xipeCtDa0/wnMr+9ns3HYnsmMdGQv
         0sGGdOx/MJMfRCpULJvu6erGWTnDt9SgtpoaQTTfDhglnAuVm3MeZzjcnUeK1csrAqvj
         QH8hS056+31WJyXB0nFhlc2RiEg5SwSaC6xd9SQo7Fn5k8cD0m19gGvIeFRRdJQfGJ30
         1uxq+i2W8TM2qeRST09zfWwvj7jLagyiyVbB+D5agndRdK+s8+nh1WOw//21FKgg6PPh
         Lu+Q==
X-Gm-Message-State: AC+VfDy1/aRSKCGCIX4QuirqNYrrR8AMWenvNwpSG8W3QIVc5Y5k0qo2
	ZHfUK09DXx6fcESWcacFTA8=
X-Google-Smtp-Source: ACHHUZ4ft+cn12hTN4Uuj5t0P2JuEBm/GeW5Gx0Gl8rrISnGI1AWEoPUKTxA0gNYCXIRPQICiyfrPw==
X-Received: by 2002:a05:6402:2742:b0:50d:9ba4:52dc with SMTP id z2-20020a056402274200b0050d9ba452dcmr3206515edd.0.1684001376457;
        Sat, 13 May 2023 11:09:36 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935e01.dip0.t-ipconnect.de. [87.147.94.1])
        by smtp.gmail.com with ESMTPSA id bn13-20020a170906c0cd00b0096599bf7029sm7119706ejb.145.2023.05.13.11.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 11:09:36 -0700 (PDT)
Date: Sat, 13 May 2023 20:09:34 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] staging: rtl8192e: Remove undefined function
 UpdateBeaconInterruptHandler
Message-ID: <7cc71096fb1e6fee755dd96de0095ef1fb6d51e1.1683960685.git.philipp.g.hortmann@gmail.com>
References: <cover.1683960684.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1683960684.git.philipp.g.hortmann@gmail.com>

Remove function UpdateBeaconInterruptHandler as it is not defined.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 --
 drivers/staging/rtl8192e/rtllib.h            | 2 --
 drivers/staging/rtl8192e/rtllib_softmac.c    | 6 ------
 3 files changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 3f8a58e32930..5fdee7b54f24 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -739,8 +739,6 @@ static void _rtl92e_init_priv_handler(struct net_device *dev)
 	priv->rtllib->rtllib_ips_leave = rtl92e_rtllib_ips_leave;
 
 	priv->rtllib->LedControlHandler = NULL;
-	priv->rtllib->UpdateBeaconInterruptHandler = NULL;
-
 	priv->rtllib->ScanOperationBackupHandler = rtl92e_scan_op_backup;
 }
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 6c1f56324bd6..8bafee31e50c 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1714,8 +1714,6 @@ struct rtllib_device {
 	bool (*GetHalfNmodeSupportByAPsHandler)(struct net_device *dev);
 	u8   (*rtllib_ap_sec_type)(struct rtllib_device *ieee);
 	void (*InitialGainHandler)(struct net_device *dev, u8 Operation);
-	void (*UpdateBeaconInterruptHandler)(struct net_device *dev,
-					     bool start);
 	void (*ScanOperationBackupHandler)(struct net_device *dev,
 					   u8 Operation);
 	void (*LedControlHandler)(struct net_device *dev,
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index bb28414b88bc..1fe0675033cb 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2882,9 +2882,6 @@ void rtllib_start_protocol(struct rtllib_device *ieee)
 		ieee->last_packet_time[i] = 0;
 	}
 
-	if (ieee->UpdateBeaconInterruptHandler)
-		ieee->UpdateBeaconInterruptHandler(ieee->dev, false);
-
 	ieee->wmm_acm = 0;
 	/* if the user set the MAC of the ad-hoc cell and then
 	 * switch to managed mode, shall we  make sure that association
@@ -2894,9 +2891,6 @@ void rtllib_start_protocol(struct rtllib_device *ieee)
 	if (ieee->iw_mode == IW_MODE_INFRA) {
 		rtllib_start_bss(ieee);
 	} else if (ieee->iw_mode == IW_MODE_ADHOC) {
-		if (ieee->UpdateBeaconInterruptHandler)
-			ieee->UpdateBeaconInterruptHandler(ieee->dev, true);
-
 		rtllib_start_ibss(ieee);
 
 	} else if (ieee->iw_mode == IW_MODE_MASTER) {
-- 
2.40.1

