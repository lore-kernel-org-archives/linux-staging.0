Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA4F43CEC0
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 12:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513203; cv=none; b=gAavW7JTCFA6J+QW0J7d9pSqSOqBh2Fw4kyRDRuEadIfHKYxGimLIeLjtseVm+XtD8jhvCskbkrNKszB0ld9i+KZtduftWKlARHdxtQmiEIeBRyBqNKVeEl81fft/0/YTur57DHjpVGW9iJ7y885hT25Ul7/bb6OsoTdxh4rok4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513203; c=relaxed/simple;
	bh=SDx81YueuHQCS/VWYJpZ2LS9ZSOJrRlEBml47X52l7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JAroWLVxnS759Aecl6jza9cygacheNTg3eHUlzQT8GAKYZB/DRx599MECiNjkFClKcJbYmIjfAyTQYQVOH+7uqa594zZtF6Od9B56RK3x1dRrZicrndylFZ8IS0OnTQINzwMZrRGXKPzfdcrLQkk/iDPFJQYP9At/zRC++b1l1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MmLHF0g2; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmLHF0g2"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493c733f15aso5322545e9.0
        for <linux-staging@lists.linux.dev>; Wed, 08 Jul 2026 05:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783513200; x=1784118000; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LgfoXuqFZlthBsRfWNFEaOapkzQzI+zxNd3N8TjA++s=;
        b=MmLHF0g2GCjqyNxsCizjCJbDJ5K3KCoaYVworWycLCfWiTRhqPDh8zoiijNHiLIGEW
         qu9gGrEY1flZoM4vFX7WMWRnb5hwroeJIT+V2EIKfkIsw6+zklkvGcfoHXqteufjpctF
         l7qtSt90SHDz0wr9sXyXABWKcQ3rQtmBokERc59wHk2lhvJK64oD6LN4sSNfckjluf7+
         96yPv/oQ+2MqhUuddw2S42heDcnSEkp/yjFimQ9PsFMJI1PM6dYR/l1/xYNNgs2SPXsj
         l1RBVRfc0FrWtcW+jzzQrJgVRD+unY3Qbu+HlK10t1wD3HSP8uDVrz6OL3BeKU7D466N
         K3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513200; x=1784118000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LgfoXuqFZlthBsRfWNFEaOapkzQzI+zxNd3N8TjA++s=;
        b=CRPPxpAxt+38pG0DIEIZ5kto6+V1MhAgcT3S2pq74g+jCmSGi4RDxothbBgX0s5/Ws
         vbi7YD08+tj3XQbLOE7MHX4DUCVZGbGmQvvY1ulurw1t9mW9PAQrisMkqylwMROv/uxD
         zdFMuGlEhCcbxydYBlcuaTzZmKZ7im9xm/hRaQChlRIGEetTJDTywEADzr+d+WYoevIu
         6sgHTsdel8azeAW8L4fyZDDxOhrL8OqUx2MKN1xzZGd7da1CH8SIWdmA5eAnB4U37SzV
         c5GHh+9euaO9AouaJ1X1fxCFkAR9bo1OuheOfHdSPRcuiNqjN/pRn6BsFIa0JiDyx41q
         7G6A==
X-Forwarded-Encrypted: i=1; AHgh+RoeWd+7V+HHXtJSL/Cq4VkW+sSRBTitdL8HoRAKjy4WmpY0NVPrfTiB9XnJwRGK/IzpyenRiTxHdj+1EBGO@lists.linux.dev
X-Gm-Message-State: AOJu0YxWwpLd9Y+83f0UiHO8v3b3ucjJBcPWJo8DJpL6RIyVWRTk5gmD
	mW51q/bSU+CqL84NlolRF1hHJLYaPp5YSSgmPgttD1CNGTNPA8TERlu0
X-Gm-Gg: AfdE7cn7EQpg8KnW2/UvJuXNAZPUjRjuDoikStNwp0z5YkqJ5av4kpKhA6U7ZI5jAKC
	XanUTNHJUdN2U4YvGAxdCMcYZPQftmCnEmsNm102a2yshBHUFm/xuTdiE4ZVDdeBAxusjC8VeiN
	9EYvgiIPOPcnB5koVyVEBOojefPt3QXaqk/wbaxQETH3b10sK5kvwEUWASTgQKUiPjlPxblw0kg
	rcSOmayalDbCBLackiuzgt9PdbSa0UQ++2eNz4FFohd1ONeIAe+61WHH06k4dL1CsQhlzr7E/6k
	u0ZJImW4XaJChI7cirLs5/t6SVBgygNxoUPITEelg3dJFFF1KoYoO39l/sk1FOTuYODt3rLeyMi
	yLY7EqX+bggR5BDh+A5dZuCzNVuxU9RHs6PAadyGas3q5uvylXftMqrINHNxPR0gVpOLlwhgBuW
	G9Ns8FOVGBck+DK0ilhSEgqnstvoM2/eAShyLpdu4OHGab+4+FKbc/Hd2X49JW4dnFsxMwMNiKw
	0B5ow==
X-Received: by 2002:a05:600c:8b05:b0:493:aaa2:f034 with SMTP id 5b1f17b1804b1-493e68cf39amr23647945e9.26.1783513200177;
        Wed, 08 Jul 2026 05:20:00 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f50418sm122571205e9.11.2026.07.08.05.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:19:59 -0700 (PDT)
From: fliegbert2@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v2 4/6] staging: rtl8723bs: Rename camelcase enum value dot11AuthAlgrthm_Auto
Date: Wed,  8 Jul 2026 12:16:01 +0000
Message-ID: <20260708121603.2393-5-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260708121603.2393-1-fliegbert2@gmail.com>
References: <cover.1780343502.git.fliegbert2@gmail.com>
 <20260708121603.2393-1-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>

Rename enum value dot11AuthAlgrthm_Auto to dot11_auth_algrthm_auto
to fix checkpatch.pl CamelCase finding.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     | 2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c         | 2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h      | 2 +-
 drivers/staging/rtl8723bs/include/rtw_security.h  | 2 +-
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 6 +++---
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index aba97ff0f007..d721b75ade7a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -858,7 +858,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 	status	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 4));
 
 	if (status != 0) {
-		if (status == 13) { /*  pmlmeinfo->auth_algo == dot11AuthAlgrthm_Auto) */
+		if (status == 13) { /*  pmlmeinfo->auth_algo == dot11_auth_algrthm_auto) */
 			if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared)
 				pmlmeinfo->auth_algo = dot11_auth_algrthm_open;
 			else
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 80e7eef51390..7ba71b5f142d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -526,7 +526,7 @@ static int update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 		switch (psecuritypriv->dot11_auth_algrthm) {
 		case dot11_auth_algrthm_open:
 		case dot11AuthAlgrthm_Shared:
-		case dot11AuthAlgrthm_Auto:
+		case dot11_auth_algrthm_auto:
 			pattrib->key_idx = (u8)psecuritypriv->dot11PrivacyKeyIndex;
 			break;
 		case dot11_auth_algrthm_8021x:
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 140f382a3f42..88965de0a02e 100644
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
index 5a822784fe65..f164146ebed5 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -173,7 +173,7 @@ do {\
 	switch (psecuritypriv->dot11_auth_algrthm) {\
 	case dot11_auth_algrthm_open:\
 	case dot11AuthAlgrthm_Shared:\
-	case dot11AuthAlgrthm_Auto:\
+	case dot11_auth_algrthm_auto:\
 		encry_algo = (u8)psecuritypriv->dot11PrivacyAlgrthm;\
 		break;\
 	case dot11_auth_algrthm_8021x:\
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 2a947bbe6c84..84cff63276f9 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -539,7 +539,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 		if (psecuritypriv->bWepDefaultKeyIdxSet == 0) {
 			/* wep default key has not been set, so use this key index as default key. */
 
-			psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_Auto;
+			psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_auto;
 			psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
 			psecuritypriv->dot11PrivacyAlgrthm = _WEP40_;
 			psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
@@ -1310,7 +1310,7 @@ static int rtw_cfg80211_set_auth_type(struct security_priv *psecuritypriv,
 	switch (sme_auth_type) {
 	case NL80211_AUTHTYPE_AUTOMATIC:
 
-		psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_Auto;
+		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_auto;
 
 		break;
 	case NL80211_AUTHTYPE_OPEN_SYSTEM:
@@ -1683,7 +1683,7 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 
 	/* For WEP Shared auth */
 	if ((psecuritypriv->dot11_auth_algrthm == dot11AuthAlgrthm_Shared ||
-	     psecuritypriv->dot11_auth_algrthm == dot11AuthAlgrthm_Auto) && sme->key) {
+	     psecuritypriv->dot11_auth_algrthm == dot11_auth_algrthm_auto) && sme->key) {
 		u32 wep_key_idx, wep_key_len, wep_total_len;
 		struct ndis_802_11_wep	 *pwep = NULL;
 
-- 
2.54.0

