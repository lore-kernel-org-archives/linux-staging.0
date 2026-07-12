Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47A8234964
	for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 14:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783866571; cv=none; b=Bx49noUYbtHkuFu5q95Bu4fgT1Z1AXZlJ4jqE2KW9wEgghi92/6dUo47PMXXt42UkXGGHbVuCCzh6EJCv4pX8MoZL5jbaFMpufjHw+SgsMpNFWqFsSHL0lH7GnViKlSX3ecIUwJS8qFtZEBx29fasVs28rfCzCnZH5WDvD5Ov1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783866571; c=relaxed/simple;
	bh=8BlY4o55AxKS9dPrtt7KZ1+BTBYNyqkfFfv4zziZkq0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QPDSNoWPY2sdhM5T6kl88g72tFnznmM5LbqbKmDrOJWaBOZTeRztNZau0oUQZ1fRtjfCXzJbaWwt5C8yn50ypQ2kHqaDZzZBFvETZDzFoGLlbeDf7RM34hJANYeiG8KWPR23N4jIEwbuWGMNIOK0BrA+rYV/z5yPzXGsNhH3XTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6Bv3del; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6Bv3del"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc73e322dbso24208725ad.1
        for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 07:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783866569; x=1784471369; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BNmjXRQSOFo7yJX9FQn7HizisfYTu/YMxrB3JDqbJU0=;
        b=m6Bv3delJXYUkk4W/disbBzW5xdGNFidQr3HIcBcQZJOReWFUCy1/wwR5V2Z6n5po+
         hgPz+ga8P6BwTxJF3qODAGyl2qj+ByQTYRyt6p0PC9G9G/kRWlL3QZTbWjpANVdZ2Nbr
         DSG7oDrrqNsugOYEFRikZS6ltM9VIelkkqtL0+bZjbz5HRzdaIcQs2F52Te8T3xAlT8Y
         zDmrKzfkwtXqIQas+/gNfQJpMOMjmLWify+DK7rGVdGQBg1ecUBXsV7blxLKRqRTwHM3
         TRa0INLMJdSX8ZJg/54+/FG5SbUIRBaKFj3/iHvOjsRfLbWm+Atf77+HA0hkK9O1eoms
         jL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783866569; x=1784471369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BNmjXRQSOFo7yJX9FQn7HizisfYTu/YMxrB3JDqbJU0=;
        b=qoAjJ4fZxcgKi48/DtH/Bi8e52vXimoTxh4OvQhBJYv7XbM0ESOKtqAIu5rJjakrOJ
         KEDegQtBMK+8Ovb8iE6DK1iBjdCkmIPgo+jsfqSt+RYbSB3mhmOsvKPa3Z/h9//PBBdj
         Imbjj+HtiP3jkBo6zq+FjZsY25fF9MJqnHgA2Z03HE+NnY98cLfdHSWzPim8HkQ6b+qE
         o6cahRH9rKKUsDeuBoRbgNBni+AfM6ePGZwWW56rssM6d7ivkd7JORf/ANThQkHXGO1t
         Ua7vcWDwAJ4tzp7+LmE8ZNTJeIBivI8tTKnViKJicKFIWUr1DLkhdpTCWv1bbroYFq2y
         wrkA==
X-Gm-Message-State: AOJu0YweXsP2poiUto037x1L4oSybyBt7wBy3uU70dyfLpYEcj14imPF
	gXHSG6d2DUroxA5KMI1sEC0Hq5NmU42slUBQV6/MTHq8zuAH13gXw60i
X-Gm-Gg: AfdE7cmfDVB0Jw4cijDDzXEizprbYPUJ+FIjdNGdJIz0ZvEQXuEi4ZEvJnqAIImH537
	ZtggEme5LnPFTdvRhwGkeHcRa4ojFjAeEEoVJhWrAJZZgI7taEvUxZGUU8KcR2rq0QfwPLRdicX
	SEqkCoTV1jC3sx83PEqdYmTRJ2iHESl1nrHnTQN4CCkWA/yTEr9IgmQ4On+oNt20CBVdnlLS0JK
	Ao3vEYA7FN+IlfB6wb/1Tn9WYerjDrVOeh2hQzmbdMh7XcNB5qE/V+A4TxR+sfXWfEge/BbvdwQ
	cl0ymQOINKaUMOhIIx+LgLjxGyQl7GlexcDiTQX8MEy18TtRSeBtVWx2LOk6wlJ0q3O5v+u6qAv
	RpG4ZxpL9ENxrO3HDEJsrCEwqzxffw+8bnrRn4kW/bPVtNAivSTGwNfkVgaFJRs77PrKiJM46Tu
	J3myeu7CdkwqyU4VHx/VTVqJufBNQrIAPEJOHyGro=
X-Received: by 2002:a17:90b:3806:b0:37f:e326:6559 with SMTP id 98e67ed59e1d1-38dc7b37972mr6300316a91.22.1783866569111;
        Sun, 12 Jul 2026 07:29:29 -0700 (PDT)
Received: from localhost.localdomain ([152.59.151.248])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm20129364eec.23.2026.07.12.07.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 07:29:28 -0700 (PDT)
From: Anirban Bose <boses156@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Anirban Bose <boses156@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename Switch_DM_Func to switch_dm_func
Date: Sun, 12 Jul 2026 19:58:46 +0530
Message-ID: <20260712142846.3369-1-boses156@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I changed the Switch_DM_Func() to switch_dm_func() to fix the
CamelCase, I changed it in every instance where it was present

Signed-off-by: Anirban Bose <boses156@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c          |  2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 10 +++++-----
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c   |  6 +++---
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h |  2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 7e272701c68c..aecb3b575663 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -684,7 +684,7 @@ void start_bss_network(struct adapter *padapter)
 
 	if (!pmlmepriv->cur_network.join_res) { /* setting only at  first time */
 		/* turn on all dynamic functions */
-		Switch_DM_Func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true);
+		switch_dm_func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true);
 	}
 
 	/* set channel, bwmode */
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 833132a12be2..e7f2c4dd731e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3787,7 +3787,7 @@ void site_survey(struct adapter *padapter)
 			rtw_hal_set_hwreg(padapter, HW_VAR_INITIAL_GAIN, (u8 *)(&initialgain));
 			/* turn on dynamic functions */
 			Restore_DM_Func_Flag(padapter);
-			/* Switch_DM_Func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true); */
+			/* switch_dm_func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true); */
 
 			if (is_client_associated_to_ap(padapter))
 				issue_nulldata(padapter, NULL, 0, 3, 500);
@@ -4683,7 +4683,7 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 		update_bmc_sta(padapter);
 
 	/* turn on dynamic functions */
-	Switch_DM_Func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true);
+	switch_dm_func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true);
 
 	/*  update IOT-related issue */
 	update_IOT_info(padapter);
@@ -5119,7 +5119,7 @@ u8 createbss_hdl(struct adapter *padapter, u8 *pbuf)
 
 		/* disable dynamic functions, such as high power, DIG */
 		Save_DM_Func_Flag(padapter);
-		Switch_DM_Func(padapter, DYNAMIC_FUNC_DISABLE, false);
+		switch_dm_func(padapter, DYNAMIC_FUNC_DISABLE, false);
 
 		/* config the initial gain under linking, need to write the BB registers */
 		/* initialgain = 0x1E; */
@@ -5266,7 +5266,7 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 	}
 
 	/* disable dynamic functions, such as high power, DIG */
-	/* Switch_DM_Func(padapter, DYNAMIC_FUNC_DISABLE, false); */
+	/* switch_dm_func(padapter, DYNAMIC_FUNC_DISABLE, false); */
 
 	/* config the initial gain under linking, need to write the BB registers */
 	/* initialgain = 0x1E; */
@@ -5423,7 +5423,7 @@ u8 sitesurvey_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 	    (pmlmeext->sitesurvey_res.state == SCAN_TXNULL)) {
 		/* disable dynamic functions, such as high power, DIG */
 		Save_DM_Func_Flag(padapter);
-		Switch_DM_Func(padapter, DYNAMIC_FUNC_DISABLE, false);
+		switch_dm_func(padapter, DYNAMIC_FUNC_DISABLE, false);
 
 		/* config the initial gain under scanning, need to write the BB
 		 * registers
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 3682048b29be..641818c60e92 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -234,7 +234,7 @@ void Restore_DM_Func_Flag(struct adapter *padapter)
 	rtw_hal_set_hwreg(padapter, HW_VAR_DM_FUNC_OP, (u8 *)(&bSaveFlag));
 }
 
-void Switch_DM_Func(struct adapter *padapter, u32 mode, u8 enable)
+void switch_dm_func(struct adapter *padapter, u32 mode, u8 enable)
 {
 	if (enable)
 		rtw_hal_set_hwreg(padapter, HW_VAR_DM_FUNC_SET, (u8 *)(&mode));
@@ -1449,13 +1449,13 @@ void update_IOT_info(struct adapter *padapter)
 		pmlmeinfo->turboMode_cts2self = 0;
 		pmlmeinfo->turboMode_rtsen = 1;
 		/* disable high power */
-		Switch_DM_Func(padapter, ((u32)(~DYNAMIC_BB_DYNAMIC_TXPWR)), false);
+		switch_dm_func(padapter, ((u32)(~DYNAMIC_BB_DYNAMIC_TXPWR)), false);
 		break;
 	case HT_IOT_PEER_REALTEK:
 		/* rtw_write16(padapter, 0x4cc, 0xffff); */
 		/* rtw_write16(padapter, 0x546, 0x01c0); */
 		/* disable high power */
-		Switch_DM_Func(padapter, ((u32)(~DYNAMIC_BB_DYNAMIC_TXPWR)), false);
+		switch_dm_func(padapter, ((u32)(~DYNAMIC_BB_DYNAMIC_TXPWR)), false);
 		break;
 	default:
 		pmlmeinfo->turboMode_cts2self = 0;
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index bf5a7e9dbe0e..0c2bd51b6bc2 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -435,7 +435,7 @@ void update_basic_rate_table_soft_ap(u8 *bssrateset, u32 bssratelen);
 
 void Save_DM_Func_Flag(struct adapter *padapter);
 void Restore_DM_Func_Flag(struct adapter *padapter);
-void Switch_DM_Func(struct adapter *padapter, u32 mode, u8 enable);
+void switch_dm_func(struct adapter *padapter, u32 mode, u8 enable);
 
 void set_msr(struct adapter *padapter, u8 type);
 
-- 
2.55.0

