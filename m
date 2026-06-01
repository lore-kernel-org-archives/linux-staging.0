Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D063BB105
	for <linux-staging@lists.linux.dev>; Mon,  1 Jun 2026 20:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780346567; cv=none; b=Bf2SWWQ+81g8Wzng8Td8Xt3ImLjQJECt0hpxBFu3gn8dxTZNVq6CZQ9GlGOOecFTlq6K5ZB9RQIhgUb9rdnvVe/MT6p4UVcBmojwZo+b8c3B8nDz/BrS+EQNYEbatJ5hZ+7xzIDUnEMtesAWO+zw1INlJZO6TLe/c0mh0JSnTNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780346567; c=relaxed/simple;
	bh=KaGHD7MRJSGadoPQyCI5Xl6ByYCEJpNtlbmORijAIdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NIG9QczmTtmJeLM3h0wuufKcjmfx7mw+fPe/iCSEb/zO3mGnFLcZuHXKBdP+XRO4AvzvLKO8kUo43gGmM4XijHgx8MY2/AFFZoFktv/Tl468IjzD/2aYXpYbLbfrS3msyDw240QxbbFRPRNN5iGTELVMUQd/2cE0xT5P084rH68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0jGPbQH; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0jGPbQH"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490af320e2aso6699535e9.2
        for <linux-staging@lists.linux.dev>; Mon, 01 Jun 2026 13:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780346563; x=1780951363; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPuNPWC05WOH5OYTWFGTa/XjSiyoqitd6jV7lIrieh0=;
        b=B0jGPbQHWjqF+uiXGvxm4r592Tw1ih8/FFVGRFlNrN8BlibwDwwVDjm5hSVdpotNjk
         hEBkQsAOm5PFnYYomGfFkoYbLExoXF5hZS/Om/kcIHFDa+mKQz4D7wbXlNepfLlMiaG0
         2YBj2tqND2Aj5pU4vZKwOMApH7c1z4+am5Xw8QgHTN3XFUrwXmgnmaZeF59PGzYwUxd2
         sHDEvZ4u7EefYt2Kqgg/CNP558bDvmIKE7hbjpwZTLV6ham49Q6SFA4PchG7UwQFqHiY
         WZNS4mVMGOhhHzWGPXPgxpEmmvsETgCEIwm6awsWcal88u3XRmuSmUqu0t3J2IF/O90c
         ti4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780346563; x=1780951363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OPuNPWC05WOH5OYTWFGTa/XjSiyoqitd6jV7lIrieh0=;
        b=U5JznQxYRkln4JDn24qDZ1vI313xhjfuxdEnJ0vyvX75eNz5AXdom0BqDtI/hiPSmN
         d3Q2TsuvhT5WY4Ijh2SkreNC4gyp4VoSoy7RfYdko7yPU7Ze4o9albTLkVbhzwX0iy3d
         ytVWc/7YDTxjd7SEU69oLegN3HclfKv362u2v/ixToko0liIh1IOtI2fJZ+PbvCXo9Wg
         lZUjGrrn+JSQoAHPmLh9LaY3av6JCpRFDMTyLJvWqACQG3rvpo+okMNbSo4eNUsYlRXg
         VjyMNmsp48znPdPAtjBFH+qVWKe/iMM6ggyvziRPqojSetBqYDQywHNr1Pzhh234wYbD
         pkjw==
X-Gm-Message-State: AOJu0Ywhxbrvuo8dXB6i2X1k/RNRPZncdLMGYKDMpxA8aqR3Lz26yeZL
	I1CfIfSq4H66KKZSTkNdIglFARzIMcU8o7dC2BikVebYoKvIOK/ZDxgk
X-Gm-Gg: Acq92OGm2m7Z3DcPc0uYy+qVnLuUH0AsJfUsmdkLke5Mb531XtaZqFWXHbUVvRVlppP
	FBDcLqNeuGM6rdqxn9scp6G9tJ+xv+MCOd7RwzkjQHb/A+eoxP1cYOZt1G3aXdn88CEjMbm9VNE
	xcjfo/4iKEJaAmaIC4t14Car6A/0LWZ7+HvifpaT7POyml4YZXjrpAOOtmJSJ+jy2pxXeozyoGh
	eLvCD5I3/ufV7UX31/TBqKjS0CCjxC3JbV6/YtkcehTEjqFPdmk+I/k2wHH6L8iZnuyL30779bZ
	CGlYQhavfJZVx8eL0yZ7tbFQXNGZFm1SipElzQhYvTYdWM3dWS/aL0OvuGOoz+eC/3g7Jsykqz9
	iVJBlaV/5hKbC1H8l3NmAwJq9HaOow1Iqiw4golJWp4WBE7pi0bcvlViak3qddtakSNLHMM9pXZ
	ZvlQz9EnL5jA8pU9+xdlDpsj3ifUmJRKbQ+xdLpI+MyhK8AGcV6kcCuFp1I7QU+xc24CVNmsqu8
	J1RDL5Nw2eU7+fwp027fkf1X94=
X-Received: by 2002:a05:600c:c494:b0:48f:d612:3c59 with SMTP id 5b1f17b1804b1-490a2915525mr245681625e9.9.1780346563327;
        Mon, 01 Jun 2026 13:42:43 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-002-204-131-161.002.204.pools.vodafone-ip.de. [2.204.131.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e19a06sm16988405e9.5.2026.06.01.13.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 13:42:42 -0700 (PDT)
From: fliegbert2@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH 4/6] staging: rtl8723bs: Rename camelcase variable dot11AuthAlgrthm_Auto
Date: Mon,  1 Jun 2026 20:39:56 +0000
Message-ID: <b7fdec56410647f643d341aef242902c22aacf0e.1780343502.git.fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1780343502.git.fliegbert2@gmail.com>
References: <cover.1780343502.git.fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>

Rename variable dot11AuthAlgrthm_Auto to dot11_auth_algrthm_auto
to resolve checkpatch.pl CamelCase finding.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     | 2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c         | 2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h      | 2 +-
 drivers/staging/rtl8723bs/include/rtw_security.h  | 2 +-
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 6 +++---
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index d95e897eba62..52f6d59cd44d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -855,7 +855,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 	status	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 4));
 
 	if (status != 0) {
-		if (status == 13) { /*  pmlmeinfo->auth_algo == dot11AuthAlgrthm_Auto) */
+		if (status == 13) { /*  pmlmeinfo->auth_algo == dot11_auth_algrthm_auto) */
 			if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared)
 				pmlmeinfo->auth_algo = dot11_auth_algrthm_open;
 			else
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index a89c7dc87b06..9caa5da75a5e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -529,7 +529,7 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 		switch (psecuritypriv->dot11AuthAlgrthm) {
 		case dot11_auth_algrthm_open:
 		case dot11AuthAlgrthm_Shared:
-		case dot11AuthAlgrthm_Auto:
+		case dot11_auth_algrthm_auto:
 			pattrib->key_idx = (u8)psecuritypriv->dot11PrivacyKeyIndex;
 			break;
 		case dot11_auth_algrthm_8021x:
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index e9d08633b6bb..85c18df913fd 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -47,7 +47,7 @@ enum {
 	dot11_auth_algrthm_open = 0,
 	dot11AuthAlgrthm_Shared,
 	dot11_auth_algrthm_8021x,
-	dot11AuthAlgrthm_Auto,
+	dot11_auth_algrthm_auto,
 	dot11AuthAlgrthm_WAPI,
 	dot11AuthAlgrthm_MaxNum
 };
diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 342e6908163e..b72b1643ce5e 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -173,7 +173,7 @@ do {\
 	switch (psecuritypriv->dot11AuthAlgrthm) {\
 	case dot11_auth_algrthm_open:\
 	case dot11AuthAlgrthm_Shared:\
-	case dot11AuthAlgrthm_Auto:\
+	case dot11_auth_algrthm_auto:\
 		encry_algo = (u8)psecuritypriv->dot11PrivacyAlgrthm;\
 		break;\
 	case dot11_auth_algrthm_8021x:\
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index d473ff687487..f910c8817e2c 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -546,7 +546,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 		if (psecuritypriv->bWepDefaultKeyIdxSet == 0) {
 			/* wep default key has not been set, so use this key index as default key. */
 
-			psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Auto;
+			psecuritypriv->dot11AuthAlgrthm = dot11_auth_algrthm_auto;
 			psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
 			psecuritypriv->dot11PrivacyAlgrthm = _WEP40_;
 			psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
@@ -1326,7 +1326,7 @@ static int rtw_cfg80211_set_auth_type(struct security_priv *psecuritypriv,
 	switch (sme_auth_type) {
 	case NL80211_AUTHTYPE_AUTOMATIC:
 
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Auto;
+		psecuritypriv->dot11AuthAlgrthm = dot11_auth_algrthm_auto;
 
 		break;
 	case NL80211_AUTHTYPE_OPEN_SYSTEM:
@@ -1699,7 +1699,7 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 
 	/* For WEP Shared auth */
 	if ((psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_Shared ||
-	     psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_Auto) && sme->key) {
+	     psecuritypriv->dot11AuthAlgrthm == dot11_auth_algrthm_auto) && sme->key) {
 		u32 wep_key_idx, wep_key_len, wep_total_len;
 		struct ndis_802_11_wep	 *pwep = NULL;
 
-- 
2.54.0

