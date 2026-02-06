Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B5D34D390
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 07:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770364533; cv=none; b=TSuJhcjDmQ9F9y1JdWyOMsFlPUbnVMxwfUNQuZ0FlCB6/8Vb/+KjNGo56y+C5qEQ77v1p5A1hHXn8ksRm+DgF128RJvKGsji18yO8ngrQpE8SFKlMP+VgLJn2bgngEYX4VrXi3QoFwSl5gy+QzAyrFbze25w8x6KrpWPr5eYdMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770364533; c=relaxed/simple;
	bh=xxmU2Iz1niZ9TaTlPjBX3e0cq7c/9QkGOrVTrFkgBLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ni5yd4jdq73T2BiMG1ye87VMBkrtloql+YDZwS/Fnhc+kqBD5t9/z0CfmSnnGe39qs+jmx3+sR6DWuC8aSGurSFSUf+m1nmwl+TqegBRxRmoOJLNBtWqbe1SQMlis5NQ8u1MtZs69bGX2JQxD4SE3xq5V1kWZIskzznrgXo0u/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S9RT/eG1; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S9RT/eG1"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4362d4050c1so80116f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 23:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770364532; x=1770969332; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJl9uSxjTmkQN0eYXj0vZRVQ5k+Fy7400lwDxhWwNOY=;
        b=S9RT/eG1XS8Cd2dAzMb8M5o0pIw2f7XYVfwgnXZnsF/Kdt1dXuf/x3zZ6CbLObRGiX
         H3m2HoS0NuV5+vRD/gwCxtjaYEq0nAM0j2ZsTdIRY++wjo1xG7MsZGjYt9Hq7wWEf6ou
         bH4RLSK9D0oozJe8i6TpCoBncSiH2otTE56b3teYLW6uYJ+ckkk+LFQ9vwD62EF4sUdy
         RQQK7XRjjOVxDoqlC/EcKFdbGs9noJK6rNvcGruggeK9Qcq3dJFrWT46L/bUEo0RN6mc
         20uOsdf6gUWYcZDff2h8DxLO+VY6mX5tcVd/zZ/aFV6GLi68aGq6GCQ+j5WVo6KEkNrZ
         Z5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770364532; x=1770969332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aJl9uSxjTmkQN0eYXj0vZRVQ5k+Fy7400lwDxhWwNOY=;
        b=Uto9CsnT7ZX7Qnd54RsMHgz1uKNMzsO2Ljt5dwT6gbJ5zf2Em31en7eMH9Jqfqw5BN
         CLPPKaPChy9RYjP2iScGwivgWSoSc6SJMF5pC9+rP9CfSYxB+nxr/SBTgOsbppWX1fdj
         +6+dUD4zYRqA0djnRvTt7/SoomrUDNGEDnDp975+dnzn3NHNZpdTNsEJ/gisfXyGgGig
         uFFYZjRgz86B2xrODx2zMhEiyZT1QP4xyCJjVOhmRxSROGG6sT5x9311i/yYuJLxHk82
         l2v5LRUDJA2N1hOzxjWaWVALjdlI2F9koMSIayX951tUWkaCsi4HrmDpaqrf9v4TuFGV
         gaGA==
X-Forwarded-Encrypted: i=1; AJvYcCUYe4npKe+suXG1Lc2dVwhctQamtCLxFp7S1exHIj3g7+00ZAKcQV+Qi0l+oVsCtksUms4ClYfabLYV5nT3@lists.linux.dev
X-Gm-Message-State: AOJu0YzyJ0x51Ja41HKF4kT+5jQ0fiIeqBTgXIhqkecJd6hiBFA9RPpl
	ZNxjWn7SqxgOYDZPhLSJEDea1/ImiFJCwZt3pWzv1SRUpF8q54vlfNM=
X-Gm-Gg: AZuq6aIRHyRhc3qHzmmN0tO0Ky6gXXg16tjM/t6Cnd0siLMVAC1TA0F8PwW9ocLAKsK
	y3tr9p08Euz/kbYEyDjXLmEWSlsox3c3VNAPPfHk9VTMWMvmBB2zVLINRmJl4hEdUT03lB5xqyU
	WqxbuYIhqOB8ImckkgXpD1ID+vZL/kJjDk6iZW3lh/wkwM315HZ3YlQPK+4SlwmFLiF4WKNm0uL
	IkWe01ceZwCbv+RuHYFMlaM9KNkftv2y7QP8boRAIp63M3d1+w3/og+z/42zvEtOV11Uqt+7EQY
	FziJxW3NalAEOcQyhFqYKD69V26k3LcUlIIV8oSZeeHzEKRLNrZ2BorL4zFQ3RAFOW4Cc7hSvAu
	Velr7jiOAMZ+REVWrhMd+sNGmqgB849HRSstFb2uwh9cor4FydtNshqIwCFbrkCV31DaJFot++a
	q6cBajK+7R8EXnS/dxCW2G3dhF9DKrlWbKjj36ZcyFib78/tAibLb0wOXMSawooYg=
X-Received: by 2002:a5d:5d86:0:b0:430:f437:5a6d with SMTP id ffacd0b85a97d-43629341e92mr2668591f8f.22.1770364531840;
        Thu, 05 Feb 2026 23:55:31 -0800 (PST)
Received: from LGPC ([31.223.131.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd3b8sm3836039f8f.11.2026.02.05.23.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:55:31 -0800 (PST)
From: lukagejak5@gmail.com
X-Google-Original-From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v2 25/26] staging: rtl8723bs: core: fix line lengths in rtw_xmit.c
Date: Fri,  6 Feb 2026 08:54:38 +0100
Message-ID: <20260206075439.103287-26-luka.gejak@linux.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206075439.103287-1-luka.gejak@linux.dev>
References: <20260206075439.103287-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luka Gejak <luka.gejak@linux.dev>

Break long lines exceeding 100 characters to comply with kernel coding
style.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 44 ++++++++++++++++-------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 9cead1455bfa..fdacdcf3aa98 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -435,7 +435,9 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 		pattrib->vcs_mode = padapter->driver_vcs_type;
 }
 
-static void update_attrib_phy_info(struct adapter *padapter, struct pkt_attrib *pattrib, struct sta_info *psta)
+static void update_attrib_phy_info(struct adapter *padapter,
+				   struct pkt_attrib *pattrib,
+				   struct sta_info *psta)
 {
 	struct mlme_ext_priv *mlmeext = &padapter->mlmeextpriv;
 
@@ -471,7 +473,9 @@ static void update_attrib_phy_info(struct adapter *padapter, struct pkt_attrib *
 	pattrib->retry_ctrl = false;
 }
 
-static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *pattrib, struct sta_info *psta)
+static s32 update_attrib_sec_info(struct adapter *padapter,
+				  struct pkt_attrib *pattrib,
+				  struct sta_info *psta)
 {
 	signed int res = _SUCCESS;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
@@ -510,8 +514,14 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 		}
 
 		/* For WPS 1.0 WEP, driver should not encrypt EAPOL Packet for WPS handshake. */
-		if (((pattrib->encrypt == _WEP40_) || (pattrib->encrypt == _WEP104_)) && (pattrib->ether_type == 0x888e))
-			pattrib->encrypt = _NO_PRIVACY_;
+		{
+			bool is_wep = pattrib->encrypt == _WEP40_ ||
+				      pattrib->encrypt == _WEP104_;
+			bool is_eapol = pattrib->ether_type == 0x888e;
+
+			if (is_wep && is_eapol)
+				pattrib->encrypt = _NO_PRIVACY_;
+		}
 	}
 
 	switch (pattrib->encrypt) {
@@ -776,15 +786,18 @@ static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 	if (pattrib->encrypt == _TKIP_) {
 		/* encode mic code */
 		{
-			u8 null_key[16] = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
+			static const u8 null_key[16] = {0};
 
 			pframe = pxmitframe->buf_addr + hw_hdr_offset;
 
 			if (bmcst) {
-				if (!memcmp(psecuritypriv->dot118021XGrptxmickey[psecuritypriv->dot118021XGrpKeyid].skey, null_key, 16))
+				u8 grpkeyid = psecuritypriv->dot118021XGrpKeyid;
+				u8 *grp_mic = psecuritypriv->dot118021XGrptxmickey[grpkeyid].skey;
+
+				if (!memcmp(grp_mic, null_key, 16))
 					return _FAIL;
 				/* start to calculate the mic code */
-				rtw_secmicsetkey(&micdata, psecuritypriv->dot118021XGrptxmickey[psecuritypriv->dot118021XGrpKeyid].skey);
+				rtw_secmicsetkey(&micdata, grp_mic);
 			} else {
 				if (!memcmp(&pattrib->dot11tkiptxmickey.skey[0], null_key, 16))
 					return _FAIL;
@@ -1029,7 +1042,8 @@ u32 rtw_calculate_wlan_pkt_size_by_attribue(struct pkt_attrib *pattrib)
  * 5. move frag chunk from pframe to pxmitframe->mem
  * 6. apply sw-encrypt, if necessary.
  */
-s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe)
+s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt,
+			   struct xmit_frame *pxmitframe)
 {
 	struct pkt_file pktfile;
 
@@ -1150,7 +1164,8 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 }
 
 /* broadcast or multicast management pkt use BIP, unicast management pkt use CCMP encryption */
-s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe)
+s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt,
+				struct xmit_frame *pxmitframe)
 {
 	u8 *pframe, *mem_start = NULL, *tmp_buf = NULL;
 	u8 subtype;
@@ -1764,7 +1779,9 @@ s32 rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitfram
 	return _SUCCESS;
 }
 
-struct tx_servq *rtw_get_sta_pending(struct adapter *padapter, struct sta_info *psta, signed int up, u8 *ac)
+struct tx_servq *rtw_get_sta_pending(struct adapter *padapter,
+					 struct sta_info *psta,
+					 signed int up, u8 *ac)
 {
 	struct tx_servq *ptxservq = NULL;
 
@@ -2018,7 +2035,8 @@ inline bool xmitframe_hiq_filter(struct xmit_frame *xmitframe)
 	return allow;
 }
 
-signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct xmit_frame *pxmitframe)
+signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter,
+					      struct xmit_frame *pxmitframe)
 {
 	signed int ret = false;
 	struct sta_info *psta = NULL;
@@ -2133,7 +2151,9 @@ signed int xmitframe_enqueue_for_sleeping_sta(struct adapter *padapter, struct x
 	return ret;
 }
 
-static void dequeue_xmitframes_to_sleeping_queue(struct adapter *padapter, struct sta_info *psta, struct __queue *pframequeue)
+static void dequeue_xmitframes_to_sleeping_queue(struct adapter *padapter,
+						 struct sta_info *psta,
+						 struct __queue *pframequeue)
 {
 	signed int ret;
 	struct list_head *plist, *phead, *tmp;
-- 
2.52.0

