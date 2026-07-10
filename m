Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402B9410D32
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 10:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783680443; cv=none; b=tXglF+2cJmWB3hhIWPrNbHtqOAbEWZFfiiYq8EpY3CnkGb6T9MAyX8kmy5nHkEPJstCrYFkxN/WD6/s+Pc+7X7A+mDD88VZebrjnjekbudmZEdJvsQfxo+vh4jL8RHOkwtSQeAe8iL3lQqwhALoBg24f1ISySTKBGokVN9rqw5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783680443; c=relaxed/simple;
	bh=scty4xPdAqOnFRkCsAUPs1FZW8OpeiLbJ0/6AquiM0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jR/UnX1j/eU0gtS58wc3XNaE9/fsVCU7cHHcITgKJpxUTTMt/8YlZ4ZA+FMZU64xPIOfHYHRWm8x0DCNBANGC2YacjcyJ16+/B7MbxsNLSDSKzj4OfigLRPRtKEOajmr4PXsTbNHFKOs61gtB1dLvoplBT7whqU/J6Lbj7T2E38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b8OtEDIT; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b8OtEDIT"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso770256f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 03:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783680439; x=1784285239; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=puAnhbXrS/ryKWLba49/wZ4FoHFWIGbaW9NlD2SHYcc=;
        b=b8OtEDIT2f7+dDV2HwKiB/68b2gBmEL7UkEKD4080GJa3D/mzqZHbpZGNnrrlGiGRn
         EJQGd/fKHPZ4jTBJz/9w40A8GJoE2vvRygG0ewP9ps6JH8Bmw+caRHggvsCQHYNHUrOc
         5OA0IHzUEYcXIs7jFKyO/jaULh4dXEG6fwhsdnWu5wrL6jit2VJp1zwhQQwJ4cX4L6l0
         U73cjp8GD7F0rcL3a9d9MwvrnWZxdQ85KvIS5ShqllfQgn3F5NxMdlrdNx/nLqcDhWKi
         SzVKanK9pDpupB/efNa7u324XptyHIj3lOOb1Wm5rUI9GASyUjBSzVM1k0lnaGJxTEz9
         M5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783680439; x=1784285239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=puAnhbXrS/ryKWLba49/wZ4FoHFWIGbaW9NlD2SHYcc=;
        b=R0OJf5yY9j4dRSuiQ4+dx1GAQt24LjgMVxw8ozV5pr/dH5WhAF2xYSlsWrefAhYp2Q
         2P++b+A+zdDM1Wk9U04bPatfn5bSOJmWU1EyoyyJwJrQ4m19RSS/7geWPMoGpyhOSOsr
         yuL7hSzrXjD4742GY34MtemgMvzF/POUq2Y3NuZu4ePRGKR3GA48SXdwg+qFKtLbh3ae
         iga30pM/kJ7mbtyzWY/cFz/lGQY18HmsybDl8ZMMltN/vHcblRkRz/6z4JJdYq+oKSrC
         eEXxX5tw8B94mfwGqAn8dgea1KCUIIOcvYI4gul3a2YsJAd25Z+dO2OjR3hUdZGxCn2A
         YFTA==
X-Forwarded-Encrypted: i=1; AHgh+RpLwNqUxUjyEKrU7ZElXmUei9dagqR0vKYXRYPWB36ssStsIWyROnXX5uT3b2ykaNy0/zG50kgDUe1gPtWs@lists.linux.dev
X-Gm-Message-State: AOJu0YxRRZXpttGzZVhoXUTQTHtA2t4B4erOs1TZrMePuNIbL6ODhRam
	+q/0sBrshhHZ5jU8e1NX5JsKyU+Ya0YVVU/SC0yIrV4Fz5iLTD9yEntk
X-Gm-Gg: AfdE7cnHH4oRcep1KTvOYA6Z/BCgzPXVzubUkTeMdIIl6Obst1+a8cDfVRnFEPop/BR
	64uodj3AduWEzUSQPdMJlxhPT35m1G5ySwNkdoQOwWE/lmfEB6DkYjz/D/Jmpf6fNUK76COWE07
	VjzOfBcWLlKk8ZD4OadttFza7OcRmINZx/0sH1Q1I7Ju1MyfVqoqd2s7GfqHTHVPVVB32AnwEdK
	jKT+5eKPNI0PLNIhKcjrTULhhAzpJZITfAbYA8TePdoLMPPDiq2ru8OT1EVU2SFw2gWBVKKmY7i
	gQdo81ucMnsWblFtskMQalIrSyhzwmDTMUpsKThI1sgzB1SyyH+9VahvThhm5LSDfbWfVLLXLi0
	Zcr8K/MS882WRBs2dx0LyO0fAc8Wz4OWY4Sr8yAyqrR+xsWnOD6SqQZeXstcTdfkd51V31r2+4Y
	QuJ4JeGguG/rAE05AG5tDfdQh0J8uytVOAg/e73/IbAfd8oY8p1MHTf4KoVZru3x0/ErA/ZH4c9
	ia9hFjCOwqsFKqk
X-Received: by 2002:a05:6000:98a:b0:475:3a97:8e2c with SMTP id ffacd0b85a97d-47df074886dmr11572624f8f.16.1783680439548;
        Fri, 10 Jul 2026 03:47:19 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm66551861f8f.17.2026.07.10.03.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:47:19 -0700 (PDT)
From: fliegbert2@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v3 3/5] staging: rtl8723bs: Rename camelcase enum value dot11AuthAlgrthm_Auto
Date: Fri, 10 Jul 2026 10:45:27 +0000
Message-ID: <20260710104529.5366-4-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260710104529.5366-1-fliegbert2@gmail.com>
References: <cover.1780343502.git.fliegbert2@gmail.com>
 <20260710104529.5366-1-fliegbert2@gmail.com>
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
index f19ece2ffb39..f20697fb9e93 100644
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

