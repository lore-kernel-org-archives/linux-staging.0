Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D081352920
	for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 18:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768156660; cv=none; b=hxxzfSZcHBcY1M1/HoSnXYl7SpwByAthQiEyHoHKlbalJe8MMEgWheeTVJXPga9gX0+F/LchIGj7Mrdf27I1iIjIKD+u8g4keVian4CGxooJOIujTidQI0sE5IXA1I3zeCKVTY5R1veZUBwXscnCrFBr/JNey6cQHvkDjErVUqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768156660; c=relaxed/simple;
	bh=PiU/yfqR0EaY67xKBn3HiBizwFWWuNX72Ur0SeMJ3uk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SZu08YDqKBbS7oglqfwHWEphM1oS7rJsnF51wFOhBOQHLsYDHK9Cw51T80mJLPIwLshI8Lf/gnU4Cail+ZnQpDpwq0pMYMOh+Dww3FWheP0tszoLjXFDB+anp7jnss0wLwp37E9YdV3O11eu32GhYk7DlWIBDqTmxwNhWKgbgRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AsyMfOFb; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AsyMfOFb"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a0bb2f093aso40151145ad.3
        for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 10:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768156657; x=1768761457; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0lLxKb8bj1oGcqDwzVMK/D1NpEacU7JoXhpDJTmkFM=;
        b=AsyMfOFb8K1F9mqJfyVqZJVYVpByD4Lx7h6D4OYFSRRkEFrNRU4LIz439JM/ULH/Mz
         mk/C4IpBBRJoinqlNDncAQ7xeJLSdB8uOr8tSEq3fsC2U6Mhbc0y9gBVkUl/z21y0Ush
         SyITMnu3N2sfvQYNpcTlpH5+HmdH8JcGs0gnC697AEdj6uI8wVZxDCs/3IGqYC7OaAV3
         5ItCpvgn9VYVfAOpp6AtrLq6xp1CCQSnwbhw3KWiL92sKcZaVZBt+FWSo065Bn0wOnyz
         pLYx6S6gax0rV5NI+41tGQc2ngU9ktHxf8qd0KbtywAB9ctdA5tsjaBFrc4ih5i3R5DD
         qBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768156657; x=1768761457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q0lLxKb8bj1oGcqDwzVMK/D1NpEacU7JoXhpDJTmkFM=;
        b=pJXWC3n0jBppqrJz/dvsj83geJwF9Cc3c85YolPf9igFVnlJ8mdAJKsRpByRPzHVnA
         K8r/HCaN/idiXb2Ms+1U/nF6We9ddI6QSFwDZ9DDEix70r4cEbk/yLwDNb80XyACRqrp
         pCtcShL4sCJ05G7JOSth8M8/onHYP9WS2Tj8aqssXwsd5j96gZ09cysUQxxUuFp9bzGx
         V4/7SKKcsGAYg56qseJq9yiT+jVzOSRBtuu8oJG0CD7oJhCgC4ZrqK79e+tmbNOQy420
         /bAxR+V1YFw0Hu1QwRJXFb7CeAHzHa8gN8LByYDC6L4STAjpJ+6bzRno6iUEFdNuKZfu
         IC8w==
X-Forwarded-Encrypted: i=1; AJvYcCXUYFLvvAS1uOSI2ghRK++xMkjO9cEHx1i+fxsGdIyufMNOCvyJ8aQWp3bR0R2pZBdX8McJBGLaroQAxZ7U@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6I42uiB7XXzdjVmKV5Gkvc6WB64fdAYN9ieG/g9+lrOMM078R
	GicafDddCOUzhFIyqtIpAjEflYrqAivE1yl9vyA8v9U1/4j8EOENQCip
X-Gm-Gg: AY/fxX5mSaUmXfI4XRL7nYEUMmB0E+VTAE7hiPOeru4+8oEGl9flVDjJ8AiLBPFeN+9
	nwfJ8EWUq3SliJkDmfp6hcg0IaYYkg0BNSEXN9QTTvY2IxMoPJgpnPperFUvZR6wkE8nX45dWm6
	DyiV1ajUdIrPSegQZkjBX4smjsAlGBqe0ADaN/MfgtWxpPE17xFhiTsoDgt7lN337bFZWEc0IfP
	KxEF3vVESx2WKxHVJNvgxyd/XcAom/eC0MhnTA5UTy7IDBQS2oXckUUt6cfXhBcrFUwcPiLnJiZ
	5tbJr0N1yaKRz7YfJKqDc5tZlIjYo2YWWMhXGSUVUo9PMoQvbmDvhfPmYTP9JsICxMuS8h7GJiN
	5lWqXF1qe+5WRP3WU9vZjRnZE8qXhm7a+HcL3QTeCO8RiHlz54z7d8TouAFus/+VFvU7yHx5iSp
	lqz6TeUZkQrrQlCZKtWyFz0vUo
X-Google-Smtp-Source: AGHT+IEWMomKo5ZK9Gixh1Em2vQ8A2UoZe3kprhkc62oWhXFrlFJ5JRhxKef3M51FGVk++Vk/FYn2Q==
X-Received: by 2002:a17:902:ce08:b0:2a0:34ee:3725 with SMTP id d9443c01a7336-2a3ee4456c1mr158288805ad.14.1768156657332;
        Sun, 11 Jan 2026 10:37:37 -0800 (PST)
Received: from snowman.bbrouter ([43.241.121.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd2953sm152220415ad.86.2026.01.11.10.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 10:37:36 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH 9/9] staging: rtl8723bs: fix line length and alignment issues
Date: Mon, 12 Jan 2026 00:06:30 +0530
Message-ID: <20260111183630.12816-10-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260111183630.12816-1-khushalchitturi@gmail.com>
References: <20260111183630.12816-1-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix multiple coding style issues in rtw_xmit.c to comply with
the kernel coding style by splitting expressions and adjusting
alignment.

This patch resolves checkpatch.pl warnings caused by lines
exceeding the 100-column limit.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 135 ++++++++++++++--------
 1 file changed, 85 insertions(+), 50 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index a800547f2f01..e4dd3b2b4882 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -125,10 +125,12 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		pxmitbuf->buf_tag = XMITBUF_DATA;
 
 		/* Tx buf allocation may fail sometimes, so sleep and retry. */
-		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
+		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf,
+						 MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ, true);
 		if (res == _FAIL) {
 			usleep_range(10000, 11000);
-			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
+			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf,
+							 MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ, true);
 			if (res == _FAIL)
 				goto exit;
 		}
@@ -141,8 +143,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 
 		pxmitbuf->flags = XMIT_VO_QUEUE;
 
-		list_add_tail(&pxmitbuf->list,
-			      &pxmitpriv->free_xmitbuf_queue.queue);
+		list_add_tail(&pxmitbuf->list, &pxmitpriv->free_xmitbuf_queue.queue);
 		#ifdef DBG_XMIT_BUF
 		pxmitbuf->no = i;
 		#endif
@@ -208,7 +209,8 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		pxmitbuf->padapter = padapter;
 		pxmitbuf->buf_tag = XMITBUF_MGNT;
 
-		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, MAX_XMIT_EXTBUF_SZ + XMITBUF_ALIGN_SZ, true);
+		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf,
+						 MAX_XMIT_EXTBUF_SZ + XMITBUF_ALIGN_SZ, true);
 		if (res == _FAIL) {
 			res = _FAIL;
 			goto exit;
@@ -239,7 +241,9 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 			pxmitbuf->padapter = padapter;
 			pxmitbuf->buf_tag = XMITBUF_CMD;
 
-			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, MAX_CMDBUF_SZ + XMITBUF_ALIGN_SZ, true);
+			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf,
+							 MAX_CMDBUF_SZ + XMITBUF_ALIGN_SZ,
+							 true);
 			if (res == _FAIL) {
 				res = _FAIL;
 				goto exit;
@@ -291,7 +295,8 @@ void _rtw_free_xmit_priv(struct xmit_priv *pxmitpriv)
 	}
 
 	for (i = 0; i < NR_XMITBUFF; i++) {
-		rtw_os_xmit_resource_free(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
+		rtw_os_xmit_resource_free(padapter, pxmitbuf,
+					  MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ, true);
 
 		pxmitbuf++;
 	}
@@ -313,7 +318,8 @@ void _rtw_free_xmit_priv(struct xmit_priv *pxmitpriv)
 	/*  free xmit extension buff */
 	pxmitbuf = (struct xmit_buf *)pxmitpriv->pxmit_extbuf;
 	for (i = 0; i < NR_XMIT_EXTBUFF; i++) {
-		rtw_os_xmit_resource_free(padapter, pxmitbuf, (MAX_XMIT_EXTBUF_SZ + XMITBUF_ALIGN_SZ), true);
+		rtw_os_xmit_resource_free(padapter, pxmitbuf,
+					  MAX_XMIT_EXTBUF_SZ + XMITBUF_ALIGN_SZ, true);
 
 		pxmitbuf++;
 	}
@@ -323,7 +329,8 @@ void _rtw_free_xmit_priv(struct xmit_priv *pxmitpriv)
 	for (i = 0; i < CMDBUF_MAX; i++) {
 		pxmitbuf = &pxmitpriv->pcmd_xmitbuf[i];
 		if (pxmitbuf)
-			rtw_os_xmit_resource_free(padapter, pxmitbuf, MAX_CMDBUF_SZ + XMITBUF_ALIGN_SZ, true);
+			rtw_os_xmit_resource_free(padapter, pxmitbuf,
+						  MAX_CMDBUF_SZ + XMITBUF_ALIGN_SZ, true);
 	}
 
 	rtw_free_hwxmits(padapter);
@@ -365,7 +372,9 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 		sz = pattrib->last_txcmdsz;
 
 	/*  (1) RTS_Threshold is compared to the MPDU, not MSDU. */
-	/*  (2) If there are more than one frag in  this MSDU, only the first frag uses protection frame. */
+	/*  (2) If there are more than one frag in  this MSDU,
+	 *  only the first frag uses protection frame.
+	 */
 	/* Other fragments are protected by previous fragment. */
 	/* So we only need to check the length of first fragment. */
 	if (pmlmeext->cur_wireless_mode < WIRELESS_11_24N  || padapter->registrypriv.wifi_spec) {
@@ -382,7 +391,8 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 	} else {
 		while (true) {
 			/* IOT action */
-			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) && (pattrib->ampdu_en) &&
+			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) &&
+			    (pattrib->ampdu_en) &&
 			    (padapter->securitypriv.dot11_privacy_algrthm == _AES_)) {
 				pattrib->vcs_mode = CTS_TO_SELF;
 				break;
@@ -402,8 +412,9 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 			if (pattrib->ht_en) {
 				u8 ht_op_mode = pmlmeinfo->HT_protection;
 
-				if ((pmlmeext->cur_bwmode && (ht_op_mode == 2 || ht_op_mode == 3)) ||
-					(!pmlmeext->cur_bwmode && ht_op_mode == 3)) {
+				if ((pmlmeext->cur_bwmode &&
+				     (ht_op_mode == 2 || ht_op_mode == 3)) ||
+				    (!pmlmeext->cur_bwmode && ht_op_mode == 3)) {
 					pattrib->vcs_mode = RTS_CTS;
 					break;
 				}
@@ -433,7 +444,8 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 		pattrib->vcs_mode = padapter->driver_vcs_type;
 }
 
-static void update_attrib_phy_info(struct adapter *padapter, struct pkt_attrib *pattrib, struct sta_info *psta)
+static void update_attrib_phy_info(struct adapter *padapter, struct pkt_attrib *pattrib,
+				   struct sta_info *psta)
 {
 	struct mlme_ext_priv *mlmeext = &padapter->mlmeextpriv;
 
@@ -461,7 +473,8 @@ static void update_attrib_phy_info(struct adapter *padapter, struct pkt_attrib *
 	pattrib->ch_offset = psta->htpriv.ch_offset;
 	pattrib->ampdu_en = false;
 
-	if (padapter->driver_ampdu_spacing != 0xFF) /* driver control AMPDU Density for peer sta's rx */
+	/* driver control AMPDU Density for peer sta's rx */
+	if (padapter->driver_ampdu_spacing != 0xFF)
 		pattrib->ampdu_spacing = padapter->driver_ampdu_spacing;
 	else
 		pattrib->ampdu_spacing = psta->htpriv.rx_ampdu_min_spacing;
@@ -469,7 +482,8 @@ static void update_attrib_phy_info(struct adapter *padapter, struct pkt_attrib *
 	pattrib->retry_ctrl = false;
 }
 
-static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *pattrib, struct sta_info *psta)
+static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *pattrib,
+				  struct sta_info *psta)
 {
 	signed int res = _SUCCESS;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
@@ -508,7 +522,8 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 		}
 
 		/* For WPS 1.0 WEP, driver should not encrypt EAPOL Packet for WPS handshake. */
-		if (((pattrib->encrypt == _WEP40_) || (pattrib->encrypt == _WEP104_)) && (pattrib->ether_type == 0x888e))
+		if (((pattrib->encrypt == _WEP40_) || (pattrib->encrypt == _WEP104_)) &&
+		    (pattrib->ether_type == 0x888e))
 			pattrib->encrypt = _NO_PRIVACY_;
 	}
 
@@ -560,7 +575,7 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 		memcpy(pattrib->dot11_8021x_uncst_key.skey, psta->dot11_8021x_uncst_key.skey, 16);
 
 	if (pattrib->encrypt &&
-		((padapter->securitypriv.sw_encrypt) || (!psecuritypriv->hw_decrypted)))
+	    ((padapter->securitypriv.sw_encrypt) || (!psecuritypriv->hw_decrypted)))
 		pattrib->bswenc = true;
 	else
 		pattrib->bswenc = false;
@@ -638,7 +653,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	memcpy(pattrib->src, &etherhdr.h_source, ETH_ALEN);
 
 	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))) {
+	    (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))) {
 		memcpy(pattrib->ra, pattrib->dst, ETH_ALEN);
 		memcpy(pattrib->ta, pattrib->src, ETH_ALEN);
 	} else if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
@@ -652,7 +667,9 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	pattrib->pktlen = pktfile.pkt_len;
 
 	if (pattrib->ether_type == ETH_P_IP) {
-		/*  The following is for DHCP and ARP packet, we use cck1M to tx these packets and let LPS awake some time */
+		/*  The following is for DHCP and ARP packet,
+		 *  we use cck1M to tx these packets and let LPS awake some time
+		 */
 		/*  to prevent DHCP protocol fail */
 
 		u8 tmp[24];
@@ -663,7 +680,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 		if (pktfile.pkt_len > 282) {/* MINIMUM_DHCP_PACKET_SIZE) { */
 			if (pattrib->ether_type == ETH_P_IP) {/*  IP header */
 				if (((tmp[21] == 68) && (tmp[23] == 67)) ||
-					((tmp[21] == 67) && (tmp[23] == 68))) {
+				    ((tmp[21] == 67) && (tmp[23] == 68))) {
 					/*  68 : UDP BOOTP client */
 					/*  67 : UDP BOOTP server */
 					pattrib->dhcp_pkt = 1;
@@ -702,7 +719,8 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 		if (!psta)	{ /*  if we cannot get psta => drop the pkt */
 			res = _FAIL;
 			goto exit;
-		} else if ((check_fwstate(pmlmepriv, WIFI_AP_STATE)) && (!(psta->state & _FW_LINKED))) {
+		} else if ((check_fwstate(pmlmepriv, WIFI_AP_STATE)) &&
+			   (!(psta->state & _FW_LINKED))) {
 			res = _FAIL;
 			goto exit;
 		}
@@ -759,7 +777,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitframe)
 {
 	signed int			curfragnum, length;
-	u8 *pframe, *payload, mic[8];
+	u8 *pframe, *payload, mic[8], *skey;
 	struct mic_data micdata;
 	struct pkt_attrib *pattrib = &pxmitframe->attrib;
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
@@ -773,15 +791,17 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 	if (pattrib->encrypt == _TKIP_) {
 		/* encode mic code */
 		{
-			u8 null_key[16] = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
-
+			u8 null_key[16] = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
+					   0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
+			skey = psecuritypriv->dot11_8021x_grp_tx_mickey[
+			       psecuritypriv->dot11_8021x_grp_key_id].skey;
 			pframe = pxmitframe->buf_addr + hw_hdr_offset;
 
 			if (bmcst) {
-				if (!memcmp(psecuritypriv->dot11_8021x_grp_tx_mickey[psecuritypriv->dot11_8021x_grp_key_id].skey, null_key, 16))
+				if (!memcmp(skey, null_key, 16))
 					return _FAIL;
 				/* start to calculate the mic code */
-				rtw_secmicsetkey(&micdata, psecuritypriv->dot11_8021x_grp_tx_mickey[psecuritypriv->dot11_8021x_grp_key_id].skey);
+				rtw_secmicsetkey(&micdata, skey);
 			} else {
 				if (!memcmp(&pattrib->dot11tkiptxmickey.skey[0], null_key, 16))
 					return _FAIL;
@@ -815,11 +835,15 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 				payload = payload + pattrib->hdrlen + pattrib->iv_len;
 
 				if ((curfragnum + 1) == pattrib->nr_frags) {
-					length = pattrib->last_txcmdsz - pattrib->hdrlen - pattrib->iv_len - ((pattrib->bswenc) ? pattrib->icv_len : 0);
+					length = pattrib->last_txcmdsz - pattrib->hdrlen -
+						 pattrib->iv_len -
+						 ((pattrib->bswenc) ? pattrib->icv_len : 0);
 					rtw_secmicappend(&micdata, payload, length);
 					payload = payload + length;
 				} else {
-					length = pxmitpriv->frag_len - pattrib->hdrlen - pattrib->iv_len - ((pattrib->bswenc) ? pattrib->icv_len : 0);
+					length = pxmitpriv->frag_len - pattrib->hdrlen -
+						 pattrib->iv_len -
+						 ((pattrib->bswenc) ? pattrib->icv_len : 0);
 					rtw_secmicappend(&micdata, payload, length);
 					payload = payload + length + pattrib->icv_len;
 				}
@@ -990,7 +1014,7 @@ s32 rtw_txframes_pending(struct adapter *padapter)
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 
 	return ((!list_empty(&pxmitpriv->be_pending.queue)) ||
-			 (!list_empty(&pxmitpriv->bk_pending.queue)) ||
+		(!list_empty(&pxmitpriv->bk_pending.queue)) ||
 			 (!list_empty(&pxmitpriv->vi_pending.queue)) ||
 			 (!list_empty(&pxmitpriv->vo_pending.queue)));
 }
@@ -1022,7 +1046,8 @@ u32 rtw_calculate_wlan_pkt_size_by_attribue(struct pkt_attrib *pattrib)
  * 5. move frag chunk from pframe to pxmitframe->mem
  * 6. apply sw-encrypt, if necessary.
  */
-s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe)
+s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt,
+			   struct xmit_frame *pxmitframe)
 {
 	struct pkt_file pktfile;
 
@@ -1110,7 +1135,8 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 		if (bmcst || (rtw_endofpktfile(&pktfile))) {
 			pattrib->nr_frags = frg_inx;
 
-			pattrib->last_txcmdsz = pattrib->hdrlen + pattrib->iv_len + ((pattrib->nr_frags == 1) ? llc_sz : 0) +
+			pattrib->last_txcmdsz = pattrib->hdrlen + pattrib->iv_len +
+				((pattrib->nr_frags == 1) ? llc_sz : 0) +
 					((pattrib->bswenc) ? pattrib->icv_len : 0) + mem_sz;
 
 			clear_m_frag(mem_start);
@@ -1141,7 +1167,8 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 }
 
 /* broadcast or multicast management pkt use BIP, unicast management pkt use CCMP encryption */
-s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe)
+s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt,
+				struct xmit_frame *pxmitframe)
 {
 	u8 *pframe, *mem_start = NULL, *tmp_buf = NULL;
 	u8 subtype;
@@ -1187,7 +1214,8 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 		memset(MME, 0, 18);
 
 		/* other types doesn't need the BIP */
-		if (get_frame_sub_type(pframe) != WIFI_DEAUTH && get_frame_sub_type(pframe) != WIFI_DISASSOC)
+		if ((get_frame_sub_type(pframe) != WIFI_DEAUTH) &&
+		    (get_frame_sub_type(pframe) != WIFI_DISASSOC))
 			goto xmitframe_coalesce_fail;
 
 		MGMT_body = pframe + sizeof(struct ieee80211_hdr_3addr);
@@ -1226,7 +1254,7 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 	} else { /* unicast mgmt frame TX */
 		/* start to encrypt mgmt frame */
 		if (subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC ||
-			subtype == WIFI_REASSOCREQ || subtype == WIFI_ACTION) {
+		    subtype == WIFI_REASSOCREQ || subtype == WIFI_ACTION) {
 			if (pattrib->psta)
 				psta = pattrib->psta;
 			else
@@ -1240,15 +1268,16 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 
 			/* according 802.11-2012 standard, these five types are not robust types */
 			if (subtype == WIFI_ACTION &&
-			(pframe[WLAN_HDR_A3_LEN] == RTW_WLAN_CATEGORY_PUBLIC ||
-			pframe[WLAN_HDR_A3_LEN] == RTW_WLAN_CATEGORY_HT ||
-			pframe[WLAN_HDR_A3_LEN] == RTW_WLAN_CATEGORY_UNPROTECTED_WNM ||
-			pframe[WLAN_HDR_A3_LEN] == RTW_WLAN_CATEGORY_SELF_PROTECTED  ||
-			pframe[WLAN_HDR_A3_LEN] == RTW_WLAN_CATEGORY_P2P))
+			    (pframe[WLAN_HDR_A3_LEN] == RTW_WLAN_CATEGORY_PUBLIC ||
+			     pframe[WLAN_HDR_A3_LEN] == RTW_WLAN_CATEGORY_HT ||
+			     pframe[WLAN_HDR_A3_LEN] == RTW_WLAN_CATEGORY_UNPROTECTED_WNM ||
+			     pframe[WLAN_HDR_A3_LEN] == RTW_WLAN_CATEGORY_SELF_PROTECTED  ||
+			     pframe[WLAN_HDR_A3_LEN] == RTW_WLAN_CATEGORY_P2P))
 				goto xmitframe_coalesce_fail;
 			/* before encrypt dump the management packet content */
 			if (pattrib->encrypt > 0)
-				memcpy(pattrib->dot11_8021x_uncst_key.skey, psta->dot11_8021x_uncst_key.skey, 16);
+				memcpy(pattrib->dot11_8021x_uncst_key.skey,
+				       psta->dot11_8021x_uncst_key.skey, 16);
 			/* bakeup original management packet */
 			memcpy(tmp_buf, pframe, pattrib->pktlen);
 			/* move to data portion */
@@ -1271,7 +1300,8 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 			memcpy(pframe, pattrib->iv, pattrib->iv_len);
 			pframe += pattrib->iv_len;
 			/* copy mgmt data portion after CCMP header */
-			memcpy(pframe, tmp_buf + pattrib->hdrlen, pattrib->pktlen - pattrib->hdrlen);
+			memcpy(pframe, tmp_buf + pattrib->hdrlen,
+			       pattrib->pktlen - pattrib->hdrlen);
 			/* move pframe to end of mgmt pkt */
 			pframe += pattrib->pktlen - pattrib->hdrlen;
 			/* add 8 bytes CCMP IV header to length */
@@ -1400,7 +1430,7 @@ void rtw_count_tx_stats(struct adapter *padapter, struct xmit_frame *pxmitframe,
 }
 
 static struct xmit_buf *__rtw_alloc_cmd_xmitbuf(struct xmit_priv *pxmitpriv,
-		enum cmdbuf_type buf_type)
+						enum cmdbuf_type buf_type)
 {
 	struct xmit_buf *pxmitbuf =  NULL;
 
@@ -1422,7 +1452,7 @@ static struct xmit_buf *__rtw_alloc_cmd_xmitbuf(struct xmit_priv *pxmitpriv,
 }
 
 struct xmit_frame *__rtw_alloc_cmdxmitframe(struct xmit_priv *pxmitpriv,
-		enum cmdbuf_type buf_type)
+					    enum cmdbuf_type buf_type)
 {
 	struct xmit_frame		*pcmdframe;
 	struct xmit_buf		*pxmitbuf;
@@ -1757,7 +1787,8 @@ s32 rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitfram
 	return _SUCCESS;
 }
 
-struct tx_servq *rtw_get_sta_pending(struct adapter *padapter, struct sta_info *psta, signed int up, u8 *ac)
+struct tx_servq *rtw_get_sta_pending(struct adapter *padapter, struct sta_info *psta,
+				     signed int up, u8 *ac)
 {
 	struct tx_servq *ptxservq = NULL;
 
@@ -2011,7 +2042,8 @@ inline bool xmitframe_hiq_filter(struct xmit_frame *xmitframe)
 	return allow;
 }
 
-signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct xmit_frame *pxmitframe)
+signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter,
+					      struct xmit_frame *pxmitframe)
 {
 	signed int ret = false;
 	struct sta_info *psta = NULL;
@@ -2106,7 +2138,8 @@ signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct x
 			if (wmmps_ac)
 				psta->sleepq_ac_len++;
 
-			if (((psta->has_legacy_ac) && (!wmmps_ac)) || ((!psta->has_legacy_ac) && (wmmps_ac))) {
+			if (((psta->has_legacy_ac) && (!wmmps_ac)) ||
+			    ((!psta->has_legacy_ac) && (wmmps_ac))) {
 				if (!(pstapriv->tim_bitmap & BIT(psta->aid)))
 					update_tim = true;
 
@@ -2126,7 +2159,8 @@ signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct x
 	return ret;
 }
 
-static void dequeue_xmitframes_to_sleeping_queue(struct adapter *padapter, struct sta_info *psta, struct __queue *pframequeue)
+static void dequeue_xmitframes_to_sleeping_queue(struct adapter *padapter, struct sta_info *psta,
+						 struct __queue *pframequeue)
 {
 	signed int ret;
 	struct list_head *plist, *phead, *tmp;
@@ -2147,7 +2181,8 @@ static void dequeue_xmitframes_to_sleeping_queue(struct adapter *padapter, struc
 		ret = xmitframe_enqueue_for_sleeping_sta(padapter, pxmitframe);
 
 		if (ret) {
-			ptxservq = rtw_get_sta_pending(padapter, psta, pattrib->priority, (u8 *)(&ac_index));
+			ptxservq = rtw_get_sta_pending(padapter, psta, pattrib->priority,
+						       (u8 *)(&ac_index));
 
 			ptxservq->qcnt--;
 			phwxmits[ac_index].accnt--;
@@ -2453,7 +2488,7 @@ struct xmit_buf *dequeue_pending_xmitbuf_under_survey(struct xmit_priv *pxmitpri
 			type = get_frame_sub_type(pxmitbuf->pbuf + TXDESC_OFFSET);
 
 			if ((type == WIFI_PROBEREQ) ||
-				(type == WIFI_DATA_NULL) ||
+			    (type == WIFI_DATA_NULL) ||
 				(type == WIFI_QOS_DATA_NULL)) {
 				list_del_init(&pxmitbuf->list);
 				break;
-- 
2.52.0

