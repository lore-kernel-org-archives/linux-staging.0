Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E22809
	for <linux-staging@lists.linux.dev>; Sat,  9 Apr 2022 12:06:46 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id bq8so22018684ejb.10
        for <linux-staging@lists.linux.dev>; Sat, 09 Apr 2022 05:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XCtUqRrEnchiPWI+Bdu07xbyLJ9MlyKU90+iSNkqkHY=;
        b=XoOiZs6flNAATBJYW0ZZn1e+wtyIFq9WPmB8liXAtCxAuv+i4q45RTaqE7v3vD/WX8
         n6Xzn0rTpRTHLMULDqMxX87HsyDZTAGeyfb+b+0RtGEwPx/t0E1ppT7oZ1k1DcQUqxQB
         7lxwoz7OD2o1xZo4QjaEK2JyIGDx1qThT4lP+0brzaL47K2ovC0N9usyQNs+qS4YrvsR
         fzmHQ4qKbQp8Ip/rZ4jEMXKZSiheGwURvQrZOEctGyiMmX/GXwor/3GUnM2lK5WvxDJi
         N9xtVg6wwLqulD6x3WgtDCXpiFCsR4hDigTur5J0qQS8XlVQtoHuCPHHwhyVhTBGEbdG
         ni8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XCtUqRrEnchiPWI+Bdu07xbyLJ9MlyKU90+iSNkqkHY=;
        b=b/yadL3L2GjYLovmEGYaLM0k2iMKlkMo24GEMR7oTg8tJ2Qs2RMUV9ZC/XQGKpbMLG
         3TG8GEVT0GZZG3E0SmXXmizlA2f9lTi8gEG37gF2xvUV1706EHfpWhvUV+HA2VFNKmVd
         +NblpjZ5PK5tJg9jvTk27r+SpfjFO3lDtA4MnM5WuKo3UnaYG81MTp0F4Ct/I/oQGz9W
         W+3f6qE7FpbIwEkmFqkS2440SlMrABccmgHEjs89jiIgz6htmFwH69mMq6JGZ9IXbz06
         yLGYbL3906GbIeC0BUY9vn4++8W4kD9dnyhI4IpHpe71XbOlfTqlSJAJpwD5jstP9TsV
         IdYg==
X-Gm-Message-State: AOAM533h5oluRR4lfK6rnpxHoXGBDdh+BVZKVY43HaTFHXhAxdzMhEfY
	NbSHSBh64BM37mn4+zoFyikIbkO6CW4=
X-Google-Smtp-Source: ABdhPJyiLtNkrp2mgy73ZRqRIwZjT+QMcCLCpJtpQnpMSu3R92QnK5dInXKGVPT76kX4wDe0yZkOCw==
X-Received: by 2002:a17:906:6a02:b0:6d7:cda:2cf7 with SMTP id qw2-20020a1709066a0200b006d70cda2cf7mr21560386ejc.53.1649506004464;
        Sat, 09 Apr 2022 05:06:44 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id z21-20020a170906435500b006e8669fae36sm1102947ejm.189.2022.04.09.05.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Apr 2022 05:06:43 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/4] staging: r8188eu: remove HW_VAR_H2C_FW_PWRMODE
Date: Sat,  9 Apr 2022 14:06:27 +0200
Message-Id: <20220409120627.10633-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220409120627.10633-1-straube.linux@gmail.com>
References: <20220409120627.10633-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the HW_VAR_H2C_FW_PWRMODE case from SetHwReg8188EU() and move
its functionality to a new function in rtw_pwrctrl.c. This is part of
the ongoing effort to get rid of the unwanted hal layer.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_p2p.c        |  4 ++--
 drivers/staging/r8188eu/core/rtw_pwrctrl.c    | 19 +++++++++++++++----
 drivers/staging/r8188eu/hal/usb_halinit.c     | 11 -----------
 drivers/staging/r8188eu/include/hal_intf.h    |  1 -
 drivers/staging/r8188eu/include/rtw_pwrctrl.h |  1 +
 5 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_p2p.c b/drivers/staging/r8188eu/core/rtw_p2p.c
index 80305d128ccd..dcf828a57179 100644
--- a/drivers/staging/r8188eu/core/rtw_p2p.c
+++ b/drivers/staging/r8188eu/core/rtw_p2p.c
@@ -1612,7 +1612,7 @@ void p2p_ps_wk_hdl(struct adapter *padapter, u8 p2p_ps_state)
 		if (padapter->pwrctrlpriv.bFwCurrentInPSMode) {
 			if (pwrpriv->smart_ps == 0) {
 				pwrpriv->smart_ps = 2;
-				SetHwReg8188EU(padapter, HW_VAR_H2C_FW_PWRMODE, (u8 *)(&padapter->pwrctrlpriv.pwr_mode));
+				rtw_set_firmware_ps_mode(padapter, pwrpriv->pwr_mode);
 			}
 		}
 		break;
@@ -1623,7 +1623,7 @@ void p2p_ps_wk_hdl(struct adapter *padapter, u8 p2p_ps_state)
 			if (pwdinfo->ctwindow > 0) {
 				if (pwrpriv->smart_ps != 0) {
 					pwrpriv->smart_ps = 0;
-					SetHwReg8188EU(padapter, HW_VAR_H2C_FW_PWRMODE, (u8 *)(&padapter->pwrctrlpriv.pwr_mode));
+					rtw_set_firmware_ps_mode(padapter, pwrpriv->pwr_mode);
 				}
 			}
 			rtl8188e_set_p2p_ps_offload_cmd(padapter, p2p_ps_state);
diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index efdc7de49d49..f13bd5cdaa23 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -176,6 +176,19 @@ static bool PS_RDY_CHECK(struct adapter *padapter)
 	return true;
 }
 
+void rtw_set_firmware_ps_mode(struct adapter *adapter, u8 mode)
+{
+	struct hal_data_8188e *haldata = &adapter->haldata;
+	struct odm_dm_struct *odmpriv = &haldata->odmpriv;
+
+	/* Force leave RF low power mode for 1T1R to prevent
+	 * conflicting setting in firmware power saving sequence.
+	 */
+	if (mode != PS_MODE_ACTIVE)
+		ODM_RF_Saving(odmpriv, true);
+	rtl8188e_set_FwPwrMode_cmd(adapter, mode);
+}
+
 void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_ant_mode)
 {
 	struct pwrctrl_priv *pwrpriv = &padapter->pwrctrlpriv;
@@ -193,11 +206,10 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_a
 			return;
 	}
 
-	/* if (pwrpriv->pwr_mode == PS_MODE_ACTIVE) */
 	if (ps_mode == PS_MODE_ACTIVE) {
 		if (pwdinfo->opp_ps == 0) {
 			pwrpriv->pwr_mode = ps_mode;
-			SetHwReg8188EU(padapter, HW_VAR_H2C_FW_PWRMODE, (u8 *)(&ps_mode));
+			rtw_set_firmware_ps_mode(padapter, ps_mode);
 			pwrpriv->bFwCurrentInPSMode = false;
 		}
 	} else {
@@ -206,14 +218,13 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_a
 			pwrpriv->pwr_mode = ps_mode;
 			pwrpriv->smart_ps = smart_ps;
 			pwrpriv->bcn_ant_mode = bcn_ant_mode;
-			SetHwReg8188EU(padapter, HW_VAR_H2C_FW_PWRMODE, (u8 *)(&ps_mode));
+			rtw_set_firmware_ps_mode(padapter, ps_mode);
 
 			/*  Set CTWindow after LPS */
 			if (pwdinfo->opp_ps == 1)
 				p2p_ps_wk_cmd(padapter, P2P_PS_ENABLE, 0);
 		}
 	}
-
 }
 
 static bool lps_rf_on(struct adapter *adapter)
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 62ada1790d0d..b62ebd011886 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1105,17 +1105,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 			}
 		}
 		break;
-	case HW_VAR_H2C_FW_PWRMODE:
-		{
-			u8 psmode = (*(u8 *)val);
-
-			/*  Forece leave RF low power mode for 1T1R to prevent conficting setting in Fw power */
-			/*  saving sequence. 2010.06.07. Added by tynli. Suggested by SD3 yschang. */
-			if (psmode != PS_MODE_ACTIVE)
-				ODM_RF_Saving(podmpriv, true);
-			rtl8188e_set_FwPwrMode_cmd(Adapter, psmode);
-		}
-		break;
 	case HW_VAR_H2C_MEDIA_STATUS_RPT:
 		rtl8188e_set_FwMediaStatus_cmd(Adapter, (*(__le16 *)val));
 		break;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index bbbdcfa253f8..26dd395c239f 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -20,7 +20,6 @@ enum hw_variables {
 	HW_VAR_DM_FUNC_CLR,
 	HW_VAR_AC_PARAM_BE,
 	HW_VAR_AMPDU_FACTOR,
-	HW_VAR_H2C_FW_PWRMODE,
 	HW_VAR_H2C_MEDIA_STATUS_RPT,
 };
 
diff --git a/drivers/staging/r8188eu/include/rtw_pwrctrl.h b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
index 1d7dba853c40..affaf4ca5495 100644
--- a/drivers/staging/r8188eu/include/rtw_pwrctrl.h
+++ b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
@@ -95,6 +95,7 @@ struct pwrctrl_priv {
 
 void rtw_init_pwrctrl_priv(struct adapter *adapter);
 
+void rtw_set_firmware_ps_mode(struct adapter *adapter, u8 mode);
 void rtw_set_ps_mode(struct adapter *adapter, u8 ps_mode, u8 smart_ps,
 		     u8 bcn_ant_mode);
 void LeaveAllPowerSaveMode(struct adapter *adapter);
-- 
2.35.1

