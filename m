Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED8D7A
	for <linux-staging@lists.linux.dev>; Mon,  4 Apr 2022 08:21:51 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id b15so10088200edn.4
        for <linux-staging@lists.linux.dev>; Mon, 04 Apr 2022 01:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eYi42idZagF7+PntnhrV7u1NVJ1zH5gAAuFaLqoUChg=;
        b=JjsmMULs94skPzT6xphNvB4kqywkZnL72/HghLakTvfFcbUjYvX0Z4O/7mNIZGfWEw
         ONrgKXfIvNmc81bgyIfTtuNsLlaOHKLs/xkV7+5/yyJRRXc0Dzno3BX+au9N1Y0Vd7L1
         1VHqTMV7EgKErFvvwhs532WZtJCMETyv1yJTHhxE9kx9XhOOBhBFq9Jn2C+dd0nu+h88
         VhPfT4LdevaT3mqECsz+X/O0uEAimqT3tC/92w9eGHao4Nn25aO20OACQ/hiXIl8kdz2
         UkF/mOr/KxuZUY7CiOlhF1CtDACs3O5qoUcDgG3cVBmBUFDj/29QoyQQQFY8GAGwxnyx
         bV8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eYi42idZagF7+PntnhrV7u1NVJ1zH5gAAuFaLqoUChg=;
        b=R0OUOld/1rYpIWq5qq7XhxuVcf9BmBevJjpPT5/g1xQPhnEAxk5Mjo/Qv65tjyFmZn
         IBElkwz+fyf8pzqiSWPk9rTzOCmpY821eZPyUyuNhmseENV/CkXRk8BHvc0tRe2CPzoX
         6jX98gk0XWu2SPtqmKdE92p+YZlR+RueOaX/QwvQYdnCn+ArFrDmfm7oY0qMbGnHUglg
         M8C8qpMXulJprm8tK23MVaMMq2KXQhLN1TlzLTK9WhJYBmEed0qb+g+bT0xzxySDn2SR
         X5CNE5Bn4JOFMVeZBHB2aL2mW1+v40LRgmIt7Tz06sdnVMKogTQkR67yzV5xdh+Ae5De
         ktow==
X-Gm-Message-State: AOAM532EQn3tD5jZNZqcItWnGL3un4Ok9jQqapunvXDmWqII8O3bboPn
	vJa5YWu+ersIS2rVF0LSLX8=
X-Google-Smtp-Source: ABdhPJxNjt+nCbqV1xpIeLBTsFp/FnJSPk2UM+b7LWRvSinLDRADDXWo4LlRiMDnzweqhORcZxmCgQ==
X-Received: by 2002:a50:f092:0:b0:41c:b7dd:cdb5 with SMTP id v18-20020a50f092000000b0041cb7ddcdb5mr7649642edl.225.1649060509500;
        Mon, 04 Apr 2022 01:21:49 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id n3-20020a1709061d0300b006da94efcc7esm4047336ejh.204.2022.04.04.01.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 01:21:48 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/5] staging: r8188eu: pwr_state_check_cnts is always zero
Date: Mon,  4 Apr 2022 10:21:41 +0200
Message-Id: <20220404082142.4639-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220404082142.4639-1-straube.linux@gmail.com>
References: <20220404082142.4639-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The field pwr_state_check_cnts in struct pwrctrl_priv is set to 0 and
never changed. Remove it and remove related dead code.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_pwrctrl.c    | 4 +---
 drivers/staging/r8188eu/include/rtw_pwrctrl.h | 1 -
 drivers/staging/r8188eu/os_dep/os_intfs.c     | 3 ---
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index 5d468e8b4920..939909e5316f 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -133,9 +133,8 @@ void rtw_ps_processor(struct adapter *padapter)
 	if (!rtw_pwr_unassociated_idle(padapter))
 		goto exit;
 
-	if ((pwrpriv->rf_pwrstate == rf_on) && ((pwrpriv->pwr_state_check_cnts % 4) == 0)) {
+	if (pwrpriv->rf_pwrstate == rf_on) {
 		pwrpriv->change_rfpwrstate = rf_off;
-
 		ips_enter(padapter);
 	}
 exit:
@@ -342,7 +341,6 @@ void rtw_init_pwrctrl_priv(struct adapter *padapter)
 	pwrctrlpriv->ips_mode_req = padapter->registrypriv.ips_mode;
 
 	pwrctrlpriv->pwr_state_check_interval = RTW_PWR_STATE_CHK_INTERVAL;
-	pwrctrlpriv->pwr_state_check_cnts = 0;
 	pwrctrlpriv->bInSuspend = false;
 	pwrctrlpriv->bkeepfwalive = false;
 
diff --git a/drivers/staging/r8188eu/include/rtw_pwrctrl.h b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
index 94a65056a77e..162792988910 100644
--- a/drivers/staging/r8188eu/include/rtw_pwrctrl.h
+++ b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
@@ -69,7 +69,6 @@ struct pwrctrl_priv {
 	u8		bSupportRemoteWakeup;
 	struct timer_list pwr_state_check_timer;
 	int		pwr_state_check_interval;
-	u8		pwr_state_check_cnts;
 
 	int		ps_flag;
 
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index c531504acc9e..5a9374957e3a 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -441,7 +441,6 @@ static void rtw_init_default_value(struct adapter *padapter)
 u8 rtw_reset_drv_sw(struct adapter *padapter)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	struct pwrctrl_priv *pwrctrlpriv = &padapter->pwrctrlpriv;
 
 	/* hal_priv */
 	rtl8188eu_init_default_value(padapter);
@@ -457,8 +456,6 @@ u8 rtw_reset_drv_sw(struct adapter *padapter)
 
 	_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY | _FW_UNDER_LINKING);
 
-	pwrctrlpriv->pwr_state_check_cnts = 0;
-
 	/* mlmeextpriv */
 	padapter->mlmeextpriv.sitesurvey_res.state = SCAN_DISABLE;
 
-- 
2.35.1

