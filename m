Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05D22C80
	for <linux-staging@lists.linux.dev>; Sun, 28 Nov 2021 17:09:58 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id o29so12699812wms.2
        for <linux-staging@lists.linux.dev>; Sun, 28 Nov 2021 09:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VDR+IVxxeeTY3pueMAGZ7jxJmYafV0PT+lGE6gPzU/g=;
        b=S5upfRz9lN77QH3G8CFZjUiEavx1EituaAIIS0ZVDRdzwB7zjfd2vl6ZO+Jj6uXKd5
         wGtfpVXYru01kEk/OC8uYWcTifWWRVffUV61HVY4J+voUE+543QU1xrtcTwpTGX1Nak0
         RvNN4ltyJysLXL/m1QXNqY0WG7yMqvneFcMWheKYFmZ8YaVVJBsYA7mBvYtWXptX3C71
         U2emytwQQoTmzr4/JB1x2e/i0BZ3+svXvTXHxsH7Wl+mKibWo2p4EqO3dPjlw0iqT382
         n5wn+xtQ2eB3BaP2M/g4mfzRh5hpXXUFphBZ5L9gq9ikiBwyf00Df5P903/zY/ZDQSU5
         KhMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VDR+IVxxeeTY3pueMAGZ7jxJmYafV0PT+lGE6gPzU/g=;
        b=l3KQBvSHGw30SvRcpeTsl8GUNdShrHxvF9LMG4+wLeMk0LRwY7I8y6jAWn3+CeeAkL
         hZHLt1XEDXOO8S1a06BuHh46WFUFr6NCZzWSG79GOfLcULoZzAAtPEDfJiq5VCZ6t8mi
         i6a5xCmgeo0kFqa+URQ33x4UXibMWW3NSW6CbiLdySxDK5Bd0wS36eD3OW7XOTTr5TsT
         pGoYaPNAmcvow1p3OUH4E63JbylWEfMDIVefnr6dcC7BhqI2wBwf1B5Xlm67yy4L+bDl
         lwwCvObnl0HzvraGFU2nsSPjGh7+K3nQYaeIMplveumAb3j4EDFMAfuxdFfNqbbUfUs7
         cepQ==
X-Gm-Message-State: AOAM533ASrjZtj649sry6BFRMdUoDwkqQidIrJQ2t16kVouoDEGcwNLs
	6o+JNHHVDLkz0lsNrxQMTHk=
X-Google-Smtp-Source: ABdhPJymkgns9D9qgHJXuC1+m/H1yB/tlovzTOzwy3lgONbZuLc8hCIfufDa5HYB5cY5wtyoCz9CSw==
X-Received: by 2002:a7b:cf10:: with SMTP id l16mr30923511wmg.17.1638119397390;
        Sun, 28 Nov 2021 09:09:57 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ac86])
        by smtp.gmail.com with ESMTPSA id n15sm18243845wmq.38.2021.11.28.09.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 09:09:57 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 10/10] staging: r8188eu: remove module parameter rtw_rf_config
Date: Sun, 28 Nov 2021 18:09:24 +0100
Message-Id: <20211128170924.5874-11-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211128170924.5874-1-straube.linux@gmail.com>
References: <20211128170924.5874-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The module parameter rtw_rf_config is not used in the driver.
Remove it and remove the now unused enum rt_rf_type_def.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/drv_types.h |  1 -
 drivers/staging/r8188eu/include/rtw_rf.h    | 10 ----------
 drivers/staging/r8188eu/os_dep/os_intfs.c   |  3 ---
 3 files changed, 14 deletions(-)

diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
index 3e4928320f17..edcdbd646eaa 100644
--- a/drivers/staging/r8188eu/include/drv_types.h
+++ b/drivers/staging/r8188eu/include/drv_types.h
@@ -85,7 +85,6 @@ struct registry_priv {
 	u8	ampdu_amsdu;/* A-MPDU Supports A-MSDU is permitted */
 	u8	lowrate_two_xmit;
 
-	u8	rf_config;
 	u8	low_power;
 
 	u8	wifi_spec;/*  !turbo_mode */
diff --git a/drivers/staging/r8188eu/include/rtw_rf.h b/drivers/staging/r8188eu/include/rtw_rf.h
index 7ec252fec054..d0a408b903dc 100644
--- a/drivers/staging/r8188eu/include/rtw_rf.h
+++ b/drivers/staging/r8188eu/include/rtw_rf.h
@@ -99,16 +99,6 @@ enum ht_extchnl_offset {
 	HT_EXTCHNL_OFFSET_LOWER = 3,
 };
 
-/* 2007/11/15 MH Define different RF type. */
-enum rt_rf_type_def {
-	RF_1T2R = 0,
-	RF_2T4R = 1,
-	RF_2T2R = 2,
-	RF_1T1R = 3,
-	RF_2T2R_GREEN = 4,
-	RF_819X_MAX_TYPE = 5,
-};
-
 u32 rtw_ch2freq(u32 ch);
 
 #endif /* _RTL8711_RF_H_ */
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 5a5f182d30c9..0021ca578949 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -75,7 +75,6 @@ static int rtw_ampdu_amsdu;/*  0: disabled, 1:enabled, 2:auto */
 
 static int rtw_lowrate_two_xmit = 1;/* Use 2 path Tx to transmit MCS0~7 and legacy mode */
 
-static int rtw_rf_config = RF_819X_MAX_TYPE;  /* auto */
 static int rtw_low_power;
 static int rtw_wifi_spec;
 static int rtw_channel_plan = RT_CHANNEL_DOMAIN_MAX;
@@ -123,7 +122,6 @@ module_param(rtw_ampdu_enable, int, 0644);
 module_param(rtw_rx_stbc, int, 0644);
 module_param(rtw_ampdu_amsdu, int, 0644);
 module_param(rtw_lowrate_two_xmit, int, 0644);
-module_param(rtw_rf_config, int, 0644);
 module_param(rtw_power_mgnt, int, 0644);
 module_param(rtw_smart_ps, int, 0644);
 module_param(rtw_low_power, int, 0644);
@@ -205,7 +203,6 @@ static uint loadparam(struct adapter *padapter,  struct  net_device *pnetdev)
 	registry_par->rx_stbc = (u8)rtw_rx_stbc;
 	registry_par->ampdu_amsdu = (u8)rtw_ampdu_amsdu;
 	registry_par->lowrate_two_xmit = (u8)rtw_lowrate_two_xmit;
-	registry_par->rf_config = (u8)rtw_rf_config;
 	registry_par->low_power = (u8)rtw_low_power;
 	registry_par->wifi_spec = (u8)rtw_wifi_spec;
 	registry_par->channel_plan = (u8)rtw_channel_plan;
-- 
2.34.0

