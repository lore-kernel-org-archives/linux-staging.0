Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B912D9EC2
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 03:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775879778; cv=none; b=L57GBEGSfaIGehJB9KEu+zKewWIDMNrHig34ndVFiwq5NbjvVfUm98AeIeQQdnr5J04dnn1UOBVkXXjQAljNxQVel1kSvn14WCCH4ifZfvCYhUHiml/cjyTxqA1+ayLC+np8Zpy6g7Ir1HlSFFwPLWo1Enrss5FshK26VKPMx0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775879778; c=relaxed/simple;
	bh=aMaK49Y3WJmPYR3KfDGD4EsaTWQfLmnzgmZT8mxIjlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DhWq0qY7CS6j/dugTREB/+7DNfzdebBFECYTkt98YEuycc8SgfEMn3mv+61deUoVpf6vG8XzYr6cXs539SgTOY2WAupBDKtTjx/1t15is91AzuY+9hRJ6WfKXm8TG6gsrranZiwiI18KulN1lFtQC8fbrX0s098E41wLdcGupH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFNNJhMY; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFNNJhMY"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c76b9efc299so1172466a12.0
        for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 20:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775879775; x=1776484575; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZOqdo6pZASSz8dBytktdhNpwHy02N+q4gVkPZ4fSFY=;
        b=CFNNJhMYWbws2HdSealXpQA+MG9yifcUvUrqWNe55PTL+T8SilfQSeC/XO/Q/5I1f/
         aJGy1Mdnly8a5ym/r76sseG8Mwe/iH7FQKcKb3r/7xTE3YpKk4xzHBGVMPBzFzn2Tgvm
         Me0f7CvptDMWGKs71bTDOdcx2BjTgSDUp5Mq5R0LyYAecaZb3adTyP5AwZabsKVSRss9
         +RwSQm6ECmsZYaZ2x2AYEiPuOp+LaNcDzM9bnnq3mvJ4htA/2wnizFrCITm/ZMcNuIDm
         4DkwMJXGzRP//bK0GYkhPUXTJIWPehjhHtwxsEyrIMglVQoh6YD1FdTJ5CGVuKw3/uKr
         t1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775879775; x=1776484575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AZOqdo6pZASSz8dBytktdhNpwHy02N+q4gVkPZ4fSFY=;
        b=mrSUsjH9D4M2atEN3tB9GKM9MWoKZUybKhh8HSaKEsvyZTqBHc4RwPlhb+kUq96zPu
         IZ/YREo6/Qczl/34/6nvmLE9hcIb+Bi2be0S1ZJ1802Wyzg/js9AqTaS8GrXpivuybkx
         0p8uxRlNxJ7kCX8EFiN1NuAir3wJSpqMfIe7pOHVR1zIVOvaWwup0BRQCI/EFLR78tiV
         xO9OpBAzt7sEz8wpaoIXXEmqn5w4oOb8AlUv5vjrVz/408PLYiyDtKh5VI84ZD2dwOR4
         kMJbsJl9po55/Uaotg3qAOUUsl0aFK/hjB1pybYeEL+WMHEZ7l6lP2wH06Z+PnKmvLCt
         VKqQ==
X-Gm-Message-State: AOJu0YzlOiH2fXu6J/6x9VhhPNlQo94Wzb5B8VV/uXiTE0j5Mgl4xOvU
	UDJ+Cf0FwFwtWn4Zifia4RFjFZP/yYe27Ajz3euYTjEAYWNN328AWgtR
X-Gm-Gg: AeBDieuQzrOBZ4cN1V2RfqGgCO7PhmSzEurn9K+t4BQqOahfS6+zNiGbUrRBPgsEjfk
	S2DQaH2XRSz++WCRoOTVzOHqMbevmyhTdctF/a/NDtdymCzuFSAHP6ai8bch1BnJNWtBAJ5m6ZU
	8wZU14BmkErIC/eUOHIA784R9oEhM4CVN0ZkjHeF3ZHM98Ka8pIVJjJtZL8XyYNj+i4lWI3a0z4
	DD3iuuoXAoBw9ggU08vltN/4lhtPvuFQGAq/yRNb8QdmwFtRxUWgOn+plh9MbzmdTZPEJ/Wr0Zp
	W3vdrMaiaDVp7k809ajYkPl7om/XMjcvLcTkk8+fo4ViPgM6OAxRNVzc6uJy/kPPqdrn8LcrcUF
	SKpoj1QrXVottCfONbIfN5FDHYpaDAycs3c4QXb+LJ5YC76nj8vSCCrJMJngfzCkaMp3Ui0it0W
	nvGEDATznoN/w5vpAN1tyv3Dv3/I8He+bV4c94jUuPlHTk7tQZ8s2x
X-Received: by 2002:a05:6a20:7d86:b0:398:aaac:a0a0 with SMTP id adf61e73a8af0-39fe40b5a2dmr6585411637.59.1775879774829;
        Fri, 10 Apr 2026 20:56:14 -0700 (PDT)
Received: from localhost.localdomain ([222.254.206.81])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c30e7besm4267840b3a.5.2026.04.10.20.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 20:56:14 -0700 (PDT)
From: Nguyen Duc Thinh <ducthinh100812@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ducthinh100812@gmail.com
Subject: [PATCH] staging: rtl8723bs: verify boolean and logics and rename dot11AuthAlgrthm
Date: Sat, 11 Apr 2026 10:53:03 +0700
Message-ID: <20260411035303.859-2-ducthinh100812@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260411035303.859-1-ducthinh100812@gmail.com>
References: <20260411035303.859-1-ducthinh100812@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Nguyen Duc Thinh <ducthinh100812@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c       | 28 ++++----
 drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  2 +-
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  2 +-
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    | 40 +++++------
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 16 ++---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 22 +++---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |  2 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 70 +++++++++----------
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |  2 +-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  8 +--
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 36 +++++-----
 drivers/staging/rtl8723bs/hal/hal_com.c       |  2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h  | 12 ++--
 .../staging/rtl8723bs/include/rtw_security.h  | 14 ++--
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 32 ++++-----
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  2 +-
 16 files changed, 145 insertions(+), 145 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 864cd8b6d..dd915c654 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -301,7 +301,7 @@ void expire_timeout_chk(struct adapter *padapter)
 
 			psta->keep_alive_trycnt = 0;
 			spin_lock_bh(&pstapriv->asoc_list_lock);
-			if (list_empty(&psta->asoc_list) == false) {
+			if (!list_empty(&psta->asoc_list)) {
 				list_del_init(&psta->asoc_list);
 				pstapriv->asoc_list_cnt--;
 				updated = ap_free_sta(padapter, psta, false,
@@ -416,7 +416,7 @@ void update_bmc_sta(struct adapter *padapter)
 		/* ap mode */
 		rtw_hal_set_odm_var(padapter, HAL_ODM_STA_INFO, psta, true);
 
-		/* if (pHalData->fw_ractrl == true) */
+		/* if (pHalData->fw_ractrl) */
 		{
 			u8 arg[4] = {0};
 
@@ -461,7 +461,7 @@ void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
 	/* ap mode */
 	rtw_hal_set_odm_var(padapter, HAL_ODM_STA_INFO, psta, true);
 
-	if (psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_8021X)
+	if (psecuritypriv->dot11_auth_algrthm == dot11_auth_algrthm_8021X)
 		psta->ieee8021x_blocked = true;
 	else
 		psta->ieee8021x_blocked = false;
@@ -704,8 +704,8 @@ void start_bss_network(struct adapter *padapter)
 	rtw_hal_set_hwreg(padapter, HW_VAR_AC_PARAM_BK, (u8 *)(&acparm));
 
 	/* Set Security */
-	val8 = (psecuritypriv->dot11AuthAlgrthm ==
-		dot11AuthAlgrthm_8021X) ? 0xcc : 0xcf;
+	val8 = (psecuritypriv->dot11_auth_algrthm ==
+		dot11_auth_algrthm_8021X) ? 0xcc : 0xcf;
 	rtw_hal_set_hwreg(padapter, HW_VAR_SEC_CFG, (u8 *)(&val8));
 
 	/* Beacon Control related register */
@@ -924,7 +924,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 				      &group_cipher,
 				      &pairwise_cipher,
 				      NULL) == _SUCCESS) {
-			psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+			psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021X;
 
 			psecuritypriv->dot8021xalg = 1;/* psk,  todo:802.1x */
 			psecuritypriv->wpa_psk |= BIT(1);
@@ -950,7 +950,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 					     &group_cipher,
 					     &pairwise_cipher,
 					     NULL) == _SUCCESS) {
-				psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+				psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021X;
 
 				psecuritypriv->dot8021xalg = 1;/* psk,  todo:802.1x */
 
@@ -1013,10 +1013,10 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 		rtw_ht_use_default_setting(padapter);
 
-		if (pmlmepriv->htpriv.sgi_20m == false)
+		if (!pmlmepriv->htpriv.sgi_20m)
 			pht_cap->cap_info &= cpu_to_le16(~(IEEE80211_HT_CAP_SGI_20));
 
-		if (pmlmepriv->htpriv.sgi_40m == false)
+		if (!pmlmepriv->htpriv.sgi_40m)
 			pht_cap->cap_info &= cpu_to_le16(~(IEEE80211_HT_CAP_SGI_40));
 
 		if (!TEST_FLAG(pmlmepriv->htpriv.ldpc_cap, LDPC_HT_ENABLE_RX))
@@ -1156,7 +1156,7 @@ int rtw_acl_add_sta(struct adapter *padapter, u8 *addr)
 		paclnode = list_entry(plist, struct rtw_wlan_acl_node, list);
 
 		if (!memcmp(paclnode->addr, addr, ETH_ALEN)) {
-			if (paclnode->valid == true) {
+			if (paclnode->valid) {
 				added = true;
 				break;
 			}
@@ -1573,8 +1573,8 @@ static int rtw_ht_operation_update(struct adapter *padapter)
 	if (pmlmepriv->htpriv.ht_option)
 		return 0;
 
-	if (!(pmlmepriv->ht_op_mode & IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT)
-	    && pmlmepriv->num_sta_ht_no_gf) {
+	if (!(pmlmepriv->ht_op_mode & IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT) &&
+	    pmlmepriv->num_sta_ht_no_gf) {
 		pmlmepriv->ht_op_mode |=
 			IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT;
 		op_mode_changes++;
@@ -1780,8 +1780,8 @@ u8 bss_cap_update_on_sta_leave(struct adapter *padapter, struct sta_info *psta)
 	if (psta->no_short_preamble_set) {
 		psta->no_short_preamble_set = 0;
 		pmlmepriv->num_sta_no_short_preamble--;
-		if (pmlmeext->cur_wireless_mode > WIRELESS_11B
-		    && pmlmepriv->num_sta_no_short_preamble == 0){
+		if (pmlmeext->cur_wireless_mode > WIRELESS_11B &&
+		    pmlmepriv->num_sta_no_short_preamble == 0){
 			beacon_updated = true;
 			update_beacon(padapter, 0xFF, NULL, true);
 		}
diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index f4b19ef7b..b6611f771 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -11,7 +11,7 @@
 void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 media_status)
 {
 	if ((media_status == RT_MEDIA_CONNECT)
-		&& (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true)) {
+		&& (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE))) {
 		rtw_hal_set_hwreg(padapter, HW_VAR_DL_RSVD_PAGE, NULL);
 	}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 3e2b5e6b0..51030a10b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -347,7 +347,7 @@ int rtw_generate_ie(struct registry_priv *pregistrypriv)
 
 	/* HT Cap. */
 	if ((pregistrypriv->wireless_mode & WIRELESS_11_24N) &&
-	    (pregistrypriv->ht_enable == true)) {
+	    (pregistrypriv->ht_enable)) {
 		/* todo: */
 	}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 587a87fbf..977169889 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -84,7 +84,7 @@ u8 rtw_do_join(struct adapter *padapter)
 			pmlmepriv->to_join = false;
 			_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
 		} else {
-			if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) {
+			if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
 				/*  submit createbss_cmd to change to a ADHOC_MASTER */
 
 				/* pmlmepriv->lock has been acquired by caller... */
@@ -151,12 +151,12 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 
 	spin_lock_bh(&pmlmepriv->lock);
 
-	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) == true)
+	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
 		goto handle_tkip_countermeasure;
-	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) == true)
+	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
 		goto release_mlme_lock;
 
-	if (check_fwstate(pmlmepriv, _FW_LINKED|WIFI_ADHOC_MASTER_STATE) == true) {
+	if (check_fwstate(pmlmepriv, _FW_LINKED|WIFI_ADHOC_MASTER_STATE)) {
 		if ((pmlmepriv->assoc_ssid.ssid_length == ssid->ssid_length) &&
 		    (!memcmp(&pmlmepriv->assoc_ssid.ssid, ssid->ssid, ssid->ssid_length))) {
 			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == false) {
@@ -164,12 +164,12 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
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
@@ -182,12 +182,12 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
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
@@ -208,7 +208,7 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 	memcpy(&pmlmepriv->assoc_ssid, ssid, sizeof(struct ndis_802_11_ssid));
 	pmlmepriv->assoc_by_bssid = false;
 
-	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) == true)
+	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
 		pmlmepriv->to_join = true;
 	else
 		status = rtw_do_join(padapter);
@@ -249,9 +249,9 @@ u8 rtw_set_802_11_connect(struct adapter *padapter, u8 *bssid, struct ndis_802_1
 	netdev_dbg(padapter->pnetdev, FUNC_ADPT_FMT "  fw_state = 0x%08x\n",
 		   FUNC_ADPT_ARG(padapter), get_fwstate(pmlmepriv));
 
-	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) == true)
+	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
 		goto handle_tkip_countermeasure;
-	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) == true)
+	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
 		goto release_mlme_lock;
 
 handle_tkip_countermeasure:
@@ -272,7 +272,7 @@ u8 rtw_set_802_11_connect(struct adapter *padapter, u8 *bssid, struct ndis_802_1
 		pmlmepriv->assoc_by_bssid = false;
 	}
 
-	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY) == true)
+	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
 		pmlmepriv->to_join = true;
 	else
 		status = rtw_do_join(padapter);
@@ -301,15 +301,15 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 
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
 
@@ -352,7 +352,7 @@ u8 rtw_set_802_11_disassociate(struct adapter *padapter)
 
 	spin_lock_bh(&pmlmepriv->lock);
 
-	if (check_fwstate(pmlmepriv, _FW_LINKED) == true) {
+	if (check_fwstate(pmlmepriv, _FW_LINKED)) {
 		rtw_disassoc_cmd(padapter, 0, true);
 		rtw_indicate_disconnect(padapter);
 		/* modify for CONFIG_IEEE80211W, none 11w can use it */
@@ -379,8 +379,8 @@ u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter, struct ndis_802_11_s
 		goto exit;
 	}
 
-	if ((check_fwstate(pmlmepriv, _FW_UNDER_SURVEY|_FW_UNDER_LINKING) == true) ||
-		(pmlmepriv->LinkDetectInfo.bBusyTraffic == true)) {
+	if ((check_fwstate(pmlmepriv, _FW_UNDER_SURVEY|_FW_UNDER_LINKING)) ||
+		(pmlmepriv->LinkDetectInfo.bBusyTraffic)) {
 		/*  Scan or linking is in progress, do nothing. */
 		res = true;
 
@@ -408,7 +408,7 @@ u8 rtw_set_802_11_authentication_mode(struct adapter *padapter, enum ndis_802_11
 	psecuritypriv->ndisauthtype = authmode;
 
 	if (psecuritypriv->ndisauthtype > 3)
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021X;
 
 	res = rtw_set_auth(padapter, psecuritypriv);
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 1ef48bf65..e4fe6cd92 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -987,7 +987,7 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 		rtw_hal_set_odm_var(padapter, HAL_ODM_STA_INFO, psta, true);
 
 		/* security related */
-		if (padapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) {
+		if (padapter->securitypriv.dot11_auth_algrthm == dot11_auth_algrthm_8021X) {
 			padapter->securitypriv.binstallGrpkey = false;
 			padapter->securitypriv.busetkipkey = false;
 			padapter->securitypriv.bgrpkey_handshake = false;
@@ -1098,7 +1098,7 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 
 	spin_lock_bh(&adapter->security_key_mutex);
 
-	if (adapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) {
+	if (adapter->securitypriv.dot11_auth_algrthm == dot11_auth_algrthm_8021X) {
 		/* 802.1x */
 		/*  Added by Albert 2009/02/18 */
 		/*  We have to backup the PMK information for WiFi PMK Caching test item. */
@@ -1132,7 +1132,7 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 		/*  */
 		struct security_priv *psec_priv = &adapter->securitypriv;
 
-		psec_priv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open;  /* open system */
+		psec_priv->dot11_auth_algrthm = dot11_auth_algrthm_Open;  /* open system */
 		psec_priv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
 		psec_priv->dot11PrivacyKeyIndex = 0;
 
@@ -1367,7 +1367,7 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 
 	rtw_sta_media_status_rpt(adapter, psta, 1);
 
-	if (adapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X)
+	if (adapter->securitypriv.dot11_auth_algrthm == dot11_auth_algrthm_8021X)
 		psta->dot118021XPrivacy = adapter->securitypriv.dot11PrivacyAlgrthm;
 
 	psta->ieee8021x_blocked = false;
@@ -1594,7 +1594,7 @@ void rtw_mlme_reset_auto_scan_int(struct adapter *adapter)
 
 	if (pmlmeinfo->VHT_enable) /* disable auto scan when connect to 11AC AP */
 		mlme->auto_scan_int_ms = 0;
-	else if (adapter->registrypriv.wifi_spec && is_client_associated_to_ap(adapter) == true)
+	else if (adapter->registrypriv.wifi_spec && is_client_associated_to_ap(adapter))
 		mlme->auto_scan_int_ms = 60 * 1000;
 	else if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
 		if (check_fwstate(mlme, WIFI_STATION_STATE) && check_fwstate(mlme, _FW_LINKED))
@@ -1888,7 +1888,7 @@ signed int rtw_set_auth(struct adapter *adapter, struct security_priv *psecurity
 		goto exit;
 	}
 
-	psetauthparm->mode = (unsigned char)psecuritypriv->dot11AuthAlgrthm;
+	psetauthparm->mode = (unsigned char)psecuritypriv->dot11_auth_algrthm;
 
 	pcmd->cmdcode = _SetAuth_CMD_;
 	pcmd->parmbuf = (unsigned char *)psetauthparm;
@@ -1918,7 +1918,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 		goto exit;
 	}
 
-	if (psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_8021X)
+	if (psecuritypriv->dot11_auth_algrthm == dot11_auth_algrthm_8021X)
 		psetkeyparm->algorithm = (unsigned char)psecuritypriv->dot118021XGrpPrivacy;
 	else
 		psetkeyparm->algorithm = (u8)psecuritypriv->dot11PrivacyAlgrthm;
@@ -2531,7 +2531,7 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
 
 		if (issued == 0) {
 			psta->htpriv.candidate_tid_bitmap |= BIT((u8)priority);
-			rtw_addbareq_cmd(padapter, (u8) priority, pattrib->ra);
+			rtw_addbareq_cmd(padapter, (u8)priority, pattrib->ra);
 		}
 	}
 }
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index b1f20aa81..1388a7418 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -236,7 +236,7 @@ static void init_mlme_ext_priv_value(struct adapter *padapter)
 	pmlmeinfo->reassoc_count = 0;
 	pmlmeinfo->link_count = 0;
 	pmlmeinfo->auth_seq = 0;
-	pmlmeinfo->auth_algo = dot11AuthAlgrthm_Open;
+	pmlmeinfo->auth_algo = dot11_auth_algrthm_Open;
 	pmlmeinfo->key_index = 0;
 	pmlmeinfo->iv = 0;
 
@@ -485,7 +485,7 @@ void mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame)
 		_mgt_dispatcher(padapter, ptable, precv_frame);
 		break;
 	case WIFI_ACTION:
-		/* if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) */
+		/* if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) */
 		_mgt_dispatcher(padapter, ptable, precv_frame);
 		break;
 	default:
@@ -688,7 +688,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 
 	sa = GetAddr2Ptr(pframe);
 
-	auth_mode = psecuritypriv->dot11AuthAlgrthm;
+	auth_mode = psecuritypriv->dot11_auth_algrthm;
 
 	if (GetPrivacy(pframe)) {
 		u8 *iv;
@@ -872,11 +872,11 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 	status	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 4));
 
 	if (status != 0) {
-		if (status == 13) { /*  pmlmeinfo->auth_algo == dot11AuthAlgrthm_Auto) */
-			if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared)
-				pmlmeinfo->auth_algo = dot11AuthAlgrthm_Open;
+		if (status == 13) { /*  pmlmeinfo->auth_algo == dot11_auth_algrthm_Auto) */
+			if (pmlmeinfo->auth_algo == dot11_auth_algrthm_Shared)
+				pmlmeinfo->auth_algo = dot11_auth_algrthm_Open;
 			else
-				pmlmeinfo->auth_algo = dot11AuthAlgrthm_Shared;
+				pmlmeinfo->auth_algo = dot11_auth_algrthm_Shared;
 			/* pmlmeinfo->reauth_count = 0; */
 		}
 
@@ -885,7 +885,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 	}
 
 	if (seq == 2) {
-		if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared) {
+		if (pmlmeinfo->auth_algo == dot11_auth_algrthm_Shared) {
 			 /*  legendary shared system */
 			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&len,
 				pkt_len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_);
@@ -903,7 +903,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 		/* open system */
 		go2asoc = 1;
 	} else if (seq == 4) {
-		if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared)
+		if (pmlmeinfo->auth_algo == dot11_auth_algrthm_Shared)
 			go2asoc = 1;
 		else
 			goto authclnt_fail;
@@ -2630,7 +2630,7 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 		memcpy(pwlanhdr->addr3, get_my_bssid(&pmlmeinfo->network), ETH_ALEN);
 
 		/*  setting auth algo number */
-		val16 = (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared) ? 1 : 0;/*  0:OPEN System, 1:Shared key */
+		val16 = (pmlmeinfo->auth_algo == dot11_auth_algrthm_Shared) ? 1 : 0;/*  0:OPEN System, 1:Shared key */
 		if (val16)
 			use_shared_key = 1;
 		le_tmp = cpu_to_le16(val16);
@@ -4111,7 +4111,7 @@ void start_clnt_join(struct adapter *padapter)
 	if (caps&WLAN_CAPABILITY_ESS) {
 		set_msr(padapter, WIFI_FW_STATION_STATE);
 
-		val8 = (pmlmeinfo->auth_algo == dot11AuthAlgrthm_8021X) ? 0xcc : 0xcf;
+		val8 = (pmlmeinfo->auth_algo == dot11_auth_algrthm_8021X) ? 0xcc : 0xcf;
 
 		rtw_hal_set_hwreg(padapter, HW_VAR_SEC_CFG, (u8 *)(&val8));
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 1c9e02732..6934d27eb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -321,7 +321,7 @@ static u8 PS_RDY_CHECK(struct adapter *padapter)
 	)
 		return false;
 
-	if (padapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X &&
+	if (padapter->securitypriv.dot11_auth_algrthm == dot11_auth_algrthm_8021X &&
 	    !padapter->securitypriv.binstallGrpkey)
 		return false;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 337671b12..84cb0e474 100644
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
@@ -1409,7 +1409,7 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 
 	/* only support station mode */
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) && check_fwstate(pmlmepriv, _FW_LINKED) &&
-	    adapter->securitypriv.binstallBIPkey == true) {
+	    adapter->securitypriv.binstallBIPkey) {
 		/* unicast management frame decrypt */
 		if (pattrib->privacy && !(is_multicast_ether_addr(GetAddr1Ptr(ptr))) &&
 			(subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC || subtype == WIFI_ACTION)) {
@@ -1593,7 +1593,7 @@ static signed int wlanhdr_to_ethhdr(union recv_frame *precvframe)
 	eth_type = ntohs(be_tmp); /* pattrib->ether_type */
 	pattrib->eth_type = eth_type;
 
-	if ((check_fwstate(pmlmepriv, WIFI_MP_STATE) == true)) {
+	if ((check_fwstate(pmlmepriv, WIFI_MP_STATE))) {
 		ptr += rmv_len;
 		*ptr = 0x87;
 		*(ptr+1) = 0x12;
@@ -1668,7 +1668,7 @@ static void rtw_recv_indicate_pkt(struct adapter *padapter, struct sk_buff *pkt,
 
 	/* Indicate the packets to upper layer */
 	if (pkt) {
-		if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) {
+		if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 			struct sk_buff *pskb2 = NULL;
 			struct sta_info *psta = NULL;
 			struct sta_priv *pstapriv = &padapter->stapriv;
@@ -1911,7 +1911,7 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 	plist = get_next(phead);
 
 	/*  Handling some condition for forced indicate case. */
-	if (bforced == true) {
+	if (bforced) {
 		if (list_empty(phead)) {
 			/*  spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
 			/* spin_unlock(&ppending_recvframe_queue->lock); */
@@ -1946,8 +1946,8 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 
 			/* indicate this recv_frame */
 			if (!pattrib->amsdu) {
-				if ((padapter->bDriverStopped == false) &&
-				    (padapter->bSurpriseRemoved == false))
+				if ((!padapter->bDriverStopped) &&
+				    (!padapter->bSurpriseRemoved))
 					rtw_recv_indicatepkt(padapter, prframe);/* indicate this recv_frame */
 
 			} else if (pattrib->amsdu == 1) {
@@ -1987,8 +1987,8 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 		wlanhdr_to_ethhdr(prframe);
 
 		if (pattrib->qos != 1) {
-			if ((padapter->bDriverStopped == false) &&
-			    (padapter->bSurpriseRemoved == false)) {
+			if ((!padapter->bDriverStopped) &&
+			    (!padapter->bSurpriseRemoved)) {
 				rtw_recv_indicatepkt(padapter, prframe);
 				return _SUCCESS;
 
@@ -1998,7 +1998,7 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 
 		}
 
-		if (preorder_ctrl->enable == false) {
+		if (!preorder_ctrl->enable) {
 			/* indicate this recv_frame */
 			preorder_ctrl->indicate_seq = pattrib->seq_num;
 
@@ -2009,7 +2009,7 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 			return _SUCCESS;
 		}
 	} else if (pattrib->amsdu == 1) { /* temp filter -> means didn't support A-MSDUs in a A-MPDU */
-		if (preorder_ctrl->enable == false) {
+		if (!preorder_ctrl->enable) {
 			preorder_ctrl->indicate_seq = pattrib->seq_num;
 
 			retval = amsdu_to_msdu(padapter, prframe);
@@ -2045,7 +2045,7 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 	/*  */
 
 	/* recv_indicatepkts_in_order(padapter, preorder_ctrl, true); */
-	if (recv_indicatepkts_in_order(padapter, preorder_ctrl, false) == true) {
+	if (recv_indicatepkts_in_order(padapter, preorder_ctrl, false)) {
 		_set_timer(&preorder_ctrl->reordering_ctrl_timer, REORDER_WAIT_TIME);
 		spin_unlock_bh(&ppending_recvframe_queue->lock);
 	} else {
@@ -2075,7 +2075,7 @@ void rtw_reordering_ctrl_timeout_handler(struct timer_list *t)
 
 	spin_lock_bh(&ppending_recvframe_queue->lock);
 
-	if (recv_indicatepkts_in_order(padapter, preorder_ctrl, true) == true)
+	if (recv_indicatepkts_in_order(padapter, preorder_ctrl, true))
 		_set_timer(&preorder_ctrl->reordering_ctrl_timer, REORDER_WAIT_TIME);
 
 	spin_unlock_bh(&ppending_recvframe_queue->lock);
@@ -2090,13 +2090,13 @@ static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct ht_priv *phtpriv = &pmlmepriv->htpriv;
 
-	if (phtpriv->ht_option == true) { /* B/G/N Mode */
+	if (phtpriv->ht_option) { /* B/G/N Mode */
 		/* prframe->u.hdr.preorder_ctrl = &precvpriv->recvreorder_ctrl[pattrib->priority]; */
 
 		if (recv_indicatepkt_reorder(padapter, prframe) != _SUCCESS) { /*  including perform A-MPDU Rx Ordering Buffer Control */
 
-			if ((padapter->bDriverStopped == false) &&
-			    (padapter->bSurpriseRemoved == false)) {
+			if ((!padapter->bDriverStopped) &&
+			    (!padapter->bSurpriseRemoved)) {
 				retval = _FAIL;
 				return retval;
 			}
@@ -2106,7 +2106,7 @@ static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame
 		if (retval != _SUCCESS)
 			return retval;
 
-		if ((padapter->bDriverStopped == false) && (padapter->bSurpriseRemoved == false)) {
+		if ((!padapter->bDriverStopped) && (!padapter->bSurpriseRemoved)) {
 			/* indicate this recv_frame */
 			rtw_recv_indicatepkt(padapter, prframe);
 		} else {
@@ -2195,7 +2195,7 @@ static int recv_func(struct adapter *padapter, union recv_frame *rframe)
 		/* check if need to enqueue into uc_swdec_pending_queue*/
 		if (check_fwstate(mlmepriv, WIFI_STATION_STATE) &&
 			!is_multicast_ether_addr(prxattrib->ra) && prxattrib->encrypt > 0 &&
-			(prxattrib->bdecrypted == 0 || psecuritypriv->sw_decrypt == true) &&
+			(prxattrib->bdecrypted == 0 || psecuritypriv->sw_decrypt) &&
 			psecuritypriv->ndisauthtype == Ndis802_11AuthModeWPAPSK &&
 			!psecuritypriv->busetkipkey) {
 			rtw_enqueue_recvframe(rframe, &padapter->recvpriv.uc_swdec_pending_queue);
@@ -2282,7 +2282,7 @@ static void rtw_signal_stat_timer_hdl(struct timer_list *t)
 			}
 		}
 
-		if (check_fwstate(&adapter->mlmepriv, _FW_UNDER_SURVEY) == true ||
+		if (check_fwstate(&adapter->mlmepriv, _FW_UNDER_SURVEY) ||
 		    check_fwstate(&adapter->mlmepriv, _FW_LINKED) == false
 		) {
 			goto set_timer;
diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index bdd4b6d8f..3b6c4c652 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -531,7 +531,7 @@ u8 rtw_access_ctrl(struct adapter *padapter, u8 *mac_addr)
 		paclnode = list_entry(plist, struct rtw_wlan_acl_node, list);
 
 		if (!memcmp(paclnode->addr, mac_addr, ETH_ALEN))
-			if (paclnode->valid == true) {
+			if (paclnode->valid) {
 				match = true;
 				break;
 			}
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 3242978da..b014585d5 100644
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
@@ -1687,7 +1687,7 @@ void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
 		pmlmeext->bcn_delay_cnt[delay_ms]++;
 		/* pmlmeext->bcn_delay_ratio[delay_ms] = (pmlmeext->bcn_delay_cnt[delay_ms] * 100) /pmlmeext->bcn_cnt; */
 	/* dump for  adaptive_early_32k */
-	if (pmlmeext->bcn_cnt > 100 && (pmlmeext->adaptive_tsf_done == true)) {
+	if (pmlmeext->bcn_cnt > 100 && (pmlmeext->adaptive_tsf_done)) {
 		u8 ratio_20_delay, ratio_80_delay;
 		u8 DrvBcnEarly, DrvBcnTimeOut;
 
@@ -1760,7 +1760,7 @@ void rtw_release_macid(struct adapter *padapter, struct sta_info *psta)
 
 	spin_lock_bh(&pdvobj->lock);
 	if (psta->mac_id < NUM_STA && psta->mac_id != 1) {
-		if (pdvobj->macid[psta->mac_id] == true) {
+		if (pdvobj->macid[psta->mac_id]) {
 			pdvobj->macid[psta->mac_id] = false;
 			psta->mac_id = NUM_STA;
 		}
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 7b18be891..998f742c9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -384,7 +384,7 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 	} else {
 		while (true) {
 			/* IOT action */
-			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) && (pattrib->ampdu_en == true) &&
+			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) && (pattrib->ampdu_en) &&
 			    (padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)) {
 				pattrib->vcs_mode = CTS_TO_SELF;
 				break;
@@ -420,7 +420,7 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 			/* to do list: check MIMO power save condition. */
 
 			/* check AMPDU aggregation for TXOP */
-			if (pattrib->ampdu_en == true) {
+			if (pattrib->ampdu_en) {
 				pattrib->vcs_mode = RTS_CTS;
 				break;
 			}
@@ -482,7 +482,7 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 	memset(pattrib->dot11tkiptxmickey.skey,  0, 16);
 	pattrib->mac_id = psta->mac_id;
 
-	if (psta->ieee8021x_blocked == true) {
+	if (psta->ieee8021x_blocked) {
 		pattrib->encrypt = 0;
 
 		if ((pattrib->ether_type != 0x888e) && (check_fwstate(pmlmepriv, WIFI_MP_STATE) == false)) {
@@ -492,13 +492,13 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 	} else {
 		GET_ENCRY_ALGO(psecuritypriv, psta, pattrib->encrypt, bmcast);
 
-		switch (psecuritypriv->dot11AuthAlgrthm) {
-		case dot11AuthAlgrthm_Open:
-		case dot11AuthAlgrthm_Shared:
-		case dot11AuthAlgrthm_Auto:
+		switch (psecuritypriv->dot11_auth_algrthm) {
+		case dot11_auth_algrthm_Open:
+		case dot11_auth_algrthm_Shared:
+		case dot11_auth_algrthm_Auto:
 			pattrib->key_idx = (u8)psecuritypriv->dot11PrivacyKeyIndex;
 			break;
-		case dot11AuthAlgrthm_8021X:
+		case dot11_auth_algrthm_8021X:
 			if (bmcast)
 				pattrib->key_idx = (u8)psecuritypriv->dot118021XGrpKeyid;
 			else
@@ -650,8 +650,8 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	memcpy(pattrib->dst, &etherhdr.h_dest, ETH_ALEN);
 	memcpy(pattrib->src, &etherhdr.h_source, ETH_ALEN);
 
-	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)) {
+	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) ||
+		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))) {
 		memcpy(pattrib->ra, pattrib->dst, ETH_ALEN);
 		memcpy(pattrib->ta, pattrib->src, ETH_ALEN);
 	} else if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
@@ -717,7 +717,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 		if (!psta)	{ /*  if we cannot get psta => drop the pkt */
 			res = _FAIL;
 			goto exit;
-		} else if ((check_fwstate(pmlmepriv, WIFI_AP_STATE) == true) && (!(psta->state & _FW_LINKED))) {
+		} else if ((check_fwstate(pmlmepriv, WIFI_AP_STATE)) && (!(psta->state & _FW_LINKED))) {
 			res = _FAIL;
 			goto exit;
 		}
@@ -899,7 +899,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 	SetFrameSubType(fctrl, pattrib->subtype);
 
 	if (pattrib->subtype & WIFI_DATA_TYPE) {
-		if (check_fwstate(pmlmepriv,  WIFI_STATION_STATE) == true) {
+		if (check_fwstate(pmlmepriv,  WIFI_STATION_STATE)) {
 			/* to_ds = 1, fr_ds = 0; */
 
 			{
@@ -913,7 +913,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 			if (pqospriv->qos_option)
 				qos_option = true;
-		} else if (check_fwstate(pmlmepriv,  WIFI_AP_STATE) == true) {
+		} else if (check_fwstate(pmlmepriv,  WIFI_AP_STATE)) {
 			/* to_ds = 0, fr_ds = 1; */
 			SetFrDs(fctrl);
 			memcpy(pwlanhdr->addr1, pattrib->dst, ETH_ALEN);
@@ -922,8 +922,8 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 			if (pattrib->qos_en)
 				qos_option = true;
-		} else if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)) {
+		} else if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) ||
+		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))) {
 			memcpy(pwlanhdr->addr1, pattrib->dst, ETH_ALEN);
 			memcpy(pwlanhdr->addr2, pattrib->src, ETH_ALEN);
 			memcpy(pwlanhdr->addr3, get_bssid(pmlmepriv), ETH_ALEN);
@@ -981,7 +981,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 						pattrib->ampdu_en = true;
 
 				/* re-check if enable ampdu by BA_starting_seqctrl */
-				if (pattrib->ampdu_en == true) {
+				if (pattrib->ampdu_en) {
 					u16 tx_seq;
 
 					tx_seq = psta->BA_starting_seqctrl[pattrib->priority & 0x0f];
@@ -1138,7 +1138,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 
 		frg_inx++;
 
-		if (bmcst || (rtw_endofpktfile(&pktfile) == true)) {
+		if (bmcst || (rtw_endofpktfile(&pktfile))) {
 			pattrib->nr_frags = frg_inx;
 
 			pattrib->last_txcmdsz = pattrib->hdrlen + pattrib->iv_len +
@@ -2000,7 +2000,7 @@ s32 rtw_xmit(struct adapter *padapter, struct sk_buff **ppkt)
 	do_queue_select(padapter, &pxmitframe->attrib);
 
 	spin_lock_bh(&pxmitpriv->lock);
-	if (xmitframe_enqueue_for_sleeping_sta(padapter, pxmitframe) == true) {
+	if (xmitframe_enqueue_for_sleeping_sta(padapter, pxmitframe)) {
 		spin_unlock_bh(&pxmitpriv->lock);
 		return 1;
 	}
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 31b3e880a..6e0df3545 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -593,7 +593,7 @@ void SetHwReg(struct adapter *adapter, u8 variable, u8 *val)
 
 		if (val) { /* Enable default key related setting */
 			reg_scr |= SCR_TXBCUSEDK;
-			if (sec->dot11AuthAlgrthm != dot11AuthAlgrthm_8021X)
+			if (sec->dot11_auth_algrthm != dot11_auth_algrthm_8021X)
 				reg_scr |= (SCR_RxUseDK|SCR_TxUseDK);
 		} else /* Disable default key related setting */
 			reg_scr &= ~(SCR_RXBCUSEDK|SCR_TXBCUSEDK|SCR_RxUseDK|SCR_TxUseDK);
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 2a128568c..cde8967bf 100644
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
+ dot11_auth_algrthm_Open = 0,
+ dot11_auth_algrthm_Shared,
+ dot11_auth_algrthm_8021X,
+ dot11_auth_algrthm_Auto,
+ dot11_auth_algrthm_WAPI,
+ dot11_auth_algrthm_MaxNum
 };
 
 /*  Scan type including active and passive scan. */
diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 32f6d3a5e..e97c751e5 100644
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
+	case dot11_auth_algrthm_Open:\
+	case dot11_auth_algrthm_Shared:\
+	case dot11_auth_algrthm_Auto:\
 		encry_algo = (u8)psecuritypriv->dot11PrivacyAlgrthm;\
 		break;\
-	case dot11AuthAlgrthm_8021X:\
+	case dot11_auth_algrthm_8021X:\
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
index 7cb0c6f22..e19cae302 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -546,7 +546,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 		if (psecuritypriv->bWepDefaultKeyIdxSet == 0) {
 			/* wep default key has not been set, so use this key index as default key. */
 
-			psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Auto;
+			psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_Auto;
 			psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
 			psecuritypriv->dot11PrivacyAlgrthm = _WEP40_;
 			psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
@@ -616,7 +616,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 		goto exit;
 	}
 
-	if (psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_8021X && psta) { /*  psk/802_1x */
+	if (psecuritypriv->dot11_auth_algrthm == dot11_auth_algrthm_8021X && psta) { /*  psk/802_1x */
 		if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 			if (param->u.crypt.set_tx == 1) { /* pairwise key */
 				memcpy(psta->dot118021x_UncstKey.skey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
@@ -764,7 +764,7 @@ static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param
 		goto exit;
 	}
 
-	if (padapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) { /*  802_1x */
+	if (padapter->securitypriv.dot11_auth_algrthm == dot11_auth_algrthm_8021X) { /*  802_1x */
 		struct sta_info *psta, *pbcmc_sta;
 		struct sta_priv *pstapriv = &padapter->stapriv;
 
@@ -1323,26 +1323,26 @@ static int rtw_cfg80211_set_auth_type(struct security_priv *psecuritypriv,
 	switch (sme_auth_type) {
 	case NL80211_AUTHTYPE_AUTOMATIC:
 
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Auto;
+		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_Auto;
 
 		break;
 	case NL80211_AUTHTYPE_OPEN_SYSTEM:
 
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open;
+		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_Open;
 
 		if (psecuritypriv->ndisauthtype > Ndis802_11AuthModeWPA)
-			psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+			psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021X;
 
 		break;
 	case NL80211_AUTHTYPE_SHARED_KEY:
 
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Shared;
+		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_Shared;
 
 		psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
 
 		break;
 	default:
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open;
+		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_Open;
 		/* return -ENOTSUPP; */
 	}
 
@@ -1401,9 +1401,9 @@ static int rtw_cfg80211_set_key_mgt(struct security_priv *psecuritypriv, u32 key
 {
 	if (key_mgt == WLAN_AKM_SUITE_8021X)
 		/* auth_type = UMAC_AUTH_TYPE_8021X; */
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021X;
 	else if (key_mgt == WLAN_AKM_SUITE_PSK) {
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021X;
 	}
 
 	return 0;
@@ -1446,7 +1446,7 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 	pwpa = rtw_get_wpa_ie(buf, &wpa_ielen, ielen);
 	if (pwpa && wpa_ielen > 0) {
 		if (rtw_parse_wpa_ie(pwpa, wpa_ielen + 2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
-			padapter->securitypriv.dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+			padapter->securitypriv.dot11_auth_algrthm = dot11_auth_algrthm_8021X;
 			padapter->securitypriv.ndisauthtype = Ndis802_11AuthModeWPAPSK;
 			memcpy(padapter->securitypriv.supplicant_ie, &pwpa[0], wpa_ielen + 2);
 		}
@@ -1455,7 +1455,7 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 	pwpa2 = rtw_get_wpa2_ie(buf, &wpa2_ielen, ielen);
 	if (pwpa2 && wpa2_ielen > 0) {
 		if (rtw_parse_wpa2_ie(pwpa2, wpa2_ielen + 2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
-			padapter->securitypriv.dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
+			padapter->securitypriv.dot11_auth_algrthm = dot11_auth_algrthm_8021X;
 			padapter->securitypriv.ndisauthtype = Ndis802_11AuthModeWPA2PSK;
 			memcpy(padapter->securitypriv.supplicant_ie, &pwpa2[0], wpa2_ielen + 2);
 		}
@@ -1578,7 +1578,7 @@ static int cfg80211_rtw_join_ibss(struct wiphy *wiphy, struct net_device *ndev,
 	psecuritypriv->ndisencryptstatus = Ndis802_11EncryptionDisabled;
 	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
 	psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
-	psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open; /* open system */
+	psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_Open; /* open system */
 	psecuritypriv->ndisauthtype = Ndis802_11AuthModeOpen;
 
 	ret = rtw_cfg80211_set_auth_type(psecuritypriv, NL80211_AUTHTYPE_OPEN_SYSTEM);
@@ -1674,7 +1674,7 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 	psecuritypriv->ndisencryptstatus = Ndis802_11EncryptionDisabled;
 	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
 	psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
-	psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open; /* open system */
+	psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_Open; /* open system */
 	psecuritypriv->ndisauthtype = Ndis802_11AuthModeOpen;
 
 	ret = rtw_cfg80211_set_wpa_version(psecuritypriv, sme->crypto.wpa_versions);
@@ -1697,8 +1697,8 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 	}
 
 	/* For WEP Shared auth */
-	if ((psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_Shared ||
-	     psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_Auto) && sme->key) {
+	if ((psecuritypriv->dot11_auth_algrthm == dot11_auth_algrthm_Shared ||
+	     psecuritypriv->dot11_auth_algrthm == dot11_auth_algrthm_Auto) && sme->key) {
 		u32 wep_key_idx, wep_key_len, wep_total_len;
 		struct ndis_802_11_wep	 *pwep = NULL;
 
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 29939bf5a..18abd1f25 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -534,7 +534,7 @@ static void rtw_init_default_value(struct adapter *padapter)
 	psecuritypriv->sw_encrypt = pregistrypriv->software_encrypt;
 	psecuritypriv->sw_decrypt = pregistrypriv->software_decrypt;
 
-	psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open; /* open system */
+	psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_Open; /* open system */
 	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
 
 	psecuritypriv->dot11PrivacyKeyIndex = 0;
-- 
2.47.3

