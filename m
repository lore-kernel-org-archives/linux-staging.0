Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADE13093DD
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 20:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769544297; cv=none; b=diKMCxMe4p7yPCwDNiJQ9xl7YBQ1B0Sb1TYyMYdXodM0vQSnUKc16DHSKgor5e3wQPKvzihJKoV+NUzKzQJGFgnRJvRv6T3bYtIppg2u3a6vBuTjdFenfah84TV/kYn2vBBiQavTmLcGI2FpLTN6Wx9sBlXV7a9X+B/JN1FvZOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769544297; c=relaxed/simple;
	bh=sXOaB7NIuFwO+ola+5LAme68gR6H9DmALpktmQVfoTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Flscq+WTKoNuO/F4yXkAVQTk4jNe0xcd41M6e/AlFJSeWrWzWRjHL+4NF9B/L9HtQvD86+P6iSr/hFXxN261JhmoZ2T4XDtC6Ov5jzL1zKfBtFCtNO6hM5bN4acRg/TRs0d8YCB0gEXvb+1VDRc9y5bbRK/MdlvfxNqdeqd1RCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VkFUwKeQ; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VkFUwKeQ"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-823075fed75so108067b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 12:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769544295; x=1770149095; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxOSxJR3eoAri4XJO8nrv4h+7CQ4CfbcPtMU0dg9utM=;
        b=VkFUwKeQy61R7Ndd5Kaa3533hB0WUvE34bjcW5HPDMMOEtoTcMtqvduqIbw9J1YzfT
         XtrVuW9yQR06nJf64tHp1Ncq0E/wA68z7WIYyTMNGXKrGTUbCcC4azmSTLUkWNgYvE62
         pRxkLKzhdDEMQEfTYYtO3rL8e/k9CMOCvjXuo8IWf9KF/fnCxfB/3/K1PaR+dDa32Exa
         PtSVOjaZy/gBltYxIvfSLWlMiYsEeytNrKIcntAPQDDq3NmxG1H/L2oulwXAIbPT5r74
         Ni6goQf5nbVoQfHcOImTvPJBDFZHDJcZB1RCx6eTu73ZAnXnxnDd3YuX0jhBoVqXFFNI
         ZoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769544295; x=1770149095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NxOSxJR3eoAri4XJO8nrv4h+7CQ4CfbcPtMU0dg9utM=;
        b=ImIuVHuC+0uHKTLyQVNAqU9JX9Joxlr3yNYNZZjwFqjdl6ILWBPwNcmY+VoHuDifMW
         dyiLup7BKs91L5/yXngrIhUUEm4oGn7O2JwVdA2KJOzVrPuTQ+uMeweF4KHwUlDn0uwp
         rkgABWSvnsGvNVlreQXezzFlYwhxO/adV+vMVuXIKZHXoFopu8tYu+x1shVcVuyLcRvF
         Ul8tv552E2w4l1mGRonaRQ/excQg+w66/9bJupuDVwAJ4DvecinEmRBnIBYeE8c2h43M
         nmlS9rc8wzbZQXRBlWIv0XBcJwqdwTnCUwlSUbsEo0Odd3u69h+vIot6OYBnTrVoMavw
         S+EA==
X-Forwarded-Encrypted: i=1; AJvYcCUvDy7LQcx7Vdq+VFJr58PY8e4ghAzMLPCluxrc4J9XvLSJikeMjuNH7HF6bpX0t3JkFDVInEEVDkW//+44@lists.linux.dev
X-Gm-Message-State: AOJu0YzGXBJUEI/WWBEZGV5MuS/Y1CjoTMOSIBDuuzWGRl8HN4cBcGvT
	qOcJ6WO3D7fQiUJe+0kPnyb6mdRNlxtXefwUwdRgJg+63w79UK5zJUAa
X-Gm-Gg: AZuq6aKbLc1kWADH6xXCrvawDb+bF22bjnCUDF/LmEctND5GzkuWNcVjoSVfFk8GBSj
	VTlUhlpkQUAdkrz/p4Ls9py5gtCKTNEg0obz/xlOZ9NCPolzTEm9ptjegJTPtB3eyNXp/BGtIRB
	J8FN6kNvQqZUAJnijCPMxcX7wzgE71IoybeKf9d3WWqncilsqpAOBIWDySz55tGvBjYsleFxh0T
	L1cAnH+QMdALYTH1M9tF61u6xUPkYvvG7QF+qRKtM3HzkN7Ps7X1vSFPt2x4cicrJwcKdPLaG+I
	tdnyd6dGUy6yab2J+WFe7dhcQ2PoetCKNfstZkhWF/hRl4ue/79bsj+/yqwUPksjan0xup+jYlS
	E72ejeiRd3WaBlsrFZBlZn1RL7UNQhdwvzJ7HVSHGgtElI/wVpGmW4E2A86nBEUtNel4CEOPmKW
	MOlww1RuujUEGx/JTR
X-Received: by 2002:a05:6a00:1a0b:b0:81f:c6d1:5608 with SMTP id d2e1a72fcca58-8236a14bd51mr2568262b3a.1.1769544295423;
        Tue, 27 Jan 2026 12:04:55 -0800 (PST)
Received: from snowman ([2401:4900:646d:9a6e:84d0:c92:d353:cd21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b59e10sm377771b3a.25.2026.01.27.12.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 12:04:55 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v5 3/3] staging: rtl8723bs: fix line length and alignment issues
Date: Wed, 28 Jan 2026 01:34:27 +0530
Message-ID: <20260127200427.3669-4-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127200427.3669-1-khushalchitturi@gmail.com>
References: <20260127200427.3669-1-khushalchitturi@gmail.com>
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

This patch resolves checkpatch.pl warnings caused by line length
exceeding 100 columns and alignment matching the open parenthesis.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>

---
Changelog:
v4 -> v5: Rebased onto current staging-testing.
v3 -> v4: Adjusted comment formatting.
v2 -> v3: Resubmitted as a versioned series to resolve threading confusion.
v1 -> v2: No changes.

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 107 +++++++++++++---------
 1 file changed, 66 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 06537f21bbe6..be1054234bb2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -126,10 +126,14 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		pxmitbuf->buf_tag = XMITBUF_DATA;
 
 		/* Tx buf allocation may fail sometimes, so sleep and retry. */
-		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
+		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf,
+						 (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ),
+						 true);
 		if (res == _FAIL) {
 			msleep(10);
-			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
+			res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf,
+							 (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ),
+							 true);
 			if (res == _FAIL)
 				goto exit;
 		}
@@ -208,7 +212,9 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		pxmitbuf->padapter = padapter;
 		pxmitbuf->buf_tag = XMITBUF_MGNT;
 
-		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf, MAX_XMIT_EXTBUF_SZ + XMITBUF_ALIGN_SZ, true);
+		res = rtw_os_xmit_resource_alloc(padapter, pxmitbuf,
+						 MAX_XMIT_EXTBUF_SZ + XMITBUF_ALIGN_SZ,
+						 true);
 		if (res == _FAIL) {
 			res = _FAIL;
 			goto exit;
@@ -291,7 +297,9 @@ void _rtw_free_xmit_priv(struct xmit_priv *pxmitpriv)
 	}
 
 	for (i = 0; i < NR_XMITBUFF; i++) {
-		rtw_os_xmit_resource_free(padapter, pxmitbuf, (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ), true);
+		rtw_os_xmit_resource_free(padapter, pxmitbuf,
+					  (MAX_XMITBUF_SZ + XMITBUF_ALIGN_SZ),
+					  true);
 
 		pxmitbuf++;
 	}
@@ -313,7 +321,9 @@ void _rtw_free_xmit_priv(struct xmit_priv *pxmitpriv)
 	/*  free xmit extension buff */
 	pxmitbuf = (struct xmit_buf *)pxmitpriv->pxmit_extbuf;
 	for (i = 0; i < NR_XMIT_EXTBUFF; i++) {
-		rtw_os_xmit_resource_free(padapter, pxmitbuf, (MAX_XMIT_EXTBUF_SZ + XMITBUF_ALIGN_SZ), true);
+		rtw_os_xmit_resource_free(padapter, pxmitbuf,
+					  (MAX_XMIT_EXTBUF_SZ + XMITBUF_ALIGN_SZ),
+					  true);
 
 		pxmitbuf++;
 	}
@@ -366,10 +376,12 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 	else /* no frag */
 		sz = pattrib->last_txcmdsz;
 
-	/*  (1) RTS_Threshold is compared to the MPDU, not MSDU. */
-	/*  (2) If there are more than one frag in  this MSDU, only the first frag uses protection frame. */
-	/* Other fragments are protected by previous fragment. */
-	/* So we only need to check the length of first fragment. */
+	/* (1) RTS_Threshold is compared to the MPDU, not MSDU.
+	 * (2) If there are more than one frag in this MSDU, only the
+	 * first frag uses protection frame. Other fragments are
+	 * protected by the previous fragment, so we only need to
+	 * check the length of first fragment.
+	 */
 	if (pmlmeext->cur_wireless_mode < WIRELESS_11_24N  || padapter->registrypriv.wifi_spec) {
 		if (sz > padapter->registrypriv.rts_thresh) {
 			pattrib->vcs_mode = RTS_CTS;
@@ -436,7 +448,8 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 		pattrib->vcs_mode = padapter->driver_vcs_type;
 }
 
-static void update_attrib_phy_info(struct adapter *padapter, struct pkt_attrib *pattrib, struct sta_info *psta)
+static void update_attrib_phy_info(struct adapter *padapter, struct pkt_attrib *pattrib,
+				   struct sta_info *psta)
 {
 	struct mlme_ext_priv *mlmeext = &padapter->mlmeextpriv;
 
@@ -464,7 +477,8 @@ static void update_attrib_phy_info(struct adapter *padapter, struct pkt_attrib *
 	pattrib->ch_offset = psta->htpriv.ch_offset;
 	pattrib->ampdu_en = false;
 
-	if (padapter->driver_ampdu_spacing != 0xFF) /* driver control AMPDU Density for peer sta's rx */
+	/* driver control AMPDU Density for peer sta's rx */
+	if (padapter->driver_ampdu_spacing != 0xFF)
 		pattrib->ampdu_spacing = padapter->driver_ampdu_spacing;
 	else
 		pattrib->ampdu_spacing = psta->htpriv.rx_ampdu_min_spacing;
@@ -472,7 +486,8 @@ static void update_attrib_phy_info(struct adapter *padapter, struct pkt_attrib *
 	pattrib->retry_ctrl = false;
 }
 
-static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *pattrib, struct sta_info *psta)
+static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *pattrib,
+				  struct sta_info *psta)
 {
 	signed int res = _SUCCESS;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
@@ -511,7 +526,8 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 		}
 
 		/* For WPS 1.0 WEP, driver should not encrypt EAPOL Packet for WPS handshake. */
-		if (((pattrib->encrypt == _WEP40_) || (pattrib->encrypt == _WEP104_)) && (pattrib->ether_type == 0x888e))
+		if ((pattrib->encrypt == _WEP40_ || pattrib->encrypt == _WEP104_) &&
+		    pattrib->ether_type == 0x888e)
 			pattrib->encrypt = _NO_PRIVACY_;
 	}
 
@@ -563,7 +579,7 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 		memcpy(pattrib->dot118021x_UncstKey.skey, psta->dot118021x_UncstKey.skey, 16);
 
 	if (pattrib->encrypt &&
-		((padapter->securitypriv.sw_encrypt) || (!psecuritypriv->hw_decrypted)))
+	    (padapter->securitypriv.sw_encrypt || !psecuritypriv->hw_decrypted))
 		pattrib->bswenc = true;
 	else
 		pattrib->bswenc = false;
@@ -655,8 +671,9 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	pattrib->pktlen = pktfile.pkt_len;
 
 	if (pattrib->ether_type == ETH_P_IP) {
-		/*  The following is for DHCP and ARP packet, we use cck1M to tx these packets and let LPS awake some time */
-		/*  to prevent DHCP protocol fail */
+		/*  The following is for DHCP and ARP packets, we use cck1M to tx these
+		 *  packets and let LPS awake some time to prevent DHCP protocol fail
+		 */
 
 		u8 tmp[24];
 
@@ -665,8 +682,8 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 		pattrib->dhcp_pkt = 0;
 		if (pktfile.pkt_len > 282) {/* MINIMUM_DHCP_PACKET_SIZE) { */
 			if (pattrib->ether_type == ETH_P_IP) {/*  IP header */
-				if (((tmp[21] == 68) && (tmp[23] == 67)) ||
-					((tmp[21] == 67) && (tmp[23] == 68))) {
+				if ((tmp[21] == 68 && tmp[23] == 67) ||
+				    (tmp[21] == 67 && tmp[23] == 68)) {
 					/*  68 : UDP BOOTP client */
 					/*  67 : UDP BOOTP server */
 					pattrib->dhcp_pkt = 1;
@@ -778,7 +795,8 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 	if (pattrib->encrypt == _TKIP_) {
 		/* encode mic code */
 		{
-			u8 null_key[16] = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
+			u8 null_key[16] = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
+					   0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
 
 			pframe = pxmitframe->buf_addr + hw_hdr_offset;
 
@@ -998,10 +1016,10 @@ s32 rtw_txframes_pending(struct adapter *padapter)
 {
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 
-	return ((!list_empty(&pxmitpriv->be_pending.queue)) ||
-			 (!list_empty(&pxmitpriv->bk_pending.queue)) ||
-			 (!list_empty(&pxmitpriv->vi_pending.queue)) ||
-			 (!list_empty(&pxmitpriv->vo_pending.queue)));
+	return !list_empty(&pxmitpriv->be_pending.queue) ||
+	       !list_empty(&pxmitpriv->bk_pending.queue) ||
+	       !list_empty(&pxmitpriv->vi_pending.queue) ||
+	       !list_empty(&pxmitpriv->vo_pending.queue);
 }
 
 /*
@@ -1031,7 +1049,8 @@ u32 rtw_calculate_wlan_pkt_size_by_attribue(struct pkt_attrib *pattrib)
  * 5. move frag chunk from pframe to pxmitframe->mem
  * 6. apply sw-encrypt, if necessary.
  */
-s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe)
+s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt,
+			   struct xmit_frame *pxmitframe)
 {
 	struct pkt_file pktfile;
 
@@ -1152,7 +1171,8 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 }
 
 /* broadcast or multicast management pkt use BIP, unicast management pkt use CCMP encryption */
-s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe)
+s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt,
+				struct xmit_frame *pxmitframe)
 {
 	u8 *pframe, *mem_start = NULL, *tmp_buf = NULL;
 	u8 subtype;
@@ -1235,7 +1255,7 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 	} else { /* unicast mgmt frame TX */
 		/* start to encrypt mgmt frame */
 		if (subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC ||
-			subtype == WIFI_REASSOCREQ || subtype == WIFI_ACTION) {
+		    subtype == WIFI_REASSOCREQ || subtype == WIFI_ACTION) {
 			if (pattrib->psta)
 				psta = pattrib->psta;
 			else
@@ -1249,11 +1269,11 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 
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
@@ -1410,7 +1430,7 @@ void rtw_count_tx_stats(struct adapter *padapter, struct xmit_frame *pxmitframe,
 }
 
 static struct xmit_buf *__rtw_alloc_cmd_xmitbuf(struct xmit_priv *pxmitpriv,
-		enum cmdbuf_type buf_type)
+						enum cmdbuf_type buf_type)
 {
 	struct xmit_buf *pxmitbuf =  NULL;
 
@@ -1431,7 +1451,7 @@ static struct xmit_buf *__rtw_alloc_cmd_xmitbuf(struct xmit_priv *pxmitpriv,
 }
 
 struct xmit_frame *__rtw_alloc_cmdxmitframe(struct xmit_priv *pxmitpriv,
-		enum cmdbuf_type buf_type)
+					    enum cmdbuf_type buf_type)
 {
 	struct xmit_frame		*pcmdframe;
 	struct xmit_buf		*pxmitbuf;
@@ -1766,7 +1786,8 @@ s32 rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitfram
 	return _SUCCESS;
 }
 
-struct tx_servq *rtw_get_sta_pending(struct adapter *padapter, struct sta_info *psta, signed int up, u8 *ac)
+struct tx_servq *rtw_get_sta_pending(struct adapter *padapter, struct sta_info *psta,
+				     signed int up, u8 *ac)
 {
 	struct tx_servq *ptxservq = NULL;
 
@@ -2020,7 +2041,8 @@ inline bool xmitframe_hiq_filter(struct xmit_frame *xmitframe)
 	return allow;
 }
 
-signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct xmit_frame *pxmitframe)
+signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter,
+					      struct xmit_frame *pxmitframe)
 {
 	signed int ret = false;
 	struct sta_info *psta = NULL;
@@ -2115,7 +2137,8 @@ signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct x
 			if (wmmps_ac)
 				psta->sleepq_ac_len++;
 
-			if (((psta->has_legacy_ac) && (!wmmps_ac)) || ((!psta->has_legacy_ac) && (wmmps_ac))) {
+			if ((psta->has_legacy_ac && !wmmps_ac) ||
+			    (!psta->has_legacy_ac && wmmps_ac)) {
 				if (!(pstapriv->tim_bitmap & BIT(psta->aid)))
 					update_tim = true;
 
@@ -2135,7 +2158,8 @@ signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct x
 	return ret;
 }
 
-static void dequeue_xmitframes_to_sleeping_queue(struct adapter *padapter, struct sta_info *psta, struct __queue *pframequeue)
+static void dequeue_xmitframes_to_sleeping_queue(struct adapter *padapter, struct sta_info *psta,
+						 struct __queue *pframequeue)
 {
 	signed int ret;
 	struct list_head *plist, *phead, *tmp;
@@ -2156,7 +2180,8 @@ static void dequeue_xmitframes_to_sleeping_queue(struct adapter *padapter, struc
 		ret = xmitframe_enqueue_for_sleeping_sta(padapter, pxmitframe);
 
 		if (ret) {
-			ptxservq = rtw_get_sta_pending(padapter, psta, pattrib->priority, (u8 *)(&ac_index));
+			ptxservq = rtw_get_sta_pending(padapter, psta, pattrib->priority,
+						       (u8 *)(&ac_index));
 
 			ptxservq->qcnt--;
 			phwxmits[ac_index].accnt--;
@@ -2461,9 +2486,9 @@ struct xmit_buf *dequeue_pending_xmitbuf_under_survey(struct xmit_priv *pxmitpri
 
 			type = GetFrameSubType(pxmitbuf->pbuf + TXDESC_OFFSET);
 
-			if ((type == WIFI_PROBEREQ) ||
-				(type == WIFI_DATA_NULL) ||
-				(type == WIFI_QOS_DATA_NULL)) {
+			if (type == WIFI_PROBEREQ ||
+			    type == WIFI_DATA_NULL ||
+			    type == WIFI_QOS_DATA_NULL) {
 				list_del_init(&pxmitbuf->list);
 				break;
 			}
-- 
2.52.0

