Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D443E3F1671
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 13:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778507386; cv=none; b=mFrKQnzPSD+qweCTfwSpFYKd6RRKbt8DKHqObpdhAvaB5SIZyT0nAAE+pIV3+ur6rD2WeZtP2EV55B4Wxchl1cKE6tyrculrr6vbhb2ED0+qjZtEoyWcSjH3e1vz4FHVRJx5BkOkVDurfue3hwCqH2bKcyDYe4SNFYAE7iSCkb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778507386; c=relaxed/simple;
	bh=RxXOzIOm6/rT91AMASl3L6LWCwQslVg9e1noQZZntWk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u0HOSepXojecZEB7Rt3U8EZWRd86ZrqV2C7cm62RrR7msSq1CG2Iw7XA6lj55OU8yKRLuJAbA/pl9xIUIDUiItOM9Y60PVySnENEiAMlVfSeps8XSvMPyN4AyUvwJiqhKFsJ9C/5Twcm0RAYGWz4nBOGsVef2e7YypU4/IESxpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZrdEWNH; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZrdEWNH"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b9fcf7c91bso42775055ad.0
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 06:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778507384; x=1779112184; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ffDUvmQTcWDGM1UY0/4ZQQUW1n22YjNUQL/IgNwXVAE=;
        b=UZrdEWNHEvnWfdghoOGOU1x+2Uk+y91gcQ5HekfLBO4K7ajAsgCYvQxD9Caj5V4trN
         mozBh6WPXWsvRhEPvBx60N8sNYiDjAjPS4JlnApIA6TymmFhHencactTyk4j5TNqzkLK
         KpY7zHmopcOsGDRkMmGsuzmUVH2MwvgjMVaLin5s3b+lxI1zO2uKA59qTtQtQfkhIuRZ
         tR2xgh7encUJ5g/XljuzQpMBZauEt2iY6UGm/OHFiz0dhwx459EmlAa5rFI9j87XB2Hd
         IAGXqULVwKrnWcW98LMBbLLYZLUdhGMSy5CM6IHFz5NOzd49FNtqbqw0IDVw7Qzz2o1v
         qxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778507384; x=1779112184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ffDUvmQTcWDGM1UY0/4ZQQUW1n22YjNUQL/IgNwXVAE=;
        b=MyA5048VWcgfNM/c17okqVqD5WWfEQvhkNPGnr2QPG6yyYR369wgiO4iWig7HimxQ3
         VqQmm1yXyfXt+DlVZ4l00ujZJmIVUMM7UQSRYJgvxD1GyldIjpqq8qoUDNHxcawhNJ/J
         vChBHWyRoa/DirD4+eSNDHJfFkGGCCQHH4ElozsGGF4LB1pJ/nm1YjY+4nOl6Sy54v4g
         jAksbjuBWh7HZrxKAIoYMIaEgww9GIRbsNmfzIOpyD8kBnixTGTcNtR5Uv33puKryKp9
         2NSxH/VR9SVR8nCyEmFvtA1pThX0Y/KTBhmWRS2EgJF+w80fKs3O1yx43Am1ffpLjMCg
         tVYQ==
X-Gm-Message-State: AOJu0YyCEuEANw8Kc7Er26vEaVf2M0lVHB1mMZfzjkTIlJ4qR4J4LBcs
	QnOsZtwX27XaPL6KW5EcdJ5V4FVhUyNSVC0VY31msG0aVRz1oHamFqsrXQM5YhLlSMZtUt6C
X-Gm-Gg: Acq92OHwxzC6/GrEz6jDJEjcIvsmLtu6GqaIugKrSZdKxuWANd9q9zyuLkuZff+bYSS
	JFcIf/UUErFwrDZCoX1OnStfOpdsikUBlRE1SagzqPcie2chX/8sU6l1mfh3j+2cA54gzyYSt4y
	K+sjJ6xnoNIpP0XPIlo+8rf7BVvzJtYtq98RYEk4LZ4IspBLITGMyejCRVx73NQyUtDxP58/Tg7
	wqviPGbyhu5ecRhRnNBCZ/fOBk/HB+OnRB9QsYgEEzvtlmwEcCL12lr1y70YoCQVihmcS/HrYHE
	eLWexSwN2bca6IL3DzSu+WsZE9vLNdmkNoO73+2mCNYNYlJCjfB5NveVDk98lpIjUM/3S3THhK2
	1whc2R7QYIgqI4mlR3J707S9fTntjvbtHIIB0KbIwCrOuRqUtyZmp9debCEijie5YaPf23OF7Oa
	lsSeY22r/lNNDqU7YtK3FmC6Jl3yWGSQyW4s1iJyrqkh3fzj1GnWE=
X-Received: by 2002:a17:902:8207:b0:2b2:eaec:c810 with SMTP id d9443c01a7336-2ba79291528mr190387775ad.8.1778507384055;
        Mon, 11 May 2026 06:49:44 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e89d43sm110976935ad.63.2026.05.11.06.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:49:43 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename ndis_802_11_network_infrastructure enum values to uppercase
Date: Mon, 11 May 2026 20:49:30 +0700
Message-Id: <20260511134930.4086521-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename CamelCase enum values in enum ndis_802_11_network_infrastructure
to uppercase to comply with kernel coding style as reported by
checkpatch.pl.

Compile-tested only.

Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c        |  4 ++--
 drivers/staging/rtl8723bs/core/rtw_cmd.c       | 10 +++++-----
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 18 +++++++++---------
 drivers/staging/rtl8723bs/core/rtw_mlme.c      |  8 ++++----
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  | 14 +++++++-------
 drivers/staging/rtl8723bs/hal/hal_intf.c       |  8 ++++----
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c   |  6 +++---
 .../staging/rtl8723bs/include/wlan_bssdef.h    | 14 +++++++-------
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c  | 10 +++++-----
 drivers/staging/rtl8723bs/os_dep/os_intfs.c    |  2 +-
 10 files changed, 47 insertions(+), 47 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 4b4012411011..4d0e717a3d79 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -826,7 +826,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 	memcpy(ie, pbuf, pbss_network->ie_length);
 
-	if (pbss_network->infrastructure_mode != Ndis802_11APMode)
+	if (pbss_network->infrastructure_mode != NDIS_802_11_AP_MODE)
 		return _FAIL;
 
 	pbss_network->rssi = 0;
@@ -1954,7 +1954,7 @@ void rtw_ap_restore_network(struct adapter *padapter)
 	char chk_alive_list[NUM_STA];
 	int i;
 
-	rtw_setopmode_cmd(padapter, Ndis802_11APMode, false);
+	rtw_setopmode_cmd(padapter, NDIS_802_11_AP_MODE, false);
 
 	set_channel_bwmode(padapter,
 			   pmlmeext->cur_channel,
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index c1185c25ed36..a4caf4298a30 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -698,17 +698,17 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	/* for hidden ap to set fw_state here */
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE | WIFI_ADHOC_STATE) != true) {
 		switch (ndis_network_mode) {
-		case Ndis802_11IBSS:
+		case NDIS_802_11_IBSS:
 			set_fwstate(pmlmepriv, WIFI_ADHOC_STATE);
 			break;
 
-		case Ndis802_11Infrastructure:
+		case NDIS_802_11_INFRASTRUCTURE:
 			set_fwstate(pmlmepriv, WIFI_STATION_STATE);
 			break;
 
-		case Ndis802_11APMode:
-		case Ndis802_11AutoUnknown:
-		case Ndis802_11InfrastructureMax:
+		case NDIS_802_11_AP_MODE:
+		case NDIS_802_11_AUTO_UNKNOWN:
+		case NDIS_802_11_INFRASTRUCTURE_MAX:
 			break;
 		}
 	}
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index c70541f95a73..be597f7efe46 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -287,8 +287,8 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 	enum ndis_802_11_network_infrastructure *pold_state = &(cur_network->network.infrastructure_mode);
 
 	if (*pold_state != networktype) {
-		if (*pold_state == Ndis802_11APMode) {
-			/* change to other mode from Ndis802_11APMode */
+		if (*pold_state == NDIS_802_11_AP_MODE) {
+			/* change to other mode from AP mode */
 			cur_network->join_res = -1;
 
 			stop_ap_mode(padapter);
@@ -296,14 +296,14 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 
 		spin_lock_bh(&pmlmepriv->lock);
 
-		if ((check_fwstate(pmlmepriv, _FW_LINKED) == true) || (*pold_state == Ndis802_11IBSS))
+		if ((check_fwstate(pmlmepriv, _FW_LINKED) == true) || (*pold_state == NDIS_802_11_IBSS))
 			rtw_disassoc_cmd(padapter, 0, true);
 
 		if ((check_fwstate(pmlmepriv, _FW_LINKED) == true) ||
 			(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true))
 			rtw_free_assoc_resources(padapter, 1);
 
-		if ((*pold_state == Ndis802_11Infrastructure) || (*pold_state == Ndis802_11IBSS)) {
+		if ((*pold_state == NDIS_802_11_INFRASTRUCTURE) || (*pold_state == NDIS_802_11_IBSS)) {
 			if (check_fwstate(pmlmepriv, _FW_LINKED) == true)
 				rtw_indicate_disconnect(padapter); /* will clr Linked_state; before this function, we must have checked whether issue dis-assoc_cmd or not */
 		}
@@ -313,23 +313,23 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 		_clr_fwstate_(pmlmepriv, ~WIFI_NULL_STATE);
 
 		switch (networktype) {
-		case Ndis802_11IBSS:
+		case NDIS_802_11_IBSS:
 			set_fwstate(pmlmepriv, WIFI_ADHOC_STATE);
 			break;
 
-		case Ndis802_11Infrastructure:
+		case NDIS_802_11_INFRASTRUCTURE:
 			set_fwstate(pmlmepriv, WIFI_STATION_STATE);
 			break;
 
-		case Ndis802_11APMode:
+		case NDIS_802_11_AP_MODE:
 			set_fwstate(pmlmepriv, WIFI_AP_STATE);
 			start_ap_mode(padapter);
 			/* rtw_indicate_connect(padapter); */
 
 			break;
 
-		case Ndis802_11AutoUnknown:
-		case Ndis802_11InfrastructureMax:
+		case NDIS_802_11_AUTO_UNKNOWN:
+		case NDIS_802_11_INFRASTRUCTURE_MAX:
 			break;
 		}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index ddfc56f0253d..55450fa9936f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -51,7 +51,7 @@ int	rtw_init_mlme_priv(struct adapter *padapter)
 
 	pmlmepriv->pscanned = NULL;
 	pmlmepriv->fw_state = WIFI_STATION_STATE; /*  Must sync with rtw_wdev_alloc() */
-	pmlmepriv->cur_network.network.infrastructure_mode = Ndis802_11AutoUnknown;
+	pmlmepriv->cur_network.network.infrastructure_mode = NDIS_802_11_AUTO_UNKNOWN;
 	pmlmepriv->scan_mode = SCAN_ACTIVE;/*  1: active, 0: passive. Maybe someday we should rename this varable to "active_mode" (Jeff) */
 
 	spin_lock_init(&pmlmepriv->lock);
@@ -1056,7 +1056,7 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 
 	/* update fw_state will clr _FW_UNDER_LINKING here indirectly */
 	switch (pnetwork->network.infrastructure_mode) {
-	case Ndis802_11Infrastructure:
+	case NDIS_802_11_INFRASTRUCTURE:
 
 			if (pmlmepriv->fw_state & WIFI_UNDER_WPS)
 				pmlmepriv->fw_state = WIFI_STATION_STATE | WIFI_UNDER_WPS;
@@ -1064,7 +1064,7 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 				pmlmepriv->fw_state = WIFI_STATION_STATE;
 
 			break;
-	case Ndis802_11IBSS:
+	case NDIS_802_11_IBSS:
 			pmlmepriv->fw_state = WIFI_ADHOC_STATE;
 			break;
 	default:
@@ -2145,7 +2145,7 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 
 	pdev_network->configuration.ds_config = (pregistrypriv->channel);
 
-	if (cur_network->network.infrastructure_mode == Ndis802_11IBSS)
+	if (cur_network->network.infrastructure_mode == NDIS_802_11_IBSS)
 		pdev_network->configuration.atim_window = (0);
 
 	pdev_network->infrastructure_mode = (cur_network->network.infrastructure_mode);
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 5f00fe282d1b..954dc467902f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -4003,10 +4003,10 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 	val16 = rtw_get_capability((struct wlan_bssid_ex *)bssid);
 
 	if (val16 & BIT(0)) {
-		bssid->infrastructure_mode = Ndis802_11Infrastructure;
+		bssid->infrastructure_mode = NDIS_802_11_INFRASTRUCTURE;
 		memcpy(bssid->mac_address, GetAddr2Ptr(pframe), ETH_ALEN);
 	} else {
-		bssid->infrastructure_mode = Ndis802_11IBSS;
+		bssid->infrastructure_mode = NDIS_802_11_IBSS;
 		memcpy(bssid->mac_address, GetAddr3Ptr(pframe), ETH_ALEN);
 	}
 
@@ -5171,15 +5171,15 @@ u8 setopmode_hdl(struct adapter *padapter, u8 *pbuf)
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct setopmode_parm *psetop = (struct setopmode_parm *)pbuf;
 
-	if (psetop->mode == Ndis802_11APMode) {
+	if (psetop->mode == NDIS_802_11_AP_MODE) {
 		pmlmeinfo->state = WIFI_FW_AP_STATE;
 		type = _HW_STATE_AP_;
 		/* start_ap_mode(padapter); */
-	} else if (psetop->mode == Ndis802_11Infrastructure) {
+	} else if (psetop->mode == NDIS_802_11_INFRASTRUCTURE) {
 		pmlmeinfo->state &= ~(BIT(0) | BIT(1));/*  clear state */
 		pmlmeinfo->state |= WIFI_FW_STATION_STATE;/* set to	STATION_STATE */
 		type = _HW_STATE_STATION_;
-	} else if (psetop->mode == Ndis802_11IBSS) {
+	} else if (psetop->mode == NDIS_802_11_IBSS) {
 		type = _HW_STATE_ADHOC_;
 	} else {
 		type = _HW_STATE_NOLINK_;
@@ -5188,7 +5188,7 @@ u8 setopmode_hdl(struct adapter *padapter, u8 *pbuf)
 	rtw_hal_set_hwreg(padapter, HW_VAR_SET_OPMODE, (u8 *)(&type));
 	/* set_msr(padapter, type); */
 
-	if (psetop->mode == Ndis802_11APMode) {
+	if (psetop->mode == NDIS_802_11_AP_MODE) {
 		/*  Do this after port switch to */
 		/*  prevent from downloading rsvd page to wrong port */
 		rtw_btcoex_MediaStatusNotify(padapter, 1); /* connect */
@@ -5211,7 +5211,7 @@ u8 createbss_hdl(struct adapter *padapter, u8 *pbuf)
 	}
 
 	/* below is for ad-hoc master */
-	if (pparm->network.infrastructure_mode == Ndis802_11IBSS) {
+	if (pparm->network.infrastructure_mode == NDIS_802_11_IBSS) {
 		rtw_joinbss_reset(padapter);
 
 		pmlmeext->cur_bwmode = CHANNEL_WIDTH_20;
diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 27c0c0198714..671c88b94737 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -40,18 +40,18 @@ void rtw_hal_dm_init(struct adapter *padapter)
 
 static void rtw_hal_init_opmode(struct adapter *padapter)
 {
-	enum ndis_802_11_network_infrastructure networkType = Ndis802_11InfrastructureMax;
+	enum ndis_802_11_network_infrastructure networkType = NDIS_802_11_INFRASTRUCTURE_MAX;
 	struct  mlme_priv *pmlmepriv = &(padapter->mlmepriv);
 	signed int fw_state;
 
 	fw_state = get_fwstate(pmlmepriv);
 
 	if (fw_state & WIFI_ADHOC_STATE)
-		networkType = Ndis802_11IBSS;
+		networkType = NDIS_802_11_IBSS;
 	else if (fw_state & WIFI_STATION_STATE)
-		networkType = Ndis802_11Infrastructure;
+		networkType = NDIS_802_11_INFRASTRUCTURE;
 	else if (fw_state & WIFI_AP_STATE)
-		networkType = Ndis802_11APMode;
+		networkType = NDIS_802_11_AP_MODE;
 	else
 		return;
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 12416e499ac3..c8f5778f17fc 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -245,19 +245,19 @@ static void ConstructNullFunctionData(
 		SetPwrMgt(fctrl);
 
 	switch (cur_network->network.infrastructure_mode) {
-	case Ndis802_11Infrastructure:
+	case NDIS_802_11_INFRASTRUCTURE:
 		SetToDs(fctrl);
 		ether_addr_copy(pwlanhdr->addr1, get_my_bssid(&(pmlmeinfo->network)));
 		ether_addr_copy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)));
 		ether_addr_copy(pwlanhdr->addr3, StaAddr);
 		break;
-	case Ndis802_11APMode:
+	case NDIS_802_11_AP_MODE:
 		SetFrDs(fctrl);
 		ether_addr_copy(pwlanhdr->addr1, StaAddr);
 		ether_addr_copy(pwlanhdr->addr2, get_my_bssid(&(pmlmeinfo->network)));
 		ether_addr_copy(pwlanhdr->addr3, myid(&(padapter->eeprompriv)));
 		break;
-	case Ndis802_11IBSS:
+	case NDIS_802_11_IBSS:
 	default:
 		ether_addr_copy(pwlanhdr->addr1, StaAddr);
 		ether_addr_copy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)));
diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index 812a68394268..da1b22e7a9aa 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -43,11 +43,11 @@ struct ndis_802_11_conf {
 };
 
 enum ndis_802_11_network_infrastructure {
-	Ndis802_11IBSS,
-	Ndis802_11Infrastructure,
-	Ndis802_11AutoUnknown,
-	Ndis802_11InfrastructureMax,     /*  Not a real value, defined as upper bound */
-	Ndis802_11APMode,
+	NDIS_802_11_IBSS,
+	NDIS_802_11_INFRASTRUCTURE,
+	NDIS_802_11_AUTO_UNKNOWN,
+	NDIS_802_11_INFRASTRUCTURE_MAX,     /*  Not a real value, defined as upper bound */
+	NDIS_802_11_AP_MODE,
 };
 
 struct ndis_802_11_fix_ie {
@@ -125,8 +125,8 @@ struct ndis_802_11_wep {
 /*  MIC check time, 60 seconds. */
 #define MIC_CHECK_TIME	60000000
 
-#ifndef Ndis802_11APMode
-#define Ndis802_11APMode (Ndis802_11InfrastructureMax + 1)
+#ifndef NDIS_802_11_AP_MODE
+#define NDIS_802_11_AP_MODE (NDIS_802_11_INFRASTRUCTURE_MAX + 1)
 #endif
 
 struct wlan_phy_info {
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index fd3bae31b0ed..6303121ad3f5 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1059,13 +1059,13 @@ static int cfg80211_rtw_change_iface(struct wiphy *wiphy,
 
 	switch (type) {
 	case NL80211_IFTYPE_ADHOC:
-		networkType = Ndis802_11IBSS;
+		networkType = NDIS_802_11_IBSS;
 		break;
 	case NL80211_IFTYPE_STATION:
-		networkType = Ndis802_11Infrastructure;
+		networkType = NDIS_802_11_INFRASTRUCTURE;
 		break;
 	case NL80211_IFTYPE_AP:
-		networkType = Ndis802_11APMode;
+		networkType = NDIS_802_11_AP_MODE;
 		break;
 	default:
 		ret = -EOPNOTSUPP;
@@ -1610,12 +1610,12 @@ static int cfg80211_rtw_leave_ibss(struct wiphy *wiphy, struct net_device *ndev)
 
 		rtw_wdev->iftype = NL80211_IFTYPE_STATION;
 
-		if (rtw_set_802_11_infrastructure_mode(padapter, Ndis802_11Infrastructure) == false) {
+		if (rtw_set_802_11_infrastructure_mode(padapter, NDIS_802_11_INFRASTRUCTURE) == false) {
 			rtw_wdev->iftype = old_type;
 			ret = -EPERM;
 			goto leave_ibss;
 		}
-		rtw_setopmode_cmd(padapter, Ndis802_11Infrastructure, true);
+		rtw_setopmode_cmd(padapter, NDIS_802_11_INFRASTRUCTURE, true);
 	}
 
 leave_ibss:
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index e943dcea1a21..325644236bc7 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -19,7 +19,7 @@ static int rtw_rfintfs = HWPI;
 static int rtw_lbkmode;/* RTL8712_AIR_TRX; */
 
 
-static int rtw_network_mode = Ndis802_11IBSS;/* Ndis802_11Infrastructure;infra, ad-hoc, auto */
+static int rtw_network_mode = NDIS_802_11_IBSS;/* NDIS_802_11_INFRASTRUCTURE;infra, ad-hoc, auto */
 /* struct ndis_802_11_ssid	ssid; */
 static int rtw_channel = 1;/* ad-hoc support requirement */
 static int rtw_wireless_mode = WIRELESS_11BG_24N;
-- 
2.25.1

