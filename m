Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB77C3321C8
	for <linux-staging@lists.linux.dev>; Thu,  4 Dec 2025 11:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764849334; cv=none; b=ZgEAm5nEKmwGTUo8cmtxA+SZR2Ow5ybv8z0v05t4upOSdxFlC0o7GYBUwNRxCgHPyX0IrirwlBNk1yW8yQWLoyZUlnt3M5M2SAcmDgWmiWHI1h9VCNLH8yybcGUUTJ3wymEvCRpF5k5tu/YgeDrL3f7w1YaPw9XamwsszXDJOtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764849334; c=relaxed/simple;
	bh=l7/z9VtwwR4rrbMlwaubaDmtdF99/xCCJhbB94ppox0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KKW2P9XDXUFGvkEraCrOkYc5lXtw9JNxjdNqKJ7+oE+ftWoU3nxdU1JxekFCdqso8Ewj+712y/7kAVrCqosRGPwEUOcd2lkrlF7K8FXFn3JHfrb9Q2zfnYjNPb2k75zJrqVsLMBQiAOR2EdCkPBJkIvDi0UvWDn4fHJ78nYGCyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jln+WJjY; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jln+WJjY"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5957db5bdedso1014816e87.2
        for <linux-staging@lists.linux.dev>; Thu, 04 Dec 2025 03:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764849330; x=1765454130; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rkft/WEYttkK6qRkuyqpKpo4qPYT0A5bd0mr/6P5yFc=;
        b=jln+WJjYjuoivkDBRvynZC7fwHkb1sZntz/sYj6yi6L86XAg9/J+HucT5hIrXlFZdr
         y+tbMVGyPp/5jEYkOI2dIPvrF8fT7R3ziiH4nLsyfjZ/x9EXzjyEU5KYeXOOgxESzvvq
         zA6TMbnrzn+zXaAjpMjbFhjO9xQz4kbPDZMbLSOsQUB0pgdHrWHWNJ29bZH8gP4qtOrd
         0rs4ogx8miCiw7lIyM9yDTWymCzB9ta8GAtK1dsL/oyjKUYYnkFEOTcGYzIdwEp3NWA2
         vJssprCLjh9bniuDzIhSS5pq//6ln2TSzgUvS5QkzKbg+BVjnEv5IZt+2XKbDwmn1Iu0
         PwmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764849330; x=1765454130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rkft/WEYttkK6qRkuyqpKpo4qPYT0A5bd0mr/6P5yFc=;
        b=rX2+X8P9+tE3gD97cLXVDbbke0vYuNBhomp6AouzlsHXI+wLfEGpZcAxF9YepjW6qk
         eX28cP4p4iGCtOlCczEIKWsiNhQv7mb/f6H2KaDze0D+/8cYI2AN58BsJo0yabTHGXj8
         QczdRgA2p8tdQlzZErL2EEsVi2OVYZwqRljQDD5+y5p23kZtGCwrRQeni2yeJSvsSHZ3
         Lggzk2jNzdaPzOJSD7EcRy247RWMt6eiS0WEFPBV8iVbq1DPPngpDPA0/QwSDd/9nhjP
         2V0gAGls3RrsVmo7EjNUGZSMxKZhEexoKICMyT646h1XhxhT7HwzpMYeJ71N0WtAEcUw
         1sNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDIvTbILhv5EGq8oqFMOZH/iVahRAIeMR/slEaJKoAVVuGIX4TJI/yFF+MGUiTlwcCzMSHRKqzDP0D+Nsd@lists.linux.dev
X-Gm-Message-State: AOJu0YyWnzSivZJ+clkdq/qrvky4jvl//WNnS91Qyvq+uZqKeVQkC6VB
	rSX3bC7T7UVxookKC003mDY7PNi9lWpbYcHk4yWWgJAMxQLIRsyVDSQv
X-Gm-Gg: ASbGnctgIK3VTSdCiLN1Z9tqPyuwShmnDmaayfkwyIF0E51HFjyU0XFIHHUV1pHkqK8
	X3LDdhJ8tSgJsn/ukMXjLGcI9nAs35GX5Sc5/znjHz/pZKKptNJdR5wXVPQcacT+v+U4dQjNxxB
	VGNCh9Z2/WMScDlJNF+t/ry8nzU3HyijeVM9PdWfxZ0SxYjJK8HJLqvdjF2Hn7VFphQAtBO+e7X
	ZESuFiEsDeodEOukM0O58GUtmjPMseGBu9qPccicFrrjCqTy9ECkhM4UHcq3vnbSEYMU6bhBuKb
	OX1bOx+d2ljKF6xYyzHoejq8H8WIoQDPT8IRfJ4bbzq/26L+i4x6uE3Griytp8ZUMjvAeNFM52b
	G89DpzKk1133CYhSQeF07woisE1oNvEy6fjV333f3K9616Q9B/NL93ubfwd7WtvHqMi5VU32fxG
	/zlpQEW3sNww==
X-Google-Smtp-Source: AGHT+IGs6bLnoX4tIVbjQlokVXlgUQBgdtRd+clcnPEJB8JvqJgKXIc1Q3vKHGtBbB9srs+B0RWYvA==
X-Received: by 2002:a05:6512:104f:b0:595:7d95:eaad with SMTP id 2adb3069b0e04-597d3f59bd2mr2486820e87.22.1764849329539;
        Thu, 04 Dec 2025 03:55:29 -0800 (PST)
Received: from fedora ([178.54.162.84])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c27fd3sm435629e87.76.2025.12.04.03.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 03:55:28 -0800 (PST)
From: Nazar Kletskii <nazar.kletskii@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nazar Kletskii <nazar.kletskii@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Remove unnecessary parentheses
Date: Thu,  4 Dec 2025 13:53:32 +0200
Message-ID: <20251204115332.21909-1-nazar.kletskii@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

checkpatch.pl reported multiple checks about unnecessary parentheses
when assigning the address of a struct member.

The '->' operator has higher precedence than '&', making the
parentheses redundant. This patch removes them to clean up the code.

Signed-off-by: Nazar Kletskii <nazar.kletskii@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 92 +++++++++----------
 1 file changed, 46 insertions(+), 46 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index a897c433d2b0..276d2bed06ea 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -576,7 +576,7 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 	int cam_idx;
 	struct sta_info *psta;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
@@ -693,7 +693,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	struct	sta_priv *pstapriv = &padapter->stapriv;
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
 	uint len = precv_frame->u.hdr.len;
 	u8 offset = 0;
@@ -870,7 +870,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 	unsigned char *p;
 	unsigned int	go2asoc = 0;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
 	uint pkt_len = precv_frame->u.hdr.len;
 
@@ -956,7 +956,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct wlan_bssid_ex	*cur = &(pmlmeinfo->network);
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
@@ -1381,7 +1381,7 @@ unsigned int OnAssocRsp(struct adapter *padapter, union recv_frame *precv_frame)
 	struct ndis_80211_var_ie *pIE;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	/* struct wlan_bssid_ex			*cur_network = &(pmlmeinfo->network); */
 	u8 *pframe = precv_frame->u.hdr.rx_data;
 	uint pkt_len = precv_frame->u.hdr.len;
@@ -1468,7 +1468,7 @@ unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	unsigned short	reason;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
 	int ignore_received_deauth = 0;
 
@@ -1541,7 +1541,7 @@ unsigned int OnDisassoc(struct adapter *padapter, union recv_frame *precv_frame)
 	unsigned short	reason;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
 
 	/* check A3 */
@@ -1637,7 +1637,7 @@ unsigned int OnAction_back(struct adapter *padapter, union recv_frame *precv_fra
 	unsigned char category, action;
 	unsigned short	tid, status;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 
@@ -2128,7 +2128,7 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct wlan_bssid_ex		*cur_network = &(pmlmeinfo->network);
 
 	pmgntframe = alloc_mgtxmitframe(pxmitpriv);
@@ -2276,7 +2276,7 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 	uint wps_ielen;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct wlan_bssid_ex		*cur_network = &(pmlmeinfo->network);
 	unsigned int	rate_len;
 
@@ -2599,7 +2599,7 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 	int use_shared_key = 0;
 	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	__le16 le_tmp;
 
 	pmgntframe = alloc_mgtxmitframe(pxmitpriv);
@@ -2727,7 +2727,7 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct wlan_bssid_ex *pnetwork = &(pmlmeinfo->network);
 	u8 *ie = pnetwork->ies;
 	__le16 lestatus, le_tmp;
@@ -2858,7 +2858,7 @@ void issue_assocreq(struct adapter *padapter)
 	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	int	bssrate_len = 0, sta_bssrate_len = 0;
 	u8 vs_ie_length = 0;
 
@@ -3037,7 +3037,7 @@ static int _issue_nulldata(struct adapter *padapter, unsigned char *da,
 
 	pxmitpriv = &(padapter->xmitpriv);
 	pmlmeext = &(padapter->mlmeextpriv);
-	pmlmeinfo = &(pmlmeext->mlmext_info);
+	pmlmeinfo = &pmlmeext->mlmext_info;
 
 	pmgntframe = alloc_mgtxmitframe(pxmitpriv);
 	if (!pmgntframe)
@@ -3099,7 +3099,7 @@ int issue_nulldata(struct adapter *padapter, unsigned char *da, unsigned int pow
 	int ret;
 	int i = 0;
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct sta_info *psta;
 
 
@@ -3176,7 +3176,7 @@ static int _issue_qos_nulldata(struct adapter *padapter, unsigned char *da,
 	u16 *qc;
 	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	pmgntframe = alloc_mgtxmitframe(pxmitpriv);
 	if (!pmgntframe)
@@ -3244,7 +3244,7 @@ int issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16 tid, int
 	int ret;
 	int i = 0;
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	/* da == NULL, assume it's null data for sta to ap*/
 	if (!da)
@@ -3284,7 +3284,7 @@ static int _issue_deauth(struct adapter *padapter, unsigned char *da,
 	__le16 *fctrl;
 	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	int ret = _FAIL;
 	__le16 le_tmp;
 
@@ -3378,7 +3378,7 @@ void issue_action_SA_Query(struct adapter *padapter, unsigned char *raddr, unsig
 	__le16 *fctrl;
 	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	__le16 le_tmp;
 
 	pmgntframe = alloc_mgtxmitframe(pxmitpriv);
@@ -3451,7 +3451,7 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 	__le16 *fctrl;
 	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct sta_info *psta;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct registry_priv *pregpriv = &padapter->registrypriv;
@@ -3599,7 +3599,7 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct __queue		*queue	= &(pmlmepriv->scanned_queue);
 	u8 InfoContent[16] = {0};
 	u8 ICS[8][15];
@@ -3735,7 +3735,7 @@ unsigned int send_delba(struct adapter *padapter, u8 initiator, u8 *addr)
 	struct sta_info *psta = NULL;
 	/* struct recv_reorder_ctrl *preorder_ctrl; */
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u16 tid;
 
 	if ((pmlmeinfo->state&0x03) != WIFI_FW_AP_STATE)
@@ -3808,7 +3808,7 @@ void site_survey(struct adapter *padapter)
 	unsigned char survey_channel = 0, val8;
 	enum rt_scan_type	ScanType = SCAN_PASSIVE;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u32 initialgain = 0;
 	u32 channel_scan_time_ms = 0;
 
@@ -3930,7 +3930,7 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 	u8 ie_offset;
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	__le32 le32_tmp;
 
 	len = packet_len - sizeof(struct ieee80211_hdr_3addr);
@@ -4080,7 +4080,7 @@ void start_create_ibss(struct adapter *padapter)
 	u8 val8;
 	u8 join_type;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct wlan_bssid_ex		*pnetwork = (struct wlan_bssid_ex *)(&(pmlmeinfo->network));
 
 	pmlmeext->cur_channel = (u8)pnetwork->configuration.ds_config;
@@ -4134,7 +4134,7 @@ void start_clnt_join(struct adapter *padapter)
 	unsigned short	caps;
 	u8 val8;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct wlan_bssid_ex		*pnetwork = (struct wlan_bssid_ex *)(&(pmlmeinfo->network));
 	int beacon_timeout;
 
@@ -4191,7 +4191,7 @@ void start_clnt_join(struct adapter *padapter)
 void start_clnt_auth(struct adapter *padapter)
 {
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	timer_delete_sync(&pmlmeext->link_timer);
 
@@ -4216,7 +4216,7 @@ void start_clnt_auth(struct adapter *padapter)
 void start_clnt_assoc(struct adapter *padapter)
 {
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	timer_delete_sync(&pmlmeext->link_timer);
 
@@ -4231,7 +4231,7 @@ void start_clnt_assoc(struct adapter *padapter)
 unsigned int receive_disconnect(struct adapter *padapter, unsigned char *MacAddr, unsigned short reason)
 {
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	/* check A3 */
 	if (!(!memcmp(MacAddr, get_my_bssid(&pmlmeinfo->network), ETH_ALEN)))
@@ -4511,7 +4511,7 @@ void report_join_res(struct adapter *padapter, int res)
 	struct joinbss_event		*pjoinbss_evt;
 	struct C2HEvent_Header	*pc2h_evt_hdr;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 
 	pcmd_obj = rtw_zmalloc(sizeof(struct cmd_obj));
@@ -4703,7 +4703,7 @@ void update_sta_info(struct adapter *padapter, struct sta_info *psta)
 {
 	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	/* ERP */
 	VCS_update(padapter, psta);
@@ -4763,7 +4763,7 @@ static void rtw_mlmeext_disconnect(struct adapter *padapter)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct wlan_bssid_ex		*pnetwork = (struct wlan_bssid_ex *)(&(pmlmeinfo->network));
 
 	/* set_opmode_cmd(padapter, infra_client_with_mlme); */
@@ -4809,7 +4809,7 @@ static void rtw_mlmeext_disconnect(struct adapter *padapter)
 void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 {
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct wlan_bssid_ex		*cur_network = &(pmlmeinfo->network);
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	u8 join_type;
@@ -4885,7 +4885,7 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 void mlmeext_sta_add_event_callback(struct adapter *padapter, struct sta_info *psta)
 {
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 join_type;
 
 	if ((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE) {
@@ -4949,7 +4949,7 @@ void _linked_info_dump(struct adapter *padapter)
 {
 	int i;
 	struct mlme_ext_priv    *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info    *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info    *pmlmeinfo = &pmlmeext->mlmext_info;
 	int UndecoratedSmoothedPWDB;
 	struct dvobj_priv *pdvobj = adapter_to_dvobj(padapter);
 
@@ -4992,7 +4992,7 @@ void linked_status_chk(struct adapter *padapter)
 	struct sta_info *psta;
 	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 
 
@@ -5131,7 +5131,7 @@ void link_timer_hdl(struct timer_list *t)
 	struct adapter *padapter =
 		timer_container_of(padapter, t, mlmeextpriv.link_timer);
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 
 	if (pmlmeinfo->state & WIFI_FW_AUTH_NULL) {
@@ -5204,7 +5204,7 @@ u8 setopmode_hdl(struct adapter *padapter, u8 *pbuf)
 {
 	u8 type;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct setopmode_parm *psetop = (struct setopmode_parm *)pbuf;
 
 	if (psetop->mode == Ndis802_11APMode) {
@@ -5237,7 +5237,7 @@ u8 setopmode_hdl(struct adapter *padapter, u8 *pbuf)
 u8 createbss_hdl(struct adapter *padapter, u8 *pbuf)
 {
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct wlan_bssid_ex	*pnetwork = (struct wlan_bssid_ex *)(&(pmlmeinfo->network));
 	struct joinbss_parm *pparm = (struct joinbss_parm *)pbuf;
 	/* u32 initialgain; */
@@ -5297,7 +5297,7 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 	struct ndis_80211_var_ie *pIE;
 	struct registry_priv *pregpriv = &padapter->registrypriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct wlan_bssid_ex		*pnetwork = (struct wlan_bssid_ex *)(&(pmlmeinfo->network));
 	u32 i;
 	u8 cbw40_enable = 0;
@@ -5439,7 +5439,7 @@ u8 disconnect_hdl(struct adapter *padapter, unsigned char *pbuf)
 {
 	struct disconnect_parm *param = (struct disconnect_parm *)pbuf;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct wlan_bssid_ex		*pnetwork = (struct wlan_bssid_ex *)(&(pmlmeinfo->network));
 	u8 val8;
 
@@ -5595,7 +5595,7 @@ u8 setauth_hdl(struct adapter *padapter, unsigned char *pbuf)
 {
 	struct setauth_parm		*pparm = (struct setauth_parm *)pbuf;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	if (pparm->mode < 4)
 		pmlmeinfo->auth_algo = pparm->mode;
@@ -5609,7 +5609,7 @@ u8 setkey_hdl(struct adapter *padapter, u8 *pbuf)
 	s16 cam_id = 0;
 	struct setkey_parm		*pparm = (struct setkey_parm *)pbuf;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	unsigned char null_addr[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
 	u8 *addr;
 
@@ -5649,7 +5649,7 @@ u8 set_stakey_hdl(struct adapter *padapter, u8 *pbuf)
 	s16 cam_id = 0;
 	u8 ret = H2C_SUCCESS;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct set_stakey_parm	*pparm = (struct set_stakey_parm *)pbuf;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct sta_info *psta;
@@ -5697,7 +5697,7 @@ u8 add_ba_hdl(struct adapter *padapter, unsigned char *pbuf)
 {
 	struct addBaReq_parm	*pparm = (struct addBaReq_parm *)pbuf;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	struct sta_info *psta = rtw_get_stainfo(&padapter->stapriv, pparm->addr);
 
@@ -5745,7 +5745,7 @@ u8 set_tx_beacon_cmd(struct adapter *padapter)
 	struct Tx_Beacon_param	*ptxBeacon_parm;
 	struct cmd_priv *pcmdpriv = &(padapter->cmdpriv);
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 res = _SUCCESS;
 	int len_diff = 0;
 
-- 
2.52.0

