Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2457E2FB6
	for <linux-staging@lists.linux.dev>; Sun, 30 Jan 2022 19:03:41 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id j2so22367855edj.8
        for <linux-staging@lists.linux.dev>; Sun, 30 Jan 2022 11:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jhz6BST1YYjMMuHmLP73e+gH+hSHU2pinLOrqLycFXQ=;
        b=Ox76lBFdBm6M7RVdiI6u3f8fcLujt3iSnk/iBR65DY6/6AVtkMU4lr7EAAc7KOYcW9
         SOvvIMDMx0/57eWA1T75WMs7mmRF4z3md5NgnEQxt68yljaZ7XVqtJAgCdfu6Xb2Fynt
         n0nTr9sAGvpx5ERcAtEiRfGgOMa1/TMDw6zZSadfS4P5CxjKV4bKNQVZL43QV8kJHcqD
         4XbaQ8o73yadah6lih4JUihIDu77w7Y3HDpD0O9rBMpTIP7VnAOByHqT2uR2wujgYOhA
         GHvbTep4GLLh8DoNZfpDvGJYxxYyUJtW0pC55mfAQC9HjdScllNeaMfuT+nT6WGOnOsP
         cgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jhz6BST1YYjMMuHmLP73e+gH+hSHU2pinLOrqLycFXQ=;
        b=XASUma7M2p9laFPncwkxPVMCwTj9Mefp7Czjn/uL4eNxZ0r46NtYeZ2NsGo8635OVx
         lbCVP/u7MXRF5chM+CCmO1zUQ8R6futAjcjXX/dS5Gys5O2tDYJyzpAN8H67M8XuV7vd
         Zf1Wooln9Lzj/JNbVd7ksUIxaCYbww5muANlFRuc5wRoiFYKDtNlx/Rbb5HJKargzLfm
         ZnECCrliVaDzZX0LzwZOTqU3cG1pH1w3EYAZERWktUht4Vk3jhg8y8fhHTU8bJVSuCpq
         61rTo1tI2Uq006Vh45cs5fhA/R9OwLCZ3UspdHsRILujnQnQuycIJzIfQdpQkB6aAT44
         jSMA==
X-Gm-Message-State: AOAM532iv3p2/qu18rZpiIWiBc9YJKJ36J9hD87w/A/lxafNC0as7U/c
	wN2UcxPEC8qqKU+dLASH7qxcWGTTt6c=
X-Google-Smtp-Source: ABdhPJz8vOfx1TDw8IeMyjtvxHmdPrldqreTPTyFUgKeavy8P0v5YZjxqhewcj9RZMcmY+tdZfOR8Q==
X-Received: by 2002:a50:d907:: with SMTP id t7mr17855349edj.59.1643569419590;
        Sun, 30 Jan 2022 11:03:39 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb5a.dynamic.kabel-deutschland.de. [95.90.187.90])
        by smtp.gmail.com with ESMTPSA id n3sm921124ejr.6.2022.01.30.11.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 11:03:39 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 07/12] staging: r8188eu: remove HW_VAR_MEDIA_STATUS
Date: Sun, 30 Jan 2022 20:03:16 +0100
Message-Id: <20220130190321.7172-8-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130190321.7172-1-straube.linux@gmail.com>
References: <20220130190321.7172-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove HW_VAR_MEDIA_STATUS from SetHwReg8188EU() and call
rtw_read8() and rtw_write8() directly.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c | 6 +++++-
 drivers/staging/r8188eu/hal/usb_halinit.c    | 9 ---------
 drivers/staging/r8188eu/include/hal_intf.h   | 1 -
 3 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index 62a96e59b00d..d28929a95108 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -286,7 +286,11 @@ void Switch_DM_Func(struct adapter *padapter, u32 mode, u8 enable)
 
 static void Set_NETYPE0_MSR(struct adapter *padapter, u8 type)
 {
-	SetHwReg8188EU(padapter, HW_VAR_MEDIA_STATUS, (u8 *)(&type));
+	u8 val8;
+
+	val8 = rtw_read8(padapter, MSR) & 0x0c;
+	val8 |= type;
+	rtw_write8(padapter, MSR, val8);
 }
 
 void Set_MSR(struct adapter *padapter, u8 type)
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 3d05bae459b7..96088a344d47 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1068,15 +1068,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 	struct odm_dm_struct *podmpriv = &haldata->odmpriv;
 
 	switch (variable) {
-	case HW_VAR_MEDIA_STATUS:
-		{
-			u8 val8;
-
-			val8 = rtw_read8(Adapter, MSR) & 0x0c;
-			val8 |= *((u8 *)val);
-			rtw_write8(Adapter, MSR, val8);
-		}
-		break;
 	case HW_VAR_SET_OPMODE:
 		hw_var_set_opmode(Adapter, val);
 		break;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 169f1cccafdb..2912151c7830 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -9,7 +9,6 @@
 #include "Hal8188EPhyCfg.h"
 
 enum hw_variables {
-	HW_VAR_MEDIA_STATUS,
 	HW_VAR_SET_OPMODE,
 	HW_VAR_BSSID,
 	HW_VAR_INIT_RTS_RATE,
-- 
2.34.1

