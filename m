Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597612D7D2E
	for <linux-staging@lists.linux.dev>; Mon,  9 Feb 2026 23:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770681140; cv=none; b=eprSbn7iktMdmt2vIErjqXMw9CsRSpO/PbbURkw5l+PIK0nB6/VMX26OCqInvbYewXoJs962vUDtn0GBc4A74nnnDyDl0cxIM+vlQqiu+lvuksjgV812YsnOeD3D+D3bVMK4c9WL99bvsKXVMtv12bXsr9FoAyKAZaToYzGheeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770681140; c=relaxed/simple;
	bh=erAa2wgYtFi6ZbP+gTHt+D2llk6q0nMQzvg03j8MO4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DOXkHeNVL5Bt//XaaIi9nctK+jr7g7kKnvHSzp9EEAbuSqkKz/op+fFlZlcAvGIx8nyEagOUp+h37wTFZlzcGnHtJj77rwDNW7HRi6+hx7WiLh2/ctos6S2W2sz1zL6FdFe0f9d1ciZKF/COYIO2e96DquN7VTL1gampnnPz9uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9K+/xkm; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9K+/xkm"
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-c0c24d0f4ceso1222196a12.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 15:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770681139; x=1771285939; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8B/V0xUiuY/0tv0TusZ0S8AWx1W4V5I8QXUqIKhBZ0=;
        b=f9K+/xkm7zGjwjtNPd4pDZXT7LX+MzGktsmRZ0RKu17cYvTjduD4zRFJHPR+TTsfta
         lQpGVwsB0XCNQt36KU9lDY6RkJNfGwxSJr6yA87IXUL6ZJlr45IjUWmBHC/uGQMF9gfU
         pzAKIBccaEk9mLmmnGyd+BQtE6R0PcJOO3ZZbZpr5mbkasY7hk6QHshUKDXk7KJyDxa+
         6MzYNJWA990zaaeXmP8wCGuao4UwbBuGL51nSPaEs2iucOZd9myhrO9Js2Y4qbWwJVBC
         ZGKuGg7Wc3LijLKaoanaHo0mOpp8YtdtHHsjU/7hZzhEZpQbSMTggikm6zwsBjZmLUlN
         Op5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770681139; x=1771285939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a8B/V0xUiuY/0tv0TusZ0S8AWx1W4V5I8QXUqIKhBZ0=;
        b=Bj1xvzMJHXwYNh6BYiSkMCo94N3O194xG/wKLRSNlVVE7IJBmTX6/RXAfLZzRSrsnF
         oD4biwlxIB+1ZkwS1Am6jyYDLaPiElvLyCCmnXLRweH3lvb4wuZqOckGlReJOQz25J+s
         6x9BDl5sVRGTl+V1BF7SASFzW+xgaBBmfmKlidwCC3nOoh1TqIReTdH1YAHNerlUQHvZ
         /mkd7i1WhNMDWQxyfX7WJpXukvgq2mPXd0CFU4JAkuFclyVwax03UKzrVl9oIXqbMYZF
         tjueVHi3UMySyVI4r4JgMVHZBObpmKH0fCD4IxG6+V3Yv/CTDCvRN+fupMVrKNIfIHgX
         K9rg==
X-Gm-Message-State: AOJu0YwvLDq7xYKbyaIL84aumYmCGEidP8xdXEAHOL+ZYsNIPqFUYDaZ
	cBUDZh9FseKAMl4gzZJKG/JyF6Qnbf7D2qrQkNtvGjwrT97xA7VqWVWWFOnGJDnc/FE=
X-Gm-Gg: AZuq6aIBc4OvPNNS2Dm/CysNAV1CMyRsYIHyBtqdBMy7+MOBQBCMJwjLbipoToPiSDk
	WD540mK6ik41ziHXoL90bOSvD+zu7zMvOaBDj5xhEftIrMqkG3fdCL4vcUcmpt1dwAJ7C0PLhWe
	vnzi/H7/ZJIwkXzE9poGajrlWgM8wrjAGUdJGtmMyxKe+akvgqhbZ1R/rs6mDiadJi/BvBBoLkN
	daQyhmzrFtNN5xcTHwBhh89qZGY9Eu19E2OLgVRrRcdTsagKTXaqVn/BISFKFlJ9qY6jxbSTmzv
	is6L78WXoi1NkQ5PCQj0pEEXnQTwCsy7jY94fLkkkOLN8Nw8HfwYOearncWSVVbscpqEfYmBYrt
	a3aMud6uMvmooj7BKklHH1xrevz3q+74jiEhJXs1XIPsiOyFRGQT3K8ypnAPC+HJpxeVW6Ekyau
	Ix+BKwr8v6ah4avJohmS0vxjeZdmXBobxEhw==
X-Received: by 2002:a17:902:ce12:b0:2a0:97d2:a264 with SMTP id d9443c01a7336-2a95180ea22mr117085375ad.37.1770681138676;
        Mon, 09 Feb 2026 15:52:18 -0800 (PST)
Received: from Horstaufmental ([159.192.34.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb64499fsm11581843a12.31.2026.02.09.15.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 15:52:18 -0800 (PST)
From: Siwanan Bungtong <horstaufmental@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Siwanan Bungtong <horstaufmental@gmail.com>
Subject: [PATCH 4/7] staging: rtl8723bs: rtw_mlme_ext: remove unnecessary void * casts
Date: Tue, 10 Feb 2026 06:51:30 +0700
Message-ID: <20260209235133.1292161-5-horstaufmental@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260209235133.1292161-1-horstaufmental@gmail.com>
References: <20260209235133.1292161-1-horstaufmental@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant (void *) casts when calling memcpy/memset and
other helpers. These casts are unnecessary since C implicitly
converts to void * and they only add noise.

No functional change.

Signed-off-by: Siwanan Bungtong <horstaufmental@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index ac49bfbaa5bb..e6a0f801ee4f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -528,7 +528,7 @@ unsigned int OnProbeReq(struct adapter *padapter, union recv_frame *precv_frame)
 		if (is_valid_p2p_probereq)
 			goto _issue_probersp;
 
-		if ((ielen != 0 && false == !memcmp((void *)(p+2), (void *)cur->ssid.ssid, cur->ssid.ssid_length))
+		if ((ielen != 0 && false == !memcmp((p+2), cur->ssid.ssid, cur->ssid.ssid_length))
 			|| (ielen == 0 && pmlmeinfo->hidden_ssid_mode)
 		)
 			return _SUCCESS;
@@ -794,7 +794,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	} else { /*  shared system or auto authentication */
 		if (seq == 1) {
 			/* prepare for the challenging txt... */
-			memset((void *)pstat->chg_txt, 78, 128);
+			memset(pstat->chg_txt, 78, 128);
 
 			pstat->state &= ~WIFI_FW_AUTH_NULL;
 			pstat->state |= WIFI_FW_AUTH_STATE;
@@ -809,7 +809,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 				goto auth_fail;
 			}
 
-			if (!memcmp((void *)(p + 2), pstat->chg_txt, 128)) {
+			if (!memcmp((p + 2), pstat->chg_txt, 128)) {
 				pstat->state &= (~WIFI_FW_AUTH_STATE);
 				pstat->state |= WIFI_FW_AUTH_SUCCESS;
 				/*  challenging txt is correct... */
@@ -896,7 +896,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 			if (!p)
 				goto authclnt_fail;
 
-			memcpy((void *)(pmlmeinfo->chg_txt), (void *)(p + 2), len);
+			memcpy(pmlmeinfo->chg_txt, p + 2, len);
 			pmlmeinfo->auth_seq = 3;
 			issue_auth(padapter, NULL, 0);
 			set_link_timer(pmlmeext, REAUTH_TO);
@@ -1010,7 +1010,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		goto OnAssocReqFail;
 	} else {
 		/*  check if ssid match */
-		if (memcmp((void *)(p+2), cur->ssid.ssid, cur->ssid.ssid_length))
+		if (memcmp(p+2, cur->ssid.ssid, cur->ssid.ssid_length))
 			status = WLAN_STATUS_CHALLENGE_FAIL;
 
 		if (ie_len != cur->ssid.ssid_length)
@@ -1349,7 +1349,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 asoc_class2_error:
 
-	issue_deauth(padapter, (void *)GetAddr2Ptr(pframe), status);
+	issue_deauth(padapter, GetAddr2Ptr(pframe), status);
 
 	return _FAIL;
 
@@ -2736,9 +2736,9 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 	fctrl = &(pwlanhdr->frame_control);
 	*(fctrl) = 0;
 
-	memcpy((void *)GetAddr1Ptr(pwlanhdr), pstat->hwaddr, ETH_ALEN);
-	memcpy((void *)GetAddr2Ptr(pwlanhdr), myid(&(padapter->eeprompriv)), ETH_ALEN);
-	memcpy((void *)GetAddr3Ptr(pwlanhdr), get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
+	memcpy(GetAddr1Ptr(pwlanhdr), pstat->hwaddr, ETH_ALEN);
+	memcpy(GetAddr2Ptr(pwlanhdr), myid(&(padapter->eeprompriv)), ETH_ALEN);
+	memcpy(GetAddr3Ptr(pwlanhdr), get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
 
 
 	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
-- 
2.52.0

