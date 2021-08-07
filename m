Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446172FB3
	for <linux-staging@lists.linux.dev>; Sat,  7 Aug 2021 09:48:38 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id b13so14337579wrs.3
        for <linux-staging@lists.linux.dev>; Sat, 07 Aug 2021 02:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i4txUbUiM72tg9+taxP8c210NgRR0U+ErnpmNqbMHEI=;
        b=iEPWkQ/dnS265W7fBT/TEgqIIRyyMIliV/GBBFJWxkM6ogZnTVA7OptaFtIoBQutWL
         VkugHFefYY8AzTppMkuc8QQmdhiPIBJyF87UM0FfnpZBVNWR/jnPRimt133kcXw+Y5nu
         q1Ry6oJc0ZjBqk2fqreB6zjmztiRDR4PC4ARnr29nLoMzR1qDDw9XxhQcVhcFxb8lADX
         2cEQfo/pAfK0ZQEH4573FBkg+S6DT6YonAJlI1HE28UPPQSsj+CxWeXrX80JVJiWFTUd
         VRSkUZEMWt7kdRGmdxgaaXI3GopgZMc3LXHDOsudevwxoAjBEIFAPzRY8xcPKL0qce6i
         +FLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i4txUbUiM72tg9+taxP8c210NgRR0U+ErnpmNqbMHEI=;
        b=HMX5V0zP9cgSHKnf/07uBGFH5ucUA0wKykdjLS/o+DkkuclvXAEPK3iX6Q6arzBdWd
         qo05N9YTWxxwr7eqmZwgTmS53ZGIhh4odPGU4//99br/ch++yD2WGECFtSOooGyOSrPR
         N/hcrZQZqb23I8diGGAHhPwtd/vYq36iOHCvZKodGaEmG3tdUArlrtC7G0vo04/VLQOz
         wuoEe7F0kZOikdnnPsFVuHWoRuc+/vCrmxsb1/gjSFMUBye7pVwNJBJ8lYGx2mU8EZsm
         a3i9qp3QqlHjLQwLQSv33gIPu6HUl6/vW+J8mqP9ImjShty6eMQqD/d0CtF3Sfn64I+r
         bb6w==
X-Gm-Message-State: AOAM5305wu1nMoye+wxN1uYTZ88Blw1sMGCYX0lFL5f3K2uXN3G6KVCh
	IZLeRXRpQkye6WUOKti95/8=
X-Google-Smtp-Source: ABdhPJyhei1pjYm7I3WMqJNUc7CB23dSmOuCDVOnXcKnm3Yp4eGbtn7LNHQb956N3JyRESoBBrgI2A==
X-Received: by 2002:adf:f112:: with SMTP id r18mr14538107wro.160.1628329716716;
        Sat, 07 Aug 2021 02:48:36 -0700 (PDT)
Received: from agape ([5.171.80.112])
        by smtp.gmail.com with ESMTPSA id c190sm11252174wma.21.2021.08.07.02.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 02:48:36 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/21] staging: rtl8723bs: remove unused rtw_rf_config module param
Date: Sat,  7 Aug 2021 11:48:08 +0200
Message-Id: <a83eaa9b2350d3d16f5b1dddc40870e0f0a6df06.1628329348.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1628329348.git.fabioaiuto83@gmail.com>
References: <cover.1628329348.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused rtw_rf_config module param and struct field
used to store the param value.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/drv_types.h | 1 -
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 4 ----
 2 files changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index d49009c75d2e..580028d28c42 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -132,7 +132,6 @@ struct registry_priv {
 
 	u8 lowrate_two_xmit;
 
-	u8 rf_config;
 	u8 low_power;
 
 	u8 wifi_spec;/*  !turbo_mode */
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 128c64e0f0ab..7728eabdfe48 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -89,8 +89,6 @@ static int rtw_beamform_cap = 0x2;
 
 static int rtw_lowrate_two_xmit = 1;/* Use 2 path Tx to transmit MCS0~7 and legacy mode */
 
-/* int rf_config = RF_1T2R;  1T2R */
-static int rtw_rf_config = RF_MAX_TYPE;  /* auto */
 static int rtw_low_power;
 static int rtw_wifi_spec;
 static int rtw_channel_plan = RT_CHANNEL_DOMAIN_MAX;
@@ -144,7 +142,6 @@ module_param(rtw_ampdu_amsdu, int, 0644);
 
 module_param(rtw_lowrate_two_xmit, int, 0644);
 
-module_param(rtw_rf_config, int, 0644);
 module_param(rtw_power_mgnt, int, 0644);
 module_param(rtw_smart_ps, int, 0644);
 module_param(rtw_low_power, int, 0644);
@@ -249,7 +246,6 @@ static void loadparam(struct adapter *padapter, struct net_device *pnetdev)
 	registry_par->beamform_cap = (u8)rtw_beamform_cap;
 
 	registry_par->lowrate_two_xmit = (u8)rtw_lowrate_two_xmit;
-	registry_par->rf_config = (u8)rtw_rf_config;
 	registry_par->low_power = (u8)rtw_low_power;
 
 
-- 
2.20.1

