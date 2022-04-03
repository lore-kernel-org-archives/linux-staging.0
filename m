Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617907C
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 10:37:26 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id w18so1551059edi.13
        for <linux-staging@lists.linux.dev>; Sun, 03 Apr 2022 03:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GSyRYDX1aNYM71dkaQ/N0Y+9b2N5O+FflhMrusy6CQQ=;
        b=Ejg+9ZumG2W4lnDxjgs80njEkgJ9gEU7hYYsPeZazpGzJVBdOFIuFiCAmj+c636R5S
         6NkKzmp+n6x+fo+F95dT/07sjIwNUL0MvYkge5obaR6GzFGxu8bHzoXTWC4Ml+DBNSLi
         mCLkVRM0BC/uz9ydpdxk/EX/ISZ07NXuC3p7jQ/Ao3O0ELjTK+fCte2w7dXpSS4F95hA
         iFENBHJYvGRUh0UtupwUvRESQJ8IF9Lm9vD5G9Odhv5eq/ypMOzOrWoahKK/nNxwBRcq
         ie7gVgaXRNY+CRRYrRzSDon3wRxvUJVo715I4DKBC+5rUQx67LRllhJXLasYNDZ+e928
         /gkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GSyRYDX1aNYM71dkaQ/N0Y+9b2N5O+FflhMrusy6CQQ=;
        b=ZaNVtGn7eUalRSx+9BSXldRDdO8mw2Kt9kMaquDzSUEdWHYz50kS/yRaKFnbTUaAeJ
         NO0hYNBs3+0/24rSI0qSUWEJfgyfXSePLs5M2ZvwAJd3YBbxV7D/bQMloSJiuZq7q4KM
         irYmtAiqKRZCQBgE/rgQCpXlus3dtiK6A5s7mImlHSNi9WxFqK9VRj5npQ/5V7eRdlrq
         A5w5WVOU5WbR99KCViprJaPgVet4gDaAv0m1CUYno5DKsRBS08PNPFmr7fMGt+UY3WZi
         gjmS1nmpr+mA2WOr6l0+pEIBxd4BdmwOkiwnTOfRgLJ8jBk69luHVix6tgk+Les1+HoQ
         fMsg==
X-Gm-Message-State: AOAM531bSnLrKYE9MJgjAlsGCGuIy+DtfsnweWEq4J4i7KU8Gu0LTKp0
	PnIg4lZwYS3pRHbWSHmuG6k=
X-Google-Smtp-Source: ABdhPJz5Y4ypgQ5cqIkZnzERRBeUUhGqmsQ8HOqOVR92z0xXiuMthkNocV5P0Yut88wp99Z/PBiEsA==
X-Received: by 2002:a05:6402:909:b0:415:cdbf:4748 with SMTP id g9-20020a056402090900b00415cdbf4748mr28149461edz.395.1648982244752;
        Sun, 03 Apr 2022 03:37:24 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id kx5-20020a170907774500b006e1382b8192sm3130751ejc.147.2022.04.03.03.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 03:37:24 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/4] staging: r8188eu: remove constant parameter from _rtw_pwr_wakeup()
Date: Sun,  3 Apr 2022 12:37:11 +0200
Message-Id: <20220403103713.12883-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220403103713.12883-1-straube.linux@gmail.com>
References: <20220403103713.12883-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The parameter 'ips_deffer_ms' of _rtw_pwr_wakeup() is always
RTW_PWR_STATE_CHK_INTERVAL. Make it local.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_pwrctrl.c    | 7 +++++--
 drivers/staging/r8188eu/include/rtw_pwrctrl.h | 5 ++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index 08e8a5efba5e..ee324c18a1b9 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -349,16 +349,19 @@ void rtw_init_pwrctrl_priv(struct adapter *padapter)
 /*
 * rtw_pwr_wakeup - Wake the NIC up from: 1)IPS. 2)USB autosuspend
 * @adapter: pointer to struct adapter structure
-* @ips_deffer_ms: the ms wiil prevent from falling into IPS after wakeup
 * Return _SUCCESS or _FAIL
 */
 
-int _rtw_pwr_wakeup(struct adapter *padapter, u32 ips_deffer_ms)
+int _rtw_pwr_wakeup(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv = &padapter->pwrctrlpriv;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	int ret = _SUCCESS;
 	u32 start = jiffies;
+	u32 ips_deffer_ms;
+
+	/* the ms will prevent from falling into IPS after wakeup */
+	ips_deffer_ms = RTW_PWR_STATE_CHK_INTERVAL;
 
 	if (pwrpriv->ips_deny_time < jiffies + rtw_ms_to_systime(ips_deffer_ms))
 		pwrpriv->ips_deny_time = jiffies + rtw_ms_to_systime(ips_deffer_ms);
diff --git a/drivers/staging/r8188eu/include/rtw_pwrctrl.h b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
index 0a0f7a4c4052..fd301a9f117a 100644
--- a/drivers/staging/r8188eu/include/rtw_pwrctrl.h
+++ b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
@@ -121,9 +121,8 @@ s32 LPS_RF_ON_check(struct adapter *adapter, u32 delay_ms);
 void LPS_Enter(struct adapter *adapter);
 void LPS_Leave(struct adapter *adapter);
 
-int _rtw_pwr_wakeup(struct adapter *adapter, u32 ips_defer_ms);
-#define rtw_pwr_wakeup(adapter)						\
-	 _rtw_pwr_wakeup(adapter, RTW_PWR_STATE_CHK_INTERVAL)
+int _rtw_pwr_wakeup(struct adapter *adapter);
+#define rtw_pwr_wakeup(adapter) _rtw_pwr_wakeup(adapter)
 int rtw_pm_set_ips(struct adapter *adapter, u8 mode);
 int rtw_pm_set_lps(struct adapter *adapter, u8 mode);
 
-- 
2.35.1

