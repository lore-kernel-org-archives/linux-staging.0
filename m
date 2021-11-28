Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5298D2C83
	for <linux-staging@lists.linux.dev>; Sun, 28 Nov 2021 13:53:41 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id p3-20020a05600c1d8300b003334fab53afso14653001wms.3
        for <linux-staging@lists.linux.dev>; Sun, 28 Nov 2021 05:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VDR+IVxxeeTY3pueMAGZ7jxJmYafV0PT+lGE6gPzU/g=;
        b=e0YUHokLR/ZLj7+ok8hihW2xB254hZu3XGxrOslzatqizRd1qpoZ4jagZMeAMiCTHV
         3ffScUUm7oVHZ+1SdZ6WDAP1ZtSzYDlDNo1T4Wn9e9Ux6K+27Oz8MxSu2K6nRdn57qgb
         v9r+B8Cm0aLUkJsOPAqDaXgp/3O5TZPz6qTRV7lEXtEUApt7R181fTkIW9flk2hB/T27
         9xEYFjDvYXgOwAY8y3fhi8ScrUL5xSh55uIgExi/Jpzg0/eFBXggYxBzTDmHN5vtY4qb
         2obzlcKmc98stA1MHfoYL9CkPmuSssrPD27jnHov3JqYTqlFAkFm0/VYeCzdaDEmXNJp
         Yx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VDR+IVxxeeTY3pueMAGZ7jxJmYafV0PT+lGE6gPzU/g=;
        b=U4GC5fNYkGqoeqo9bC75sDPqTwgb/hF6xzH6McpFZBgsS8mhGA4yw+weosjiQoxqVH
         5OJsnF+BUYaoti9pgs/rl8YPLsRqiAk0HUjHYX7wTPno4eOfTVfMPf60mERoWAwnXC1H
         Zjg/nxCaW0YztL+05fS0nZnaighHaEe2rDKOL+wdEX2Da4FXaCYQbHxyOrtmR/JKqsjR
         0XbK/nV83IXx9r853Q1lei9/PY/9JasguFd38XoxbSFJBUCkiI46+LuIPcr341ZQccMN
         U0oSZxuvqoK2dYJ8E1H4HtVdYvfcc3VunwCRPxS4RRSkDlhFy/6UlhO9uxqAnzejnhax
         0a2Q==
X-Gm-Message-State: AOAM533tav2XONhyPifMPuhNaplqbuRzDv5xNrNWBJ1rbtW5VF3vqwGm
	++NhowMAQXwIAiWAKwronGJkXrfIYvw=
X-Google-Smtp-Source: ABdhPJwJF17HSv10OSA4m6s/NbRd6+B4Z2lwkVoQs/7hXZWDcni1eA9wG0s1riIWXO1cePZAn32jmw==
X-Received: by 2002:a1c:21d7:: with SMTP id h206mr28559309wmh.60.1638107619775;
        Sun, 28 Nov 2021 05:53:39 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ac86])
        by smtp.gmail.com with ESMTPSA id l26sm13598510wms.15.2021.11.28.05.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 05:53:39 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 5/5] staging: r8188eu: remove module parameter rtw_rf_config
Date: Sun, 28 Nov 2021 14:53:26 +0100
Message-Id: <20211128135326.9838-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211128135326.9838-1-straube.linux@gmail.com>
References: <20211128135326.9838-1-straube.linux@gmail.com>
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

