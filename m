Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87867264609
	for <linux-staging@lists.linux.dev>; Thu, 22 Jan 2026 16:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769100514; cv=none; b=i5P9AQTUIbIMgwWRsaoXzyjDHVWiChiZUeU6NRjmjZ7ZIfy0Ao2zEf94YfC0ni/lzw3yHnLQJ6VB/f7v871YvG5/Xdxd0OOWLrXL6BvRMzMuixYIohiVxHpOZXs46R7WvBudBLQbBVxCBoRaD4lKB1qZWOuinRkFnDCk3riNNcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769100514; c=relaxed/simple;
	bh=wMn5OodQiuyuzlqSG0KT3UKtvO1RoYKdkyBLbhWAn0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nrjNq2PJ9oWH1/OvaoCuuUUOx5CSgXjuw31HuMRNzane26jO7UyekU1MI9lcTdj0xqHqgnRgr5K74fENLlK1kIgCeIhNkFx8A45GYmr5F6zXEcQHtvp+ZjuPv/dVY42QVS/eMb6gf8vrC4EO7/v0x1AiseZg/U9Qe/n+seWu5h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eIs5t/sl; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eIs5t/sl"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a7a23f5915so8208395ad.2
        for <linux-staging@lists.linux.dev>; Thu, 22 Jan 2026 08:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769100503; x=1769705303; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0BDRr2yeABBk83iQGJ24rP8MmGcDKpsrsYXgQ2ZdRI=;
        b=eIs5t/sl9TqO/vkdfXsETcozDP072vg0VXKKqo0wDO7K4K6fn8GSrTdOg+NYhdh5ld
         YR6kCISCqALleo6o1w+dhCm/jpqaBtQTQlGvk2TVyQm/g+iWYoUC2GApdZviOO/hmZTb
         evVrnWuaE5qMdoh+AsyMODUy1jU0g/OKqKq10x/qJs5nZtyNwnItIHRPqwBlZEBvuCu+
         F9GpVOnuXInxTDnQUQuE4Y+BENdgqtqEt4++ywOVxbaYyg1iQBng49X/e6BSqHA3bR/L
         oCm1t8ge7xxJC291lkYQeR5+60yiVSqh7p/yOHJdQa6HDjW3XhNIrpv3Q2tXcW+K5eG+
         3MRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769100503; x=1769705303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y0BDRr2yeABBk83iQGJ24rP8MmGcDKpsrsYXgQ2ZdRI=;
        b=Yhca77ftNQFMSIxcvQTqIw6ehJJaZKKRUrqok7lLhxzS9Ov/gBJF4RQ0l2EIiF0wTH
         hvNdelvcN5QdxH5Ptd1V3A7UoxF2Y+wRlRUfDa+fNsJxOVmIbKNH57Dz9JwJ3p5XED4Q
         yvznlApUS/mZtwAnWIdV+E//fHk3BWU3pxUfVxPf8+7UB+BhIsBsktRLfk0VyT5PtTcO
         UxsHmjE6dEB0GJv2N0dJRk+maTb1BH+EAt2xtJJXNf91iQ72DtU0t7TNEXynH99WePoo
         nrCRuLgak1zd0QBFSV2H840DwMKYD8LU2866ou072I1rYHVcUIPwPWYBFRtO6QojTRTk
         SuAg==
X-Forwarded-Encrypted: i=1; AJvYcCVLWoXKFYiMEVMKmdtrmnP1MyCwgoYf1ZnuWn7yPTSDBMk5A4zSq2yuCYKZQ7rm+SHV89cZcV/EmC891NQ1@lists.linux.dev
X-Gm-Message-State: AOJu0YxCzN/Z3A7LE9hFEEx2F5sFKy1/9kNGiebLxRnMYVNfZmvrIR4H
	Qbzh/OsUnmKugRJDolewPV6Bu2Spayr3XO1/za9EjjJbcAEzKs40jSuo
X-Gm-Gg: AZuq6aJZ9GlqPRnSNsIHTRCaSPenacrPlQUtCJ4F/mgnyWAAV/JdayiV1uqQEIkRy94
	Cw0XOsKpQPwdId+6KWOLCEJL/e9inCmapCE7jjPl1otS8uwon8yY9ZaxqoWhsOEHZUlxJnsvhgZ
	4q5i0l+LGIPE6V+v4z5ZmiZJumf+VrVVEKnI5bTU1jumaKxtKKLBX/oYOPO3pRX7TbLQyx55udb
	uSgHYVlHPDLQnJ5XYfD9lQsvin9YaKcwWbshO6k0+RmrUN05dR3cngdyvb2tnvM7lAwg1odUSAd
	sMyljqOGprQZxqKowvRHn9m1XFsue33C76VZ3yoewIRqcr4l3gVo/O5eywsApt5+XZf8Rwot2Vn
	UDwjXFuzB8liFZqo6FeRigT9uPEMSSfidxqqx1OfVFtAA4z+ve5yDNmQEpdtc37IgT7IXV+JtOV
	ci8myPrOpwOQsG4BIULZpjneRz0exM8nVcAxg=
X-Received: by 2002:a17:902:e808:b0:2a1:10f6:3c1 with SMTP id d9443c01a7336-2a7fe5ad605mr503465ad.26.1769100502601;
        Thu, 22 Jan 2026 08:48:22 -0800 (PST)
Received: from snowman.bbrouter ([43.241.121.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193dd523sm189986225ad.62.2026.01.22.08.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 08:48:22 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v4 3/3] staging: rtl8723bs: fix line length and alignment issues
Date: Thu, 22 Jan 2026 22:17:51 +0530
Message-ID: <20260122164751.37796-4-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122164751.37796-1-khushalchitturi@gmail.com>
References: <20260122164751.37796-1-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix multiple coding style issues in rtw_xmit.c to comply with the kernel
coding style by splitting expressions and adjusting alignment.

This patch resolves checkpatch.pl warnings caused by line length
exceeding 100 columns and alignment matching the open parenthesis.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>

---
Changelog:
v3 -> v4: Adjusted comment formatting.
v2 -> v3: Resubmitted as a versioned series to resolve threading confusion.
v1 -> v2: No changes.

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 107 +++++++++++++---------
 1 file changed, 66 insertions(+), 41 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 959cbb4a194e..fbe03cfbf3e6 100644
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
@@ -777,7 +794,8 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 	if (pattrib->encrypt == _TKIP_) {
 		/* encode mic code */
 		{
-			u8 null_key[16] = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
+			u8 null_key[16] = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
+					   0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
 
 			pframe = pxmitframe->buf_addr + hw_hdr_offset;
 
@@ -997,10 +1015,10 @@ s32 rtw_txframes_pending(struct adapter *padapter)
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
@@ -1030,7 +1048,8 @@ u32 rtw_calculate_wlan_pkt_size_by_attribue(struct pkt_attrib *pattrib)
  * 5. move frag chunk from pframe to pxmitframe->mem
  * 6. apply sw-encrypt, if necessary.
  */
-s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe)
+s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt,
+			   struct xmit_frame *pxmitframe)
 {
 	struct pkt_file pktfile;
 
@@ -1151,7 +1170,8 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 }
 
 /* broadcast or multicast management pkt use BIP, unicast management pkt use CCMP encryption */
-s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe)
+s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt,
+				struct xmit_frame *pxmitframe)
 {
 	u8 *pframe, *mem_start = NULL, *tmp_buf = NULL;
 	u8 subtype;
@@ -1234,7 +1254,7 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 	} else { /* unicast mgmt frame TX */
 		/* start to encrypt mgmt frame */
 		if (subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC ||
-			subtype == WIFI_REASSOCREQ || subtype == WIFI_ACTION) {
+		    subtype == WIFI_REASSOCREQ || subtype == WIFI_ACTION) {
 			if (pattrib->psta)
 				psta = pattrib->psta;
 			else
@@ -1248,11 +1268,11 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 
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
@@ -1409,7 +1429,7 @@ void rtw_count_tx_stats(struct adapter *padapter, struct xmit_frame *pxmitframe,
 }
 
 static struct xmit_buf *__rtw_alloc_cmd_xmitbuf(struct xmit_priv *pxmitpriv,
-		enum cmdbuf_type buf_type)
+						enum cmdbuf_type buf_type)
 {
 	struct xmit_buf *pxmitbuf =  NULL;
 
@@ -1430,7 +1450,7 @@ static struct xmit_buf *__rtw_alloc_cmd_xmitbuf(struct xmit_priv *pxmitpriv,
 }
 
 struct xmit_frame *__rtw_alloc_cmdxmitframe(struct xmit_priv *pxmitpriv,
-		enum cmdbuf_type buf_type)
+					    enum cmdbuf_type buf_type)
 {
 	struct xmit_frame		*pcmdframe;
 	struct xmit_buf		*pxmitbuf;
@@ -1767,7 +1787,8 @@ s32 rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitfram
 	return _SUCCESS;
 }
 
-struct tx_servq *rtw_get_sta_pending(struct adapter *padapter, struct sta_info *psta, signed int up, u8 *ac)
+struct tx_servq *rtw_get_sta_pending(struct adapter *padapter, struct sta_info *psta,
+				     signed int up, u8 *ac)
 {
 	struct tx_servq *ptxservq = NULL;
 
@@ -2021,7 +2042,8 @@ inline bool xmitframe_hiq_filter(struct xmit_frame *xmitframe)
 	return allow;
 }
 
-signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct xmit_frame *pxmitframe)
+signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter,
+					      struct xmit_frame *pxmitframe)
 {
 	signed int ret = false;
 	struct sta_info *psta = NULL;
@@ -2116,7 +2138,8 @@ signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct x
 			if (wmmps_ac)
 				psta->sleepq_ac_len++;
 
-			if (((psta->has_legacy_ac) && (!wmmps_ac)) || ((!psta->has_legacy_ac) && (wmmps_ac))) {
+			if ((psta->has_legacy_ac && !wmmps_ac) ||
+			    (!psta->has_legacy_ac && wmmps_ac)) {
 				if (!(pstapriv->tim_bitmap & BIT(psta->aid)))
 					update_tim = true;
 
@@ -2136,7 +2159,8 @@ signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct x
 	return ret;
 }
 
-static void dequeue_xmitframes_to_sleeping_queue(struct adapter *padapter, struct sta_info *psta, struct __queue *pframequeue)
+static void dequeue_xmitframes_to_sleeping_queue(struct adapter *padapter, struct sta_info *psta,
+						 struct __queue *pframequeue)
 {
 	signed int ret;
 	struct list_head *plist, *phead, *tmp;
@@ -2157,7 +2181,8 @@ static void dequeue_xmitframes_to_sleeping_queue(struct adapter *padapter, struc
 		ret = xmitframe_enqueue_for_sleeping_sta(padapter, pxmitframe);
 
 		if (ret) {
-			ptxservq = rtw_get_sta_pending(padapter, psta, pattrib->priority, (u8 *)(&ac_index));
+			ptxservq = rtw_get_sta_pending(padapter, psta, pattrib->priority,
+						       (u8 *)(&ac_index));
 
 			ptxservq->qcnt--;
 			phwxmits[ac_index].accnt--;
@@ -2462,9 +2487,9 @@ struct xmit_buf *dequeue_pending_xmitbuf_under_survey(struct xmit_priv *pxmitpri
 
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

