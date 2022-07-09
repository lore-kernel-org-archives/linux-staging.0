Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34399EC0
	for <linux-staging@lists.linux.dev>; Sat,  9 Jul 2022 09:45:13 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id ez10so1349781ejc.13
        for <linux-staging@lists.linux.dev>; Sat, 09 Jul 2022 02:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gGNrZWcZve4ntLjDaNg+77tzOugVuMr5ZGinbcK3AS0=;
        b=mbzt/VM2GakxdRKK+ghwIOvW9inDdugRBB/rzwsxpv3evLOD0n5IS53Q2ifRPIHnJt
         3v5DQMstb96+IxscvcFEuGuc0I/KLfyWh0JgRjkl6LJlmxq9Upj/05Bnv6Qg93VRRbuT
         rlQe5gRpuMT9pQGgUzN2Qi0mt6QYaLeblp073awe5RsOSigM+jXCPX08/F2hn5r7S5TT
         4brED+9aN1ZIB48FKZXrZ4TXNGa66Lb43A8UXZp35GnVwsVjtMzg0lr8NLMzbZ6KCl/f
         5cUyUrKV1hYpmoWhB8xNSvSd8TyA06biBvHTBC7d919tjJ5mjYYllAP/xVs1Ea0Pw8aF
         PqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gGNrZWcZve4ntLjDaNg+77tzOugVuMr5ZGinbcK3AS0=;
        b=27R2PMkjX6ekEBEBB1gcV/cqlN9SyLgdLXl5wOuKc0HU+CS7aY5TApI7uu79IAdxQR
         aYAM+Rsz/NOJ+fDTKCrC6wxpADfdpC7yT43rbg3n4/79C2l7VEwozoo4qdtPAgK5wt9w
         YISl2k5DFQs+IALgseBqhgg6OmT24Dngp44Wfk3RqVwk+p+F983dUl5OYGtJkkubqYLI
         Jqtvcqt6ag+ADGhworr9EoKWrIYkgl5s0YvNuQ8ni8dqyyFhg2VJZaYuB/kUaJSHVG59
         I0puN53vEoPypmO4u1UZgQavkeO7StPD0W45SLkELCbhpbSbVjeFi+p8Si3t4aoLRIi3
         KomA==
X-Gm-Message-State: AJIora+Vcw+Z6/23opNsTpw6EPLCSAyXK4zOrz6P3QWRupnJKi/+Tn2H
	1bu2yRa7pkq64xt/mZsThLM=
X-Google-Smtp-Source: AGRyM1tZehRvHfOA19V71v/2gVhkK0TWSbmapDF7TpKevVIV6liGDFmsTVVPsMj+RrD0iTFd3ha52A==
X-Received: by 2002:a17:906:c048:b0:718:ca61:e7b9 with SMTP id bm8-20020a170906c04800b00718ca61e7b9mr7965328ejb.120.1657359911561;
        Sat, 09 Jul 2022 02:45:11 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6f.dynamic.kabel-deutschland.de. [95.90.187.111])
        by smtp.gmail.com with ESMTPSA id hy10-20020a1709068a6a00b00704757b1debsm441521ejc.9.2022.07.09.02.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Jul 2022 02:45:11 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 5/5] staging: r8188eu: remove HW_VAR_DM_FUNC_CLR from SetHwReg8188EU()
Date: Sat,  9 Jul 2022 11:44:58 +0200
Message-Id: <20220709094458.9578-6-straube.linux@gmail.com>
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

Remove the HW_VAR_DM_FUNC_CLR case from SetHwReg8188EU() and move its
functionality to a static function. This is part of the ongoing effort
to get rid of SetHwReg8188EU().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 12 ++++++++++--
 drivers/staging/r8188eu/hal/usb_halinit.c   |  5 -----
 drivers/staging/r8188eu/include/hal_intf.h  |  1 -
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 31d936ad063a..eecb00e41d6a 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -6655,6 +6655,14 @@ static void rtw_reset_dm_func_flag(struct adapter *adapter)
 	odmpriv->SupportAbility = dmpriv->InitODMFlag;
 }
 
+static void rtw_clear_dm_func_flag(struct adapter *adapter)
+{
+	struct hal_data_8188e *haldata = &adapter->haldata;
+	struct odm_dm_struct *odmpriv = &haldata->odmpriv;
+
+	odmpriv->SupportAbility = 0;
+}
+
 void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 {
 	struct sta_info		*psta, *psta_bmc;
@@ -7110,7 +7118,7 @@ u8 createbss_hdl(struct adapter *padapter, u8 *pbuf)
 
 		/* disable dynamic functions, such as high power, DIG */
 		Save_DM_Func_Flag(padapter);
-		SetHwReg8188EU(padapter, HW_VAR_DM_FUNC_CLR, NULL);
+		rtw_clear_dm_func_flag(padapter);
 
 		/* cancel link timer */
 		_cancel_timer_ex(&pmlmeext->link_timer);
@@ -7380,7 +7388,7 @@ u8 sitesurvey_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 	if ((pmlmeext->sitesurvey_res.state == SCAN_START) || (pmlmeext->sitesurvey_res.state == SCAN_TXNULL)) {
 		/* disable dynamic functions, such as high power, DIG */
 		Save_DM_Func_Flag(padapter);
-		SetHwReg8188EU(padapter, HW_VAR_DM_FUNC_CLR, NULL);
+		rtw_clear_dm_func_flag(padapter);
 
 		/* config the initial gain under scanning, need to write the BB registers */
 		if (rtw_p2p_chk_state(pwdinfo, P2P_STATE_NONE))
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 92446cd1a096..04beded95475 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1061,8 +1061,6 @@ static void hw_var_set_opmode(struct adapter *Adapter, u8 *val)
 
 void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 {
-	struct hal_data_8188e *haldata = &Adapter->haldata;
-	struct odm_dm_struct *podmpriv = &haldata->odmpriv;
 	u8 reg;
 	int res;
 
@@ -1156,9 +1154,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 			rtw_write32(Adapter, REG_RCR, reg32 | RCR_CBSSID_BCN);
 		}
 		break;
-	case HW_VAR_DM_FUNC_CLR:
-		podmpriv->SupportAbility = 0;
-		break;
 	default:
 		break;
 	}
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index d33e75bcac74..c1db7f834e20 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -12,7 +12,6 @@ enum hw_variables {
 	HW_VAR_SET_OPMODE,
 	HW_VAR_CORRECT_TSF,
 	HW_VAR_MLME_SITESURVEY,
-	HW_VAR_DM_FUNC_CLR,
 };
 
 typedef s32 (*c2h_id_filter)(u8 id);
-- 
2.36.1

