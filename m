Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BEA368264
	for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 10:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768473014; cv=none; b=By9YGbiyXZYOhoemIqvqFe8c4e265SZTyYZ5i9ROePdNqbjlI3hpIX4cAzyFvd0RavBagcNYd9os1EnDAozuGlSNcudPE1bJNXdIs2J4bLEk5nGXKvUA1LIzVgVLFRilbaR5h3v2F3Jkbdowy2wQsZBpYV0MsuL4xucMQnKIR1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768473014; c=relaxed/simple;
	bh=lfzpup8sMXzgFKSAb9qsmed7Tm9dM3aPstuATL07vJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lpONWedHy08ckylYMokeFUezYD+1WnbVvXJm8OsXVFQRjqOHxDBWyum/Zu4DnVbZbGjNCp2NErdY2139cexUgrWxX3I2VIw0DEbpJthCZGzZu09RaBryn46azk1Z/9pAQfQSlyjwR3Ung2uI+xd8cq913zk52x4k0lYLCttbyRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1x978t2; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1x978t2"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-81dbc0a99d2so379207b3a.1
        for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 02:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768473009; x=1769077809; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eu/zMPm8jNOPhQZ2KpPuGdbHBQhde0/v14GSW1jHftw=;
        b=I1x978t2sWKLNPv6G0Ib8OrDXDhv6OJnwBEQtE8MEictDZG0v2DNndV9SIkYMY6oLp
         atKl9LkjMlbSetKH7ue5Nh9iKXSAzxkknvt8Kvi3uj+N6yFCLG/hxCqJx64kwJznKZx+
         lZa/Aa0qIJqnttiZqROoy5Tfll2olqOzbIU4jum+IPNKIBFk8E+EUnABYeqLXPKOgJ7u
         uBAALnXxoHyOmYHExQVbqRQ7QxtJbvd1gTyyq8zzoxnfFx/FveJK0nVCqP2F9Z0DD4KP
         BmgffDlnvQX3Pe0xHrxDQ8vKoOuaw842r/JWYcbKaisTY/1u8fcWJlrgC+Z3ReIIXylq
         v3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768473009; x=1769077809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Eu/zMPm8jNOPhQZ2KpPuGdbHBQhde0/v14GSW1jHftw=;
        b=wVt8Jt6ly8dBZML7kvUue4GwXmAVaGawkrPGNznSHGBx16KKAVzd2FA7SgGNZfew8g
         qUVscg7+iad1SuEglIHFOOqGxi8q/aVXbPfL6jPYuAW8A4zbG0KHeVZZXi21GZLNURdw
         6xvbKInjXuArS81j78MadXm48smV9rRQubCwQFlwtnrzoNnQXYr4XDSJxDcyxWGwbCyg
         EarReRukvxxa2QyzQZKNXUlTVyj+mZkHYUTLrfmUxD/rf+imz9sOjJscwL+YD74POBqu
         s2Df+HsGVHStU/JCpfbHCzKsGQQtA6Ab4yBl6VzlRMTziOPGBAcnJRirhzDSa+3+CDvS
         64IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJJT5bMfiMW6vSAdZKp377adE2sr/BdFawyVAuwyjVFSI/RhRygnRtezi0Ql9fn8tzrhZxA3XE/CLnIoTb@lists.linux.dev
X-Gm-Message-State: AOJu0Yzmd+Zt6qCy9aYalrOcTsTBqtCWpX9z7gQx8Fg3AhbB8yj40ABV
	SYWfDu9MXvF3Yx1u51XY8jDjN6R8aXa/y+4Papv6z4Z6+4wIBfoktoD8
X-Gm-Gg: AY/fxX7+kGXtOPF/RYWQftpnruO+42UCOnGRfYcdcndl6Cvi35V1kEKGqSkKbVGmQiT
	ez2Om+TOpBopYCZnceNMhBDue5aouGhco98xwMbHTRJwK2bljhGRx9xjJrFlQiGvXjaP4GRnfx1
	71MpP0+QxdmM7EUjGmsJoWgqPerdyB0NR0KfETZUqD7SvQOU3SXdNY8riaiG7HcmQpn+YzyUJjv
	Tr2VIoQQFVo5xWpW3LbCJKbheOMqSwMllIm/I0BkHkhE3l02OPRMTPvLRs1XIQwajOd5FjcCbWY
	uNgAKOkRAb6zl++wlUEck3e84DaAUMHPoWTICj4I79Zu7k9vqsba3lFlAq4Hqi8SeJsD//otvDP
	X3DCtc5DRSv2sbChIHLfLQs+a3CnGsnLGj5OM5pJ+8rScFLUnvghEkb/NH8/+jGwfJ3aTHWxWsG
	jvh8VlSNj8G2agdF4=
X-Received: by 2002:a05:6a00:4c87:b0:7f6:4922:89c4 with SMTP id d2e1a72fcca58-81f83d484d7mr5247539b3a.55.1768473009252;
        Thu, 15 Jan 2026 02:30:09 -0800 (PST)
Received: from snowman ([223.196.193.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f8e4f61fdsm2103488b3a.26.2026.01.15.02.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:30:08 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	hansg@kernel.org,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH 4/4] staging: rtl8723bs: fix line length and alignment issues
Date: Thu, 15 Jan 2026 15:59:10 +0530
Message-ID: <20260115102910.10018-5-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115102910.10018-1-khushalchitturi@gmail.com>
References: <20260115102910.10018-1-khushalchitturi@gmail.com>
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
exceeding 100 columns and alignment with the open parenthesis.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 94 +++++++++++++++--------
 1 file changed, 60 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 39477b7c443d..4cc41d1f4836 100644
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
@@ -367,7 +377,9 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 		sz = pattrib->last_txcmdsz;
 
 	/*  (1) RTS_Threshold is compared to the MPDU, not MSDU. */
-	/*  (2) If there are more than one frag in  this MSDU, only the first frag uses protection frame. */
+	/*  (2) If there are more than one frag in this MSDU,
+	 *  only the first frag uses protection frame.
+	 */
 	/* Other fragments are protected by previous fragment. */
 	/* So we only need to check the length of first fragment. */
 	if (pmlmeext->cur_wireless_mode < WIRELESS_11_24N  || padapter->registrypriv.wifi_spec) {
@@ -437,7 +449,8 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 		pattrib->vcs_mode = padapter->driver_vcs_type;
 }
 
-static void update_attrib_phy_info(struct adapter *padapter, struct pkt_attrib *pattrib, struct sta_info *psta)
+static void update_attrib_phy_info(struct adapter *padapter, struct pkt_attrib *pattrib,
+				   struct sta_info *psta)
 {
 	struct mlme_ext_priv *mlmeext = &padapter->mlmeextpriv;
 
@@ -465,7 +478,8 @@ static void update_attrib_phy_info(struct adapter *padapter, struct pkt_attrib *
 	pattrib->ch_offset = psta->htpriv.ch_offset;
 	pattrib->ampdu_en = false;
 
-	if (padapter->driver_ampdu_spacing != 0xFF) /* driver control AMPDU Density for peer sta's rx */
+	/* driver control AMPDU Density for peer sta's rx */
+	if (padapter->driver_ampdu_spacing != 0xFF)
 		pattrib->ampdu_spacing = padapter->driver_ampdu_spacing;
 	else
 		pattrib->ampdu_spacing = psta->htpriv.rx_ampdu_min_spacing;
@@ -473,7 +487,8 @@ static void update_attrib_phy_info(struct adapter *padapter, struct pkt_attrib *
 	pattrib->retry_ctrl = false;
 }
 
-static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *pattrib, struct sta_info *psta)
+static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *pattrib,
+				  struct sta_info *psta)
 {
 	signed int res = _SUCCESS;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
@@ -512,7 +527,8 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 		}
 
 		/* For WPS 1.0 WEP, driver should not encrypt EAPOL Packet for WPS handshake. */
-		if (((pattrib->encrypt == _WEP40_) || (pattrib->encrypt == _WEP104_)) && (pattrib->ether_type == 0x888e))
+		if (((pattrib->encrypt == _WEP40_) || (pattrib->encrypt == _WEP104_)) &&
+		    (pattrib->ether_type == 0x888e))
 			pattrib->encrypt = _NO_PRIVACY_;
 	}
 
@@ -564,7 +580,7 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 		memcpy(pattrib->dot118021x_UncstKey.skey, psta->dot118021x_UncstKey.skey, 16);
 
 	if (pattrib->encrypt &&
-		((padapter->securitypriv.sw_encrypt) || (!psecuritypriv->hw_decrypted)))
+	    ((padapter->securitypriv.sw_encrypt) || (!psecuritypriv->hw_decrypted)))
 		pattrib->bswenc = true;
 	else
 		pattrib->bswenc = false;
@@ -656,7 +672,9 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	pattrib->pktlen = pktfile.pkt_len;
 
 	if (pattrib->ether_type == ETH_P_IP) {
-		/*  The following is for DHCP and ARP packet, we use cck1M to tx these packets and let LPS awake some time */
+		/*  The following is for DHCP and ARP packet,
+		 *  we use cck1M to tx these packets and let LPS awake some time
+		 */
 		/*  to prevent DHCP protocol fail */
 
 		u8 tmp[24];
@@ -667,7 +685,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 		if (pktfile.pkt_len > 282) {/* MINIMUM_DHCP_PACKET_SIZE) { */
 			if (pattrib->ether_type == ETH_P_IP) {/*  IP header */
 				if (((tmp[21] == 68) && (tmp[23] == 67)) ||
-					((tmp[21] == 67) && (tmp[23] == 68))) {
+				    ((tmp[21] == 67) && (tmp[23] == 68))) {
 					/*  68 : UDP BOOTP client */
 					/*  67 : UDP BOOTP server */
 					pattrib->dhcp_pkt = 1;
@@ -778,7 +796,8 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 	if (pattrib->encrypt == _TKIP_) {
 		/* encode mic code */
 		{
-			u8 null_key[16] = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
+			u8 null_key[16] = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
+					   0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
 
 			pframe = pxmitframe->buf_addr + hw_hdr_offset;
 
@@ -999,9 +1018,9 @@ s32 rtw_txframes_pending(struct adapter *padapter)
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 
 	return ((!list_empty(&pxmitpriv->be_pending.queue)) ||
-			 (!list_empty(&pxmitpriv->bk_pending.queue)) ||
-			 (!list_empty(&pxmitpriv->vi_pending.queue)) ||
-			 (!list_empty(&pxmitpriv->vo_pending.queue)));
+		(!list_empty(&pxmitpriv->bk_pending.queue)) ||
+		(!list_empty(&pxmitpriv->vi_pending.queue)) ||
+		(!list_empty(&pxmitpriv->vo_pending.queue)));
 }
 
 /*
@@ -1031,7 +1050,8 @@ u32 rtw_calculate_wlan_pkt_size_by_attribue(struct pkt_attrib *pattrib)
  * 5. move frag chunk from pframe to pxmitframe->mem
  * 6. apply sw-encrypt, if necessary.
  */
-s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe)
+s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt,
+			   struct xmit_frame *pxmitframe)
 {
 	struct pkt_file pktfile;
 
@@ -1152,7 +1172,8 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 }
 
 /* broadcast or multicast management pkt use BIP, unicast management pkt use CCMP encryption */
-s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe)
+s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt,
+				struct xmit_frame *pxmitframe)
 {
 	u8 *pframe, *mem_start = NULL, *tmp_buf = NULL;
 	u8 subtype;
@@ -1235,7 +1256,7 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 	} else { /* unicast mgmt frame TX */
 		/* start to encrypt mgmt frame */
 		if (subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC ||
-			subtype == WIFI_REASSOCREQ || subtype == WIFI_ACTION) {
+		    subtype == WIFI_REASSOCREQ || subtype == WIFI_ACTION) {
 			if (pattrib->psta)
 				psta = pattrib->psta;
 			else
@@ -1249,11 +1270,11 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 
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
@@ -1410,7 +1431,7 @@ void rtw_count_tx_stats(struct adapter *padapter, struct xmit_frame *pxmitframe,
 }
 
 static struct xmit_buf *__rtw_alloc_cmd_xmitbuf(struct xmit_priv *pxmitpriv,
-		enum cmdbuf_type buf_type)
+						enum cmdbuf_type buf_type)
 {
 	struct xmit_buf *pxmitbuf =  NULL;
 
@@ -1431,7 +1452,7 @@ static struct xmit_buf *__rtw_alloc_cmd_xmitbuf(struct xmit_priv *pxmitpriv,
 }
 
 struct xmit_frame *__rtw_alloc_cmdxmitframe(struct xmit_priv *pxmitpriv,
-		enum cmdbuf_type buf_type)
+					    enum cmdbuf_type buf_type)
 {
 	struct xmit_frame		*pcmdframe;
 	struct xmit_buf		*pxmitbuf;
@@ -1768,7 +1789,8 @@ s32 rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitfram
 	return _SUCCESS;
 }
 
-struct tx_servq *rtw_get_sta_pending(struct adapter *padapter, struct sta_info *psta, signed int up, u8 *ac)
+struct tx_servq *rtw_get_sta_pending(struct adapter *padapter, struct sta_info *psta,
+				     signed int up, u8 *ac)
 {
 	struct tx_servq *ptxservq = NULL;
 
@@ -2022,7 +2044,8 @@ inline bool xmitframe_hiq_filter(struct xmit_frame *xmitframe)
 	return allow;
 }
 
-signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct xmit_frame *pxmitframe)
+signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter,
+					      struct xmit_frame *pxmitframe)
 {
 	signed int ret = false;
 	struct sta_info *psta = NULL;
@@ -2117,7 +2140,8 @@ signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct x
 			if (wmmps_ac)
 				psta->sleepq_ac_len++;
 
-			if (((psta->has_legacy_ac) && (!wmmps_ac)) || ((!psta->has_legacy_ac) && (wmmps_ac))) {
+			if (((psta->has_legacy_ac) && (!wmmps_ac)) ||
+			    ((!psta->has_legacy_ac) && (wmmps_ac))) {
 				if (!(pstapriv->tim_bitmap & BIT(psta->aid)))
 					update_tim = true;
 
@@ -2137,7 +2161,8 @@ signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct x
 	return ret;
 }
 
-static void dequeue_xmitframes_to_sleeping_queue(struct adapter *padapter, struct sta_info *psta, struct __queue *pframequeue)
+static void dequeue_xmitframes_to_sleeping_queue(struct adapter *padapter, struct sta_info *psta,
+						 struct __queue *pframequeue)
 {
 	signed int ret;
 	struct list_head *plist, *phead, *tmp;
@@ -2158,7 +2183,8 @@ static void dequeue_xmitframes_to_sleeping_queue(struct adapter *padapter, struc
 		ret = xmitframe_enqueue_for_sleeping_sta(padapter, pxmitframe);
 
 		if (ret) {
-			ptxservq = rtw_get_sta_pending(padapter, psta, pattrib->priority, (u8 *)(&ac_index));
+			ptxservq = rtw_get_sta_pending(padapter, psta, pattrib->priority,
+						       (u8 *)(&ac_index));
 
 			ptxservq->qcnt--;
 			phwxmits[ac_index].accnt--;
@@ -2464,8 +2490,8 @@ struct xmit_buf *dequeue_pending_xmitbuf_under_survey(struct xmit_priv *pxmitpri
 			type = GetFrameSubType(pxmitbuf->pbuf + TXDESC_OFFSET);
 
 			if ((type == WIFI_PROBEREQ) ||
-				(type == WIFI_DATA_NULL) ||
-				(type == WIFI_QOS_DATA_NULL)) {
+			    (type == WIFI_DATA_NULL) ||
+			    (type == WIFI_QOS_DATA_NULL)) {
 				list_del_init(&pxmitbuf->list);
 				break;
 			}
-- 
2.52.0

