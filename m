Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75436849C
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 13:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775998852; cv=none; b=qgu2NtfcLtl6I1/xPtuAwDtXdrJBndZgPvCIan2gp9gBwXdF/m7cPOetjrHQBM3roPXkmcxd8gK+AZ3SBzXDLsq08i4zhwuFFn8kf13ojzoJOLrMeYX4nnBFfIMzDmmGT05r55uZFYKEUXSzLXYIj7bg+GgzzlecgfYJpk1neSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775998852; c=relaxed/simple;
	bh=thAsHTZZL9HA3VkUlvYQnFGLCZCMp65iAY+K3FyipG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=beqXrZaZ92PysrXds9HX3+RQMZYy5MgKY3BUX7H3keqOGV8uYRMvUyRqAc2wsymHdk1iHbZ0xNQEUFWNuinVMND7UVj7sPJ7mzpgZN8yckYuYphFZgXdmJDKtY1CR5bo2W2ozP2JJAPJ/VqkPnnyvRV2+XXBcavRDh+7eIwlcJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hI6Wg+Jg; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hI6Wg+Jg"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82f138a6d5aso804716b3a.0
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 06:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775998846; x=1776603646; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APR1jBt0QjJIh65Rqf2WDKNElBE+RCuThzC08sgOGv8=;
        b=hI6Wg+Jg+x9VTUoQ+2DNrGlMx1kTwEG2qgwnM8mWwTzbSy3hNryrwNc6Rl0xtprw0g
         6bsMLXSCGCjOsiUgpB6eKsTDJV+IETFDhqJoMD6C5N6o2YKn8jzl5n48yCmmPtN1zU7J
         LRf0FdjxKNJ8/ww35rRxQSuZrzQGtTktaWN/8FCHYazcDldqS0Ou8HVw1pgjWZXtOtcE
         R96Wy4GQjqgeusGXuHpxMeXKgSyghtZpXZoNJ+xjAM9xb+YgU0cMc7Bz4WKcgpLEDkv3
         QgNLoFW1kbVZZo9cdWDXxTcRpSEeBjkUP21bZZhKIMHPj0BA8qMqeFGLQmdub0djl2dK
         5KZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775998846; x=1776603646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=APR1jBt0QjJIh65Rqf2WDKNElBE+RCuThzC08sgOGv8=;
        b=fsuKMcAWueavCAe0xB1WEjeDTbkFapNe90/3URdLlVNRGeIt1wU1HQYfdwPV0NJVzB
         STEg9AiguutUj11ty7+MPMLysv6wLSR7IfZ4ALfBf5jcLNl/pI6wSnqZIV2RnxYv3WoH
         SJHYt69KFNYn/+L5QNMgVYCq0+CcnjNhDNBKfiUF5cK+TYXmSKqGFvrytZqB7KIOzLvS
         Ktt29Gs0SzcWCKZwhBVlYtxKWTY9GWhcI86QAVmIvlrpmd6PS+GBcM3H7LlhEUs7jJLJ
         hlKCm6RgZNJPoK7gxSNFwMf9D7sYvyVgBm50RdDbGTuHl9oQuhXt/kPfdW9levDxZSs8
         dbWg==
X-Forwarded-Encrypted: i=1; AJvYcCWXMRITVRcnYpsV5zoXg+gBVSZ8iVyetdm9xdFH6lGkhjRbvFiMLZAgaEE1yFI07ZqmLkUyfWq9894HhKnQ@lists.linux.dev
X-Gm-Message-State: AOJu0YyRXCupiFQCGpQeXX3VOykYtlcyb1BrH+lYopj5ton5tAPscRR1
	wbBT3H60UQSXTSCzqY+kWpYOfOXHGPC7ddXEQpTLJ5AsRSeQcoota9/M
X-Gm-Gg: AeBDietdn4PNVimNA7I1R3Zd5DafG63b2A1pY5HjQJP5Bha4DW83YilDtiowouDhoWp
	HQuHkp8gN/Og6dWM5I/VlvXI9bJqd/cN0mUIjU6Brz7uHwBs6K1HKC75mZQC3M9eAp8nq4sinbS
	hcrnXN9BnNVbEEsEaG9gCnW9itRXSUMzpLz2/fLMzQ+xkNEoDWAsnt85fT0gzVUoSa0FKRY/eQh
	qUO5y9WcjSqnaOLqk7QVggCXdnZsC2p6OwbKbujtsXWIKDrFflFiMX76PiLFGVmcC+JOcEIKcsj
	26DmEdz3/RpfvXKy1y4VIQQIkpKB8CciFR70slWHKogBRliCTnhM81+JxR38dVcRnIWiKszRxA4
	KL4dAVDizAoVO8e3d8USqfDGGtAgvgQSP33nPrFuav9LD34pmKgmhSLTvA7JsGLKYWPz0A7KtBZ
	LG/yozzh9h3fptkaxDj+ySUGrr6GNrhasuMRe3ZtA/odraTVaYUaf7
X-Received: by 2002:a05:6a20:7292:b0:398:7973:277e with SMTP id adf61e73a8af0-39fe3f1d806mr10802821637.31.1775998844742;
        Sun, 12 Apr 2026 06:00:44 -0700 (PDT)
Received: from localhost.localdomain ([222.254.206.81])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c79219c618asm7361852a12.18.2026.04.12.06.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 06:00:44 -0700 (PDT)
From: Nguyen Duc Thinh <ducthinh100812@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nguyen Duc Thinh <ducthinh100812@gmail.com>
Subject: [PATCH v3 2/2] staging: rtl8723bs: rename dot11AuthAlgrthm to fix CamelCase
Date: Sun, 12 Apr 2026 20:00:12 +0700
Message-ID: <20260412130012.5832-3-ducthinh100812@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260412130012.5832-1-ducthinh100812@gmail.com>
References: <20260412130012.5832-1-ducthinh100812@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable dot11AuthAlgrthm and its associated enum values
violate the kernel naming convention. Rename them to the
snake_case equivalent, dot11_auth_algrthm.

Signed-off-by: Nguyen Duc Thinh <ducthinh100812@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c       | 24 +++---
 drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  4 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  8 +-
 drivers/staging/rtl8723bs/core/rtw_efuse.c    |  8 +-
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  4 +-
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    | 44 +++++-----
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 20 ++---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 54 ++++++------
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |  2 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 84 +++++++++----------
 drivers/staging/rtl8723bs/core/rtw_security.c |  4 +-
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |  6 +-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 30 +++----
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 46 +++++-----
 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   |  4 +-
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c   |  4 +-
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 12 +--
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    | 10 +--
 drivers/staging/rtl8723bs/hal/hal_com.c       |  6 +-
 drivers/staging/rtl8723bs/hal/hal_intf.c      |  4 +-
 drivers/staging/rtl8723bs/hal/odm.c           | 12 +--
 .../staging/rtl8723bs/hal/odm_CfoTracking.c   |  6 +-
 drivers/staging/rtl8723bs/hal/odm_DIG.c       | 26 +++---
 .../rtl8723bs/hal/odm_EdcaTurboCheck.c        |  2 +-
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c  |  2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |  2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   | 12 +--
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 28 +++----
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  4 +-
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |  4 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  2 +-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  6 +-
 drivers/staging/rtl8723bs/include/ieee80211.h |  8 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h  | 14 ++--
 .../staging/rtl8723bs/include/rtw_security.h  | 14 ++--
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 74 ++++++++--------
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  6 +-
 .../staging/rtl8723bs/os_dep/sdio_ops_linux.c |  4 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c |  4 +-
 39 files changed, 304 insertions(+), 304 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 4b4012411011..3ca8c3640acc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -228,7 +228,7 @@ void expire_timeout_chk(struct adapter *padapter)
 			}
 
 			if (psta->state & WIFI_SLEEP_STATE) {
-				if (!(psta->state & WIFI_STA_ALIVE_CHK_STATE)) {
+				if !(psta->state & WIFI_STA_ALIVE_CHK_STATE) {
 					/* to check if alive by another methods */
 					/* if station is at ps mode. */
 					psta->expire_to = pstapriv->expire_to;
@@ -281,7 +281,7 @@ void expire_timeout_chk(struct adapter *padapter)
 			int ret = _FAIL;
 
 			psta = rtw_get_stainfo_by_offset(pstapriv, chk_alive_list[i]);
-			if (!(psta->state & _FW_LINKED))
+			if !(psta->state & _FW_LINKED)
 				continue;
 
 			if (psta->state & WIFI_SLEEP_STATE)
@@ -301,7 +301,7 @@ void expire_timeout_chk(struct adapter *padapter)
 
 			psta->keep_alive_trycnt = 0;
 			spin_lock_bh(&pstapriv->asoc_list_lock);
-			if (list_empty(&psta->asoc_list) == false) {
+			if (!list_empty(&psta->asoc_list)) {
 				list_del_init(&psta->asoc_list);
 				pstapriv->asoc_list_cnt--;
 				updated = ap_free_sta(padapter, psta, false,
@@ -328,7 +328,7 @@ void add_ratid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level)
 	if (!psta)
 		return;
 
-	if (!(psta->state & _FW_LINKED))
+	if !(psta->state & _FW_LINKED)
 		return;
 
 	rtw_hal_update_sta_rate_mask(padapter, psta);
@@ -413,7 +413,7 @@ void update_bmc_sta(struct adapter *padapter)
 		/* ap mode */
 		rtw_hal_set_odm_var(padapter, HAL_ODM_STA_INFO, psta, true);
 
-		/* if (pHalData->fw_ractrl == true) */
+		/* if (pHalData->fw_ractrl) */
 		{
 			u8 arg[4] = {0};
 
@@ -458,7 +458,7 @@ void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
 	/* ap mode */
 	rtw_hal_set_odm_var(padapter, HAL_ODM_STA_INFO, psta, true);
 
-	if (psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_8021X)
+	if (psecuritypriv->dot11_auth_algrthm == dot11_auth_algrthm_8021x)
 		psta->ieee8021x_blocked = true;
 	else
 		psta->ieee8021x_blocked = false;
@@ -701,8 +701,8 @@ void start_bss_network(struct adapter *padapter)
 	rtw_hal_set_hwreg(padapter, HW_VAR_AC_PARAM_BK, (u8 *)(&acparm));
 
 	/* Set Security */
-	val8 = (psecuritypriv->dot11AuthAlgrthm ==
-		dot11AuthAlgrthm_8021X) ? 0xcc : 0xcf;
+	val8 = (psecuritypriv->dot11_auth_algrthm ==
+		dot11_auth_algrthm_8021x) ? 0xcc : 0xcf;
 	rtw_hal_set_hwreg(padapter, HW_VAR_SEC_CFG, (u8 *)(&val8));
 
 	/* Beacon Control related register */
@@ -919,7 +919,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 				      &group_cipher,
 				      &pairwise_cipher,
 				      NULL) == _SUCCESS) {
-			psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+			psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021x;
 
 			psecuritypriv->dot8021xalg = 1;/* psk,  todo:802.1x */
 			psecuritypriv->wpa_psk |= BIT(1);
@@ -945,7 +945,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 					     &group_cipher,
 					     &pairwise_cipher,
 					     NULL) == _SUCCESS) {
-				psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+				psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021x;
 
 				psecuritypriv->dot8021xalg = 1;/* psk,  todo:802.1x */
 
@@ -1649,7 +1649,7 @@ void bss_cap_update_on_sta_join(struct adapter *padapter, struct sta_info *psta)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 
-	if (!(psta->flags & WLAN_STA_SHORT_PREAMBLE)) {
+	if !(psta->flags & WLAN_STA_SHORT_PREAMBLE) {
 		if (!psta->no_short_preamble_set) {
 			psta->no_short_preamble_set = 1;
 
@@ -1699,7 +1699,7 @@ void bss_cap_update_on_sta_join(struct adapter *padapter, struct sta_info *psta)
 		}
 	}
 
-	if (!(psta->capability & WLAN_CAPABILITY_SHORT_SLOT_TIME)) {
+	if !(psta->capability & WLAN_CAPABILITY_SHORT_SLOT_TIME) {
 		if (!psta->no_short_slot_time_set) {
 			psta->no_short_slot_time_set = 1;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index 0191a943f0a4..cb3dbea1176e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -10,8 +10,8 @@
 
 void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 media_status)
 {
-	if ((media_status == RT_MEDIA_CONNECT)
-		&& (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true)) {
+	if (media_status == RT_MEDIA_CONNECT &&
+		(check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE))) {
 		rtw_hal_set_hwreg(padapter, HW_VAR_DL_RSVD_PAGE, NULL);
 	}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index c1185c25ed36..1320c4094ef5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -304,7 +304,7 @@ int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
 	if (cmd_obj->cmdcode == GEN_CMD_CODE(_SetChannelPlan))
 		bAllow = true;
 
-	if ((!pcmdpriv->padapter->hw_init_completed && !bAllow) ||
+	if (!pcmdpriv->padapter->hw_init_completed && !bAllow ||
 	    !atomic_read(&pcmdpriv->cmdthd_running))	/* com_thread not running */
 		return _FAIL;
 
@@ -483,7 +483,7 @@ int rtw_cmd_thread(void *context)
 			if (!pcmd_callback) {
 				rtw_free_cmd_obj(pcmd);
 			} else {
-				/* todo: !!! fill rsp_buf to pcmd->rsp if (pcmd->rsp!= NULL) */
+				/* todo: !! fill rsp_buf to pcmd->rsp if (pcmd->rsp!= NULL) */
 				pcmd_callback(pcmd->padapter, pcmd);/* need consider that free cmd_obj in rtw_cmd_callback */
 			}
 		} else {
@@ -518,7 +518,7 @@ int rtw_cmd_thread(void *context)
 
 /*
  * rtw_sitesurvey_cmd(~)
- *	### NOTE:#### (!!!!)
+ *	### NOTE:#### (!!)
  *	MUST TAKE CARE THAT BEFORE CALLING THIS FUNC, YOU SHOULD HAVE LOCKED pmlmepriv->lock
  */
 
@@ -1244,7 +1244,7 @@ static void dynamic_chk_wk_hdl(struct adapter *padapter)
 
 	/* for debug purpose */
 	_linked_info_dump(padapter);
-	/* if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING|_FW_UNDER_SURVEY) ==false) */
+	/* if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING_ | _FW_UNDER_SURVEY) ==false) */
 	{
 		linked_status_chk(padapter);
 		traffic_status_watchdog(padapter, false);
diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 099320e4eb50..fc11ce40201b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -8,7 +8,7 @@
 #include <hal_data.h>
 #include <linux/jiffies.h>
 
-/*  11/16/2008 MH Add description. Get current efuse area enabled word!!. */
+/*  11/16/2008 MH Add description. Get current efuse area enabled word!. */
 u8
 Efuse_CalculateWordCnts(u8 word_en)
 {
@@ -69,7 +69,7 @@ u16		Address)
 
 		/* Wait Write-ready (0x30[31]= 1) */
 		Bytetemp = rtw_read8(Adapter, EFUSE_CTRL + 3);
-		while (!(Bytetemp & 0x80)) {
+		while !(Bytetemp & 0x80) {
 			Bytetemp = rtw_read8(Adapter, EFUSE_CTRL + 3);
 			k++;
 			if (k == 1000)
@@ -157,7 +157,7 @@ static void Efuse_ReadAllMap(struct adapter *padapter, u8 efuseType, u8 *Efuse)
  *		efuse_ShadowRead2Byte
  *		efuse_ShadowRead4Byte
  *
- * Overview:	Read from efuse init map by one/two/four bytes !!!!!
+ * Overview:	Read from efuse init map by one/two/four bytes !!!
  *
  * Input:       NONE
  *
@@ -236,7 +236,7 @@ void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType)
 /*-----------------------------------------------------------------------------
  * Function:	EFUSE_ShadowRead
  *
- * Overview:	Read from efuse init map !!!!!
+ * Overview:	Read from efuse init map !!!
  *
  * Input:       NONE
  *
diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 72b7f731dd47..d3a04be797fd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -57,7 +57,7 @@ int rtw_get_bit_value_from_ieee_value(u8 val)
 {
 	static const unsigned char dot11_rate_table[] = {
 		2, 4, 11, 22, 12, 18, 24, 36, 48, 72, 96, 108, 0
-	}; /*  last element must be zero!! */
+	}; /*  last element must be zero! */
 	int i = 0;
 
 	while (dot11_rate_table[i] != 0) {
@@ -347,7 +347,7 @@ int rtw_generate_ie(struct registry_priv *pregistrypriv)
 
 	/* HT Cap. */
 	if ((pregistrypriv->wireless_mode & WIRELESS_11_24N) &&
-	    (pregistrypriv->ht_enable == true)) {
+	    (pregistrypriv->ht_enable)) {
 		/* todo: */
 	}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index c70541f95a73..6da2a7604b0f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -80,7 +80,7 @@ u8 rtw_do_join(struct adapter *padapter)
 			pmlmepriv->to_join = false;
 			_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
 		} else {
-			if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) {
+			if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
 				/*  submit createbss_cmd to change to a ADHOC_MASTER */
 
 				/* pmlmepriv->lock has been acquired by caller... */
@@ -139,19 +139,19 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 	netdev_dbg(padapter->pnetdev, "set ssid [%s] fw_state = 0x%08x\n",
 		   ssid->ssid, get_fwstate(pmlmepriv));
 
-	if (padapter->hw_init_completed == false) {
+	if (!padapter->hw_init_completed) {
 		status = _FAIL;
 		goto exit;
 	}
 
 	spin_lock_bh(&pmlmepriv->lock);
 
-	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) == true)
+	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
 		goto handle_tkip_countermeasure;
-	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) == true)
+	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
 		goto release_mlme_lock;
 
-	if (check_fwstate(pmlmepriv, _FW_LINKED|WIFI_ADHOC_MASTER_STATE) == true) {
+	if (check_fwstate(pmlmepriv, _FW_LINKED | WIFI_ADHOC_MASTER_STATE)) {
 		if ((pmlmepriv->assoc_ssid.ssid_length == ssid->ssid_length) &&
 		    (!memcmp(&pmlmepriv->assoc_ssid.ssid, ssid->ssid, ssid->ssid_length))) {
 			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == false) {
@@ -159,12 +159,12 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 					/* if in WIFI_ADHOC_MASTER_STATE | WIFI_ADHOC_STATE, create bss or rejoin again */
 					rtw_disassoc_cmd(padapter, 0, true);
 
-					if (check_fwstate(pmlmepriv, _FW_LINKED) == true)
+					if (check_fwstate(pmlmepriv, _FW_LINKED))
 						rtw_indicate_disconnect(padapter);
 
 					rtw_free_assoc_resources(padapter, 1);
 
-					if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true) {
+					if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
 						_clr_fwstate_(pmlmepriv, WIFI_ADHOC_MASTER_STATE);
 						set_fwstate(pmlmepriv, WIFI_ADHOC_STATE);
 					}
@@ -177,12 +177,12 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 		} else {
 			rtw_disassoc_cmd(padapter, 0, true);
 
-			if (check_fwstate(pmlmepriv, _FW_LINKED) == true)
+			if (check_fwstate(pmlmepriv, _FW_LINKED))
 				rtw_indicate_disconnect(padapter);
 
 			rtw_free_assoc_resources(padapter, 1);
 
-			if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true) {
+			if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
 				_clr_fwstate_(pmlmepriv, WIFI_ADHOC_MASTER_STATE);
 				set_fwstate(pmlmepriv, WIFI_ADHOC_STATE);
 			}
@@ -195,7 +195,7 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 		goto release_mlme_lock;
 	}
 
-	if (rtw_validate_ssid(ssid) == false) {
+	if (!rtw_validate_ssid(ssid)) {
 		status = _FAIL;
 		goto release_mlme_lock;
 	}
@@ -203,7 +203,7 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 	memcpy(&pmlmepriv->assoc_ssid, ssid, sizeof(struct ndis_802_11_ssid));
 	pmlmepriv->assoc_by_bssid = false;
 
-	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) == true)
+	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
 		pmlmepriv->to_join = true;
 	else
 		status = rtw_do_join(padapter);
@@ -234,7 +234,7 @@ u8 rtw_set_802_11_connect(struct adapter *padapter, u8 *bssid, struct ndis_802_1
 		goto exit;
 	}
 
-	if (padapter->hw_init_completed == false) {
+	if (!padapter->hw_init_completed) {
 		status = _FAIL;
 		goto exit;
 	}
@@ -244,9 +244,9 @@ u8 rtw_set_802_11_connect(struct adapter *padapter, u8 *bssid, struct ndis_802_1
 	netdev_dbg(padapter->pnetdev, FUNC_ADPT_FMT "  fw_state = 0x%08x\n",
 		   FUNC_ADPT_ARG(padapter), get_fwstate(pmlmepriv));
 
-	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) == true)
+	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
 		goto handle_tkip_countermeasure;
-	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) == true)
+	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
 		goto release_mlme_lock;
 
 handle_tkip_countermeasure:
@@ -267,7 +267,7 @@ u8 rtw_set_802_11_connect(struct adapter *padapter, u8 *bssid, struct ndis_802_1
 		pmlmepriv->assoc_by_bssid = false;
 	}
 
-	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) == true)
+	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
 		pmlmepriv->to_join = true;
 	else
 		status = rtw_do_join(padapter);
@@ -296,15 +296,15 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 
 		spin_lock_bh(&pmlmepriv->lock);
 
-		if ((check_fwstate(pmlmepriv, _FW_LINKED) == true) || (*pold_state == Ndis802_11IBSS))
+		if ((check_fwstate(pmlmepriv, _FW_LINKED)) || (*pold_state == Ndis802_11IBSS))
 			rtw_disassoc_cmd(padapter, 0, true);
 
-		if ((check_fwstate(pmlmepriv, _FW_LINKED) == true) ||
-			(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true))
+		if ((check_fwstate(pmlmepriv, _FW_LINKED)) ||
+			(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)))
 			rtw_free_assoc_resources(padapter, 1);
 
 		if ((*pold_state == Ndis802_11Infrastructure) || (*pold_state == Ndis802_11IBSS)) {
-			if (check_fwstate(pmlmepriv, _FW_LINKED) == true)
+			if (check_fwstate(pmlmepriv, _FW_LINKED))
 				rtw_indicate_disconnect(padapter); /* will clr Linked_state; before this function, we must have checked whether issue dis-assoc_cmd or not */
 		}
 
@@ -347,7 +347,7 @@ u8 rtw_set_802_11_disassociate(struct adapter *padapter)
 
 	spin_lock_bh(&pmlmepriv->lock);
 
-	if (check_fwstate(pmlmepriv, _FW_LINKED) == true) {
+	if (check_fwstate(pmlmepriv, _FW_LINKED)) {
 		rtw_disassoc_cmd(padapter, 0, true);
 		rtw_indicate_disconnect(padapter);
 		/* modify for CONFIG_IEEE80211W, none 11w can use it */
@@ -369,7 +369,7 @@ u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter, struct ndis_802_11_s
 		res = false;
 		goto exit;
 	}
-	if (padapter->hw_init_completed == false) {
+	if (!padapter->hw_init_completed) {
 		res = false;
 		goto exit;
 	}
@@ -403,7 +403,7 @@ u8 rtw_set_802_11_authentication_mode(struct adapter *padapter, enum ndis_802_11
 	psecuritypriv->ndisauthtype = authmode;
 
 	if (psecuritypriv->ndisauthtype > 3)
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021x;
 
 	res = rtw_set_auth(padapter, psecuritypriv);
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index ddfc56f0253d..3527d8672ca5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -918,7 +918,7 @@ inline void rtw_indicate_scan_done(struct adapter *padapter, bool aborted)
 {
 	rtw_cfg80211_indicate_scan_done(padapter, aborted);
 
-	if ((!adapter_to_pwrctl(padapter)->bInSuspend) &&
+	if (!adapter_to_pwrctl(padapter)->bInSuspend &&
 	    (!check_fwstate(&padapter->mlmepriv,
 			    WIFI_ASOC_STATE | WIFI_UNDER_LINKING))) {
 		rtw_set_ips_deny(padapter, 0);
@@ -978,7 +978,7 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 		rtw_hal_set_odm_var(padapter, HAL_ODM_STA_INFO, psta, true);
 
 		/* security related */
-		if (padapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) {
+		if (padapter->securitypriv.dot11_auth_algrthm == dot11_auth_algrthm_8021x) {
 			padapter->securitypriv.binstallGrpkey = false;
 			padapter->securitypriv.busetkipkey = false;
 			padapter->securitypriv.bgrpkey_handshake = false;
@@ -1089,7 +1089,7 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 
 	spin_lock_bh(&adapter->security_key_mutex);
 
-	if (adapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) {
+	if (adapter->securitypriv.dot11_auth_algrthm == dot11_auth_algrthm_8021x) {
 		/* 802.1x */
 		/*  Added by Albert 2009/02/18 */
 		/*  We have to backup the PMK information for WiFi PMK Caching test item. */
@@ -1123,7 +1123,7 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 		/*  */
 		struct security_priv *psec_priv = &adapter->securitypriv;
 
-		psec_priv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open;  /* open system */
+		psec_priv->dot11_auth_algrthm = dot11_auth_algrthm_open;  /* open system */
 		psec_priv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
 		psec_priv->dot11PrivacyKeyIndex = 0;
 
@@ -1339,7 +1339,7 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 
 	rtw_sta_media_status_rpt(adapter, psta, 1);
 
-	if (adapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X)
+	if (adapter->securitypriv.dot11_auth_algrthm == dot11_auth_algrthm_8021x)
 		psta->dot118021XPrivacy = adapter->securitypriv.dot11PrivacyAlgrthm;
 
 	psta->ieee8021x_blocked = false;
@@ -1566,7 +1566,7 @@ void rtw_mlme_reset_auto_scan_int(struct adapter *adapter)
 
 	if (pmlmeinfo->VHT_enable) /* disable auto scan when connect to 11AC AP */
 		mlme->auto_scan_int_ms = 0;
-	else if (adapter->registrypriv.wifi_spec && is_client_associated_to_ap(adapter) == true)
+	else if (adapter->registrypriv.wifi_spec && is_client_associated_to_ap(adapter))
 		mlme->auto_scan_int_ms = 60 * 1000;
 	else if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
 		if (check_fwstate(mlme, WIFI_STATION_STATE) && check_fwstate(mlme, _FW_LINKED))
@@ -1860,7 +1860,7 @@ signed int rtw_set_auth(struct adapter *adapter, struct security_priv *psecurity
 		goto exit;
 	}
 
-	psetauthparm->mode = (unsigned char)psecuritypriv->dot11AuthAlgrthm;
+	psetauthparm->mode = (unsigned char)psecuritypriv->dot11_auth_algrthm;
 
 	pcmd->cmdcode = _SetAuth_CMD_;
 	pcmd->parmbuf = (unsigned char *)psetauthparm;
@@ -1890,7 +1890,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 		goto exit;
 	}
 
-	if (psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_8021X)
+	if (psecuritypriv->dot11_auth_algrthm == dot11_auth_algrthm_8021x)
 		psetkeyparm->algorithm = (unsigned char)psecuritypriv->dot118021XGrpPrivacy;
 	else
 		psetkeyparm->algorithm = (u8)psecuritypriv->dot11PrivacyAlgrthm;
@@ -2400,7 +2400,7 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 	if (!phtpriv->ht_option)
 		return;
 
-	if ((!pmlmeinfo->HT_info_enable) || (!pmlmeinfo->HT_caps_enable))
+	if (!pmlmeinfo->HT_info_enable || (!pmlmeinfo->HT_caps_enable))
 		return;
 
 	/* maybe needs check if ap supports rx ampdu. */
@@ -2491,7 +2491,7 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
 	if (!psta)
 		return;
 
-	if (!(psta->state & _FW_LINKED))
+	if !(psta->state & _FW_LINKED)
 		return;
 
 	phtpriv = &psta->htpriv;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 5f00fe282d1b..c073553455d2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -237,7 +237,7 @@ static void init_mlme_ext_priv_value(struct adapter *padapter)
 	pmlmeinfo->reassoc_count = 0;
 	pmlmeinfo->link_count = 0;
 	pmlmeinfo->auth_seq = 0;
-	pmlmeinfo->auth_algo = dot11AuthAlgrthm_Open;
+	pmlmeinfo->auth_algo = dot11_auth_algrthm_open;
 	pmlmeinfo->key_index = 0;
 	pmlmeinfo->iv = 0;
 
@@ -486,7 +486,7 @@ void mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame)
 		_mgt_dispatcher(padapter, ptable, precv_frame);
 		break;
 	case WIFI_ACTION:
-		/* if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) */
+		/* if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) */
 		_mgt_dispatcher(padapter, ptable, precv_frame);
 		break;
 	default:
@@ -513,7 +513,7 @@ unsigned int OnProbeReq(struct adapter *padapter, union recv_frame *precv_frame)
 		return _SUCCESS;
 
 	if (check_fwstate(pmlmepriv, _FW_LINKED) == false &&
-		check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE|WIFI_AP_STATE) == false) {
+		check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE | WIFI_AP_STATE) == false) {
 		return _SUCCESS;
 	}
 
@@ -689,7 +689,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 
 	sa = GetAddr2Ptr(pframe);
 
-	auth_mode = psecuritypriv->dot11AuthAlgrthm;
+	auth_mode = psecuritypriv->dot11_auth_algrthm;
 
 	if (GetPrivacy(pframe)) {
 		u8 *iv;
@@ -748,7 +748,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	} else {
 
 		spin_lock_bh(&pstapriv->asoc_list_lock);
-		if (list_empty(&pstat->asoc_list) == false) {
+		if (!list_empty(&pstat->asoc_list)) {
 			list_del_init(&pstat->asoc_list);
 			pstapriv->asoc_list_cnt--;
 			if (pstat->expire_to > 0) {
@@ -864,7 +864,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 	if (memcmp(myid(&(padapter->eeprompriv)), get_da(pframe), ETH_ALEN))
 		return _SUCCESS;
 
-	if (!(pmlmeinfo->state & WIFI_FW_AUTH_STATE))
+	if !(pmlmeinfo->state & WIFI_FW_AUTH_STATE)
 		return _SUCCESS;
 
 	offset = (GetPrivacy(pframe)) ? 4 : 0;
@@ -873,11 +873,11 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 	status	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 4));
 
 	if (status != 0) {
-		if (status == 13) { /*  pmlmeinfo->auth_algo == dot11AuthAlgrthm_Auto) */
-			if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared)
-				pmlmeinfo->auth_algo = dot11AuthAlgrthm_Open;
+		if (status == 13) { /*  pmlmeinfo->auth_algo == dot11_auth_algrthm_auto) */
+			if (pmlmeinfo->auth_algo == dot11_auth_algrthm_shared)
+				pmlmeinfo->auth_algo = dot11_auth_algrthm_open;
 			else
-				pmlmeinfo->auth_algo = dot11AuthAlgrthm_Shared;
+				pmlmeinfo->auth_algo = dot11_auth_algrthm_shared;
 			/* pmlmeinfo->reauth_count = 0; */
 		}
 
@@ -886,7 +886,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 	}
 
 	if (seq == 2) {
-		if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared) {
+		if (pmlmeinfo->auth_algo == dot11_auth_algrthm_shared) {
 			 /*  legendary shared system */
 			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&len,
 				pkt_len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_);
@@ -904,7 +904,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 		/* open system */
 		go2asoc = 1;
 	} else if (seq == 4) {
-		if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared)
+		if (pmlmeinfo->auth_algo == dot11_auth_algrthm_shared)
 			go2asoc = 1;
 		else
 			goto authclnt_fail;
@@ -1128,7 +1128,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		/*  AP support WPA/RSN, and sta is going to do WPS, but AP is not ready */
 		/*  that the selected registrar of AP is _FLASE */
 		if ((psecuritypriv->wpa_psk > 0)
-			&& (pstat->flags & (WLAN_STA_WPS|WLAN_STA_MAYBE_WPS))) {
+			&& (pstat->flags & (WLAN_STA_WPS | WLAN_STA_MAYBE_WPS))) {
 			if (pmlmepriv->wps_beacon_ie) {
 				u8 selected_registrar = 0;
 
@@ -1239,15 +1239,15 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		pstat->flags &= ~WLAN_STA_HT;
 
 
-	if ((pmlmepriv->htpriv.ht_option == false) && (pstat->flags&WLAN_STA_HT)) {
+	if (!(pmlmepriv->htpriv.ht_option) && (pstat->flags & WLAN_STA_HT)) {
 		status = WLAN_STATUS_CHALLENGE_FAIL;
 		goto OnAssocReqFail;
 	}
 
 
 	if ((pstat->flags & WLAN_STA_HT) &&
-		    ((pstat->wpa2_pairwise_cipher&WPA_CIPHER_TKIP) ||
-		      (pstat->wpa_pairwise_cipher&WPA_CIPHER_TKIP))) {
+		    ((pstat->wpa2_pairwise_cipher & WPA_CIPHER_TKIP) ||
+		      (pstat->wpa_pairwise_cipher & WPA_CIPHER_TKIP))) {
 		/* status = WLAN_STATUS_CIPHER_SUITE_REJECTED; */
 		/* goto OnAssocReqFail; */
 	}
@@ -1474,7 +1474,7 @@ unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame)
 			u8 updated = false;
 
 			spin_lock_bh(&pstapriv->asoc_list_lock);
-			if (list_empty(&psta->asoc_list) == false) {
+			if (!list_empty(&psta->asoc_list)) {
 				list_del_init(&psta->asoc_list);
 				pstapriv->asoc_list_cnt--;
 				updated = ap_free_sta(padapter, psta, false, reason);
@@ -1546,7 +1546,7 @@ unsigned int OnDisassoc(struct adapter *padapter, union recv_frame *precv_frame)
 			u8 updated = false;
 
 			spin_lock_bh(&pstapriv->asoc_list_lock);
-			if (list_empty(&psta->asoc_list) == false) {
+			if (!list_empty(&psta->asoc_list)) {
 				list_del_init(&psta->asoc_list);
 				pstapriv->asoc_list_cnt--;
 				updated = ap_free_sta(padapter, psta, false, reason);
@@ -1627,7 +1627,7 @@ unsigned int OnAction_back(struct adapter *padapter, union recv_frame *precv_fra
 		return _SUCCESS;
 
 	if ((pmlmeinfo->state&0x03) != WIFI_FW_AP_STATE)
-		if (!(pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS))
+		if !(pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS)
 			return _SUCCESS;
 
 	addr = GetAddr2Ptr(pframe);
@@ -2632,7 +2632,7 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 		memcpy(pwlanhdr->addr3, get_my_bssid(&pmlmeinfo->network), ETH_ALEN);
 
 		/*  setting auth algo number */
-		val16 = (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared) ? 1 : 0;/*  0:OPEN System, 1:Shared key */
+		val16 = (pmlmeinfo->auth_algo == dot11_auth_algrthm_shared) ? 1 : 0;/*  0:OPEN System, 1:Shared key */
 		if (val16)
 			use_shared_key = 1;
 		le_tmp = cpu_to_le16(val16);
@@ -2929,11 +2929,11 @@ void issue_assocreq(struct adapter *padapter)
 
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:
-			if ((!memcmp(pIE->data, RTW_WPA_OUI, 4)) ||
+			if (!memcmp(pIE->data, RTW_WPA_OUI, 4) ||
 					(!memcmp(pIE->data, WMM_OUI, 4)) ||
 					(!memcmp(pIE->data, WPS_OUI, 4))) {
 				vs_ie_length = pIE->length;
-				if ((!padapter->registrypriv.wifi_spec) && (!memcmp(pIE->data, WPS_OUI, 4))) {
+				if (!padapter->registrypriv.wifi_spec && (!memcmp(pIE->data, WPS_OUI, 4))) {
 					/* Commented by Kurt 20110629
 					 * In some older APs, WPS handshake
 					 * would be fail if we append vendor
@@ -3707,7 +3707,7 @@ unsigned int send_delba(struct adapter *padapter, u8 initiator, u8 *addr)
 	u16 tid;
 
 	if ((pmlmeinfo->state&0x03) != WIFI_FW_AP_STATE)
-		if (!(pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS))
+		if !(pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS)
 			return _SUCCESS;
 
 	psta = rtw_get_stainfo(pstapriv, addr);
@@ -4058,7 +4058,7 @@ void start_create_ibss(struct adapter *padapter)
 	/* update capability */
 	caps = rtw_get_capability((struct wlan_bssid_ex *)pnetwork);
 	update_capinfo(padapter, caps);
-	if (caps&WLAN_CAPABILITY_IBSS) {/* adhoc master */
+	if (caps & WLAN_CAPABILITY_IBSS) {/* adhoc master */
 		val8 = 0xcf;
 		rtw_hal_set_hwreg(padapter, HW_VAR_SEC_CFG, (u8 *)(&val8));
 
@@ -4110,10 +4110,10 @@ void start_clnt_join(struct adapter *padapter)
 	/* update capability */
 	caps = rtw_get_capability((struct wlan_bssid_ex *)pnetwork);
 	update_capinfo(padapter, caps);
-	if (caps&WLAN_CAPABILITY_ESS) {
+	if (caps & WLAN_CAPABILITY_ESS) {
 		set_msr(padapter, WIFI_FW_STATION_STATE);
 
-		val8 = (pmlmeinfo->auth_algo == dot11AuthAlgrthm_8021X) ? 0xcc : 0xcf;
+		val8 = (pmlmeinfo->auth_algo == dot11_auth_algrthm_8021x) ? 0xcc : 0xcf;
 
 		rtw_hal_set_hwreg(padapter, HW_VAR_SEC_CFG, (u8 *)(&val8));
 
@@ -4137,7 +4137,7 @@ void start_clnt_join(struct adapter *padapter)
 			(REAUTH_TO * REAUTH_LIMIT) + (REASSOC_TO*REASSOC_LIMIT) + beacon_timeout);
 
 		pmlmeinfo->state = WIFI_FW_AUTH_NULL | WIFI_FW_STATION_STATE;
-	} else if (caps&WLAN_CAPABILITY_IBSS) { /* adhoc client */
+	} else if (caps & WLAN_CAPABILITY_IBSS) { /* adhoc client */
 		set_msr(padapter, WIFI_FW_ADHOC_STATE);
 
 		val8 = 0xcf;
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index f074ea6e0f38..4669762fb89d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -315,7 +315,7 @@ static u8 PS_RDY_CHECK(struct adapter *padapter)
 	)
 		return false;
 
-	if (padapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X &&
+	if (padapter->securitypriv.dot11_auth_algrthm == dot11_auth_algrthm_8021x &&
 	    !padapter->securitypriv.binstallGrpkey)
 		return false;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index f78194d508df..7fc5516c04e7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -382,7 +382,7 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 
 				/* psecuritypriv->dot118021XGrpKeyid, pmlmeinfo->key_index, rxdata_key_idx); */
 
-				if (psecuritypriv->binstallGrpkey == false) {
+				if (!psecuritypriv->binstallGrpkey) {
 					res = _FAIL;
 					goto exit;
 				}
@@ -406,10 +406,10 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 			}
 
 
-			if (bmic_err == true) {
+			if (bmic_err) {
 				/*  double check key_index for some timing issue , */
 				/*  cannot compare with psecuritypriv->dot118021XGrpKeyid also cause timing issue */
-				if ((is_multicast_ether_addr(prxattrib->ra) == true)  && (prxattrib->key_index != pmlmeinfo->key_index))
+				if ((is_multicast_ether_addr(prxattrib->ra))  && (prxattrib->key_index != pmlmeinfo->key_index))
 					brpt_micerror = false;
 
 				if (prxattrib->bdecrypted && brpt_micerror)
@@ -463,7 +463,7 @@ static union recv_frame *decryptor(struct adapter *padapter, union recv_frame *p
 		}
 	}
 
-	if ((prxattrib->encrypt > 0) && ((prxattrib->bdecrypted == 0) || (psecuritypriv->sw_decrypt == true))) {
+	if ((prxattrib->encrypt > 0) && ((prxattrib->bdecrypted == 0) || (psecuritypriv->sw_decrypt))) {
 		psecuritypriv->hw_decrypted = false;
 
 		switch (prxattrib->encrypt) {
@@ -512,7 +512,7 @@ static union recv_frame *portctrl(struct adapter *adapter, union recv_frame *pre
 
 	pstapriv = &adapter->stapriv;
 
-	auth_alg = adapter->securitypriv.dot11AuthAlgrthm;
+	auth_alg = adapter->securitypriv.dot11_auth_algrthm;
 
 	ptr = precv_frame->u.hdr.rx_data;
 	pfhdr = &precv_frame->u.hdr;
@@ -599,7 +599,7 @@ static void process_pwrbit_data(struct adapter *padapter, union recv_frame *prec
 
 	if (psta) {
 		if (pwrbit) {
-			if (!(psta->state & WIFI_SLEEP_STATE)) {
+			if !(psta->state & WIFI_SLEEP_STATE) {
 				/* psta->state |= WIFI_SLEEP_STATE; */
 				/* pstapriv->sta_dz_bitmap |= BIT(psta->aid); */
 
@@ -632,7 +632,7 @@ static void process_wmmps_data(struct adapter *padapter, union recv_frame *precv
 	if (!psta->qos_option)
 		return;
 
-	if (!(psta->qos_info & 0xf))
+	if !(psta->qos_info & 0xf)
 		return;
 
 	if (psta->state & WIFI_SLEEP_STATE) {
@@ -682,7 +682,7 @@ static void count_rx_stats(struct adapter *padapter, union recv_frame *prframe,
 
 	padapter->mlmepriv.link_detect_info.num_rx_ok_in_period++;
 
-	if ((!is_broadcast_ether_addr(pattrib->dst)) && (!is_multicast_ether_addr(pattrib->dst)))
+	if (!is_broadcast_ether_addr(pattrib->dst) && (!is_multicast_ether_addr(pattrib->dst)))
 		padapter->mlmepriv.link_detect_info.num_rx_unicast_ok_in_period++;
 
 	if (sta)
@@ -713,8 +713,8 @@ static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *
 	u8 *sta_addr = NULL;
 	signed int bmcast = is_multicast_ether_addr(pattrib->dst);
 
-	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)) {
+	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) ||
+		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))) {
 
 		/*  filter packets that SA is myself or multicast or broadcast */
 		if (!memcmp(myhwaddr, pattrib->src, ETH_ALEN)) {
@@ -736,7 +736,7 @@ static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *
 
 		sta_addr = pattrib->src;
 
-	} else if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true) {
+	} else if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
 		/*  For Station mode, sa and bssid should always be BSSID, and DA is my mac-address */
 		if (memcmp(pattrib->bssid, pattrib->src, ETH_ALEN)) {
 			ret = _FAIL;
@@ -744,7 +744,7 @@ static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *
 		}
 
 		sta_addr = pattrib->bssid;
-	} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) {
+	} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 		if (bmcast) {
 			/*  For AP mode, if DA == MCAST, then BSSID should be also MCAST */
 			if (!is_multicast_ether_addr(pattrib->bssid)) {
@@ -761,7 +761,7 @@ static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *
 			sta_addr = pattrib->src;
 		}
 
-	} else if (check_fwstate(pmlmepriv, WIFI_MP_STATE) == true) {
+	} else if (check_fwstate(pmlmepriv, WIFI_MP_STATE)) {
 		memcpy(pattrib->dst, GetAddr1Ptr(ptr), ETH_ALEN);
 		memcpy(pattrib->src, GetAddr2Ptr(ptr), ETH_ALEN);
 		memcpy(pattrib->bssid, GetAddr3Ptr(ptr), ETH_ALEN);
@@ -800,9 +800,9 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 	u8 *myhwaddr = myid(&adapter->eeprompriv);
 	signed int bmcast = is_multicast_ether_addr(pattrib->dst);
 
-	if ((check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true) &&
-	    (check_fwstate(pmlmepriv, _FW_LINKED) == true ||
-	     check_fwstate(pmlmepriv, _FW_UNDER_LINKING) == true)
+	if ((check_fwstate(pmlmepriv, WIFI_STATION_STATE)) &&
+	    (check_fwstate(pmlmepriv, _FW_LINKED) ||
+	     check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
 		) {
 
 		/*  filter packets that SA is myself or multicast or broadcast */
@@ -847,8 +847,8 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 			goto exit;
 		}
 
-	} else if ((check_fwstate(pmlmepriv, WIFI_MP_STATE) == true) &&
-		     (check_fwstate(pmlmepriv, _FW_LINKED) == true)) {
+	} else if ((check_fwstate(pmlmepriv, WIFI_MP_STATE)) &&
+		     (check_fwstate(pmlmepriv, _FW_LINKED))) {
 		memcpy(pattrib->dst, GetAddr1Ptr(ptr), ETH_ALEN);
 		memcpy(pattrib->src, GetAddr2Ptr(ptr), ETH_ALEN);
 		memcpy(pattrib->bssid, GetAddr3Ptr(ptr), ETH_ALEN);
@@ -866,7 +866,7 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 		}
 
 
-	} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) {
+	} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 		/* Special case */
 		ret = RTW_RX_HANDLED;
 		goto exit;
@@ -903,7 +903,7 @@ static signed int sta2ap_data_frame(struct adapter *adapter, union recv_frame *p
 	unsigned char *mybssid  = get_bssid(pmlmepriv);
 	signed int ret = _SUCCESS;
 
-	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) {
+	if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 		/* For AP mode, RA =BSSID, TX =STA(SRC_ADDR), A3 =DST_ADDR */
 		if (memcmp(pattrib->bssid, mybssid, ETH_ALEN)) {
 			ret = _FAIL;
@@ -1413,7 +1413,7 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 
 	/* only support station mode */
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) && check_fwstate(pmlmepriv, _FW_LINKED) &&
-	    adapter->securitypriv.binstallBIPkey == true) {
+	    adapter->securitypriv.binstallBIPkey) {
 		/* unicast management frame decrypt */
 		if (pattrib->privacy && !(is_multicast_ether_addr(GetAddr1Ptr(ptr))) &&
 			(subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC || subtype == WIFI_ACTION)) {
@@ -1579,8 +1579,8 @@ static signed int wlanhdr_to_ethhdr(union recv_frame *precvframe)
 	psnap_type = ptr + pattrib->hdrlen + pattrib->iv_len + SNAP_SIZE;
 	/* convert hdr + possible LLC headers into Ethernet header */
 	/* eth_type = (psnap_type[0] << 8) | psnap_type[1]; */
-	if ((!memcmp(psnap, rfc1042_header, SNAP_SIZE) &&
-		(memcmp(psnap_type, SNAP_ETH_TYPE_IPX, 2)) &&
+	if (!memcmp(psnap, rfc1042_header, SNAP_SIZE) &&
+		(memcmp(psnap_type, SNAP_ETH_TYPE_IPX, 2) &&
 		(memcmp(psnap_type, SNAP_ETH_TYPE_APPLETALK_AARP, 2))) ||
 		/* eth_type != ETH_P_AARP && eth_type != ETH_P_IPX) || */
 		 !memcmp(psnap, bridge_tunnel_header, SNAP_SIZE)) {
@@ -1597,7 +1597,7 @@ static signed int wlanhdr_to_ethhdr(union recv_frame *precvframe)
 	eth_type = ntohs(be_tmp); /* pattrib->ether_type */
 	pattrib->eth_type = eth_type;
 
-	if ((check_fwstate(pmlmepriv, WIFI_MP_STATE) == true)) {
+	if ((check_fwstate(pmlmepriv, WIFI_MP_STATE))) {
 		ptr += rmv_len;
 		*ptr = 0x87;
 		*(ptr + 1) = 0x12;
@@ -1672,7 +1672,7 @@ static void rtw_recv_indicate_pkt(struct adapter *padapter, struct sk_buff *pkt,
 
 	/* Indicate the packets to upper layer */
 	if (pkt) {
-		if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) {
+		if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 			struct sk_buff *pskb2 = NULL;
 			struct sta_info *psta = NULL;
 			struct sta_priv *pstapriv = &padapter->stapriv;
@@ -1838,7 +1838,7 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
 		if (SN_LESS(pnextattrib->seq_num, pattrib->seq_num))
 			plist = get_next(plist);
 		else if (SN_EQUAL(pnextattrib->seq_num, pattrib->seq_num))
-			/* Duplicate entry is found!! Do not insert current entry. */
+			/* Duplicate entry is found! Do not insert current entry. */
 			/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
 			return false;
 		else
@@ -1915,7 +1915,7 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 	plist = get_next(phead);
 
 	/*  Handling some condition for forced indicate case. */
-	if (bforced == true) {
+	if (bforced) {
 		if (list_empty(phead)) {
 			/*  spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
 			/* spin_unlock(&ppending_recvframe_queue->lock); */
@@ -1950,8 +1950,8 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 
 			/* indicate this recv_frame */
 			if (!pattrib->amsdu) {
-				if ((padapter->bDriverStopped == false) &&
-				    (padapter->bSurpriseRemoved == false))
+				if (!(padapter->bDriverStopped) &&
+				    (padapter->bSurpriseRemoved))
 					rtw_recv_indicatepkt(padapter, prframe);/* indicate this recv_frame */
 
 			} else if (pattrib->amsdu == 1) {
@@ -1991,8 +1991,8 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 		wlanhdr_to_ethhdr(prframe);
 
 		if (pattrib->qos != 1) {
-			if ((padapter->bDriverStopped == false) &&
-			    (padapter->bSurpriseRemoved == false)) {
+			if (!(padapter->bDriverStopped) &&
+			    (padapter->bSurpriseRemoved)) {
 				rtw_recv_indicatepkt(padapter, prframe);
 				return _SUCCESS;
 
@@ -2002,7 +2002,7 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 
 		}
 
-		if (preorder_ctrl->enable == false) {
+		if (!preorder_ctrl->enable) {
 			/* indicate this recv_frame */
 			preorder_ctrl->indicate_seq = pattrib->seq_num;
 
@@ -2013,7 +2013,7 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 			return _SUCCESS;
 		}
 	} else if (pattrib->amsdu == 1) { /* temp filter -> means didn't support A-MSDUs in a A-MPDU */
-		if (preorder_ctrl->enable == false) {
+		if (!preorder_ctrl->enable) {
 			preorder_ctrl->indicate_seq = pattrib->seq_num;
 
 			retval = amsdu_to_msdu(padapter, prframe);
@@ -2049,7 +2049,7 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 	/*  */
 
 	/* recv_indicatepkts_in_order(padapter, preorder_ctrl, true); */
-	if (recv_indicatepkts_in_order(padapter, preorder_ctrl, false) == true) {
+	if (recv_indicatepkts_in_order(padapter, preorder_ctrl, false)) {
 		_set_timer(&preorder_ctrl->reordering_ctrl_timer, REORDER_WAIT_TIME);
 		spin_unlock_bh(&ppending_recvframe_queue->lock);
 	} else {
@@ -2079,7 +2079,7 @@ void rtw_reordering_ctrl_timeout_handler(struct timer_list *t)
 
 	spin_lock_bh(&ppending_recvframe_queue->lock);
 
-	if (recv_indicatepkts_in_order(padapter, preorder_ctrl, true) == true)
+	if (recv_indicatepkts_in_order(padapter, preorder_ctrl, true))
 		_set_timer(&preorder_ctrl->reordering_ctrl_timer, REORDER_WAIT_TIME);
 
 	spin_unlock_bh(&ppending_recvframe_queue->lock);
@@ -2094,13 +2094,13 @@ static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct ht_priv *phtpriv = &pmlmepriv->htpriv;
 
-	if (phtpriv->ht_option == true) { /* B/G/N Mode */
+	if (phtpriv->ht_option) { /* B/G/N Mode */
 		/* prframe->u.hdr.preorder_ctrl = &precvpriv->recvreorder_ctrl[pattrib->priority]; */
 
 		if (recv_indicatepkt_reorder(padapter, prframe) != _SUCCESS) { /*  including perform A-MPDU Rx Ordering Buffer Control */
 
-			if ((padapter->bDriverStopped == false) &&
-			    (padapter->bSurpriseRemoved == false)) {
+			if (!(padapter->bDriverStopped) &&
+			    (padapter->bSurpriseRemoved)) {
 				retval = _FAIL;
 				return retval;
 			}
@@ -2110,7 +2110,7 @@ static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame
 		if (retval != _SUCCESS)
 			return retval;
 
-		if ((padapter->bDriverStopped == false) && (padapter->bSurpriseRemoved == false)) {
+		if (!(padapter->bDriverStopped) && (padapter->bSurpriseRemoved)) {
 			/* indicate this recv_frame */
 			rtw_recv_indicatepkt(padapter, prframe);
 		} else {
@@ -2199,7 +2199,7 @@ static int recv_func(struct adapter *padapter, union recv_frame *rframe)
 		/* check if need to enqueue into uc_swdec_pending_queue*/
 		if (check_fwstate(mlmepriv, WIFI_STATION_STATE) &&
 			!is_multicast_ether_addr(prxattrib->ra) && prxattrib->encrypt > 0 &&
-			(prxattrib->bdecrypted == 0 || psecuritypriv->sw_decrypt == true) &&
+			(prxattrib->bdecrypted == 0 || psecuritypriv->sw_decrypt) &&
 			psecuritypriv->ndisauthtype == Ndis802_11AuthModeWPAPSK &&
 			!psecuritypriv->busetkipkey) {
 			rtw_enqueue_recvframe(rframe, &padapter->recvpriv.uc_swdec_pending_queue);
@@ -2286,8 +2286,8 @@ static void rtw_signal_stat_timer_hdl(struct timer_list *t)
 			}
 		}
 
-		if (check_fwstate(&adapter->mlmepriv, _FW_UNDER_SURVEY) == true ||
-		    check_fwstate(&adapter->mlmepriv, _FW_LINKED) == false
+		if (check_fwstate(&adapter->mlmepriv, _FW_UNDER_SURVEY) ||
+		    check_fwstate(&adapter->mlmepriv, _FW_LINKED)
 		) {
 			goto set_timer;
 		}
diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 4edcbd95aab3..a00504ff2910 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1456,7 +1456,7 @@ int omac1_aes_128(u8 *key, u8 *data, size_t data_len, u8 *mac)
 /* Restore HW wep key setting according to key_mask */
 void rtw_sec_restore_wep_key(struct adapter *adapter)
 {
-	struct security_priv *securitypriv = &(adapter->securitypriv);
+	struct security_priv *securitypriv = &adapter->securitypriv;
 	signed int keyid;
 
 	if ((securitypriv->dot11PrivacyAlgrthm == _WEP40_) || (securitypriv->dot11PrivacyAlgrthm == _WEP104_)) {
@@ -1473,7 +1473,7 @@ void rtw_sec_restore_wep_key(struct adapter *adapter)
 
 u8 rtw_handle_tkip_countermeasure(struct adapter *adapter, const char *caller)
 {
-	struct security_priv *securitypriv = &(adapter->securitypriv);
+	struct security_priv *securitypriv = &adapter->securitypriv;
 	u8 status = _SUCCESS;
 
 	if (securitypriv->btkip_countermeasure) {
diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index 07a6db1d2317..41b1bc83a4c8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -377,7 +377,7 @@ u32 rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
 		spin_unlock_bh(&ppending_recvframe_queue->lock);
 	}
 
-	if (!(psta->state & WIFI_AP_STATE))
+	if !(psta->state & WIFI_AP_STATE)
 		rtw_hal_set_odm_var(padapter, HAL_ODM_STA_INFO, psta, false);
 
 	/* release mac id for non-bc/mc station, */
@@ -477,7 +477,7 @@ struct sta_info *rtw_get_stainfo(struct sta_priv *pstapriv, u8 *hwaddr)
 	list_for_each(plist, phead) {
 		psta = list_entry(plist, struct sta_info, hash_list);
 
-		if ((!memcmp(psta->hwaddr, addr, ETH_ALEN)))
+		if (!memcmp(psta->hwaddr, addr, ETH_ALEN))
 		 /*  if found the matched address */
 			break;
 
@@ -531,7 +531,7 @@ u8 rtw_access_ctrl(struct adapter *padapter, u8 *mac_addr)
 		paclnode = list_entry(plist, struct rtw_wlan_acl_node, list);
 
 		if (!memcmp(paclnode->addr, mac_addr, ETH_ALEN))
-			if (paclnode->valid == true) {
+			if (paclnode->valid) {
 				match = true;
 				break;
 			}
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 6a7c09db4cd9..c1c916f7fcd1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -147,7 +147,7 @@ unsigned int ratetbl2rateset(struct adapter *padapter, unsigned char *rateset)
 		default:
 			rate = ratetbl_val_2wifirate(rate);
 
-			if (is_basicrate(padapter, rate) == true)
+			if (is_basicrate(padapter, rate))
 				rate |= IEEE80211_BASIC_RATE_MASK;
 
 			rateset[len] = rate;
@@ -236,7 +236,7 @@ void Restore_DM_Func_Flag(struct adapter *padapter)
 
 void Switch_DM_Func(struct adapter *padapter, u32 mode, u8 enable)
 {
-	if (enable == true)
+	if (enable)
 		rtw_hal_set_hwreg(padapter, HW_VAR_DM_FUNC_SET, (u8 *)(&mode));
 	else
 		rtw_hal_set_hwreg(padapter, HW_VAR_DM_FUNC_CLR, (u8 *)(&mode));
@@ -587,7 +587,7 @@ s16 rtw_camid_alloc(struct adapter *adapter, struct sta_info *sta, u8 kid)
 		u8 *addr = sta ? sta->hwaddr : NULL;
 
 		if (!sta) {
-			if (!(mlmeinfo->state & WIFI_FW_ASSOC_SUCCESS)) {
+			if !(mlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) {
 				/* bypass STA mode group key setting before connected(ex:WEP) because bssid is not ready */
 				goto bitmap_handle;
 			}
@@ -847,7 +847,7 @@ static void bwmode_update_check(struct adapter *padapter, struct ndis_80211_var_
 	if (!pIE)
 		return;
 
-	if (phtpriv->ht_option == false)
+	if (!phtpriv->ht_option)
 		return;
 
 	if (pIE->length > sizeof(struct HT_info_element))
@@ -931,7 +931,7 @@ void HT_caps_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
 	if (!pIE)
 		return;
 
-	if (phtpriv->ht_option == false)
+	if (!phtpriv->ht_option)
 		return;
 
 	pmlmeinfo->HT_caps_enable = 1;
@@ -994,7 +994,7 @@ void HT_info_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
 	if (!pIE)
 		return;
 
-	if (phtpriv->ht_option == false)
+	if (!phtpriv->ht_option)
 		return;
 
 	if (pIE->length > sizeof(struct HT_info_element))
@@ -1122,7 +1122,7 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	struct mlme_priv *pmlmepriv = &Adapter->mlmepriv;
 	int ssid_len;
 
-	if (is_client_associated_to_ap(Adapter) == false)
+	if (!is_client_associated_to_ap(Adapter))
 		return true;
 
 	len = packet_len - sizeof(struct ieee80211_hdr_3addr);
@@ -1332,7 +1332,7 @@ unsigned int is_ap_in_tkip(struct adapter *padapter)
 
 			switch (pIE->element_id) {
 			case WLAN_EID_VENDOR_SPECIFIC:
-				if ((!memcmp(pIE->data, RTW_WPA_OUI, 4)) && (!memcmp((pIE->data + 12), WPA_TKIP_CIPHER, 4)))
+				if (!memcmp(pIE->data, RTW_WPA_OUI, 4) && (!memcmp((pIE->data + 12), WPA_TKIP_CIPHER, 4)))
 					return true;
 
 				break;
@@ -1361,7 +1361,7 @@ int support_short_GI(struct adapter *padapter, struct HT_caps_element *pHT_caps,
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 
-	if (!(pmlmeinfo->HT_enable))
+	if !(pmlmeinfo->HT_enable)
 		return _FAIL;
 
 	bit_offset = (bwmode & CHANNEL_WIDTH_40) ? 6 : 5;
@@ -1435,9 +1435,9 @@ unsigned char check_assoc_AP(u8 *pframe, uint len)
 
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:
-			if ((!memcmp(pIE->data, ARTHEROS_OUI1, 3)) || (!memcmp(pIE->data, ARTHEROS_OUI2, 3)))
+			if (!memcmp(pIE->data, ARTHEROS_OUI1, 3) || (!memcmp(pIE->data, ARTHEROS_OUI2, 3)))
 				return HT_IOT_PEER_ATHEROS;
-			else if ((!memcmp(pIE->data, BROADCOM_OUI1, 3)) ||
+			else if (!memcmp(pIE->data, BROADCOM_OUI1, 3) ||
 				 (!memcmp(pIE->data, BROADCOM_OUI2, 3)) ||
 				 (!memcmp(pIE->data, BROADCOM_OUI3, 3)))
 				return HT_IOT_PEER_BROADCOM;
@@ -1527,7 +1527,7 @@ void update_capinfo(struct adapter *Adapter, u16 updateCap)
 		if (pmlmeext->cur_wireless_mode & (WIRELESS_11_24N)) {
 			pmlmeinfo->slotTime = SHORT_SLOT_TIME;
 		} else if (pmlmeext->cur_wireless_mode & (WIRELESS_11G)) {
-			if ((updateCap & cShortSlotTime) /* && (!(pMgntInfo->pHTInfo->RT2RT_HT_Mode & RT_HT_CAP_USE_LONG_PREAMBLE)) */)
+			if ((updateCap & cShortSlotTime) /* && !(pMgntInfo->pHTInfo->RT2RT_HT_Mode & RT_HT_CAP_USE_LONG_PREAMBLE) */)
 				/*  Short Slot Time */
 				pmlmeinfo->slotTime = SHORT_SLOT_TIME;
 			else
@@ -1689,7 +1689,7 @@ void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
 		pmlmeext->bcn_delay_cnt[delay_ms]++;
 		/* pmlmeext->bcn_delay_ratio[delay_ms] = (pmlmeext->bcn_delay_cnt[delay_ms] * 100) /pmlmeext->bcn_cnt; */
 	/* dump for  adaptive_early_32k */
-	if (pmlmeext->bcn_cnt > 100 && (pmlmeext->adaptive_tsf_done == true)) {
+	if (pmlmeext->bcn_cnt > 100 && (pmlmeext->adaptive_tsf_done)) {
 		u8 ratio_20_delay, ratio_80_delay;
 		u8 DrvBcnEarly, DrvBcnTimeOut;
 
@@ -1737,7 +1737,7 @@ void rtw_alloc_macid(struct adapter *padapter, struct sta_info *psta)
 
 	spin_lock_bh(&pdvobj->lock);
 	for (i = 0; i < NUM_STA; i++) {
-		if (pdvobj->macid[i] == false) {
+		if (!pdvobj->macid[i]) {
 			pdvobj->macid[i]  = true;
 			break;
 		}
@@ -1762,7 +1762,7 @@ void rtw_release_macid(struct adapter *padapter, struct sta_info *psta)
 
 	spin_lock_bh(&pdvobj->lock);
 	if (psta->mac_id < NUM_STA && psta->mac_id != 1) {
-		if (pdvobj->macid[psta->mac_id] == true) {
+		if (pdvobj->macid[psta->mac_id]) {
 			pdvobj->macid[psta->mac_id] = false;
 			psta->mac_id = NUM_STA;
 		}
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 7bce0343d59f..03f607c4074f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -386,7 +386,7 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 	} else {
 		while (true) {
 			/* IOT action */
-			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) && (pattrib->ampdu_en == true) &&
+			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) && (pattrib->ampdu_en) &&
 			    (padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)) {
 				pattrib->vcs_mode = CTS_TO_SELF;
 				break;
@@ -422,7 +422,7 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 			/* to do list: check MIMO power save condition. */
 
 			/* check AMPDU aggregation for TXOP */
-			if (pattrib->ampdu_en == true) {
+			if (pattrib->ampdu_en) {
 				pattrib->vcs_mode = RTS_CTS;
 				break;
 			}
@@ -484,7 +484,7 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 	memset(pattrib->dot11tkiptxmickey.skey,  0, 16);
 	pattrib->mac_id = psta->mac_id;
 
-	if (psta->ieee8021x_blocked == true) {
+	if (psta->ieee8021x_blocked) {
 		pattrib->encrypt = 0;
 
 		if ((pattrib->ether_type != 0x888e) && (check_fwstate(pmlmepriv, WIFI_MP_STATE) == false)) {
@@ -494,13 +494,13 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 	} else {
 		GET_ENCRY_ALGO(psecuritypriv, psta, pattrib->encrypt, bmcast);
 
-		switch (psecuritypriv->dot11AuthAlgrthm) {
-		case dot11AuthAlgrthm_Open:
-		case dot11AuthAlgrthm_Shared:
-		case dot11AuthAlgrthm_Auto:
+		switch (psecuritypriv->dot11_auth_algrthm) {
+		case dot11_auth_algrthm_open:
+		case dot11_auth_algrthm_shared:
+		case dot11_auth_algrthm_auto:
 			pattrib->key_idx = (u8)psecuritypriv->dot11PrivacyKeyIndex;
 			break;
-		case dot11AuthAlgrthm_8021X:
+		case dot11_auth_algrthm_8021x:
 			if (bmcast)
 				pattrib->key_idx = (u8)psecuritypriv->dot118021XGrpKeyid;
 			else
@@ -652,8 +652,8 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	memcpy(pattrib->dst, &etherhdr.h_dest, ETH_ALEN);
 	memcpy(pattrib->src, &etherhdr.h_source, ETH_ALEN);
 
-	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)) {
+	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) ||
+		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))) {
 		memcpy(pattrib->ra, pattrib->dst, ETH_ALEN);
 		memcpy(pattrib->ta, pattrib->src, ETH_ALEN);
 	} else if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
@@ -719,7 +719,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 		if (!psta)	{ /*  if we cannot get psta => drop the pkt */
 			res = _FAIL;
 			goto exit;
-		} else if ((check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) && (!(psta->state & _FW_LINKED))) {
+		} else if ((check_fwstate(pmlmepriv, WIFI_AP_STATE)) && !(psta->state & _FW_LINKED)) {
 			res = _FAIL;
 			goto exit;
 		}
@@ -731,7 +731,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 		goto exit;
 	}
 
-	if (!(psta->state & _FW_LINKED))
+	if !(psta->state & _FW_LINKED)
 		return _FAIL;
 
 	spin_lock_bh(&psta->lock);
@@ -901,7 +901,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 	SetFrameSubType(fctrl, pattrib->subtype);
 
 	if (pattrib->subtype & WIFI_DATA_TYPE) {
-		if (check_fwstate(pmlmepriv,  WIFI_STATION_STATE) == true) {
+		if (check_fwstate(pmlmepriv,  WIFI_STATION_STATE)) {
 			/* to_ds = 1, fr_ds = 0; */
 
 			{
@@ -915,7 +915,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 			if (pqospriv->qos_option)
 				qos_option = true;
-		} else if (check_fwstate(pmlmepriv,  WIFI_AP_STATE) == true) {
+		} else if (check_fwstate(pmlmepriv,  WIFI_AP_STATE)) {
 			/* to_ds = 0, fr_ds = 1; */
 			SetFrDs(fctrl);
 			memcpy(pwlanhdr->addr1, pattrib->dst, ETH_ALEN);
@@ -924,8 +924,8 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 			if (pattrib->qos_en)
 				qos_option = true;
-		} else if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)) {
+		} else if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) ||
+		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))) {
 			memcpy(pwlanhdr->addr1, pattrib->dst, ETH_ALEN);
 			memcpy(pwlanhdr->addr2, pattrib->src, ETH_ALEN);
 			memcpy(pwlanhdr->addr3, get_bssid(pmlmepriv), ETH_ALEN);
@@ -967,7 +967,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 			if (!psta)
 				return _FAIL;
 
-			if (!(psta->state & _FW_LINKED))
+			if !(psta->state & _FW_LINKED)
 				return _FAIL;
 
 			if (psta) {
@@ -983,7 +983,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 						pattrib->ampdu_en = true;
 
 				/* re-check if enable ampdu by BA_starting_seqctrl */
-				if (pattrib->ampdu_en == true) {
+				if (pattrib->ampdu_en) {
 					u16 tx_seq;
 
 					tx_seq = psta->BA_starting_seqctrl[pattrib->priority & 0x0f];
@@ -1140,7 +1140,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 
 		frg_inx++;
 
-		if (bmcst || (rtw_endofpktfile(&pktfile) == true)) {
+		if (bmcst || (rtw_endofpktfile(&pktfile))) {
 			pattrib->nr_frags = frg_inx;
 
 			pattrib->last_txcmdsz = pattrib->hdrlen + pattrib->iv_len +
@@ -1166,7 +1166,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 
 	xmitframe_swencrypt(padapter, pxmitframe);
 
-	if (bmcst == false)
+	if (!bmcst)
 		update_attrib_vcs_info(padapter, pxmitframe);
 	else
 		pattrib->vcs_mode = NONE_VCS;
@@ -1846,7 +1846,7 @@ s32 rtw_xmit_classifier(struct adapter *padapter, struct xmit_frame *pxmitframe)
 		goto exit;
 	}
 
-	if (!(psta->state & _FW_LINKED))
+	if !(psta->state & _FW_LINKED)
 		return _FAIL;
 
 	ptxservq = rtw_get_sta_pending(padapter, psta, pattrib->priority, (u8 *)(&ac_index));
@@ -2003,7 +2003,7 @@ s32 rtw_xmit(struct adapter *padapter, struct sk_buff **ppkt)
 	do_queue_select(padapter, &pxmitframe->attrib);
 
 	spin_lock_bh(&pxmitpriv->lock);
-	if (xmitframe_enqueue_for_sleeping_sta(padapter, pxmitframe) == true) {
+	if (xmitframe_enqueue_for_sleeping_sta(padapter, pxmitframe)) {
 		spin_unlock_bh(&pxmitpriv->lock);
 		return 1;
 	}
@@ -2063,7 +2063,7 @@ signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct x
 	if (!psta)
 		return false;
 
-	if (!(psta->state & _FW_LINKED))
+	if !(psta->state & _FW_LINKED)
 		return false;
 
 	if (pattrib->triggered == 1) {
diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index b3e34f97cfc6..8e609e8e493b 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -2517,7 +2517,7 @@ void EXhalbtc8723b1ant_BtInfoNotify(
 		pCoexSta->bC2hBtInquiryPage = false;
 
 	/*  set link exist status */
-	if (!(btInfo & BT_INFO_8723B_1ANT_B_CONNECTION)) {
+	if !(btInfo & BT_INFO_8723B_1ANT_B_CONNECTION) {
 		pCoexSta->bBtLinkExist = false;
 		pCoexSta->bPanExist = false;
 		pCoexSta->bA2dpExist = false;
@@ -2550,7 +2550,7 @@ void EXhalbtc8723b1ant_BtInfoNotify(
 
 	btInfo = btInfo & 0x1f;  /* mask profile bit for connect-ilde identification (for CSR case: A2DP idle --> 0x41) */
 
-	if (!(btInfo & BT_INFO_8723B_1ANT_B_CONNECTION)) {
+	if !(btInfo & BT_INFO_8723B_1ANT_B_CONNECTION) {
 		pCoexDm->btStatus = BT_8723B_1ANT_BT_STATUS_NON_CONNECTED_IDLE;
 	} else if (btInfo == BT_INFO_8723B_1ANT_B_CONNECTION)	{
 		/*  connection exists but no busy */
diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
index d32dbf94858f..c0b3f77a2e9e 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c
@@ -2529,7 +2529,7 @@ void EXhalbtc8723b2ant_BtInfoNotify(
 		pCoexSta->bC2hBtInquiryPage = false;
 
 	/*  set link exist status */
-	if (!(btInfo & BT_INFO_8723B_2ANT_B_CONNECTION)) {
+	if !(btInfo & BT_INFO_8723B_2ANT_B_CONNECTION) {
 		pCoexSta->bBtLinkExist = false;
 		pCoexSta->bPanExist = false;
 		pCoexSta->bA2dpExist = false;
@@ -2557,7 +2557,7 @@ void EXhalbtc8723b2ant_BtInfoNotify(
 
 	halbtc8723b2ant_UpdateBtLinkInfo(pBtCoexist);
 
-	if (!(btInfo & BT_INFO_8723B_2ANT_B_CONNECTION)) {
+	if !(btInfo & BT_INFO_8723B_2ANT_B_CONNECTION) {
 		pCoexDm->btStatus = BT_8723B_2ANT_BT_STATUS_NON_CONNECTED_IDLE;
 	} else if (btInfo == BT_INFO_8723B_2ANT_B_CONNECTION)	{ /*  connection exists but no busy */
 		pCoexDm->btStatus = BT_8723B_2ANT_BT_STATUS_CONNECTED_IDLE;
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 8f6849f2277e..a9391114a49b 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -1259,22 +1259,22 @@ static bool phy_SimularityCompare_8723B(
 		return bResult;
 	} else {
 
-		if (!(SimularityBitMap & 0x03)) { /* path A TX OK */
+		if !(SimularityBitMap & 0x03) { /* path A TX OK */
 			for (i = 0; i < 2; i++)
 				result[3][i] = result[c1][i];
 		}
 
-		if (!(SimularityBitMap & 0x0c)) { /* path A RX OK */
+		if !(SimularityBitMap & 0x0c) { /* path A RX OK */
 			for (i = 2; i < 4; i++)
 				result[3][i] = result[c1][i];
 		}
 
-		if (!(SimularityBitMap & 0x30)) { /* path B TX OK */
+		if !(SimularityBitMap & 0x30) { /* path B TX OK */
 			for (i = 4; i < 6; i++)
 				result[3][i] = result[c1][i];
 		}
 
-		if (!(SimularityBitMap & 0xc0)) { /* path B RX OK */
+		if !(SimularityBitMap & 0xc0) { /* path B RX OK */
 			for (i = 6; i < 8; i++)
 				result[3][i] = result[c1][i];
 		}
@@ -1582,7 +1582,7 @@ void PHY_IQCalibrate_8723B(
 	if (!ODM_CheckPowerStatus(padapter))
 		return;
 
-	if (!(pDM_Odm->SupportAbility & ODM_RF_CALIBRATION))
+	if !(pDM_Odm->SupportAbility & ODM_RF_CALIBRATION)
 		return;
 
 	/*  20120213<Kordan> Turn on when continuous Tx to pass lab testing. (required by Edlu) */
@@ -1774,7 +1774,7 @@ void PHY_LCCalibrate_8723B(struct dm_odm_t *pDM_Odm)
 	bool		bSingleTone = false, bCarrierSuppression = false;
 	u32 		timeout = 2000, timecount = 0;
 
-	if (!(pDM_Odm->SupportAbility & ODM_RF_CALIBRATION))
+	if !(pDM_Odm->SupportAbility & ODM_RF_CALIBRATION)
 		return;
 
 	/*  20120213<Kordan> Turn on when continuous Tx to pass lab testing. (required by Edlu) */
diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 2a2dd60be8bb..3974fa0e38b0 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -164,8 +164,8 @@ static u8 halbtcoutsrc_IsWifiBusy(struct adapter *padapter)
 
 	pmlmepriv = &padapter->mlmepriv;
 
-	if (check_fwstate(pmlmepriv, WIFI_ASOC_STATE) == true) {
-		if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true)
+	if (check_fwstate(pmlmepriv, WIFI_ASOC_STATE)) {
+		if (check_fwstate(pmlmepriv, WIFI_AP_STATE))
 			return true;
 		if (pmlmepriv->link_detect_info.busy_traffic)
 			return true;
@@ -185,8 +185,8 @@ static u32 _halbtcoutsrc_GetWifiLinkStatus(struct adapter *padapter)
 	bp2p = false;
 	portConnectedStatus = 0;
 
-	if (check_fwstate(pmlmepriv, WIFI_ASOC_STATE) == true) {
-		if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) {
+	if (check_fwstate(pmlmepriv, WIFI_ASOC_STATE)) {
+		if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 			if (bp2p)
 				portConnectedStatus |= WIFI_P2P_GO_CONNECTED;
 			else
@@ -528,7 +528,7 @@ static u8 halbtcoutsrc_Set(void *pBtcContext, u8 setType, void *pInBuf)
 	case BTC_SET_ACT_UPDATE_RAMASK:
 		pBtCoexist->btInfo.raMask = *pU4Tmp;
 
-		if (check_fwstate(&padapter->mlmepriv, WIFI_ASOC_STATE) == true) {
+		if (check_fwstate(&padapter->mlmepriv, WIFI_ASOC_STATE)) {
 			struct sta_info *psta;
 			struct wlan_bssid_ex *cur_network;
 
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 728a2171fbcb..9c7ab5149aef 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -136,7 +136,7 @@ bool HAL_IsLegalChannel(struct adapter *adapter, u32 Channel)
 	bool bLegalChannel = true;
 
 	if ((Channel <= 14) && (Channel >= 1)) {
-		if (is_supported_24g(adapter->registrypriv.wireless_mode) == false)
+		if (!is_supported_24g(adapter->registrypriv.wireless_mode))
 			bLegalChannel = false;
 	} else {
 		bLegalChannel = false;
@@ -593,7 +593,7 @@ void SetHwReg(struct adapter *adapter, u8 variable, u8 *val)
 
 		if (val) { /* Enable default key related setting */
 			reg_scr |= SCR_TXBCUSEDK;
-			if (sec->dot11AuthAlgrthm != dot11AuthAlgrthm_8021X)
+			if (sec->dot11_auth_algrthm != dot11_auth_algrthm_8021x)
 				reg_scr |= (SCR_RxUseDK|SCR_TxUseDK);
 		} else /* Disable default key related setting */
 			reg_scr &= ~(SCR_RXBCUSEDK|SCR_TXBCUSEDK|SCR_RxUseDK|SCR_TxUseDK);
@@ -605,7 +605,7 @@ void SetHwReg(struct adapter *adapter, u8 variable, u8 *val)
 		odm->SupportAbility = *((u32 *)val);
 		break;
 	case HW_VAR_DM_FUNC_OP:
-		if (*((u8 *)val) == true) {
+		if (*((u8 *)val)) {
 			/* save dm flag */
 			odm->BK_SupportAbility = odm->SupportAbility;
 		} else {
diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 27c0c0198714..9cae6462c705 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -160,7 +160,7 @@ s32	rtw_hal_mgnt_xmit(struct adapter *padapter, struct xmit_frame *pmgntframe)
 	/* pwlanhdr = (struct rtw_ieee80211_hdr *)pframe; */
 	/* memcpy(pmgntframe->attrib.ra, pwlanhdr->addr1, ETH_ALEN); */
 
-	if (padapter->securitypriv.binstallBIPkey == true) {
+	if (padapter->securitypriv.binstallBIPkey) {
 		if (is_multicast_ether_addr(pmgntframe->attrib.ra)) {
 			pmgntframe->attrib.encrypt = _BIP_;
 			/* pmgntframe->attrib.bswenc = true; */
@@ -206,7 +206,7 @@ void rtw_hal_update_ra_mask(struct sta_info *psta, u8 rssi_level)
 
 	pmlmepriv = &(padapter->mlmepriv);
 
-	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true)
+	if (check_fwstate(pmlmepriv, WIFI_AP_STATE))
 		add_ratid(padapter, psta, rssi_level);
 	else {
 		UpdateHalRAMask8723B(padapter, psta->mac_id, rssi_level);
diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index 3dffa7620768..3528a044428b 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -298,7 +298,7 @@ static void odm_RefreshRateAdaptiveMaskCE(struct dm_odm_t *pDM_Odm)
 static void odm_RefreshRateAdaptiveMask(struct dm_odm_t *pDM_Odm)
 {
 
-	if (!(pDM_Odm->SupportAbility & ODM_BB_RA_MASK))
+	if !(pDM_Odm->SupportAbility & ODM_BB_RA_MASK)
 		return;
 
 	odm_RefreshRateAdaptiveMaskCE(pDM_Odm);
@@ -405,7 +405,7 @@ static void odm_RSSIMonitorCheckCE(struct dm_odm_t *pDM_Odm)
 
 	pRA_Table->firstconnect = pDM_Odm->bLinked;
 
-	/* if (check_fwstate(&Adapter->mlmepriv, WIFI_AP_STATE|WIFI_ADHOC_STATE|WIFI_ADHOC_MASTER_STATE) == true) */
+	/* if (check_fwstate(&Adapter->mlmepriv, WIFI_AP_STATE | WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE)) */
 	{
 		struct sta_info *psta;
 
@@ -431,7 +431,7 @@ static void odm_RSSIMonitorCheckCE(struct dm_odm_t *pDM_Odm)
 
 		for (i = 0; i < sta_cnt; i++) {
 			if (PWDB_rssi[i] != (0)) {
-				if (pHalData->fw_ractrl == true)/*  Report every sta's RSSI to FW */
+				if (pHalData->fw_ractrl)/*  Report every sta's RSSI to FW */
 					rtl8723b_set_rssi_cmd(Adapter, (u8 *)(&PWDB_rssi[i]));
 			}
 		}
@@ -457,7 +457,7 @@ static void odm_RSSIMonitorCheckCE(struct dm_odm_t *pDM_Odm)
 
 static void odm_RSSIMonitorCheck(struct dm_odm_t *pDM_Odm)
 {
-	if (!(pDM_Odm->SupportAbility & ODM_BB_RSSI_MONITOR))
+	if !(pDM_Odm->SupportAbility & ODM_BB_RSSI_MONITOR)
 		return;
 
 	odm_RSSIMonitorCheckCE(pDM_Odm);
@@ -550,7 +550,7 @@ void ODM_TXPowerTrackingCheck(struct dm_odm_t *pDM_Odm)
 {
 	struct adapter *Adapter = pDM_Odm->Adapter;
 
-	if (!(pDM_Odm->SupportAbility & ODM_RF_TX_PWR_TRACK))
+	if !(pDM_Odm->SupportAbility & ODM_RF_TX_PWR_TRACK)
 		return;
 
 	if (!pDM_Odm->RFCalibrateInfo.TM_Trigger) { /* at least delay 1 sec */
@@ -623,7 +623,7 @@ void ODM_DMWatchdog(struct dm_odm_t *pDM_Odm)
 	}
 	odm_CCKPacketDetectionThresh(pDM_Odm);
 
-	if (*(pDM_Odm->pbPowerSaving) == true)
+	if (*(pDM_Odm->pbPowerSaving))
 		return;
 
 
diff --git a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
index 0eaedd8f6469..4bc18c24db50 100644
--- a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
+++ b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
@@ -100,7 +100,7 @@ void ODM_CfoTracking(void *pDM_VOID)
 	u8 Adjust_Xtal = 1;
 
 	/* 4 Support ability */
-	if (!(pDM_Odm->SupportAbility & ODM_BB_CFO_TRACKING))
+	if !(pDM_Odm->SupportAbility & ODM_BB_CFO_TRACKING)
 		return;
 
 	if (!pDM_Odm->bLinked || !pDM_Odm->bOneEntryOnly) {
@@ -138,7 +138,7 @@ void ODM_CfoTracking(void *pDM_VOID)
 		pCfoTrack->CFO_ave_pre = CFO_ave;
 
 		/* 4 1.4 Dynamic Xtal threshold */
-		if (pCfoTrack->bAdjust == false) {
+		if (!pCfoTrack->bAdjust) {
 			if (CFO_ave > CFO_TH_XTAL_HIGH || CFO_ave < (-CFO_TH_XTAL_HIGH))
 				pCfoTrack->bAdjust = true;
 		} else {
@@ -190,7 +190,7 @@ void odm_parsing_cfo(void *dm_void, void *pkt_info_void, s8 *cfotail)
 	struct cfo_tracking *cfo_track = &dm_odm->DM_CfoTrack;
 	u8 i;
 
-	if (!(dm_odm->SupportAbility & ODM_BB_CFO_TRACKING))
+	if !(dm_odm->SupportAbility & ODM_BB_CFO_TRACKING)
 		return;
 
 	if (pkt_info->station_id != 0) {
diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.c b/drivers/staging/rtl8723bs/hal/odm_DIG.c
index a31c8368f9d9..c76720e41dc1 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DIG.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DIG.c
@@ -82,7 +82,7 @@ void odm_NHMBB(void *pDM_VOID)
 
 
 	if ((pDM_Odm->NHMCurTxOkcnt) + 1 > (u64)(pDM_Odm->NHMCurRxOkcnt<<2) + 1) { /* Tx > 4*Rx possible for adaptivity test */
-		if (pDM_Odm->NHM_cnt_0 >= 190 || pDM_Odm->adaptivity_flag == true) {
+		if (pDM_Odm->NHM_cnt_0 >= 190 || pDM_Odm->adaptivity_flag) {
 			/* Enable EDCCA since it is possible running Adaptivity testing */
 			/* test_status = 1; */
 			pDM_Odm->adaptivity_flag = true;
@@ -99,7 +99,7 @@ void odm_NHMBB(void *pDM_VOID)
 			}
 		}
 	} else { /*  TX<RX */
-		if (pDM_Odm->adaptivity_flag == true && pDM_Odm->NHM_cnt_0 <= 200) {
+		if (pDM_Odm->adaptivity_flag && pDM_Odm->NHM_cnt_0 <= 200) {
 			/* test_status = 2; */
 			pDM_Odm->tolerance_cnt = 0;
 		} else {
@@ -189,7 +189,7 @@ void odm_AdaptivityInit(void *pDM_VOID)
 {
 	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
 
-	if (pDM_Odm->Carrier_Sense_enable == false)
+	if (!pDM_Odm->Carrier_Sense_enable)
 		pDM_Odm->TH_L2H_ini = 0xf7; /*  -7 */
 	else
 		pDM_Odm->TH_L2H_ini = 0xa;
@@ -220,7 +220,7 @@ void odm_Adaptivity(void *pDM_VOID, u8 IGI)
 	s8 Diff, IGI_target;
 	bool EDCCA_State = false;
 
-	if (!(pDM_Odm->SupportAbility & ODM_BB_ADAPTIVITY))
+	if !(pDM_Odm->SupportAbility & ODM_BB_ADAPTIVITY)
 		return;
 
 	if (*pDM_Odm->pBandWidth == ODM_BW20M) /* CHANNEL_WIDTH_20 */
@@ -232,12 +232,12 @@ void odm_Adaptivity(void *pDM_VOID, u8 IGI)
 	pDM_Odm->IGI_target = (u8) IGI_target;
 
 	/* Search pwdB lower bound */
-	if (pDM_Odm->TxHangFlg == true) {
+	if (pDM_Odm->TxHangFlg) {
 		PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG_DBG_RPT_11N, bMaskDWord, 0x208);
 		odm_SearchPwdBLowerBound(pDM_Odm, pDM_Odm->IGI_target);
 	}
 
-	if ((!pDM_Odm->bLinked) || (*pDM_Odm->pChannel > 149)) { /*  Band4 doesn't need adaptivity */
+	if (!pDM_Odm->bLinked || (*pDM_Odm->pChannel > 149)) { /*  Band4 doesn't need adaptivity */
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, bMaskByte0, 0x7f);
 		PHY_SetBBReg(pDM_Odm->Adapter, rOFDM0_ECCAThreshold, bMaskByte2, 0x7f);
 		return;
@@ -311,11 +311,11 @@ bool odm_DigAbort(void *pDM_VOID)
 	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
 
 	/* SupportAbility */
-	if (!(pDM_Odm->SupportAbility & ODM_BB_FA_CNT))
+	if !(pDM_Odm->SupportAbility & ODM_BB_FA_CNT)
 		return	true;
 
 	/* SupportAbility */
-	if (!(pDM_Odm->SupportAbility & ODM_BB_DIG))
+	if !(pDM_Odm->SupportAbility & ODM_BB_DIG)
 		return	true;
 
 	/* ScanInProcess */
@@ -323,7 +323,7 @@ bool odm_DigAbort(void *pDM_VOID)
 		return	true;
 
 	/* add by Neil Chen to avoid PSD is processing */
-	if (pDM_Odm->bDMInitialGainEnable == false)
+	if (!pDM_Odm->bDMInitialGainEnable)
 		return	true;
 
 	return	false;
@@ -387,14 +387,14 @@ void odm_DIG(void *pDM_VOID)
 	if (odm_DigAbort(pDM_Odm))
 		return;
 
-	if (pDM_Odm->adaptivity_flag == true)
+	if (pDM_Odm->adaptivity_flag)
 		Adap_IGI_Upper = pDM_Odm->Adaptivity_IGI_upper;
 
 
 	/* 1 Update status */
 	DIG_Dynamic_MIN = pDM_DigTable->DIG_Dynamic_MIN_0;
 	FirstConnect = (pDM_Odm->bLinked) && (pDM_DigTable->bMediaConnect_0 == false);
-	FirstDisConnect = (!pDM_Odm->bLinked) && (pDM_DigTable->bMediaConnect_0 == true);
+	FirstDisConnect = (!pDM_Odm->bLinked) && (pDM_DigTable->bMediaConnect_0);
 
 	/* 1 Boundary Decision */
 	/* 2 For WIN\CE */
@@ -529,7 +529,7 @@ void odm_DIG(void *pDM_VOID)
 	/* 1 Force upper bound and lower bound for adaptivity */
 	if (
 		pDM_Odm->SupportAbility & ODM_BB_ADAPTIVITY &&
-		pDM_Odm->adaptivity_flag == true
+		pDM_Odm->adaptivity_flag
 	) {
 		if (CurrentIGI > Adap_IGI_Upper)
 			CurrentIGI = Adap_IGI_Upper;
@@ -611,7 +611,7 @@ void odm_FalseAlarmCounterStatistics(void *pDM_VOID)
 	struct false_ALARM_STATISTICS *FalseAlmCnt = &pDM_Odm->FalseAlmCnt;
 	u32 ret_value;
 
-	if (!(pDM_Odm->SupportAbility & ODM_BB_FA_CNT))
+	if !(pDM_Odm->SupportAbility & ODM_BB_FA_CNT)
 		return;
 
 	/* hold ofdm counter */
diff --git a/drivers/staging/rtl8723bs/hal/odm_EdcaTurboCheck.c b/drivers/staging/rtl8723bs/hal/odm_EdcaTurboCheck.c
index 578d5712645c..c291a0b91bcf 100644
--- a/drivers/staging/rtl8723bs/hal/odm_EdcaTurboCheck.c
+++ b/drivers/staging/rtl8723bs/hal/odm_EdcaTurboCheck.c
@@ -47,7 +47,7 @@ void odm_EdcaTurboCheck(void *pDM_VOID)
 	 */
 	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
 
-	if (!(pDM_Odm->SupportAbility & ODM_MAC_EDCA_TURBO))
+	if !(pDM_Odm->SupportAbility & ODM_MAC_EDCA_TURBO)
 		return;
 
 	odm_EdcaTurboCheckCE(pDM_Odm);
diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index 994b8c578e7a..a8a4be3c57d2 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -267,7 +267,7 @@ static void odm_Process_RSSIForDM(
 	if (!IS_STA_VALID(pEntry))
 		return;
 
-	if ((!pPktinfo->bssid_match))
+	if (!pPktinfo->bssid_match)
 		return;
 
 	if (pPktinfo->is_beacon)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 12416e499ac3..265418ebf94d 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -363,7 +363,7 @@ void rtl8723b_set_FwPwrMode_cmd(struct adapter *padapter, u8 psmode)
 	}
 
 	if (psmode > 0) {
-		if (hal_btcoex_IsBtControlLps(padapter) == true) {
+		if (hal_btcoex_IsBtControlLps(padapter)) {
 			PowerState = hal_btcoex_RpwmVal(padapter);
 			byte5 = hal_btcoex_LpsVal(padapter);
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
index 928226679ab4..f284c6917804 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
@@ -131,21 +131,21 @@ void rtl8723b_HalDmWatchDog(struct adapter *Adapter)
 
 	hw_init_completed = Adapter->hw_init_completed;
 
-	if (hw_init_completed == false)
+	if (!hw_init_completed)
 		goto skip_dm;
 
 	fw_current_in_ps_mode = adapter_to_pwrctl(Adapter)->fw_current_in_ps_mode;
 	rtw_hal_get_hwreg(Adapter, HW_VAR_FWLPS_RF_ON, (u8 *)(&bFwPSAwake));
 
 	if (
-		(hw_init_completed == true) &&
+		(hw_init_completed) &&
 		((!fw_current_in_ps_mode) && bFwPSAwake)
 	) {
 		rtw_hal_check_rxfifo_full(Adapter);
 	}
 
 	/* ODM */
-	if (hw_init_completed == true) {
+	if (hw_init_completed) {
 		u8 bLinked = false;
 		u8 bsta_state = false;
 		bool bBtDisabled = true;
@@ -207,7 +207,7 @@ void rtl8723b_HalDmWatchDog_in_LPS(struct adapter *Adapter)
 	struct sta_priv *pstapriv = &Adapter->stapriv;
 	struct sta_info *psta = NULL;
 
-	if (Adapter->hw_init_completed == false)
+	if (!Adapter->hw_init_completed)
 		goto skip_lps_dm;
 
 
@@ -216,10 +216,10 @@ void rtl8723b_HalDmWatchDog_in_LPS(struct adapter *Adapter)
 
 	ODM_CmnInfoUpdate(&pHalData->odmpriv, ODM_CMNINFO_LINK, bLinked);
 
-	if (bLinked == false)
+	if (!bLinked)
 		goto skip_lps_dm;
 
-	if (!(pDM_Odm->SupportAbility & ODM_BB_RSSI_MONITOR))
+	if !(pDM_Odm->SupportAbility & ODM_BB_RSSI_MONITOR)
 		goto skip_lps_dm;
 
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index e794fe3caf9d..0e2505fa0018 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -197,7 +197,7 @@ static s32 polling_fwdl_chksum(
 		yield();
 	} while (jiffies_to_msecs(jiffies-start) < timeout_ms || cnt < min_cnt);
 
-	if (!(value32 & FWDL_ChkSum_rpt)) {
+	if !(value32 & FWDL_ChkSum_rpt) {
 		goto exit;
 	}
 
@@ -238,7 +238,7 @@ static s32 _FWFreeToGo(struct adapter *adapter, u32 min_cnt, u32 timeout_ms)
 		yield();
 	} while (jiffies_to_msecs(jiffies - start) < timeout_ms || cnt < min_cnt);
 
-	if (!(value32 & WINTINI_RDY)) {
+	if !(value32 & WINTINI_RDY) {
 		goto exit;
 	}
 
@@ -604,14 +604,14 @@ void Hal_EfusePowerSwitch(
 
 		/*  Reset: 0x0000h[28], default valid */
 		tmpV16 =  rtw_read16(padapter, REG_SYS_FUNC_EN);
-		if (!(tmpV16 & FEN_ELDR)) {
+		if !(tmpV16 & FEN_ELDR) {
 			tmpV16 |= FEN_ELDR;
 			rtw_write16(padapter, REG_SYS_FUNC_EN, tmpV16);
 		}
 
 		/*  Clock: Gated(0x0008h[5]) 8M(0x0008h[1]) clock from ANA, default valid */
 		tmpV16 = rtw_read16(padapter, REG_SYS_CLKR);
-		if ((!(tmpV16 & LOADER_CLK_EN))  || (!(tmpV16 & ANA8M))) {
+		if (!(tmpV16 & LOADER_CLK_EN)  || !(tmpV16 & ANA8M)) {
 			tmpV16 |= (LOADER_CLK_EN | ANA8M);
 			rtw_write16(padapter, REG_SYS_CLKR, tmpV16);
 		}
@@ -691,7 +691,7 @@ static void hal_ReadEFuse_WiFi(
 		}
 	}
 
-	/*  Copy from Efuse map to output pointer memory!!! */
+	/*  Copy from Efuse map to output pointer memory!! */
 	for (i = 0; i < _size_byte; i++)
 		pbuf[i] = efuseTbl[_offset+i];
 
@@ -791,7 +791,7 @@ static void hal_ReadEFuse_BT(
 	/*  switch bank back to bank 0 for later BT and wifi use. */
 	hal_EfuseSwitchToBank(padapter, 0);
 
-	/*  Copy from Efuse map to output pointer memory!!! */
+	/*  Copy from Efuse map to output pointer memory!! */
 	for (i = 0; i < _size_byte; i++)
 		pbuf[i] = efuseTbl[_offset+i];
 
@@ -998,7 +998,7 @@ void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter)
 	rtw_write32(padapter, REG_TCR, value32);
 
 	/*  NOTE: Fix test chip's bug (about contention windows's randomness) */
-	if (check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE|WIFI_ADHOC_MASTER_STATE|WIFI_AP_STATE) == true) {
+	if (check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE | WIFI_AP_STATE)) {
 		rtw_write8(padapter, REG_RXTSF_OFFSET_CCK, 0x50);
 		rtw_write8(padapter, REG_RXTSF_OFFSET_OFDM, 0x50);
 	}
@@ -1148,7 +1148,7 @@ s32 rtl8723b_InitLLTTable(struct adapter *padapter)
 
 	do {
 		val32 = rtw_read32(padapter, REG_AUTO_LLT);
-		if (!(val32 & BIT_AUTO_INIT_LLT)) {
+		if !(val32 & BIT_AUTO_INIT_LLT) {
 			ret = _SUCCESS;
 			break;
 		}
@@ -1201,7 +1201,7 @@ void Hal_EfuseParseIDCode(struct adapter *padapter, u8 *hwinfo)
 	u16 EEPROMId;
 
 
-	/*  Check 0x8129 again for making sure autoload status!! */
+	/*  Check 0x8129 again for making sure autoload status! */
 	EEPROMId = le16_to_cpu(*((__le16 *)hwinfo));
 	if (EEPROMId != RTL_EEPROM_ID) {
 		pEEPROM->bautoload_fail_flag = true;
@@ -2118,7 +2118,7 @@ static void hw_var_set_mlme_sitesurvey(struct adapter *padapter, u8 variable, u8
 	/*  config RCR to receive different BSSID & not to receive data frame */
 	value_rxfltmap2 = 0;
 
-	if ((check_fwstate(pmlmepriv, WIFI_AP_STATE) == true))
+	if ((check_fwstate(pmlmepriv, WIFI_AP_STATE)))
 		rcr_clear_bit = RCR_CBSSID_BCN;
 
 	value_rcr = rtw_read32(padapter, REG_RCR);
@@ -2141,7 +2141,7 @@ static void hw_var_set_mlme_sitesurvey(struct adapter *padapter, u8 variable, u8
 		pHalData->RegRRSR = rtw_read16(padapter, REG_RRSR);
 	} else {
 		/*  sitesurvey done */
-		if (check_fwstate(pmlmepriv, (_FW_LINKED|WIFI_AP_STATE)))
+		if (check_fwstate(pmlmepriv, (_FW_LINKED | WIFI_AP_STATE)))
 			/*  enable to rx data frame */
 			rtw_write16(padapter, REG_RXFLTMAP2, 0xFFFF);
 
@@ -2185,7 +2185,7 @@ static void hw_var_set_mlme_join(struct adapter *padapter, u8 variable, u8 *val)
 			val32 |= RCR_CBSSID_DATA|RCR_CBSSID_BCN;
 		rtw_write32(padapter, REG_RCR, val32);
 
-		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true)
+		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE))
 			RetryLimit = (pEEPROM->CustomerID == RT_CID_CCX) ? 7 : 48;
 		else /*  Ad-hoc Mode */
 			RetryLimit = 0x7;
@@ -2197,7 +2197,7 @@ static void hw_var_set_mlme_join(struct adapter *padapter, u8 variable, u8 *val)
 		val8 &= ~DIS_TSF_UDT;
 		rtw_write8(padapter, REG_BCN_CTRL, val8);
 
-		if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE|WIFI_ADHOC_MASTER_STATE))
+		if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE))
 			RetryLimit = 0x7;
 	}
 
@@ -2723,7 +2723,7 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 		break;
 
 	case HW_VAR_DL_RSVD_PAGE:
-		if (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true)
+		if (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE))
 			rtl8723b_download_BTCoex_AP_mode_rsvd_page(padapter);
 		else
 			rtl8723b_download_rsvd_page(padapter, RT_MEDIA_CONNECT);
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index 7fac1c2ba8e0..a65c86a5c471 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -344,7 +344,7 @@ static int phy_BB8723b_Config_ParaFile(struct adapter *Adapter)
 		ODM_ConfigRFWithHeaderFile(&pHalData->odmpriv, CONFIG_RF_TXPWR_LMT, 0);
 
 	/*  */
-	/*  1. Read PHY_REG.TXT BB INIT!! */
+	/*  1. Read PHY_REG.TXT BB INIT! */
 	/*  */
 	ODM_ConfigBBWithHeaderFile(&pHalData->odmpriv, CONFIG_BB_PHY_REG);
 
@@ -739,7 +739,7 @@ static void PHY_HandleSwChnlAndSetBW8723B(
 	}
 
 	/* Switch workitem or set timer to do switch channel or setbandwidth operation */
-	if ((!Adapter->bDriverStopped) && (!Adapter->bSurpriseRemoved)) {
+	if (!Adapter->bDriverStopped && (!Adapter->bSurpriseRemoved)) {
 		phy_SwChnlAndSetBwMode8723B(Adapter);
 	} else {
 		if (pHalData->bSwChnl) {
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index cab4707091e2..95aaacec1b84 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -135,7 +135,7 @@ static void update_recvframe_phyinfo(union recv_frame *precvframe,
 	precvframe->u.hdr.psta = NULL;
 	if (
 		pkt_info.bssid_match &&
-		(check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true)
+		(check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE))
 	) {
 		if (psta) {
 			precvframe->u.hdr.psta = psta;
@@ -194,7 +194,7 @@ static inline bool rx_crc_err(struct recv_priv *precvpriv,
 			      union recv_frame *precvframe)
 {
 	/*  fix Hardware RX data error, drop whole recv_buffer */
-	if ((!(p_hal_data->ReceiveConfig & RCR_ACRC32)) && pattrib->crc_err) {
+	if (!(p_hal_data->ReceiveConfig & RCR_ACRC32) && pattrib->crc_err) {
 		rtw_free_recvframe(precvframe, &precvpriv->free_recv_queue);
 		return true;
 	}
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index f50726d2ed0c..e94e163abe25 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -269,7 +269,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 				}
 
 				/*  ok to send, remove frame from queue */
-				if (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true)
+				if (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE))
 					if (
 						(pxmitframe->attrib.psta->state & WIFI_SLEEP_STATE) &&
 						(pxmitframe->attrib.triggered == 0)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index f2f73c65a636..f1ef502c9e12 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -505,7 +505,7 @@ static void _InitOperationMode(struct adapter *padapter)
 
 	pmlmeext = &padapter->mlmeextpriv;
 
-	/* 1 This part need to modified according to the rate set we filtered!! */
+	/* 1 This part need to modified according to the rate set we filtered! */
 	/*  */
 	/*  Set RRSR, RATR, and REG_BWOPMODE registers */
 	/*  */
@@ -597,7 +597,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 	pwrctrlpriv = adapter_to_pwrctl(padapter);
 
 	if (
-		adapter_to_pwrctl(padapter)->bips_processing == true &&
+		adapter_to_pwrctl(padapter)->bips_processing &&
 		adapter_to_pwrctl(padapter)->pre_ips_type == 0
 	) {
 		unsigned long start_time;
@@ -746,7 +746,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 		CHANNEL_WIDTH_20, HAL_PRIME_CHNL_OFFSET_DONT_CARE, HAL_PRIME_CHNL_OFFSET_DONT_CARE);
 
 	/*  Record original value for template. This is arough data, we can only use the data */
-	/*  for power adjust. The value can not be adjustde according to different power!!! */
+	/*  for power adjust. The value can not be adjustde according to different power!! */
 /* 	pHalData->OriginalCckTxPwrIdx = pHalData->CurrentCckTxPwrIdx; */
 /* 	pHalData->OriginalOfdm24GTxPwrIdx = pHalData->CurrentOfdm24GTxPwrIdx; */
 
diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index fbb12fe31a6c..07309c14f22b 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -145,10 +145,10 @@ enum network_type {
 
 	/* Combination */
 	/* Type for current wireless mode */
-	WIRELESS_11BG = (WIRELESS_11B|WIRELESS_11G), /*  tx: cck & ofdm, rx: cck & ofdm & MCS, hw: cck & ofdm */
-	WIRELESS_11G_24N = (WIRELESS_11G|WIRELESS_11_24N), /*  tx: ofdm & MCS, rx: ofdm & cck & MCS, hw: cck & ofdm */
-	WIRELESS_11B_24N = (WIRELESS_11B|WIRELESS_11_24N), /*  tx: ofdm & cck & MCS, rx: ofdm & cck & MCS, hw: ofdm & cck */
-	WIRELESS_11BG_24N = (WIRELESS_11B|WIRELESS_11G|WIRELESS_11_24N), /*  tx: ofdm & cck & MCS, rx: ofdm & cck & MCS, hw: ofdm & cck */
+	WIRELESS_11BG = (WIRELESS_11B | WIRELESS_11G), /*  tx: cck & ofdm, rx: cck & ofdm & MCS, hw: cck & ofdm */
+	WIRELESS_11G_24N = (WIRELESS_11G | WIRELESS_11_24N), /*  tx: ofdm & MCS, rx: ofdm & cck & MCS, hw: cck & ofdm */
+	WIRELESS_11B_24N = (WIRELESS_11B | WIRELESS_11_24N), /*  tx: ofdm & cck & MCS, rx: ofdm & cck & MCS, hw: ofdm & cck */
+	WIRELESS_11BG_24N = (WIRELESS_11B | WIRELESS_11G | WIRELESS_11_24N), /*  tx: ofdm & cck & MCS, rx: ofdm & cck & MCS, hw: ofdm & cck */
 };
 
 #define SUPPORTED_24G_NETTYPE_MSK (WIRELESS_11B | WIRELESS_11G | WIRELESS_11_24N)
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index ac3ba746b64c..33114d68d497 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -44,12 +44,12 @@
 
 
 enum {
- dot11AuthAlgrthm_Open = 0,
- dot11AuthAlgrthm_Shared,
- dot11AuthAlgrthm_8021X,
- dot11AuthAlgrthm_Auto,
- dot11AuthAlgrthm_WAPI,
- dot11AuthAlgrthm_MaxNum
+	dot11_auth_algrthm_open = 0,
+	dot11_auth_algrthm_shared,
+	dot11_auth_algrthm_8021x,
+	dot11_auth_algrthm_auto,
+	dot11_auth_algrthm_WAPI,
+	dot11_auth_algrthm_max_num
 };
 
 /*  Scan type including active and passive scan. */
@@ -300,7 +300,7 @@ static inline signed int get_fwstate(struct mlme_priv *pmlmepriv)
  * No Limit on the calling context,
  * therefore set it to be the critical section...
  *
- * ### NOTE:#### (!!!!)
+ * ### NOTE:#### (!!)
  * MUST TAKE CARE THAT BEFORE CALLING THIS FUNC, YOU SHOULD HAVE LOCKED pmlmepriv->lock
  */
 static inline void set_fwstate(struct mlme_priv *pmlmepriv, signed int state)
diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 32f6d3a5e309..4a1e7594a2fb 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -91,7 +91,7 @@ struct rt_pmkid_list {
 
 
 struct security_priv {
-	u32   dot11AuthAlgrthm;		/*  802.11 auth, could be open, shared, 8021x and authswitch */
+	u32   dot11_auth_algrthm;		/*  802.11 auth, could be open, shared, 8021x and authswitch */
 	u32   dot11PrivacyAlgrthm;	/*  This specify the privacy for shared auth. algorithm. */
 
 	/* WEP */
@@ -170,19 +170,19 @@ struct security_priv {
 
 #define GET_ENCRY_ALGO(psecuritypriv, psta, encry_algo, bmcst)\
 do {\
-	switch (psecuritypriv->dot11AuthAlgrthm) {\
-	case dot11AuthAlgrthm_Open:\
-	case dot11AuthAlgrthm_Shared:\
-	case dot11AuthAlgrthm_Auto:\
+	switch (psecuritypriv->dot11_auth_algrthm) {\
+	case dot11_auth_algrthm_open:\
+	case dot11_auth_algrthm_shared:\
+	case dot11_auth_algrthm_auto:\
 		encry_algo = (u8)psecuritypriv->dot11PrivacyAlgrthm;\
 		break;\
-	case dot11AuthAlgrthm_8021X:\
+	case dot11_auth_algrthm_8021x:\
 		if (bmcst)\
 			encry_algo = (u8)psecuritypriv->dot118021XGrpPrivacy;\
 		else\
 			encry_algo = (u8)psta->dot118021XPrivacy;\
 		break;\
-	case dot11AuthAlgrthm_WAPI:\
+	case dot11_auth_algrthm_WAPI:\
 		encry_algo = (u8)psecuritypriv->dot11PrivacyAlgrthm;\
 		break;\
 	} \
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 098456e97c96..0fbb8adedbf9 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -275,7 +275,7 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 	notify_timestamp = ktime_to_us(ktime_get_boottime());
 
 	/* We've set wiphy's signal_type as CFG80211_SIGNAL_TYPE_MBM: signal strength in mBm (100*dBm) */
-	if (check_fwstate(pmlmepriv, _FW_LINKED) == true &&
+	if (check_fwstate(pmlmepriv, _FW_LINKED) &&
 	    is_same_network(&pmlmepriv->cur_network.network, &pnetwork->network, 0)) {
 		notify_signal = 100 * translate_percentage_to_dbm(padapter->recvpriv.signal_strength);/* dbm */
 	} else {
@@ -372,7 +372,7 @@ void rtw_cfg80211_ibss_indicate_connect(struct adapter *padapter)
 		struct wlan_bssid_ex  *pnetwork = &(padapter->mlmeextpriv.mlmext_info.network);
 		struct wlan_network *scanned = pmlmepriv->cur_network_scanned;
 
-		if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true) {
+		if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
 			memcpy(&cur_network->network, pnetwork, sizeof(struct wlan_bssid_ex));
 			rtw_cfg80211_inform_bss(padapter, cur_network);
 		} else {
@@ -390,7 +390,7 @@ void rtw_cfg80211_ibss_indicate_connect(struct adapter *padapter)
 
 		if (!rtw_cfg80211_check_bss(padapter))
 			netdev_dbg(padapter->pnetdev,
-				   FUNC_ADPT_FMT " BSS not found !!\n",
+				   FUNC_ADPT_FMT " BSS not found !\n",
 				   FUNC_ADPT_ARG(padapter));
 	}
 	/* notify cfg80211 that device joined an IBSS */
@@ -410,7 +410,7 @@ void rtw_cfg80211_indicate_connect(struct adapter *padapter)
 		return;
 	}
 
-	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true)
+	if (check_fwstate(pmlmepriv, WIFI_AP_STATE))
 		return;
 
 	{
@@ -433,7 +433,7 @@ void rtw_cfg80211_indicate_connect(struct adapter *padapter)
 check_bss:
 	if (!rtw_cfg80211_check_bss(padapter))
 		netdev_dbg(padapter->pnetdev,
-			   FUNC_ADPT_FMT " BSS not found !!\n",
+			   FUNC_ADPT_FMT " BSS not found !\n",
 			   FUNC_ADPT_ARG(padapter));
 
 	if (rtw_to_roam(padapter) > 0) {
@@ -479,7 +479,7 @@ void rtw_cfg80211_indicate_disconnect(struct adapter *padapter)
 		return;
 	}
 
-	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true)
+	if (check_fwstate(pmlmepriv, WIFI_AP_STATE))
 		return;
 
 	if (!padapter->mlmepriv.not_indic_disco) {
@@ -546,7 +546,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 		if (psecuritypriv->bWepDefaultKeyIdxSet == 0) {
 			/* wep default key has not been set, so use this key index as default key. */
 
-			psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Auto;
+			psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_auto;
 			psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
 			psecuritypriv->dot11PrivacyAlgrthm = _WEP40_;
 			psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
@@ -616,7 +616,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 		goto exit;
 	}
 
-	if (psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_8021X && psta) { /*  psk/802_1x */
+	if (psecuritypriv->dot11_auth_algrthm == dot11_auth_algrthm_8021x && psta) { /*  psk/802_1x */
 		if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 			if (param->u.crypt.set_tx == 1) { /* pairwise key */
 				memcpy(psta->dot118021x_UncstKey.skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
@@ -764,11 +764,11 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 		goto exit;
 	}
 
-	if (padapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) { /*  802_1x */
+	if (padapter->securitypriv.dot11_auth_algrthm == dot11_auth_algrthm_8021x) { /*  802_1x */
 		struct sta_info *psta, *pbcmc_sta;
 		struct sta_priv *pstapriv = &padapter->stapriv;
 
-		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE | WIFI_MP_STATE) == true) { /* sta mode */
+		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE | WIFI_MP_STATE)) { /* sta mode */
 			psta = rtw_get_stainfo(pstapriv, get_bssid(pmlmepriv));
 			if (psta) {
 				/* Jeff: don't disable ieee8021x_blocked while clearing key */
@@ -891,15 +891,15 @@ static int cfg80211_rtw_add_key(struct wiphy *wiphy, struct net_device *ndev,
 		memcpy(param->u.crypt.key, (u8 *)params->key, params->key_len);
 	}
 
-	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true) {
+	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
 		ret =  rtw_cfg80211_set_encryption(ndev, param, param_len);
-	} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) {
+	} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 		if (mac_addr)
 			memcpy(param->sta_addr, mac_addr, ETH_ALEN);
 
 		ret = rtw_cfg80211_ap_set_encryption(ndev, param, param_len);
-	} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true
-		|| check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true) {
+	} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)
+		|| check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
 		ret =  rtw_cfg80211_set_encryption(ndev, param, param_len);
 	}
 
@@ -1031,7 +1031,7 @@ static int cfg80211_rtw_change_iface(struct wiphy *wiphy,
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	int ret = 0;
 
-	if (adapter_to_dvobj(padapter)->processing_dev_remove == true) {
+	if (adapter_to_dvobj(padapter)->processing_dev_remove) {
 		ret = -EPERM;
 		goto exit;
 	}
@@ -1207,8 +1207,8 @@ static int cfg80211_rtw_scan(struct wiphy *wiphy
 	pwdev_priv->scan_request = request;
 	spin_unlock_bh(&pwdev_priv->scan_req_lock);
 
-	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) {
-		if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS | _FW_UNDER_SURVEY | _FW_UNDER_LINKING) == true) {
+	if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
+		if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS | _FW_UNDER_SURVEY | _FW_UNDER_LINKING)) {
 			need_indicate_scan_done = true;
 			goto check_need_indicate_scan_done;
 		}
@@ -1223,10 +1223,10 @@ static int cfg80211_rtw_scan(struct wiphy *wiphy
 	if (request->ie && request->ie_len > 0)
 		rtw_cfg80211_set_probe_req_wpsp2pie(padapter, (u8 *)request->ie, request->ie_len);
 
-	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) == true) {
+	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY)) {
 		need_indicate_scan_done = true;
 		goto check_need_indicate_scan_done;
-	} else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) == true) {
+	} else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING)) {
 		ret = -EBUSY;
 		goto check_need_indicate_scan_done;
 	}
@@ -1282,7 +1282,7 @@ static int cfg80211_rtw_scan(struct wiphy *wiphy
 	}
 	spin_unlock_bh(&pmlmepriv->lock);
 
-	if (_status == false)
+	if (!_status)
 		ret = -1;
 
 check_need_indicate_scan_done:
@@ -1323,26 +1323,26 @@ static int rtw_cfg80211_set_auth_type(struct security_priv *psecuritypriv,
 	switch (sme_auth_type) {
 	case NL80211_AUTHTYPE_AUTOMATIC:
 
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Auto;
+		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_auto;
 
 		break;
 	case NL80211_AUTHTYPE_OPEN_SYSTEM:
 
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open;
+		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_open;
 
 		if (psecuritypriv->ndisauthtype > Ndis802_11AuthModeWPA)
-			psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+			psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021x;
 
 		break;
 	case NL80211_AUTHTYPE_SHARED_KEY:
 
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Shared;
+		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_shared;
 
 		psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
 
 		break;
 	default:
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open;
+		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_open;
 		/* return -ENOTSUPP; */
 	}
 
@@ -1401,9 +1401,9 @@ static int rtw_cfg80211_set_key_mgt(struct security_priv *psecuritypriv, u32 key
 {
 	if (key_mgt == WLAN_AKM_SUITE_8021X)
 		/* auth_type = UMAC_AUTH_TYPE_8021X; */
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021x;
 	else if (key_mgt == WLAN_AKM_SUITE_PSK) {
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021x;
 	}
 
 	return 0;
@@ -1444,7 +1444,7 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 	pwpa = rtw_get_wpa_ie(buf, &wpa_ielen, ielen);
 	if (pwpa && wpa_ielen > 0) {
 		if (rtw_parse_wpa_ie(pwpa, wpa_ielen + 2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
-			padapter->securitypriv.dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+			padapter->securitypriv.dot11_auth_algrthm = dot11_auth_algrthm_8021x;
 			padapter->securitypriv.ndisauthtype = Ndis802_11AuthModeWPAPSK;
 			memcpy(padapter->securitypriv.supplicant_ie, &pwpa[0], wpa_ielen + 2);
 		}
@@ -1453,7 +1453,7 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 	pwpa2 = rtw_get_wpa2_ie(buf, &wpa2_ielen, ielen);
 	if (pwpa2 && wpa2_ielen > 0) {
 		if (rtw_parse_wpa2_ie(pwpa2, wpa2_ielen + 2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
-			padapter->securitypriv.dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+			padapter->securitypriv.dot11_auth_algrthm = dot11_auth_algrthm_8021x;
 			padapter->securitypriv.ndisauthtype = Ndis802_11AuthModeWPA2PSK;
 			memcpy(padapter->securitypriv.supplicant_ie, &pwpa2[0], wpa2_ielen + 2);
 		}
@@ -1530,7 +1530,7 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 		|| padapter->securitypriv.dot11PrivacyAlgrthm == _TKIP_WTMIC_
 		|| padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)
 		/* WPS open need to enable multicast */
-		/*  check_fwstate(&padapter->mlmepriv, WIFI_UNDER_WPS) == true) */
+		/*  check_fwstate(&padapter->mlmepriv, WIFI_UNDER_WPS)) */
 		rtw_hal_set_hwreg(padapter, HW_VAR_OFF_RCR_AM, null_addr);
 
 exit:
@@ -1576,7 +1576,7 @@ static int cfg80211_rtw_join_ibss(struct wiphy *wiphy, struct net_device *ndev,
 	psecuritypriv->ndisencryptstatus = Ndis802_11EncryptionDisabled;
 	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
 	psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
-	psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open; /* open system */
+	psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_open; /* open system */
 	psecuritypriv->ndisauthtype = Ndis802_11AuthModeOpen;
 
 	ret = rtw_cfg80211_set_auth_type(psecuritypriv, NL80211_AUTHTYPE_OPEN_SYSTEM);
@@ -1632,7 +1632,7 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 
 	padapter->mlmepriv.not_indic_disco = true;
 
-	if (adapter_wdev_data(padapter)->block == true) {
+	if (adapter_wdev_data(padapter)->block) {
 		ret = -EBUSY;
 		goto exit;
 	}
@@ -1662,17 +1662,17 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 	ndis_ssid.ssid_length = sme->ssid_len;
 	memcpy(ndis_ssid.ssid, (u8 *)sme->ssid, sme->ssid_len);
 
-	if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) == true) {
+	if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING)) {
 		ret = -EBUSY;
 		goto exit;
 	}
-	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) == true)
+	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
 		rtw_scan_abort(padapter);
 
 	psecuritypriv->ndisencryptstatus = Ndis802_11EncryptionDisabled;
 	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
 	psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
-	psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open; /* open system */
+	psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_open; /* open system */
 	psecuritypriv->ndisauthtype = Ndis802_11AuthModeOpen;
 
 	ret = rtw_cfg80211_set_wpa_version(psecuritypriv, sme->crypto.wpa_versions);
@@ -1695,8 +1695,8 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 	}
 
 	/* For WEP Shared auth */
-	if ((psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_Shared ||
-	     psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_Auto) && sme->key) {
+	if ((psecuritypriv->dot11_auth_algrthm == dot11_auth_algrthm_shared ||
+	     psecuritypriv->dot11_auth_algrthm == dot11_auth_algrthm_auto) && sme->key) {
 		u32 wep_key_idx, wep_key_len, wep_total_len;
 		struct ndis_802_11_wep	 *pwep = NULL;
 
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index e943dcea1a21..7f0fdfeee55d 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -534,7 +534,7 @@ static void rtw_init_default_value(struct adapter *padapter)
 	psecuritypriv->sw_encrypt = pregistrypriv->software_encrypt;
 	psecuritypriv->sw_decrypt = pregistrypriv->software_decrypt;
 
-	psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open; /* open system */
+	psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_open; /* open system */
 	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
 
 	psecuritypriv->dot11PrivacyKeyIndex = 0;
@@ -1068,7 +1068,7 @@ static void rtw_suspend_normal(struct adapter *padapter)
 
 	if ((rtw_hal_check_ips_status(padapter)) || (adapter_to_pwrctl(padapter)->rf_pwrstate == rf_off))
 		netdev_dbg(padapter->pnetdev,
-			   "%s: ### ERROR #### driver in IPS ####ERROR###!!!\n",
+			   "%s: ### ERROR #### driver in IPS ####ERROR###!!\n",
 			   __func__);
 
 	rtw_dev_unload(padapter);
@@ -1093,7 +1093,7 @@ void rtw_suspend_common(struct adapter *padapter)
 	while (pwrpriv->bips_processing)
 		msleep(1);
 
-	if ((!padapter->bup) || (padapter->bDriverStopped) || (padapter->bSurpriseRemoved))
+	if (!padapter->bup || (padapter->bDriverStopped) || (padapter->bSurpriseRemoved))
 		return;
 
 	rtw_ps_deny(padapter, PS_DENY_SUSPEND);
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
index 3ea9fdfa14f8..e9a2f3f7ec74 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
@@ -224,7 +224,7 @@ u32 sd_read32(struct intf_hdl *pintfhdl, u32 addr, s32 *err)
 			if ((-ESHUTDOWN == *err) || (-ENODEV == *err))
 				padapter->bSurpriseRemoved = true;
 
-			if (rtw_inc_and_chk_continual_io_error(psdiodev) == true) {
+			if (rtw_inc_and_chk_continual_io_error(psdiodev)) {
 				padapter->bSurpriseRemoved = true;
 				break;
 			}
@@ -300,7 +300,7 @@ void sd_write32(struct intf_hdl *pintfhdl, u32 addr, u32 v, s32 *err)
 			if ((-ESHUTDOWN == *err) || (-ENODEV == *err))
 				padapter->bSurpriseRemoved = true;
 
-			if (rtw_inc_and_chk_continual_io_error(psdiodev) == true) {
+			if (rtw_inc_and_chk_continual_io_error(psdiodev)) {
 				padapter->bSurpriseRemoved = true;
 				break;
 			}
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index dc0b77f38b1a..479e4bfc9083 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -153,7 +153,7 @@ static int rtw_mlcst2unicst(struct adapter *padapter, struct sk_buff *skb)
 
 	for (i = 0; i < chk_alive_num; i++) {
 		psta = rtw_get_stainfo_by_offset(pstapriv, chk_alive_list[i]);
-		if (!(psta->state & _FW_LINKED))
+		if !(psta->state & _FW_LINKED)
 			continue;
 
 		/* avoid come from STA1 and send back STA1 */
@@ -188,7 +188,7 @@ void _rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	s32 res = 0;
 
-	if (rtw_if_up(padapter) == false)
+	if (!rtw_if_up(padapter))
 		goto drop_packet;
 
 	rtw_check_xmit_resource(padapter, pkt);
-- 
2.47.3

