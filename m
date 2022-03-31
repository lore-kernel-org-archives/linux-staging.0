Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4EA7E0
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 13:05:34 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id r23so28124764edb.0
        for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 06:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2Ctmuw6ZzQ/vE6l7pPQ1kZ77ejeBWjd65IhnZItF+7o=;
        b=PA9hp7AaOABt/iP+ZiFzFNht0r9TpK6+AtLyRBKegBFMk8C5TTBclQn/3LdhL06PYG
         vCXEC3ofAdzCzLcx3hkigp/Ez/+ECsVNcAidWqy4ylzm1/IsErOdS0ehjNX4VQCwNWOm
         Y3rzVugkTNFL7AcqMfXWysAlobQP8jaFe1u1XcqwoILhX/XOMfNyxW3269VcNK6sQbH7
         5SmqSKrL2hfV8nfOABpzrYgtGWIvmPxsRJ8Re7G8lyhKhhMNytkwb8nAARvaS180+8XK
         7ZMx+/DyaMLeLSXovfAkrykFPZDw0nTf5HP6IIR4zyrvW998SXgJGwbUuvrcY8iGxu7s
         UH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2Ctmuw6ZzQ/vE6l7pPQ1kZ77ejeBWjd65IhnZItF+7o=;
        b=r09ctE9vU2sllCHPneX1/6bj6Gy5PNdA+4gdLhl1NY+IUvjEliQg8av3/ms9MhkvKr
         4vqhz9BB/fD2+qnD51TT6gIrWvhH8HZgAfkuv7peUezfJXGtgA5hy+ib7SJuhgcrQmHY
         3bRJfZe2DepMe4yUUI9+iAgN1ArfjoxI9gPUqv08v7lUwmw/wvBpWWsmQATmRnlhJm5Z
         JrRGn3cGl5O8OqzcANcqDZFQHhaPjDQHrni9SVyccuMnWGlQz02I1mQDOLs8wDI4H0vq
         fUo5iAsrG09WrEkFRW05e7A7imUNBQdtxXjZVV8R7RNVq0viiwW3c5cxca5lURY/xU+V
         b7gw==
X-Gm-Message-State: AOAM533zFO3kskj/MOnBr+KaGyeWd0p5+aOGTgAplR5Y6b8IAQqvu3q6
	ZswUpmmEadCFPGC9Xa+f9y0=
X-Google-Smtp-Source: ABdhPJw1Tgl4jd12QxFtucjF6mXHRFgjMS1MSm3qywNuDoODZr9ywM5BeRbkZWKKjLLztmCcMrcaFg==
X-Received: by 2002:a05:6402:2681:b0:419:4564:1bd4 with SMTP id w1-20020a056402268100b0041945641bd4mr16634407edd.358.1648731932488;
        Thu, 31 Mar 2022 06:05:32 -0700 (PDT)
Received: from localhost.localdomain ([95.90.187.85])
        by smtp.gmail.com with ESMTPSA id kw3-20020a170907770300b006d2a835ac33sm9333358ejc.197.2022.03.31.06.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 06:05:32 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/5] staging: r8188eu: remove HW_VAR_FWLPS_RF_ON from GetHwReg8188EU()
Date: Thu, 31 Mar 2022 15:05:21 +0200
Message-Id: <20220331130522.6648-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331130522.6648-1-straube.linux@gmail.com>
References: <20220331130522.6648-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the functionality of the HW_VAR_FWLPS_RF_ON case in
GetHwReg8188EU() to a static function in rtw_pwrctrl.c and remove the
HW_VAR_FWLPS_RF_ON case from GetHwReg8188EU(). This is part of the
ongoing effort to get rid of the unwanted hal layer.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_pwrctrl.c | 19 ++++++++++++++++---
 drivers/staging/r8188eu/hal/usb_halinit.c  | 18 ------------------
 drivers/staging/r8188eu/include/hal_intf.h |  1 -
 3 files changed, 16 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index 7beabf82eb92..0141de7ab08c 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -217,6 +217,21 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_a
 
 }
 
+static bool lps_rf_on(struct adapter *adapter)
+{
+	/* When we halt NIC, we should check if FW LPS is leave. */
+	if (adapter->pwrctrlpriv.rf_pwrstate == rf_off) {
+		/*  If it is in HW/SW Radio OFF or IPS state, we do not check Fw LPS Leave, */
+		/*  because Fw is unload. */
+		return true;
+	}
+
+	if (rtw_read32(adapter, REG_RCR) & 0x00070000)
+		return false;
+
+	return true;
+}
+
 /*
  * Return:
  *	0:	Leave OK
@@ -226,13 +241,11 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_a
 s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 {
 	u32 start_time;
-	u8 bAwake = false;
 	s32 err = 0;
 
 	start_time = jiffies;
 	while (1) {
-		GetHwReg8188EU(padapter, HW_VAR_FWLPS_RF_ON, &bAwake);
-		if (bAwake)
+		if (lps_rf_on(padapter))
 			break;
 
 		if (padapter->bSurpriseRemoved) {
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 611785caa17f..37c56690b13a 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1292,24 +1292,6 @@ void GetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 	case HW_VAR_DM_FLAG:
 		val[0] = podmpriv->SupportAbility;
 		break;
-	case HW_VAR_FWLPS_RF_ON:
-		{
-			/* When we halt NIC, we should check if FW LPS is leave. */
-			if (Adapter->pwrctrlpriv.rf_pwrstate == rf_off) {
-				/*  If it is in HW/SW Radio OFF or IPS state, we do not check Fw LPS Leave, */
-				/*  because Fw is unload. */
-				val[0] = true;
-			} else {
-				u32 valRCR;
-				valRCR = rtw_read32(Adapter, REG_RCR);
-				valRCR &= 0x00070000;
-				if (valRCR)
-					val[0] = false;
-				else
-					val[0] = true;
-			}
-		}
-		break;
 	default:
 		break;
 	}
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index f0a6d697e68b..0033a0aca27b 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -26,7 +26,6 @@ enum hw_variables {
 	HW_VAR_AMPDU_FACTOR,
 	HW_VAR_H2C_FW_PWRMODE,
 	HW_VAR_H2C_FW_JOINBSSRPT,
-	HW_VAR_FWLPS_RF_ON,
 	HW_VAR_H2C_FW_P2P_PS_OFFLOAD,
 	HW_VAR_INITIAL_GAIN,
 	HW_VAR_ANTENNA_DIVERSITY_SELECT,
-- 
2.35.1

