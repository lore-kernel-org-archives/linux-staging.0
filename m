Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF1A11CAF
	for <linux-staging@lists.linux.dev>; Mon,  1 Jun 2026 20:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780346566; cv=none; b=iTq88kJQ3ipuPfkN+I5FHEvsHQtI6TrT6gxxNBUhSWBaPsGPbp8XkquNX6qySnmyGO5LnCvq1Kkr+wYl89jKRLLcf5A4euERnnHGwlXj872RATHJCpfrKxvqdPaJk3i7xDHTvRz4/1bzjavbKfJpPAyA6278PInozMnYfOCeveo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780346566; c=relaxed/simple;
	bh=TKtGC5LuhoZdz89HAyo/1GlH+JUbcQ83ywQuXAzFfmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=My76FnKWlkj8LR3aFAok51TGQLlzZ51ckOI/nwcr89zzeVQR/PE3gcdNW97phth8TObUqwGv4fuvdd8bgy228In1OsZLaZcH4H9prjkX2+vbEFTwJq5N0CH3y/LAT1oCPL998II5DoGHN7tWrxWxtNjeAeealswWlA2bUxr8DH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTF90wJQ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTF90wJQ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490a7a9f81bso14929645e9.1
        for <linux-staging@lists.linux.dev>; Mon, 01 Jun 2026 13:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780346563; x=1780951363; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9F7mAXYFz9A4hZ4l/TciGH0Ovi0epzYjjtbeUGcbvs=;
        b=cTF90wJQunJonQ1ldMetKK/w/f4wG3g3ZUYAaZ+zGfv7a/bbayrTXFRW3Cg8sMmKQ2
         85bkmMpYjGIkQCXU+JN3i8wa9xjTpmVCTirC07GjY8JRPMpxP6zpqq6o2WCreBTepfN2
         nK0NrNSzVNZNHZee57cxG10yWj9Ul4APFXRi9R8Na2QXqzJDPcEKR9+axQyjLIWFcODz
         puh2sRtlEEMsGDShxQ7IrpF8aGSm1cpS7k50aRV7cYqOLWo4LM6a3hkDkJi132GUYSRd
         ca4TgTPQqucueft/2AsLqbpjxKd49Dy5DbSHaxH9oOeAqgAjwxCA3dKXqUwyc9x8kTG6
         Zh2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780346563; x=1780951363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s9F7mAXYFz9A4hZ4l/TciGH0Ovi0epzYjjtbeUGcbvs=;
        b=gRIIxLXWOmUtF2wGeumzTaDvbSneA2S8s0ZgG+LngwvBm/RwM5vc4EOHBsmEkOyzOI
         2bXt/gH2vNm83rIZvFGiveXrOSxt/gXY780dGaUI2Z0miQHiNhColfZS8PSRfkvaVNvk
         tnIGxcWwZrPuKlehkuT/7ifKc1YBuBv4W4KjkBdzRxhrhWGcbu+tvvyFCtxCUb0ndYsR
         jQNEgwaiW/2ixvQ4OTPZIX0wuYE2R6egW1JBt7CGjaFGXe2IX9Tz8MPkTDHAb0skQhij
         gKr8Q6GRmp7hskhXFRVeDeGwxuIyeIpOkLJQS4jGPveGECyIfWw3sYWCg4sc+239kNrH
         5SIg==
X-Gm-Message-State: AOJu0Yxd6USFEbt8GAtUA7OzGAFG2yZ1urdnEn1un6wMtmziSg8bhLWt
	KU3QwN8DwCAnc9qekactwHsw4XQYpXJwUcV1H5RobcGf5V0+Lxu1nPXl
X-Gm-Gg: Acq92OE04s/DzJPxVjg9IgVHvJ348llGmZkAuw6+nAjS/YBIkvz/keJBXr++B6eX9bl
	4Cb/wFHlH+LVomliO/mCuG+1uTHle54eZwx54MrjkcdZ/ug7e6vOePZmWtUzGWxKkto3Z8Kd7X7
	pbMm+KfGH66BsYWzwRSeqlM7l6dRl1jw56Tfp7Dpss7eQhy8mfMsaY1HMacv1jwoXeCjVgAXirj
	yDrFa2Qs0oNP2VnL7autddEPW9VujwhafDxh/Y/CKSrQrHKk/Q+6zco17LKTYsgM66Bd31+SQcs
	KffeR+l0ClM5KF+/Et9KW5JqHuYcZeo7hVjg2ZRSV5SxaGjE2ZwfeCOqXBjQlAQLgifCSzuWu97
	9nMyhfhNLtWMfzLOrlkTbEZsuN/oYBmxBV/dFG+PMif+AnKagYJ5dsgq+qJ/ZwuRwMDUOcrH8OC
	kJEEjTSmcM5YrJ31jrSmeVijqsQL6pl/iPDTgzXNOKt0m1EDQltfX3+DydDYUCwoZZ8GDLDDhJy
	KKKxjOldPiMd80CDmLqdmhsM/0=
X-Received: by 2002:a05:600d:84ca:10b0:490:8b0b:d3b1 with SMTP id 5b1f17b1804b1-490b0e8f03bmr10342195e9.12.1780346562462;
        Mon, 01 Jun 2026 13:42:42 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-002-204-131-161.002.204.pools.vodafone-ip.de. [2.204.131.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e19a06sm16988405e9.5.2026.06.01.13.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 13:42:42 -0700 (PDT)
From: fliegbert2@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH 3/6] staging: rtl8723bs: Rename camelcase variable dot11AuthAlgrthm_Open
Date: Mon,  1 Jun 2026 20:39:55 +0000
Message-ID: <1597266339d64b1467e964788c838f775ea9f9d6.1780343502.git.fliegbert2@gmail.com>
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

Rename variable dot11AuthAlgrthm_Open to dot11_auth_algrthm_open in
enum to resolve checkpatch.pl CamelCase finding.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c         | 2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     | 4 ++--
 drivers/staging/rtl8723bs/core/rtw_xmit.c         | 2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h      | 2 +-
 drivers/staging/rtl8723bs/include/rtw_security.h  | 2 +-
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 8 ++++----
 drivers/staging/rtl8723bs/os_dep/os_intfs.c       | 2 +-
 7 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 01e758a5fb8e..1bf6a1534104 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1114,7 +1114,7 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 		/*  */
 		struct security_priv *psec_priv = &adapter->securitypriv;
 
-		psec_priv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open;  /* open system */
+		psec_priv->dot11AuthAlgrthm = dot11_auth_algrthm_open;  /* open system */
 		psec_priv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
 		psec_priv->dot11PrivacyKeyIndex = 0;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 607af599c21c..d95e897eba62 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -237,7 +237,7 @@ static void init_mlme_ext_priv_value(struct adapter *padapter)
 	pmlmeinfo->reassoc_count = 0;
 	pmlmeinfo->link_count = 0;
 	pmlmeinfo->auth_seq = 0;
-	pmlmeinfo->auth_algo = dot11AuthAlgrthm_Open;
+	pmlmeinfo->auth_algo = dot11_auth_algrthm_open;
 	pmlmeinfo->key_index = 0;
 	pmlmeinfo->iv = 0;
 
@@ -857,7 +857,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 	if (status != 0) {
 		if (status == 13) { /*  pmlmeinfo->auth_algo == dot11AuthAlgrthm_Auto) */
 			if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared)
-				pmlmeinfo->auth_algo = dot11AuthAlgrthm_Open;
+				pmlmeinfo->auth_algo = dot11_auth_algrthm_open;
 			else
 				pmlmeinfo->auth_algo = dot11AuthAlgrthm_Shared;
 			/* pmlmeinfo->reauth_count = 0; */
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 65f0d567b4d5..a89c7dc87b06 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -527,7 +527,7 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 		GET_ENCRY_ALGO(psecuritypriv, psta, pattrib->encrypt, bmcast);
 
 		switch (psecuritypriv->dot11AuthAlgrthm) {
-		case dot11AuthAlgrthm_Open:
+		case dot11_auth_algrthm_open:
 		case dot11AuthAlgrthm_Shared:
 		case dot11AuthAlgrthm_Auto:
 			pattrib->key_idx = (u8)psecuritypriv->dot11PrivacyKeyIndex;
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 4128944af68a..e9d08633b6bb 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -44,7 +44,7 @@
 
 
 enum {
-	dot11AuthAlgrthm_Open = 0,
+	dot11_auth_algrthm_open = 0,
 	dot11AuthAlgrthm_Shared,
 	dot11_auth_algrthm_8021x,
 	dot11AuthAlgrthm_Auto,
diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 146d0fdf94b0..342e6908163e 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -171,7 +171,7 @@ struct security_priv {
 #define GET_ENCRY_ALGO(psecuritypriv, psta, encry_algo, bmcst)\
 do {\
 	switch (psecuritypriv->dot11AuthAlgrthm) {\
-	case dot11AuthAlgrthm_Open:\
+	case dot11_auth_algrthm_open:\
 	case dot11AuthAlgrthm_Shared:\
 	case dot11AuthAlgrthm_Auto:\
 		encry_algo = (u8)psecuritypriv->dot11PrivacyAlgrthm;\
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 00d63eed7b46..d473ff687487 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1331,7 +1331,7 @@ static int rtw_cfg80211_set_auth_type(struct security_priv *psecuritypriv,
 		break;
 	case NL80211_AUTHTYPE_OPEN_SYSTEM:
 
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open;
+		psecuritypriv->dot11AuthAlgrthm = dot11_auth_algrthm_open;
 
 		if (psecuritypriv->ndisauthtype > Ndis802_11AuthModeWPA)
 			psecuritypriv->dot11AuthAlgrthm = dot11_auth_algrthm_8021x;
@@ -1345,7 +1345,7 @@ static int rtw_cfg80211_set_auth_type(struct security_priv *psecuritypriv,
 
 		break;
 	default:
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open;
+		psecuritypriv->dot11AuthAlgrthm = dot11_auth_algrthm_open;
 		/* return -ENOTSUPP; */
 	}
 
@@ -1579,7 +1579,7 @@ static int cfg80211_rtw_join_ibss(struct wiphy *wiphy, struct net_device *ndev,
 	psecuritypriv->ndisencryptstatus = Ndis802_11EncryptionDisabled;
 	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
 	psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
-	psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open; /* open system */
+	psecuritypriv->dot11AuthAlgrthm = dot11_auth_algrthm_open; /* open system */
 	psecuritypriv->ndisauthtype = Ndis802_11AuthModeOpen;
 
 	ret = rtw_cfg80211_set_auth_type(psecuritypriv, NL80211_AUTHTYPE_OPEN_SYSTEM);
@@ -1675,7 +1675,7 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 	psecuritypriv->ndisencryptstatus = Ndis802_11EncryptionDisabled;
 	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
 	psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
-	psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open; /* open system */
+	psecuritypriv->dot11AuthAlgrthm = dot11_auth_algrthm_open; /* open system */
 	psecuritypriv->ndisauthtype = Ndis802_11AuthModeOpen;
 
 	ret = rtw_cfg80211_set_wpa_version(psecuritypriv, sme->crypto.wpa_versions);
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index f31196f54b3e..7646fcf54f81 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -534,7 +534,7 @@ static void rtw_init_default_value(struct adapter *padapter)
 	psecuritypriv->sw_encrypt = pregistrypriv->software_encrypt;
 	psecuritypriv->sw_decrypt = pregistrypriv->software_decrypt;
 
-	psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open; /* open system */
+	psecuritypriv->dot11AuthAlgrthm = dot11_auth_algrthm_open; /* open system */
 	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
 
 	psecuritypriv->dot11PrivacyKeyIndex = 0;
-- 
2.54.0

