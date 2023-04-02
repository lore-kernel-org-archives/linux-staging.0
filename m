Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8847228EA
	for <linux-staging@lists.linux.dev>; Sun,  2 Apr 2023 09:51:51 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id i5so106484210eda.0
        for <linux-staging@lists.linux.dev>; Sun, 02 Apr 2023 02:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680429110; x=1683021110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KhiswCrusaKP4BJlZZJCPIbuTKVOmwuOxikLoZ9ebT0=;
        b=pAE7/h5VEeQ5yCr9LFJXyKFTAjLmOFfZTgw2MbmHa/BqqOSJ/flZdLHPdhivywjXaD
         fQvvJTywVJ3bv35d9VVrrYKrSc3OGhbaUb7j5r5UnYJukiB6vKNxrcmhR33FQAbm0iRU
         CihNxtBKhjVxHPN4jBCEgC5aIszRgj3kzAxKyeaY9r741RcWqCM6CRepPB1maZ14khB6
         xIKGivfX2Cza9Zh0Abg3QtByp9AtrT/h8Gl4sfA6M2Ktoe2LCbvcvYCo/7XR2TYGHcu7
         z8x8ZFa4E3I8ScwtRYe9DDA75xcDTmJrXJotnONyGso/2uiqVoJb1Fq/Dew7KlOLXNIv
         +Tag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680429110; x=1683021110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KhiswCrusaKP4BJlZZJCPIbuTKVOmwuOxikLoZ9ebT0=;
        b=gH+wt53hVVZgaNSLTE8anitdbXONVaqI1Gz6Z5huWHpEDBE42HaNSNg+O2y9n2yQ61
         F+hWUPAyB3mvwvJpMvGAMg/rkJwzlg4afGrCzvnGVX2wyB9jTzhZH7oeCiIh5Fr1/CYR
         WTehirg1vseG39aFulVwJ2ZuO7wQxak2LA54FgM27t3s4XzpTJpX9+lTdehcBPBwxrb3
         tVl1UBGGUCxWeMdu7A6D9ozP7eIZtuxF5S7DfwjDGu4a6Khhl6QZYAxXMT62a+iJAIhU
         twqu5T6vVqn1FO4BoTDc/vUveJFkO9zrRmoq9JFmFLZO+oJZ1NS6ys/HGcIc/X2eaQP+
         Ginw==
X-Gm-Message-State: AAQBX9dgsYSA+IlMMKM02pePsekhL009LpEvp2LzYOtMDoJYTcya7FBl
	Dhr3uQ1zK5DxPa6reIBdbRo=
X-Google-Smtp-Source: AKy350Zrp6xqBdqtbKE/2s4DU2frd4df2TjoeQmOQNCXtBFD2YZboGFXVrBCC7e+4J2qhhlLyTajHQ==
X-Received: by 2002:a17:906:49:b0:930:aa02:f9cf with SMTP id 9-20020a170906004900b00930aa02f9cfmr10039192ejg.2.1680429109889;
        Sun, 02 Apr 2023 02:51:49 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id u25-20020a1709060b1900b0093e39b921c8sm3021008ejg.164.2023.04.02.02.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 02:51:49 -0700 (PDT)
Date: Sun, 2 Apr 2023 11:51:47 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] staging: rtl8192e: Remove enum RF_1T2R and RF_Type
Message-ID: <6c29e709f5c328703870ca8e7d61ee6338886fa7.1680427945.git.philipp.g.hortmann@gmail.com>
References: <cover.1680427945.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1680427945.git.philipp.g.hortmann@gmail.com>

enum RF_1T2R is used to initialize a local variable RF_Type that is then
shifted. The result of the shift is zero. Remove code that has always
the same result to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1->V2: Removed declaration of local variable
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 5 ++---
 drivers/staging/rtl8192e/rtllib.h          | 4 ----
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 258ea66ab2fd..a21b3798db48 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -518,7 +518,7 @@ static void _rtl92e_dm_tx_power_tracking_callback_tssi(struct net_device *dev)
 	struct dcmd_txcmd tx_cmd;
 	u8	powerlevelOFDM24G;
 	int	i = 0, j = 0, k = 0;
-	u8	RF_Type, tmp_report[5] = {0, 0, 0, 0, 0};
+	u8	tmp_report[5] = {0, 0, 0, 0, 0};
 	u32	Value;
 	u8	Pwr_Flag;
 	u16	Avg_TSSI_Meas, tssi_13dBm, Avg_TSSI_Meas_from_driver = 0;
@@ -529,8 +529,7 @@ static void _rtl92e_dm_tx_power_tracking_callback_tssi(struct net_device *dev)
 	priv->rtllib->bdynamic_txpower_enable = false;
 
 	powerlevelOFDM24G = priv->pwr_track >> 24;
-	RF_Type = RF_1T2R;
-	Value = (RF_Type<<8) | powerlevelOFDM24G;
+	Value = powerlevelOFDM24G;
 
 	for (j = 0; j <= 30; j++) {
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 197c0a44ebd6..7d83a4c322cf 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -433,10 +433,6 @@ enum led_ctl_mode {
 	LED_CTL_START_TO_LINK = 8,
 };
 
-enum rt_rf_type_def {
-	RF_1T2R = 0,
-};
-
 enum wireless_mode {
 	WIRELESS_MODE_UNKNOWN = 0x00,
 	WIRELESS_MODE_A = 0x01,
-- 
2.40.0

