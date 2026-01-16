Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36FD328B5B
	for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 16:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768579779; cv=none; b=uoEiiUWRgIWKBt3KfHlbBGKW7ukd3YqfSK6kvR6OyTXcFWi/Z38i6IXeQ6Z3TECsxBbazkf1olgga8iftoq7gjhikdxez9moDD4kO80+nqCcN8AMGhvvSb3Q6KOIiohGvMfTAHbr2cuEzg33BAKEr5YzfPWLORpJtAz/UnC932Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768579779; c=relaxed/simple;
	bh=sb0wV30ybgcfvf2JEbaUBptmTuOr7cl7Jb47tNJ5kzs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PV5Zq7E2tR3VTnmFfXL7TV6mubO6DEQqnY5Wlfq8cCpxVvIFfZgfqvDtSrLyRPQsPKYtkIJUbqDBfnJoQ2NpDLBSZcretzUt4LY0sSz/8D20ySoCuYU1G1XmhWihxZsi77z4VFoLdo2OiI+ttQ8KVK7AD/1Mw3+EMJSxw4xuWyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XA/gtqJu; arc=none smtp.client-ip=209.85.219.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XA/gtqJu"
Received: by mail-qv1-f66.google.com with SMTP id 6a1803df08f44-88888d80590so31331576d6.3
        for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 08:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768579777; x=1769184577; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nhV+MDNf3Svoz0aiuutNprgfVlewNZTWg3tJjqgUfmA=;
        b=XA/gtqJu0NSFXMrzEGkNlzR/0THY/yjeRjuif4QVTfpIe4KiKtLMp2bJJQ1Ar53rZL
         eKcDeJP575AyVgWQzAxJgyk8RavAjfoytnW0GN2oDYzEPpWQn001m8jLtPY9pS5+aKuO
         oiKyft+DihvV/9hbWqXUJWwS8wb1oEU4Xd/jqd6WDzJaKHIJuYCKRgy4nhymUG6CSriL
         u0KstqXh7gYVJsUtfOmOCdcHBkUtXZEs7DPhICwoj0hJloTODc+ph3jJktYrDG8cxOdA
         j8MhslsW3rMZDfRcxrs23X5pxqAkbsvtpvYTE+mF/W6hXJUmj6D/G58fHJ0mCuPg+bk0
         HNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768579777; x=1769184577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhV+MDNf3Svoz0aiuutNprgfVlewNZTWg3tJjqgUfmA=;
        b=tY4a8B8MuCnUyLMI4dd/JPeVIssiUU6yzkjMnJRXx/4Yn1WVf+ylf/553vqsW6iz4B
         k2kYE6UhWkA4NAd4LkhvNxfYLDqRENPDun/JaDpJMez1G7ZvliicSw1wOIoqkgLVgjwN
         ppvuYfMHZ68B5UlKH7ayjnG5LlKrzJvzuqOforOd1hTi5pIPx4YzwrlnEg3DugC/13Q3
         OfesrA6IVb19PRSJf0Lc35lukc/FkSNnQeEBlj8aUBTS0pVFJ+4yOa2tMMIFyuCPcUcb
         P1qqiN+7VyzsT9wcr+c1U/ucLp5ziz6W034IFzb53LLB0WJylGcLTK7gnqieBiHDRtQv
         MtXQ==
X-Gm-Message-State: AOJu0Yw4TlgkgfbzZND0gnvVcLLrP80LDIoCJA+/kJ9NF7tikB7t4q0F
	/sDj54T7k7PT208CckOJkrovMWQmyCQRLQjAfp1hnDs4+Qx08037337kIByAQWn53k8=
X-Gm-Gg: AY/fxX4OzY3dnG9+NOQLfaOVGFTu+TMxeVmkY1VPQKe2I1APs2kV0WH3y/97CFYXEWz
	Aba94SSsyTDKn0XMsbUJXPiXbE/GOYJN6lakOyyG3iq5bwm5L6Gdrp3udgz7SWITgzQEWQY2Vd5
	3cEZleGfTobBnrOPk7I9LbAxL1DGizr+ZZFd78r9FCDUwS9ySPjyihXan2I+8qNdnyb/o31gUr3
	3aAPX1QzTRgWlBdXe3EOX0Ysf+mtBPZIdiM+VxvjZ14c+XMKfdcwpefykDfRhsgvsmM1XxdD6i/
	10rvSWDKWNtKIp5k0TWSUNeZ3LKS9RJ18i/gzeMRnB9IZn/KUtsbMiwtJBXfJWdYbkJpkO75/oF
	8VE0+Oozna9YUa9DARJg3Y4uMj6wkipDE/E72gfXUf2fQKrLYpk3U4E62EtwW++P60NZ05BYZ7a
	7aHuShcvR9qUd0JZUlAQftkEDL
X-Received: by 2002:a05:6214:c6c:b0:88a:449e:81a0 with SMTP id 6a1803df08f44-8942e421a10mr44059386d6.3.1768579776477;
        Fri, 16 Jan 2026 08:09:36 -0800 (PST)
Received: from localhost ([132.216.195.103])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6ca6e0sm25511936d6.42.2026.01.16.08.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 08:09:36 -0800 (PST)
From: William Hansen-Baird <william.hansen.baird@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	William Hansen-Baird <william.hansen.baird@gmail.com>
Subject: [PATCH 1/5] staging: rtl8723bs: core/rtw_mlme_ext.c: refactor security IE parsing in OnAssocReq
Date: Fri, 16 Jan 2026 11:08:47 -0500
Message-ID: <20260116160914.88069-1-william.hansen.baird@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor security ies parsing in OnAssocReq function into separate
helper function rtw_parse_assoc_security_ies.
Local variables from OnAssocReq wpa_ie, wpa_ie_len and psecuritypriv moved into
helper function as they're only used within the function.

This change significantly shortens OnAssocReq, and makes the logic
easier to reason about.

Signed-off-by: William Hansen-Baird <william.hansen.baird@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 231 +++++++++---------
 1 file changed, 119 insertions(+), 112 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index ac49bfbaa5bb..83342d48e730 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -929,20 +929,132 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 
 }
 
+static unsigned short rtw_parse_assoc_security_ies(struct adapter *padapter,
+						   struct rtw_ieee802_11_elems *elems,
+						   struct sta_info *pstat)
+{
+	struct security_priv *psecuritypriv = &padapter->securitypriv;
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	unsigned char *wpa_ie;
+	int wpa_ie_len;
+
+	pstat->dot8021xalg = 0;
+	pstat->wpa_psk = 0;
+	pstat->wpa_group_cipher = 0;
+	pstat->wpa2_group_cipher = 0;
+	pstat->wpa_pairwise_cipher = 0;
+	pstat->wpa2_pairwise_cipher = 0;
+	memset(pstat->wpa_ie, 0, sizeof(pstat->wpa_ie));
+	if ((psecuritypriv->wpa_psk & BIT(1)) && elems->rsn_ie) {
+
+		int group_cipher = 0, pairwise_cipher = 0;
+
+		wpa_ie = elems->rsn_ie;
+		wpa_ie_len = elems->rsn_ie_len;
+
+		if (rtw_parse_wpa2_ie(wpa_ie-2, wpa_ie_len+2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
+			pstat->dot8021xalg = 1;/* psk,  todo:802.1x */
+			pstat->wpa_psk |= BIT(1);
+
+			pstat->wpa2_group_cipher = group_cipher&psecuritypriv->wpa2_group_cipher;
+			pstat->wpa2_pairwise_cipher = pairwise_cipher&psecuritypriv->wpa2_pairwise_cipher;
+
+			if (!pstat->wpa2_group_cipher)
+				return WLAN_STATUS_INVALID_GROUP_CIPHER;
+
+			if (!pstat->wpa2_pairwise_cipher)
+				return WLAN_STATUS_INVALID_PAIRWISE_CIPHER;
+		} else {
+			return WLAN_STATUS_INVALID_IE;
+		}
+
+	} else if ((psecuritypriv->wpa_psk & BIT(0)) && elems->wpa_ie) {
+
+		int group_cipher = 0, pairwise_cipher = 0;
+
+		wpa_ie = elems->wpa_ie;
+		wpa_ie_len = elems->wpa_ie_len;
+
+		if (rtw_parse_wpa_ie(wpa_ie-2, wpa_ie_len+2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
+			pstat->dot8021xalg = 1;/* psk,  todo:802.1x */
+			pstat->wpa_psk |= BIT(0);
+
+			pstat->wpa_group_cipher = group_cipher&psecuritypriv->wpa_group_cipher;
+			pstat->wpa_pairwise_cipher = pairwise_cipher&psecuritypriv->wpa_pairwise_cipher;
+
+			if (!pstat->wpa_group_cipher)
+				return WLAN_STATUS_INVALID_GROUP_CIPHER;
+
+			if (!pstat->wpa_pairwise_cipher)
+				return WLAN_STATUS_INVALID_PAIRWISE_CIPHER;
+
+		} else {
+			return WLAN_STATUS_INVALID_IE;
+		}
+
+	} else {
+		wpa_ie = NULL;
+		wpa_ie_len = 0;
+	}
+
+	pstat->flags &= ~(WLAN_STA_WPS | WLAN_STA_MAYBE_WPS);
+	if (!wpa_ie) {
+		if (elems->wps_ie) {
+			pstat->flags |= WLAN_STA_WPS;
+		} else {
+			pstat->flags |= WLAN_STA_MAYBE_WPS;
+		}
+
+
+		/*  AP support WPA/RSN, and sta is going to do WPS, but AP is not ready */
+		/*  that the selected registrar of AP is _FLASE */
+		if ((psecuritypriv->wpa_psk > 0)
+			&& (pstat->flags & (WLAN_STA_WPS|WLAN_STA_MAYBE_WPS))) {
+			if (pmlmepriv->wps_beacon_ie) {
+				u8 selected_registrar = 0;
+
+				rtw_get_wps_attr_content(pmlmepriv->wps_beacon_ie, pmlmepriv->wps_beacon_ie_len, WPS_ATTR_SELECTED_REGISTRAR, &selected_registrar, NULL);
+
+				if (!selected_registrar)
+					return WLAN_STATUS_AP_UNABLE_TO_HANDLE_NEW_STA;
+			}
+		}
+
+	} else {
+		int copy_len;
+
+		if (psecuritypriv->wpa_psk == 0) {
+			return WLAN_STATUS_INVALID_IE;
+		}
+
+		if (elems->wps_ie) {
+			pstat->flags |= WLAN_STA_WPS;
+			copy_len = 0;
+		} else {
+			copy_len = ((wpa_ie_len+2) > sizeof(pstat->wpa_ie)) ? (sizeof(pstat->wpa_ie)):(wpa_ie_len+2);
+		}
+
+
+		if (copy_len > 0)
+			memcpy(pstat->wpa_ie, wpa_ie-2, copy_len);
+
+	}
+	return WLAN_STATUS_SUCCESS;
+}
+
 unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 {
 	u16 capab_info;
 	struct rtw_ieee802_11_elems elems;
 	struct sta_info *pstat;
-	unsigned char *p, *pos, *wpa_ie;
+	unsigned char *p, *pos;
 	unsigned char WMM_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x00, 0x01};
-	int		i, ie_len, wpa_ie_len, left;
+	int		i, ie_len, left;
 	unsigned char supportRate[16];
 	int					supportRateNum;
-	unsigned short		status = WLAN_STATUS_SUCCESS;
+	unsigned short		status = WLAN_STATUS_SUCCESS, parse_status;
 	unsigned short		frame_type, ie_offset = 0;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	struct security_priv *psecuritypriv = &padapter->securitypriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 	struct wlan_bssid_ex	*cur = &(pmlmeinfo->network);
@@ -1056,118 +1168,13 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	update_basic_rate_table_soft_ap(pstat->bssrateset, pstat->bssratelen);
 
 	/* check RSN/WPA/WPS */
-	pstat->dot8021xalg = 0;
-	pstat->wpa_psk = 0;
-	pstat->wpa_group_cipher = 0;
-	pstat->wpa2_group_cipher = 0;
-	pstat->wpa_pairwise_cipher = 0;
-	pstat->wpa2_pairwise_cipher = 0;
-	memset(pstat->wpa_ie, 0, sizeof(pstat->wpa_ie));
-	if ((psecuritypriv->wpa_psk & BIT(1)) && elems.rsn_ie) {
-
-		int group_cipher = 0, pairwise_cipher = 0;
-
-		wpa_ie = elems.rsn_ie;
-		wpa_ie_len = elems.rsn_ie_len;
-
-		if (rtw_parse_wpa2_ie(wpa_ie-2, wpa_ie_len+2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
-			pstat->dot8021xalg = 1;/* psk,  todo:802.1x */
-			pstat->wpa_psk |= BIT(1);
-
-			pstat->wpa2_group_cipher = group_cipher&psecuritypriv->wpa2_group_cipher;
-			pstat->wpa2_pairwise_cipher = pairwise_cipher&psecuritypriv->wpa2_pairwise_cipher;
-
-			if (!pstat->wpa2_group_cipher)
-				status = WLAN_STATUS_INVALID_GROUP_CIPHER;
-
-			if (!pstat->wpa2_pairwise_cipher)
-				status = WLAN_STATUS_INVALID_PAIRWISE_CIPHER;
-		} else {
-			status = WLAN_STATUS_INVALID_IE;
-		}
-
-	} else if ((psecuritypriv->wpa_psk & BIT(0)) && elems.wpa_ie) {
-
-		int group_cipher = 0, pairwise_cipher = 0;
-
-		wpa_ie = elems.wpa_ie;
-		wpa_ie_len = elems.wpa_ie_len;
-
-		if (rtw_parse_wpa_ie(wpa_ie-2, wpa_ie_len+2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
-			pstat->dot8021xalg = 1;/* psk,  todo:802.1x */
-			pstat->wpa_psk |= BIT(0);
-
-			pstat->wpa_group_cipher = group_cipher&psecuritypriv->wpa_group_cipher;
-			pstat->wpa_pairwise_cipher = pairwise_cipher&psecuritypriv->wpa_pairwise_cipher;
-
-			if (!pstat->wpa_group_cipher)
-				status = WLAN_STATUS_INVALID_GROUP_CIPHER;
-
-			if (!pstat->wpa_pairwise_cipher)
-				status = WLAN_STATUS_INVALID_PAIRWISE_CIPHER;
-
-		} else {
-			status = WLAN_STATUS_INVALID_IE;
-		}
-
-	} else {
-		wpa_ie = NULL;
-		wpa_ie_len = 0;
-	}
+	parse_status = rtw_parse_assoc_security_ies(padapter, &elems, pstat);
+	if (parse_status != WLAN_STATUS_SUCCESS)
+		status = parse_status;
 
 	if (status != WLAN_STATUS_SUCCESS)
 		goto OnAssocReqFail;
 
-	pstat->flags &= ~(WLAN_STA_WPS | WLAN_STA_MAYBE_WPS);
-	if (!wpa_ie) {
-		if (elems.wps_ie) {
-			pstat->flags |= WLAN_STA_WPS;
-		} else {
-			pstat->flags |= WLAN_STA_MAYBE_WPS;
-		}
-
-
-		/*  AP support WPA/RSN, and sta is going to do WPS, but AP is not ready */
-		/*  that the selected registrar of AP is _FLASE */
-		if ((psecuritypriv->wpa_psk > 0)
-			&& (pstat->flags & (WLAN_STA_WPS|WLAN_STA_MAYBE_WPS))) {
-			if (pmlmepriv->wps_beacon_ie) {
-				u8 selected_registrar = 0;
-
-				rtw_get_wps_attr_content(pmlmepriv->wps_beacon_ie, pmlmepriv->wps_beacon_ie_len, WPS_ATTR_SELECTED_REGISTRAR, &selected_registrar, NULL);
-
-				if (!selected_registrar) {
-					status = WLAN_STATUS_AP_UNABLE_TO_HANDLE_NEW_STA;
-
-					goto OnAssocReqFail;
-				}
-			}
-		}
-
-	} else {
-		int copy_len;
-
-		if (psecuritypriv->wpa_psk == 0) {
-			status = WLAN_STATUS_INVALID_IE;
-
-			goto OnAssocReqFail;
-
-		}
-
-		if (elems.wps_ie) {
-			pstat->flags |= WLAN_STA_WPS;
-			copy_len = 0;
-		} else {
-			copy_len = ((wpa_ie_len+2) > sizeof(pstat->wpa_ie)) ? (sizeof(pstat->wpa_ie)):(wpa_ie_len+2);
-		}
-
-
-		if (copy_len > 0)
-			memcpy(pstat->wpa_ie, wpa_ie-2, copy_len);
-
-	}
-
-
 	/*  check if there is WMM IE & support WWM-PS */
 	pstat->flags &= ~WLAN_STA_WME;
 	pstat->qos_option = 0;
-- 
2.52.0

