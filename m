Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6562FB2
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 13:37:40 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id v1so2425535edt.6
        for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 06:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bwBHs/wfdbbTP/xDyWCdRqI3v9B7SnfqEe4JLN+8zlc=;
        b=iduWjB3ArSnnkWf/hyXF1SKw/bskl7XG6bKFKXEvVyxzVOtgj2T4nxbWNngdsarN4X
         M6veU/xTEVI5pmxzFUAUtuzDHXrgVQUopwpVKJqPIAAP63erLgjuhEZpFPmLnTOxNxg7
         3HDHUXtNmro/LlX1kMIcrn0tsRy3CpDAU64799iyDvz8nV9zk3Il4pe9uBeHooP09NpB
         X5sHAM+86aCylEOIlXxpn7J1G9zQ71+gOqcIaD0jfNlIqUvnQcOqruI/kC3DZNp37p17
         /kF4a9hQblc45QnggoAl2FM0CufmRu2E50XJ8GLzI0CbxD3PItG86JyxUcDBE+oxxqO4
         urQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bwBHs/wfdbbTP/xDyWCdRqI3v9B7SnfqEe4JLN+8zlc=;
        b=ChnHiZp2WJHldwRQOjUbyWB04+huzHVnAYwHpfkAKdEGvVTIeJaP9jlz1XGUPRX5aI
         74COkxaxk14YEz7/EhH6Dl+mhwlhfSSw9atcuG52N0vHhHr3/s4967nmn0NxATDcI7e+
         mw+xQlnm0CxXVdDQFl2S3WLm/WxcFCBaNdf0Nr1eeQxvE8JSewG3a+0BqK6+8VjOVha0
         SkUkMCyPZZb9kRDtyBo9+jqI4/zofYubGjvfShcW5dLgavFwFJ2JdUftUIRxiNHGnvpe
         PY5US67tDkkguUua25BMc31B9gsb429nnJbnUBdvr+76tGzMjFxV6J0VGk0qlyoYBN0o
         anBA==
X-Gm-Message-State: AOAM530bWv/LM47kOG4YoTxE9X576TvjpIZsVZ1nV6njpKt21a1eVZg6
	Pn6hKRoAbR9iPHPcTt6+q4o=
X-Google-Smtp-Source: ABdhPJyYBn4yziKabsG2WxiaLbSaXykX8wE/3lubrzs5tth8TVa425ekOlkfgAbQbAS6EE5t3LfkLQ==
X-Received: by 2002:aa7:d84a:: with SMTP id f10mr48652181eds.45.1626874658944;
        Wed, 21 Jul 2021 06:37:38 -0700 (PDT)
Received: from agape ([5.171.73.45])
        by smtp.gmail.com with ESMTPSA id d2sm8318931ejy.108.2021.07.21.06.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 06:37:38 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/16] staging: rtl8723bs: remove struct ndis_802_11_conf_fh
Date: Wed, 21 Jul 2021 15:37:16 +0200
Message-Id: <9c203ab5fe8a36b96f1f24e1fbf1a08ea0fa82af.1626874164.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1626874164.git.fabioaiuto83@gmail.com>
References: <cover.1626874164.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

all members of struct ndis_802_11_conf_fh fh_config in
struct ndis_802_11_conf are set to zero and their values
are never used. So remove struct ndis_802_11_conf_fh.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c       | 4 ----
 drivers/staging/rtl8723bs/include/wlan_bssdef.h | 8 --------
 2 files changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index f189cd6c11ac..624bafd44ceb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2154,10 +2154,6 @@ void rtw_init_registrypriv_dev_network(struct adapter *adapter)
 
 	pdev_network->configuration.length = sizeof(struct ndis_802_11_conf);
 	pdev_network->configuration.beacon_period = 100;
-	pdev_network->configuration.fh_config.Length = 0;
-	pdev_network->configuration.fh_config.HopPattern = 0;
-	pdev_network->configuration.fh_config.HopSet = 0;
-	pdev_network->configuration.fh_config.DwellTime = 0;
 }
 
 void rtw_update_registrypriv_dev_network(struct adapter *adapter)
diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index 6bdda580cef5..e5ab3cacfa91 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -32,13 +32,6 @@ enum ndis_802_11_network_type {
 	Ndis802_11NetworkTypeMax    /*  not a real type, defined as an upper bound */
 };
 
-struct ndis_802_11_conf_fh {
-	u32 Length;             /*  Length of structure */
-	u32 HopPattern;         /*  As defined by 802.11, MSB set */
-	u32 HopSet;             /*  to one if non-802.11 */
-	u32 DwellTime;          /*  units are Kusec */
-};
-
 /*
 	FW will only save the channel number in DSConfig.
 	ODI Handler will convert the channel number to freq. number.
@@ -48,7 +41,6 @@ struct ndis_802_11_conf {
 	u32 beacon_period;       /*  units are Kusec */
 	u32 atim_window;         /*  units are Kusec */
 	u32 ds_config;           /*  Frequency, units are kHz */
-	struct ndis_802_11_conf_fh    fh_config;
 };
 
 enum ndis_802_11_network_infrastructure {
-- 
2.20.1

