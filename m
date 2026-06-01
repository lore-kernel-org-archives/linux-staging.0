Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828882C0268
	for <linux-staging@lists.linux.dev>; Mon,  1 Jun 2026 16:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780330288; cv=none; b=Y5NLwseOKt4dpWvp/RjEHAgGsB0amkbGCKA5jhOfU0y8hwjYsfAtT+lZP/HlA4hj1YQd3M878RRs3R9h4LHdpysMArw1Gu5B38FTtbxcZaqn5KtXeWjrL9TiJaA/E33DLKFBAKwrX4h7ueMrqsqFmBcawiiAKLMBQrMnGTJ5i6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780330288; c=relaxed/simple;
	bh=H7eDTqseq6cv78i7dJ+2EYOo7noO6WFHZKFGTlwDCLk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CiSVjza+RMLRB5wZRaxo8zpju0x0GAVF/q1PIFRHjXinqlvtUgMlle029iA33WI1SzKb8kh8fh9qGggdOsyjP7eRGTsjauFgZe73VPZ7HKmgCdcgbuMtf/MHJf2ts36y9MrBMjoZDvCFO+rRPqFJGO3IEV4g4u0eluCieJ0Qg64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ofkukSX6; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ofkukSX6"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c8585cd8400so724587a12.3
        for <linux-staging@lists.linux.dev>; Mon, 01 Jun 2026 09:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780330286; x=1780935086; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ukqpC/Wwyxi0wL9G3D/InzysAyew8ct8T6ZPP6vHmE=;
        b=ofkukSX6Uk5/QBaJ/vovUttQxakqQ8I9S9MxsxN7vTOoLv2aqCLZeSrCAl4dVLWrD5
         xW0N74o6i+rPYT96JeIa4at9cuN2JEvFvTLG+WhBJB3Ie3QG31f5IxZm0lbgWiq6TFpM
         JcPAT6A4YFoa5YY4a7bq5S7WpCRJD4xp03O6RA1V1fA+YJzVV28Xs5j5xqnv/0Fqclbj
         6INKv/C8zm4inU04puM3OvlB14O5z7wTYEGdrHeLUriAxs4UKg5E3KqzY0Dn/tk9RWJu
         GwLGxsSkgJqKDra3bEZy1VhMAQ5bqeJ4YiJXh7XGcICgbh6A3RD9JmXYrs7j1rz/yI+x
         1BTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780330286; x=1780935086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ukqpC/Wwyxi0wL9G3D/InzysAyew8ct8T6ZPP6vHmE=;
        b=mXyzpDvkBiGvs5q1l5iv4LYkXpEGN3KZIz8/v5wssCV95GeZ6eAV/Y63AAb1nHSnHN
         N4ijJFdpnDLRigl7fq0kObzclsSWkHFJmRto5K5Ua+UVXwc81KdKgmmAfSkulTWfpAQW
         cSD855m7O7M/uNWEChLQsr3YXI2LNzgaOJLwBg7IyykZJOyP5IrPApIeY9f3R879kGim
         +M51vnm8IEShlC7fHABsiAY39yl+eZTwlR/kJehDjZJ3z+y0zpXqceL27HBwcwfuOklc
         HngIeZVsBQgaNBn4b7wuM2hQMddv5hv8UdeyX9nOvpggChKSSl82KHNkaoH01JDm/bcI
         mwLQ==
X-Gm-Message-State: AOJu0Yyf8VmiSlwxrRoRu3dnJauIqMZYyvkHsK4pI9XupbCZYHu46rkz
	sJLLEYNwVi6OuqPwulgBexZ23G1iWT7bqDsEc+4TlnOMDkQrcr9Z/UVjK/sHVT5H
X-Gm-Gg: Acq92OG19730cXOIVXj+i3yMUL0cD3XBbzblQwRbG5+1V/JjYaNdkfcYCihUU/+NR6E
	ms3oTEKPac5lGB1H0K3KVHOFc/0+qv2n0ltkU0KIFNTHG5tiBol8iQNwhLRfAksgPL6y4Dl5e46
	jEIzZQ/+dnibNfaKOXmNUwyC62H2ep+DRrTS3/U9DrrYrXO42y+Iyx5r9W9REVKOmwnhmfXQEML
	NiHdw9CQg8JnomBAj4hURcbdmPdJ/YFe3QkcWqlkNNWQtyJgO+bWj+jr1WLvDHdqRw+XIPDwmyG
	buyD+2E+hMgDZ7m5b4/OUuUpAceWWpNN+8xRZd80NEpSTkxyR25ZBspFDIg4qEHGCBRj3leVzbo
	1dzB1HMpgOLN+Uvy6Ido3GXBFUtNl0ia8eqbbY8Dn7ys6Wf67kFVaruKsocOoVu6xbMHeGJzlPD
	UdbM4YoFe6rXQ2cgr6khtMzbJ0wZb2VjCdFy50mxe8gJ+ulQ1KI3GyZuKIekH4ew==
X-Received: by 2002:a05:6a21:398e:b0:3b3:258f:7a1 with SMTP id adf61e73a8af0-3b427e9c891mr12557318637.15.1780330285440;
        Mon, 01 Jun 2026 09:11:25 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84238500528sm6129800b3a.54.2026.06.01.09.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 09:11:24 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: use nl80211_iftype instead of custom NDIS enum
Date: Mon,  1 Jun 2026 23:10:51 +0700
Message-Id: <20260601161051.1832080-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver defined its own enum ndis_802_11_network_infrastructure to
represent the operating mode (STA/AP/IBSS) and translated nl80211 iftypes
into it in cfg80211_rtw_change_iface(). The kernel already provides
enum nl80211_iftype for this purpose, so use it directly and drop the
redundant translation layer.

Map the removed values as follows:
  Ndis802_11IBSS           -> NL80211_IFTYPE_ADHOC
  Ndis802_11Infrastructure -> NL80211_IFTYPE_STATION
  Ndis802_11APMode         -> NL80211_IFTYPE_AP
  Ndis802_11AutoUnknown    -> NL80211_IFTYPE_UNSPECIFIED

Compile-tested only.

Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
Changes in v2:
  - Replace the custom enum ndis_802_11_network_infrastructure with the
    standard enum nl80211_iftype and drop the translation layer, instead
    of just renaming the enum values to uppercase (Greg Kroah-Hartman).

v1: https://lore.kernel.org/linux-staging/20260511134930.4086521-1-congnt264@gmail.com/

 drivers/staging/rtl8723bs/core/rtw_ap.c       |  4 ++--
 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 12 ++++------
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    | 21 ++++++++---------
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  8 +++----
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 14 +++++------
 drivers/staging/rtl8723bs/hal/hal_intf.c      |  8 +++----
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |  6 ++---
 drivers/staging/rtl8723bs/include/rtw_cmd.h   |  2 +-
 .../staging/rtl8723bs/include/rtw_ioctl_set.h |  2 +-
 .../staging/rtl8723bs/include/wlan_bssdef.h   | 14 +----------
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 23 ++++++-------------
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  2 +-
 12 files changed, 46 insertions(+), 70 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 4b4012411011..ddac8dd9250f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -826,7 +826,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 	memcpy(ie, pbuf, pbss_network->ie_length);
 
-	if (pbss_network->infrastructure_mode != Ndis802_11APMode)
+	if (pbss_network->infrastructure_mode != NL80211_IFTYPE_AP)
 		return _FAIL;
 
 	pbss_network->rssi = 0;
@@ -1954,7 +1954,7 @@ void rtw_ap_restore_network(struct adapter *padapter)
 	char chk_alive_list[NUM_STA];
 	int i;
 
-	rtw_setopmode_cmd(padapter, Ndis802_11APMode, false);
+	rtw_setopmode_cmd(padapter, NL80211_IFTYPE_AP, false);
 
 	set_channel_bwmode(padapter,
 			   pmlmeext->cur_channel,
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index c1185c25ed36..e03aa0ba13dc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -681,7 +681,7 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
 	struct ht_priv *phtpriv = &pmlmepriv->htpriv;
-	enum ndis_802_11_network_infrastructure ndis_network_mode = pnetwork->network.infrastructure_mode;
+	enum nl80211_iftype ndis_network_mode = pnetwork->network.infrastructure_mode;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u32 tmp_len;
@@ -698,17 +698,15 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	/* for hidden ap to set fw_state here */
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE | WIFI_ADHOC_STATE) != true) {
 		switch (ndis_network_mode) {
-		case Ndis802_11IBSS:
+		case NL80211_IFTYPE_ADHOC:
 			set_fwstate(pmlmepriv, WIFI_ADHOC_STATE);
 			break;
 
-		case Ndis802_11Infrastructure:
+		case NL80211_IFTYPE_STATION:
 			set_fwstate(pmlmepriv, WIFI_STATION_STATE);
 			break;
 
-		case Ndis802_11APMode:
-		case Ndis802_11AutoUnknown:
-		case Ndis802_11InfrastructureMax:
+		default:
 			break;
 		}
 	}
@@ -824,7 +822,7 @@ u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deauth_timeout_ms, bool enqueu
 	return res;
 }
 
-u8 rtw_setopmode_cmd(struct adapter  *padapter, enum ndis_802_11_network_infrastructure networktype, bool enqueue)
+u8 rtw_setopmode_cmd(struct adapter  *padapter, enum nl80211_iftype networktype, bool enqueue)
 {
 	struct	cmd_obj *ph2c;
 	struct	setopmode_parm *psetop;
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index c70541f95a73..9e3cb0f1d418 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -280,15 +280,15 @@ u8 rtw_set_802_11_connect(struct adapter *padapter, u8 *bssid, struct ndis_802_1
 }
 
 u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
-	enum ndis_802_11_network_infrastructure networktype)
+	enum nl80211_iftype networktype)
 {
 	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct	wlan_network	*cur_network = &pmlmepriv->cur_network;
-	enum ndis_802_11_network_infrastructure *pold_state = &(cur_network->network.infrastructure_mode);
+	enum nl80211_iftype *pold_state = &(cur_network->network.infrastructure_mode);
 
 	if (*pold_state != networktype) {
-		if (*pold_state == Ndis802_11APMode) {
-			/* change to other mode from Ndis802_11APMode */
+		if (*pold_state == NL80211_IFTYPE_AP) {
+			/* change to other mode from AP mode */
 			cur_network->join_res = -1;
 
 			stop_ap_mode(padapter);
@@ -296,14 +296,14 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 
 		spin_lock_bh(&pmlmepriv->lock);
 
-		if ((check_fwstate(pmlmepriv, _FW_LINKED) == true) || (*pold_state == Ndis802_11IBSS))
+		if ((check_fwstate(pmlmepriv, _FW_LINKED) == true) || (*pold_state == NL80211_IFTYPE_ADHOC))
 			rtw_disassoc_cmd(padapter, 0, true);
 
 		if ((check_fwstate(pmlmepriv, _FW_LINKED) == true) ||
 			(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true))
 			rtw_free_assoc_resources(padapter, 1);
 
-		if ((*pold_state == Ndis802_11Infrastructure) || (*pold_state == Ndis802_11IBSS)) {
+		if ((*pold_state == NL80211_IFTYPE_STATION) || (*pold_state == NL80211_IFTYPE_ADHOC)) {
 			if (check_fwstate(pmlmepriv, _FW_LINKED) == true)
 				rtw_indicate_disconnect(padapter); /* will clr Linked_state; before this function, we must have checked whether issue dis-assoc_cmd or not */
 		}
@@ -313,23 +313,22 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 		_clr_fwstate_(pmlmepriv, ~WIFI_NULL_STATE);
 
 		switch (networktype) {
-		case Ndis802_11IBSS:
+		case NL80211_IFTYPE_ADHOC:
 			set_fwstate(pmlmepriv, WIFI_ADHOC_STATE);
 			break;
 
-		case Ndis802_11Infrastructure:
+		case NL80211_IFTYPE_STATION:
 			set_fwstate(pmlmepriv, WIFI_STATION_STATE);
 			break;
 
-		case Ndis802_11APMode:
+		case NL80211_IFTYPE_AP:
 			set_fwstate(pmlmepriv, WIFI_AP_STATE);
 			start_ap_mode(padapter);
 			/* rtw_indicate_connect(padapter); */
 
 			break;
 
-		case Ndis802_11AutoUnknown:
-		case Ndis802_11InfrastructureMax:
+		default:
 			break;
 		}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index ddfc56f0253d..961f6ca7b691 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -51,7 +51,7 @@ int	rtw_init_mlme_priv(struct adapter *padapter)
 
 	pmlmepriv->pscanned = NULL;
 	pmlmepriv->fw_state = WIFI_STATION_STATE; /*  Must sync with rtw_wdev_alloc() */
-	pmlmepriv->cur_network.network.infrastructure_mode = Ndis802_11AutoUnknown;
+	pmlmepriv->cur_network.network.infrastructure_mode = NL80211_IFTYPE_UNSPECIFIED;
 	pmlmepriv->scan_mode = SCAN_ACTIVE;/*  1: active, 0: passive. Maybe someday we should rename this varable to "active_mode" (Jeff) */
 
 	spin_lock_init(&pmlmepriv->lock);
@@ -1056,7 +1056,7 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 
 	/* update fw_state will clr _FW_UNDER_LINKING here indirectly */
 	switch (pnetwork->network.infrastructure_mode) {
-	case Ndis802_11Infrastructure:
+	case NL80211_IFTYPE_STATION:
 
 			if (pmlmepriv->fw_state & WIFI_UNDER_WPS)
 				pmlmepriv->fw_state = WIFI_STATION_STATE | WIFI_UNDER_WPS;
@@ -1064,7 +1064,7 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 				pmlmepriv->fw_state = WIFI_STATION_STATE;
 
 			break;
-	case Ndis802_11IBSS:
+	case NL80211_IFTYPE_ADHOC:
 			pmlmepriv->fw_state = WIFI_ADHOC_STATE;
 			break;
 	default:
@@ -2145,7 +2145,7 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 
 	pdev_network->configuration.ds_config = (pregistrypriv->channel);
 
-	if (cur_network->network.infrastructure_mode == Ndis802_11IBSS)
+	if (cur_network->network.infrastructure_mode == NL80211_IFTYPE_ADHOC)
 		pdev_network->configuration.atim_window = (0);
 
 	pdev_network->infrastructure_mode = (cur_network->network.infrastructure_mode);
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 5f00fe282d1b..0fba1639b20b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -4003,10 +4003,10 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 	val16 = rtw_get_capability((struct wlan_bssid_ex *)bssid);
 
 	if (val16 & BIT(0)) {
-		bssid->infrastructure_mode = Ndis802_11Infrastructure;
+		bssid->infrastructure_mode = NL80211_IFTYPE_STATION;
 		memcpy(bssid->mac_address, GetAddr2Ptr(pframe), ETH_ALEN);
 	} else {
-		bssid->infrastructure_mode = Ndis802_11IBSS;
+		bssid->infrastructure_mode = NL80211_IFTYPE_ADHOC;
 		memcpy(bssid->mac_address, GetAddr3Ptr(pframe), ETH_ALEN);
 	}
 
@@ -5171,15 +5171,15 @@ u8 setopmode_hdl(struct adapter *padapter, u8 *pbuf)
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct setopmode_parm *psetop = (struct setopmode_parm *)pbuf;
 
-	if (psetop->mode == Ndis802_11APMode) {
+	if (psetop->mode == NL80211_IFTYPE_AP) {
 		pmlmeinfo->state = WIFI_FW_AP_STATE;
 		type = _HW_STATE_AP_;
 		/* start_ap_mode(padapter); */
-	} else if (psetop->mode == Ndis802_11Infrastructure) {
+	} else if (psetop->mode == NL80211_IFTYPE_STATION) {
 		pmlmeinfo->state &= ~(BIT(0) | BIT(1));/*  clear state */
 		pmlmeinfo->state |= WIFI_FW_STATION_STATE;/* set to	STATION_STATE */
 		type = _HW_STATE_STATION_;
-	} else if (psetop->mode == Ndis802_11IBSS) {
+	} else if (psetop->mode == NL80211_IFTYPE_ADHOC) {
 		type = _HW_STATE_ADHOC_;
 	} else {
 		type = _HW_STATE_NOLINK_;
@@ -5188,7 +5188,7 @@ u8 setopmode_hdl(struct adapter *padapter, u8 *pbuf)
 	rtw_hal_set_hwreg(padapter, HW_VAR_SET_OPMODE, (u8 *)(&type));
 	/* set_msr(padapter, type); */
 
-	if (psetop->mode == Ndis802_11APMode) {
+	if (psetop->mode == NL80211_IFTYPE_AP) {
 		/*  Do this after port switch to */
 		/*  prevent from downloading rsvd page to wrong port */
 		rtw_btcoex_MediaStatusNotify(padapter, 1); /* connect */
@@ -5211,7 +5211,7 @@ u8 createbss_hdl(struct adapter *padapter, u8 *pbuf)
 	}
 
 	/* below is for ad-hoc master */
-	if (pparm->network.infrastructure_mode == Ndis802_11IBSS) {
+	if (pparm->network.infrastructure_mode == NL80211_IFTYPE_ADHOC) {
 		rtw_joinbss_reset(padapter);
 
 		pmlmeext->cur_bwmode = CHANNEL_WIDTH_20;
diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 27c0c0198714..d0b5e572d7d4 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -40,18 +40,18 @@ void rtw_hal_dm_init(struct adapter *padapter)
 
 static void rtw_hal_init_opmode(struct adapter *padapter)
 {
-	enum ndis_802_11_network_infrastructure networkType = Ndis802_11InfrastructureMax;
+	enum nl80211_iftype networkType = NL80211_IFTYPE_UNSPECIFIED;
 	struct  mlme_priv *pmlmepriv = &(padapter->mlmepriv);
 	signed int fw_state;
 
 	fw_state = get_fwstate(pmlmepriv);
 
 	if (fw_state & WIFI_ADHOC_STATE)
-		networkType = Ndis802_11IBSS;
+		networkType = NL80211_IFTYPE_ADHOC;
 	else if (fw_state & WIFI_STATION_STATE)
-		networkType = Ndis802_11Infrastructure;
+		networkType = NL80211_IFTYPE_STATION;
 	else if (fw_state & WIFI_AP_STATE)
-		networkType = Ndis802_11APMode;
+		networkType = NL80211_IFTYPE_AP;
 	else
 		return;
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 12416e499ac3..467d369a16d9 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -245,19 +245,19 @@ static void ConstructNullFunctionData(
 		SetPwrMgt(fctrl);
 
 	switch (cur_network->network.infrastructure_mode) {
-	case Ndis802_11Infrastructure:
+	case NL80211_IFTYPE_STATION:
 		SetToDs(fctrl);
 		ether_addr_copy(pwlanhdr->addr1, get_my_bssid(&(pmlmeinfo->network)));
 		ether_addr_copy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)));
 		ether_addr_copy(pwlanhdr->addr3, StaAddr);
 		break;
-	case Ndis802_11APMode:
+	case NL80211_IFTYPE_AP:
 		SetFrDs(fctrl);
 		ether_addr_copy(pwlanhdr->addr1, StaAddr);
 		ether_addr_copy(pwlanhdr->addr2, get_my_bssid(&(pmlmeinfo->network)));
 		ether_addr_copy(pwlanhdr->addr3, myid(&(padapter->eeprompriv)));
 		break;
-	case Ndis802_11IBSS:
+	case NL80211_IFTYPE_ADHOC:
 	default:
 		ether_addr_copy(pwlanhdr->addr1, StaAddr);
 		ether_addr_copy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)));
diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/staging/rtl8723bs/include/rtw_cmd.h
index c4c3edee809d..a42493f2fa6d 100644
--- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
@@ -586,7 +586,7 @@ extern u8 rtw_clearstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8
 
 extern u8 rtw_joinbss_cmd(struct adapter *padapter, struct wlan_network *pnetwork);
 u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deauth_timeout_ms, bool enqueue);
-extern u8 rtw_setopmode_cmd(struct adapter  *padapter, enum ndis_802_11_network_infrastructure networktype, bool enqueue);
+extern u8 rtw_setopmode_cmd(struct adapter  *padapter, enum nl80211_iftype networktype, bool enqueue);
 extern u8 rtw_setrfintfs_cmd(struct adapter  *padapter, u8 mode);
 
 extern u8 rtw_gettssi_cmd(struct adapter  *padapter, u8 offset, u8 *pval);
diff --git a/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h b/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
index ab349de733c8..5c6cfc482731 100644
--- a/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
+++ b/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
@@ -14,7 +14,7 @@ u8 rtw_set_802_11_authentication_mode(struct adapter *pdapter, enum ndis_802_11_
 u8 rtw_set_802_11_add_wep(struct adapter *padapter, struct ndis_802_11_wep *wep);
 u8 rtw_set_802_11_disassociate(struct adapter *padapter);
 u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter, struct ndis_802_11_ssid *pssid, int ssid_max_num);
-u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter, enum ndis_802_11_network_infrastructure networktype);
+u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter, enum nl80211_iftype networktype);
 u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid);
 u8 rtw_set_802_11_connect(struct adapter *padapter, u8 *bssid, struct ndis_802_11_ssid *ssid);
 
diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index 812a68394268..bcc5a1712670 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -42,14 +42,6 @@ struct ndis_802_11_conf {
 	u32 ds_config;           /*  Frequency, units are kHz */
 };
 
-enum ndis_802_11_network_infrastructure {
-	Ndis802_11IBSS,
-	Ndis802_11Infrastructure,
-	Ndis802_11AutoUnknown,
-	Ndis802_11InfrastructureMax,     /*  Not a real value, defined as upper bound */
-	Ndis802_11APMode,
-};
-
 struct ndis_802_11_fix_ie {
 	u8  time_stamp[8];
 	u16  beacon_interval;
@@ -125,10 +117,6 @@ struct ndis_802_11_wep {
 /*  MIC check time, 60 seconds. */
 #define MIC_CHECK_TIME	60000000
 
-#ifndef Ndis802_11APMode
-#define Ndis802_11APMode (Ndis802_11InfrastructureMax + 1)
-#endif
-
 struct wlan_phy_info {
 	u8 signal_strength;/* in percentage) */
 	u8 signal_quality;/* in percentage) */
@@ -161,7 +149,7 @@ struct wlan_bssid_ex {
 	long  rssi;/* in dBM, raw data , get from PHY) */
 	enum ndis_802_11_network_type  network_type_in_use;
 	struct ndis_802_11_conf  configuration;
-	enum ndis_802_11_network_infrastructure  infrastructure_mode;
+	enum nl80211_iftype  infrastructure_mode;
 	NDIS_802_11_RATES_EX  supported_rates;
 	struct wlan_phy_info phy_info;
 	u32  ie_length;
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index fd3bae31b0ed..cd8fa486404f 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1027,7 +1027,6 @@ static int cfg80211_rtw_change_iface(struct wiphy *wiphy,
 				     struct vif_params *params)
 {
 	enum nl80211_iftype old_type;
-	enum ndis_802_11_network_infrastructure networkType;
 	struct adapter *padapter = rtw_netdev_priv(ndev);
 	struct wireless_dev *rtw_wdev = padapter->rtw_wdev;
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
@@ -1057,30 +1056,22 @@ static int cfg80211_rtw_change_iface(struct wiphy *wiphy,
 		pmlmeext->action_public_dialog_token = 0xff;
 	}
 
-	switch (type) {
-	case NL80211_IFTYPE_ADHOC:
-		networkType = Ndis802_11IBSS;
-		break;
-	case NL80211_IFTYPE_STATION:
-		networkType = Ndis802_11Infrastructure;
-		break;
-	case NL80211_IFTYPE_AP:
-		networkType = Ndis802_11APMode;
-		break;
-	default:
+	if (type != NL80211_IFTYPE_ADHOC &&
+	    type != NL80211_IFTYPE_STATION &&
+	    type != NL80211_IFTYPE_AP) {
 		ret = -EOPNOTSUPP;
 		goto exit;
 	}
 
 	rtw_wdev->iftype = type;
 
-	if (rtw_set_802_11_infrastructure_mode(padapter, networkType) == false) {
+	if (rtw_set_802_11_infrastructure_mode(padapter, type) == false) {
 		rtw_wdev->iftype = old_type;
 		ret = -EPERM;
 		goto exit;
 	}
 
-	rtw_setopmode_cmd(padapter, networkType, true);
+	rtw_setopmode_cmd(padapter, type, true);
 
 exit:
 
@@ -1610,12 +1601,12 @@ static int cfg80211_rtw_leave_ibss(struct wiphy *wiphy, struct net_device *ndev)
 
 		rtw_wdev->iftype = NL80211_IFTYPE_STATION;
 
-		if (rtw_set_802_11_infrastructure_mode(padapter, Ndis802_11Infrastructure) == false) {
+		if (rtw_set_802_11_infrastructure_mode(padapter, NL80211_IFTYPE_STATION) == false) {
 			rtw_wdev->iftype = old_type;
 			ret = -EPERM;
 			goto leave_ibss;
 		}
-		rtw_setopmode_cmd(padapter, Ndis802_11Infrastructure, true);
+		rtw_setopmode_cmd(padapter, NL80211_IFTYPE_STATION, true);
 	}
 
 leave_ibss:
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index e943dcea1a21..c33a3137845f 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -19,7 +19,7 @@ static int rtw_rfintfs = HWPI;
 static int rtw_lbkmode;/* RTL8712_AIR_TRX; */
 
 
-static int rtw_network_mode = Ndis802_11IBSS;/* Ndis802_11Infrastructure;infra, ad-hoc, auto */
+static int rtw_network_mode = NL80211_IFTYPE_ADHOC;/* infra, ad-hoc, auto */
 /* struct ndis_802_11_ssid	ssid; */
 static int rtw_channel = 1;/* ad-hoc support requirement */
 static int rtw_wireless_mode = WIRELESS_11BG_24N;
-- 
2.25.1

