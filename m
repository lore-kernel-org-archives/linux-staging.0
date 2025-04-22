Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E771244665
	for <linux-staging@lists.linux.dev>; Tue, 22 Apr 2025 21:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745357140; cv=none; b=mUPMTd+UMVaE0iTFR5nfGY+T82mGcr4SbBdCSaoyLs4O37lw0mne8c562NwLqF4CLXjU6tjjtNhWHLE15ycV3x5C3G0I+Glp+YCtsErg78EtGZ38xKn5ecI2pRPNpwUNRwPMMpOL8uHw75ArBB2sesP5TEImcwqejQ/JcjGeLYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745357140; c=relaxed/simple;
	bh=Y/C/xhkbLzQ9rIJeiEicc0P0p8FiP6d4YyTqIyKHbYg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a1WAkBstCTU8vaLZ3aTUMEInmNB5WBYkTUyZtxW4y9T4Z2tXRyJOQNzr/6tOpGRE/P24iPhLBy+Yu7KWJEV50kfXaXvWs5eixLTG4cwb3D32pKUABJmXxsANDDgm3k1xI/iSQyPmFLwfBOYMN2qYiz/3raK8zValLQ5TWJ3TVtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJYbPFDH; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJYbPFDH"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2241053582dso79854945ad.1
        for <linux-staging@lists.linux.dev>; Tue, 22 Apr 2025 14:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745357138; x=1745961938; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c2xkzyMG/T4Nc06X3h717slcVyxx+nHbaCSWe2w2AOU=;
        b=PJYbPFDH5GKaWZRYbcJwgL/GZDuqVgb9LQcA3sSrjlY6ao2ZumOLK3+VW7fPTEKVsq
         jsEQtqjuaAnKdBwz8hsw/Nssqq43mO3IhbthqvOpbtbd4mqfD4HXmbBsgFj9sTe0M91d
         1VGr026uFqfibCJEMjtSPiNKeZsy6NJ0AdgtzTKmRGtY+Akm8Y+tc/desfdc+PgojNE9
         FhBrH5x0lvYEzF16GbJM/5w0Wbs/bmx5qKpRI92NLaSdGG0r3LeTe/FCLXq708HSPWXh
         UNVcrsl1+p09uiMRPsHvgCQITVnTf01zH9OsbrlsblzpWwXz9O15Q/GI6KAawtlOpNSd
         7WVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745357138; x=1745961938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c2xkzyMG/T4Nc06X3h717slcVyxx+nHbaCSWe2w2AOU=;
        b=D42qNf8ePshazlMW0p2+JiGa0vCwmK7kwE6C5vQxVsSeBC61lU2GPvR9jPgOiIhY9x
         Jeml/eo6U63wLrEtRfBMStM/xxJ4hLFuPXtP2ujQGizGq7/swqJz4cC718uwZ2594K5f
         EeAkYe9cNRmkz+Q75LikkAoVZax2f+A14j7xpizf3kM+FDQ2/QlZrmdAH2R+RXL2b4MM
         ZguPi7EGIoDMTEOt/xvCJNKpnHF3RHG1i4sRYHkQ7lOJxKqcfiSDYwOiBSuNMXVDjK3T
         QdsfdNKbpnCRJEPya8p30kVDcgQQuwEwFECbgQ6tQ7dn3CkA2yvAFTGWk88QXzt9fmTC
         l9Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXv3NNrMd+M98qlkf73bisaBG3AsHs80EosHLaqJJuxuIwJsEnxgyLOQehspP1TmKQ8jJzStAQiAkT8cKXt@lists.linux.dev
X-Gm-Message-State: AOJu0Yywdb8VN/ZBXgomb+BdrWTVOYl/pRLWdf3A6hToGJBgCRZQoGVc
	xheI7OchFrqLBJs//prQAVzyZWZyvsrS8SoFFJeGJibSHhcyxHAL
X-Gm-Gg: ASbGnctaRmXd2aTjDW2lXMFn3Y0DUR9xY+TCb5oUR1Eq/C70NFausI8u5fJub6l8RyW
	q0FT/inze87t/omZYXE5nsii1c5IOAvXkc2sKGSa0rnGYmnQKWemrX7WEB+D7WNUC2/XRD5smVq
	J1w2c2sTX1+UQlc/gv/2uv8yfCuvYLZj6L9RKlsL1QxGmK8FcjeIfBFAcMdSrGVqkR0IQwbt6Bb
	AhAnxjRrmpJKA3msIaaDI4yEI8/wBPddr1kTEe2G9Pxr+Sxy43WHwzTZqdqE06b4g0RfHxKzCw6
	m53SocCkGiMsh9I8It++ZdUWTG94vcZa48uifg==
X-Google-Smtp-Source: AGHT+IGITDdmHBEsMW6HJ5ldB4QFVVmfPzM2dBETcoNqBLkno8pe5V2JmNTWujeQ7uMADfwfWpxmsQ==
X-Received: by 2002:a17:903:1a04:b0:224:c46:d166 with SMTP id d9443c01a7336-22c53604563mr288284045ad.40.1745357137754;
        Tue, 22 Apr 2025 14:25:37 -0700 (PDT)
Received: from archlinux.attlocal.net ([2600:1700:5a60:6f70::2f])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-22c50bdae5dsm90389605ad.35.2025.04.22.14.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 14:25:37 -0700 (PDT)
From: JJ Strnad <strnad.jj@gmail.com>
To: 
Cc: strnad.jj@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Bryant Boatright <bryant.boatright@proton.me>,
	Thomas Gleixner <tglx@linutronix.de>,
	Manuel Quintero F <sakunix@yahoo.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: remove multiple blank lines
Date: Tue, 22 Apr 2025 14:23:16 -0700
Message-ID: <20250422212332.23170-1-strnad.jj@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style.

Reported by checkpatch:

CHECK: Please don't use multiple blank lines

Signed-off-by: JJ Strnad <strnad.jj@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 946511793c08..437934dd255e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -695,7 +695,6 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	/* for ies is fix buf size */
 	t_len = sizeof(struct wlan_bssid_ex);
 
-
 	/* for hidden ap to set fw_state here */
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE|WIFI_ADHOC_STATE) != true) {
 		switch (ndis_network_mode) {
@@ -738,7 +737,6 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 
 	psecnetwork->ie_length = rtw_restruct_sec_ie(padapter, &pnetwork->network.ies[0], &psecnetwork->ies[0], pnetwork->network.ie_length);
 
-
 	pqospriv->qos_option = 0;
 
 	if (pregistrypriv->wmm_enable) {
@@ -1032,7 +1030,6 @@ u8 rtw_reset_securitypriv_cmd(struct adapter *padapter)
 
 	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
 
-
 	/* rtw_enqueue_cmd(pcmdpriv, ph2c); */
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 exit:
@@ -1099,7 +1096,6 @@ u8 rtw_dynamic_chk_wk_cmd(struct adapter *padapter)
 	pdrvextra_cmd_parm->pbuf = NULL;
 	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
 
-
 	/* rtw_enqueue_cmd(pcmdpriv, ph2c); */
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 exit:
@@ -1256,7 +1252,6 @@ static void dynamic_chk_wk_hdl(struct adapter *padapter)
 	/*  */
 	hal_btcoex_Handler(padapter);
 
-
 	/* always call rtw_ps_processor() at last one. */
 	rtw_ps_processor(padapter);
 }
@@ -1367,7 +1362,6 @@ u8 rtw_dm_in_lps_wk_cmd(struct adapter *padapter)
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
 
-
 	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
 	if (!ph2c) {
 		res = _FAIL;
@@ -1850,7 +1844,6 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 
 	spin_lock_bh(&pmlmepriv->lock);
 
-
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 		psta = rtw_get_stainfo(&padapter->stapriv, pnetwork->mac_address);
 		if (!psta) {
-- 
2.49.0

