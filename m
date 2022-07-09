Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABEFEBE
	for <linux-staging@lists.linux.dev>; Sat,  9 Jul 2022 09:45:10 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id a9so1390621ejf.6
        for <linux-staging@lists.linux.dev>; Sat, 09 Jul 2022 02:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ewUf2hENnlAF2aQNImmyJy6eeSPnXJ3tJemZRB/Hb6g=;
        b=ola8tAunmQhRemBQO2OOvTLHTdwl7fLZpR9xFcTFtrUZMDcg5guZm8VVj644BjyNyr
         zbVCFM1Rf8EV10J0TRRyP5t6lFWE+2e+aPgmJ/GWIUovLpC7EaOViZm4q9mBFP4uay2A
         vVfl38nT5RBXZeckZ8i4pVCxLtunjw/FexkFs7kT5GUf8TfO94zccjCkourlHo3AHP3P
         NhpaGqRefrKuKiAGoq+l/ORtB6OudUrV64YBzUyBUGAYSPqYObEBPCHKE5pIEcUow2RJ
         8xSEx9F5iGW+axvLrTFl06EfY6SSepatIZwVzDp9Q3Z9mzuTyFEMb0xKNgixTE8PWNd4
         cjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ewUf2hENnlAF2aQNImmyJy6eeSPnXJ3tJemZRB/Hb6g=;
        b=tBVWLXYTtImrDiPto1J+PSdPPCEf7otkMgOrHdyTUIZLPNvrwyecjKr8ymx7MjSGxH
         hRzq3eYzyEtnkoUJu7YsclXtj1Fn7Zcnhkdj/WXxJ5WYa7GKEk+vsumDYwAI77XkHKsO
         uIVMWfxVPoeWcu+P8XyHRsjk5JBcs7STXoYOI0yiSdZg34G2pkiuKGPNiUZc9S8OLK1w
         Czw7k+cqLVKMl9dWDvHPqWM3U8dxbYeOlhuWrl9Q8vx1vzt416IPYOUf+QFL65KyNQzW
         SYwBWP6HXoT2ftSn8Iy7zQ8p2o/CYz1VEcH+pk4+WMJSSW0itMsfw+aLCQDrpiglT4ll
         T73g==
X-Gm-Message-State: AJIora+rIYkK2kF/MlI5uEjO13nLSQ0sAzD/VTx+Q5UARwfaP+D1tjDn
	L+n/hlpNDFGvruUVI9iM+a2WxupEX0A=
X-Google-Smtp-Source: AGRyM1sVWeVJxHL7+w4ozfNOUxqCTlwm+Q7sjO3bC858qDCDf07Yveh2KH5PTtOwANhWTwmD7JVyEQ==
X-Received: by 2002:a17:906:72cf:b0:722:e1a4:25 with SMTP id m15-20020a17090672cf00b00722e1a40025mr8152475ejl.205.1657359908713;
        Sat, 09 Jul 2022 02:45:08 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6f.dynamic.kabel-deutschland.de. [95.90.187.111])
        by smtp.gmail.com with ESMTPSA id hy10-20020a1709068a6a00b00704757b1debsm441521ejc.9.2022.07.09.02.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Jul 2022 02:45:08 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/5] staging: r8188eu: remove HW_VAR_BASIC_RATE from SetHwReg8188EU()
Date: Sat,  9 Jul 2022 11:44:54 +0200
Message-Id: <20220709094458.9578-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220709094458.9578-1-straube.linux@gmail.com>
References: <20220709094458.9578-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the HW_VAR_BASIC_RATE case from SetHwReg8188EU() and move the
functionality to a separate function. This is part of the ongoing
effort to get rid of SetHwReg8188EU().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   |  2 +-
 drivers/staging/r8188eu/core/rtw_wlan_util.c  | 41 ++++++++++++++++++-
 drivers/staging/r8188eu/hal/usb_halinit.c     | 37 -----------------
 drivers/staging/r8188eu/include/hal_intf.h    |  1 -
 .../staging/r8188eu/include/rtw_mlme_ext.h    |  1 +
 5 files changed, 42 insertions(+), 40 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 21485c57dc3f..a16996982b58 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -6681,7 +6681,7 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 	/*  update IOT-releated issue */
 	update_IOT_info(padapter);
 
-	SetHwReg8188EU(padapter, HW_VAR_BASIC_RATE, cur_network->SupportedRates);
+	rtw_set_basic_rate(padapter, cur_network->SupportedRates);
 
 	/* BCN interval */
 	rtw_write16(padapter, REG_BCN_INTERVAL, pmlmeinfo->bcn_interval);
diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index aa6b549fd54d..60c49e161c12 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -1265,6 +1265,45 @@ void set_sta_rate(struct adapter *padapter, struct sta_info *psta)
 	enable_rate_adaptive(padapter, psta->mac_id);
 }
 
+void rtw_set_basic_rate(struct adapter *adapter, u8 *rates)
+{
+	u16 BrateCfg = 0;
+	u8 RateIndex = 0;
+	int res;
+	u8 reg;
+
+	/*  2007.01.16, by Emily */
+	/*  Select RRSR (in Legacy-OFDM and CCK) */
+	/*  For 8190, we select only 24M, 12M, 6M, 11M, 5.5M, 2M, and 1M from the Basic rate. */
+	/*  We do not use other rates. */
+	HalSetBrateCfg(adapter, rates, &BrateCfg);
+
+	/* 2011.03.30 add by Luke Lee */
+	/* CCK 2M ACK should be disabled for some BCM and Atheros AP IOT */
+	/* because CCK 2M has poor TXEVM */
+	/* CCK 5.5M & 11M ACK should be enabled for better performance */
+
+	BrateCfg = (BrateCfg | 0xd) & 0x15d;
+
+	BrateCfg |= 0x01; /*  default enable 1M ACK rate */
+	/*  Set RRSR rate table. */
+	rtw_write8(adapter, REG_RRSR, BrateCfg & 0xff);
+	rtw_write8(adapter, REG_RRSR + 1, (BrateCfg >> 8) & 0xff);
+	res = rtw_read8(adapter, REG_RRSR + 2, &reg);
+	if (res)
+		return;
+
+	rtw_write8(adapter, REG_RRSR + 2, reg & 0xf0);
+
+	/*  Set RTS initial rate */
+	while (BrateCfg > 0x1) {
+		BrateCfg = (BrateCfg >> 1);
+		RateIndex++;
+	}
+	/*  Ziv - Check */
+	rtw_write8(adapter, REG_INIRTS_RATE_SEL, RateIndex);
+}
+
 /*  Update RRSR and Rate for USERATE */
 void update_tx_basic_rate(struct adapter *padapter, u8 wirelessmode)
 {
@@ -1290,7 +1329,7 @@ void update_tx_basic_rate(struct adapter *padapter, u8 wirelessmode)
 	else
 		update_mgnt_tx_rate(padapter, IEEE80211_OFDM_RATE_6MB);
 
-	SetHwReg8188EU(padapter, HW_VAR_BASIC_RATE, supported_rates);
+	rtw_set_basic_rate(padapter, supported_rates);
 }
 
 unsigned char check_assoc_AP(u8 *pframe, uint len)
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 1a08de85a6ae..97893543d861 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1071,43 +1071,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 	case HW_VAR_SET_OPMODE:
 		hw_var_set_opmode(Adapter, val);
 		break;
-	case HW_VAR_BASIC_RATE:
-		{
-			u16 BrateCfg = 0;
-			u8 RateIndex = 0;
-
-			/*  2007.01.16, by Emily */
-			/*  Select RRSR (in Legacy-OFDM and CCK) */
-			/*  For 8190, we select only 24M, 12M, 6M, 11M, 5.5M, 2M, and 1M from the Basic rate. */
-			/*  We do not use other rates. */
-			HalSetBrateCfg(Adapter, val, &BrateCfg);
-
-			/* 2011.03.30 add by Luke Lee */
-			/* CCK 2M ACK should be disabled for some BCM and Atheros AP IOT */
-			/* because CCK 2M has poor TXEVM */
-			/* CCK 5.5M & 11M ACK should be enabled for better performance */
-
-			BrateCfg = (BrateCfg | 0xd) & 0x15d;
-
-			BrateCfg |= 0x01; /*  default enable 1M ACK rate */
-			/*  Set RRSR rate table. */
-			rtw_write8(Adapter, REG_RRSR, BrateCfg & 0xff);
-			rtw_write8(Adapter, REG_RRSR + 1, (BrateCfg >> 8) & 0xff);
-			res = rtw_read8(Adapter, REG_RRSR + 2, &reg);
-			if (res)
-				return;
-
-			rtw_write8(Adapter, REG_RRSR + 2, reg & 0xf0);
-
-			/*  Set RTS initial rate */
-			while (BrateCfg > 0x1) {
-				BrateCfg = (BrateCfg >> 1);
-				RateIndex++;
-			}
-			/*  Ziv - Check */
-			rtw_write8(Adapter, REG_INIRTS_RATE_SEL, RateIndex);
-		}
-		break;
 	case HW_VAR_CORRECT_TSF:
 		{
 			u64	tsf;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index b81144932d9a..3e0ee33aa131 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -10,7 +10,6 @@
 
 enum hw_variables {
 	HW_VAR_SET_OPMODE,
-	HW_VAR_BASIC_RATE,
 	HW_VAR_CORRECT_TSF,
 	HW_VAR_MLME_SITESURVEY,
 	HW_VAR_DM_FLAG,
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index 56c0e584bb6c..3cc475aa912a 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -455,6 +455,7 @@ int rtw_check_bcn_info(struct adapter  *Adapter, u8 *pframe, u32 packet_len);
 void update_IOT_info(struct adapter *padapter);
 void update_capinfo(struct adapter *adapter, u16 updatecap);
 void update_wireless_mode(struct adapter *padapter);
+void rtw_set_basic_rate(struct adapter *adapter, u8 *rates);
 void update_tx_basic_rate(struct adapter *padapter, u8 modulation);
 void update_bmc_sta_support_rate(struct adapter *padapter, u32 mac_id);
 int update_sta_support_rate(struct adapter *padapter, u8 *pvar_ie,
-- 
2.36.1

