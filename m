Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14AD32B997
	for <linux-staging@lists.linux.dev>; Sun,  1 Feb 2026 11:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769946039; cv=none; b=ZG3Y2bHzDqXQn20twLTbeTltLDNREtuw/8rHtPnbhGts5yWxI3r+7jEz7Cui65Sb1txMRJOH1JF5avZ91XvWbJky0vF2apAW7bjnGqGGgQA2zYC2z4OM+sJP4WlauxlSO7fuXos53AyKGevEfr07LZDd7gDZnbG6jGKU73nz3Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769946039; c=relaxed/simple;
	bh=vbEGr0UUqH4pisbLNDIa3XJWZ6anEgiy4TqqCBcTZr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AHvfc/52LjXa5pGZiK7JzX0RCWQ5X59VvKnei65iuzmdzm2QMBfxcW4Fx4kIb+Uvp1o4P5fsmAUIDSRakq2L4Pgm1JImEAUz6bvO1rTew74mYD3PLldY1vCCxhOfcEDZ5m6GeJBwztAG4kTblJWlCLmevJfrCYLGsC57n2zkzPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1fvknoL; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1fvknoL"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82361bcbd8fso2064505b3a.0
        for <linux-staging@lists.linux.dev>; Sun, 01 Feb 2026 03:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769946037; x=1770550837; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+FurWu8aQVGjuPbej29DU2QlB1gNwYsDPJkjOJmyAw=;
        b=b1fvknoL4J14yrMHstDFcjIBahJiaPcqoIkcezbdYuVgp1uBx2RlHH+QisHHfx1yu+
         TVMfpdZ80T8KntLH619D4WboP4rWUXhE6lJEGzqlIL0WuCYCx7X+v3mj5giBUMJ0S4dE
         9gO8mRysflOw3sK+w4PL8DvDUytMpkJl6bjKJp5VLg88twXflRMdina0SYb5m5dzHqXh
         8VyuH4s7X/N61XSnyipUo/iv+WY2pVXh7G6EYbCsSjxKopzcX7DW3QI6Zqp2jrn7gg+F
         kFtuqDeBWVZAqj313LAT+6a97Amli8gyC+3p6bnsymbd/apE+hJWiSugARADaCIuvPDK
         yWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769946037; x=1770550837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5+FurWu8aQVGjuPbej29DU2QlB1gNwYsDPJkjOJmyAw=;
        b=IAtGou5Icp4BLtP1ZlCS6oX336hH1LRJsoxRvK9v3S0KazaW4t6SyFE9k/kEtydSl2
         maJDdUNMWQ1tcim7qX+L+3/RSfxNN47BjQsg5T1gPaSGQOS3a/mO9J3ve4dPKa4wv7Dm
         cOYnlTPl4KNVVerkpdjkS/mdJugWVc1JnpcZkbGN1Ik1ZudfQCVZkVY1q1aSM0oTYUKn
         QBK+MwjJrGhaiHIkzfRciJHOQkJAyPd2mcY4Uk7puRB2+u3WDoZ1wpZn1gDbg31I6ab3
         qo2vl4iytdJr4A2tzVwqFZGSB343LR/cDXL82INLf22OoztkYTQlO0l6AVR3KfSvLIai
         fA4w==
X-Forwarded-Encrypted: i=1; AJvYcCXkuc/FW9Dd/Bw5cgJ9SYouYkNJM1QC3wAnrjdpDFOEqlSwO859v10u9XqDI3KswZWRVys0TqjXdBpCCMsl@lists.linux.dev
X-Gm-Message-State: AOJu0YyYCu4YJ7600Ys7240vYULyAtqBEFZK4D1VD48OoAxGKRf4xNRi
	SIBqZJSJImgaGfmB5hK4p+s4kBBc9pUoNiZIjKUpu2khX1Kb4J7cQ+n+
X-Gm-Gg: AZuq6aIQULB4pl6krZKL4Vn4iyj1xLD/sCQbl8qVTQ9y2biCFlOF1SLk72ESR1lE/jU
	1zJ6NTdymQQ4aT+1m4cd76dnriMalT7JQ9e40B24bWln0rH3NCiu+U1gsw/6/48XnaYRgRIzMPd
	mC/N560CIWD8VBonKrDzq2fOIfhSgJDsSCaMVnk48tau0LDU/Y7llG9AmoeFQwJB5NdH0vU/E+G
	YVqedUmO8Qv+FzHOUQldwzCG6D+XiDhnCn+6MDmHvW9YqRvplrTRIQl/+plDkYnVwD8gXl4y652
	bZl4BgA4Hp8xHP8JkGcb5Cc2yV3Dv+pD1CBYDaTpvi6t89bS02vbgQBfIXXsMs2gFSVYuPuFy3g
	zYbsTcUj+RllL956XpZOnnqZl7NVbe8G1gOlTjkhat5R6avlEW9jBvuL3Dw/sbRdigLv6WMRGee
	P+gW4/4BUyPBt+XuTJ
X-Received: by 2002:a05:6a21:3985:b0:37e:4319:d7c8 with SMTP id adf61e73a8af0-392e01b5b42mr7638404637.75.1769946037210;
        Sun, 01 Feb 2026 03:40:37 -0800 (PST)
Received: from snowman ([2401:4900:614d:8c00:9d3:b11e:236d:377a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b7f7caasm121156675ad.101.2026.02.01.03.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 03:40:36 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v6 4/4] staging: rtl8723bs: fix line length and alignment issues
Date: Sun,  1 Feb 2026 17:08:37 +0530
Message-ID: <20260201113837.8531-5-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260201113837.8531-1-khushalchitturi@gmail.com>
References: <20260201113837.8531-1-khushalchitturi@gmail.com>
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
v5 -> v6: No changes.
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

