Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC16D43D50C
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 12:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513198; cv=none; b=GlNVXn8T7qM8n2KnKY8xpmRCiUc65b4ONKj4eQlFCbA+/t4flzzptEJpeb/yi0NSiujOyVNqSq0Ki8ni1ALQzdY6PAatjxpu/TyqrlxKJqnXbmoDjrleEegFz2vrVHVgAMOkaxKCJZ7oZLKqcOxcrO7Pyj/LJtDIsXi2usT0kuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513198; c=relaxed/simple;
	bh=Dm4P+oTmTK3PGi4g5EY4bsNrnZ9aOGwzhV/CGu5HCdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k1ATMDzzAbusXk+llXBv9ypJDcc4M+nptG1LDm44aatCIKyzFhao/jxTlZTv+zJ0o+Tf62hO198ALfEAkOL966I9HzjMJ9sZLZUbOrts5Lu7l9KGjHVZodjRiJodAJVh09GrsAlXsCSbjxkb9rfOI8DbQ5CiyomHQ51P1Og7Zco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bsLaX2d7; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bsLaX2d7"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493c733f15aso5321725e9.0
        for <linux-staging@lists.linux.dev>; Wed, 08 Jul 2026 05:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783513195; x=1784117995; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DJoJsTraCsZ1uJHhyqxfi68Ub8Zs10///WVuTg7jUo0=;
        b=bsLaX2d7y42+S7y527iAAUKhxAl7YOFdVKNDFC0ZGQP1MJFizDm4TrYm8vKnohJLur
         4zctjK3zVKQfD/TU612SmGgpxenGKzLWb3Kua8ZFsghXRvHGXLAVJyladPDuUY/BQ+Rj
         ZnDTsx4LuvNfOPljuq+7hOIihnipG5Uy4GHNDnkwb9bSZV98V7qKtIC8D6G153puwO8I
         pZD2BCwDvn6vZqqPqv2j8WU7QgOOoKOQnBaca/Z/wb51Qv+M/FU1zruGPsjSFFxB//ip
         CHp23sYxNiuEe5f23oa7jUgv4cNxgCSFXTeSwa5NwaDPS/dchZCfmNwsQGgKkCJYHOaT
         KkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513195; x=1784117995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DJoJsTraCsZ1uJHhyqxfi68Ub8Zs10///WVuTg7jUo0=;
        b=TktfL4LZlQng9P8ACguNYYBT6ifmBCuhNf38xExwiOsXLeg1FlHw5bHSvGqwMTwgyN
         Ul9E3JBCiYPGo2DA5bUoQIeqCVfH5Evi1I3z0xRsr3LPCSNCZ8s5xHfeacSor+NQG+u7
         vjCiqSlKtw+UU4BD1/DGUzhLF4eyaELYf0kKd30vY3x9zrsIOL4YaJfSQtsYrUbl/ecw
         O/fWU81nOgB5V1XGeGO1ie3lI1i1LI7LLC0V0E5pbUL+pbqkIZkj8debX7tCpMytFigR
         7Rvj2oh4NJaS+s1KsCt5uU3zva7F0eMfxE1tnGoKvQ2YjoQfww5f2v6WvW6i9rXYIwAo
         0qbA==
X-Forwarded-Encrypted: i=1; AHgh+Rq6GHWzfCkmjwWC59NAduGvE84rlPVRKhuaDcApEtZcO0koxmyYhtb2EGqE0Dd7vE5Nv6+fGPmFuXtchbV8@lists.linux.dev
X-Gm-Message-State: AOJu0YxCr5kcz+mnvG9OPYzmRxzf5T/aqMonCEBaOUWlVrFx0qe4HOz2
	bp6Bxzzj1pom7O/H6msYGluR+WFqf1mbTdcsqUexSj18oPLIwcLcu9Qx
X-Gm-Gg: AfdE7clSeBPskYv/Pzomn9v7UCGF6Utm1nNsRsPowLANR0t95Wk6MHLSvjuWooGJGJa
	/rgzGxn/WlaC01C4n5tI+eUAFXwhuEjM9XZqR+fYa3jV98dhsATapC4WyONqYUGNXDuM+xjFhmG
	GseCBcbjUQd4B+8FDrsECm8sb/QSlJugcdrMKEBWNvWUWZSTuiu4K8ipizijTkSjlD5/sInGy5M
	2zV1fQvSe2xk1ye0ClkvVLwgOEXD6pmpNG0izb21JF1jjOjJ6nmI9bTn6M2zCYt5ZL1YynTY+3N
	o1y1PKOVOhmj9qC1qksiiwi0djUFJWjeiDpgtgwkz3wIS5CKIVg8jxh6i8loLwHdeDjsSORYkSq
	MA2/sgn24E1Cl/7dSbxC6ql2SvQUXlpolbWoSB3Qqw9RPwyRQy9u68Y415YovPS6TDljsszC5iV
	89iz0mMg1Vx1Q+shr19MwnWyAaP2L9RPHd6yCt81fF8iXLTv1Y2tEtAuELPr6FGFoyaxMmZs6W0
	f5GmA==
X-Received: by 2002:a05:600c:1385:b0:493:e7b8:fd3d with SMTP id 5b1f17b1804b1-493e7b8fd4fmr17080215e9.25.1783513195183;
        Wed, 08 Jul 2026 05:19:55 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f50418sm122571205e9.11.2026.07.08.05.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:19:53 -0700 (PDT)
From: fliegbert2@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v2 3/6] staging: rtl8723bs: Rename camelcase enum value dot11AuthAlgrthm_Open
Date: Wed,  8 Jul 2026 12:16:00 +0000
Message-ID: <20260708121603.2393-4-fliegbert2@gmail.com>
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

Rename enum value dot11AuthAlgrthm_Open to dot11_auth_algrthm_open in
enum to fix checkpatch.pl CamelCase finding.

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
index 930ca09b7ac2..1835216de530 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1119,7 +1119,7 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 		/*  */
 		struct security_priv *psec_priv = &adapter->securitypriv;
 
-		psec_priv->dot11_auth_algrthm = dot11AuthAlgrthm_Open;  /* open system */
+		psec_priv->dot11_auth_algrthm = dot11_auth_algrthm_open;  /* open system */
 		psec_priv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
 		psec_priv->dot11PrivacyKeyIndex = 0;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 3ed30b19d94e..aba97ff0f007 100644
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
 
@@ -860,7 +860,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 	if (status != 0) {
 		if (status == 13) { /*  pmlmeinfo->auth_algo == dot11AuthAlgrthm_Auto) */
 			if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared)
-				pmlmeinfo->auth_algo = dot11AuthAlgrthm_Open;
+				pmlmeinfo->auth_algo = dot11_auth_algrthm_open;
 			else
 				pmlmeinfo->auth_algo = dot11AuthAlgrthm_Shared;
 			/* pmlmeinfo->reauth_count = 0; */
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 7287f4342718..80e7eef51390 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -524,7 +524,7 @@ static int update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 		GET_ENCRY_ALGO(psecuritypriv, psta, pattrib->encrypt, bmcast);
 
 		switch (psecuritypriv->dot11_auth_algrthm) {
-		case dot11AuthAlgrthm_Open:
+		case dot11_auth_algrthm_open:
 		case dot11AuthAlgrthm_Shared:
 		case dot11AuthAlgrthm_Auto:
 			pattrib->key_idx = (u8)psecuritypriv->dot11PrivacyKeyIndex;
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index b42fb1fc7658..140f382a3f42 100644
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
index 58f058ce339f..5a822784fe65 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -171,7 +171,7 @@ struct security_priv {
 #define GET_ENCRY_ALGO(psecuritypriv, psta, encry_algo, bmcst)\
 do {\
 	switch (psecuritypriv->dot11_auth_algrthm) {\
-	case dot11AuthAlgrthm_Open:\
+	case dot11_auth_algrthm_open:\
 	case dot11AuthAlgrthm_Shared:\
 	case dot11AuthAlgrthm_Auto:\
 		encry_algo = (u8)psecuritypriv->dot11PrivacyAlgrthm;\
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 18e95c4feb39..2a947bbe6c84 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1315,7 +1315,7 @@ static int rtw_cfg80211_set_auth_type(struct security_priv *psecuritypriv,
 		break;
 	case NL80211_AUTHTYPE_OPEN_SYSTEM:
 
-		psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_Open;
+		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_open;
 
 		if (psecuritypriv->ndisauthtype > Ndis802_11AuthModeWPA)
 			psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_8021x;
@@ -1329,7 +1329,7 @@ static int rtw_cfg80211_set_auth_type(struct security_priv *psecuritypriv,
 
 		break;
 	default:
-		psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_Open;
+		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_open;
 		/* return -ENOTSUPP; */
 	}
 
@@ -1563,7 +1563,7 @@ static int cfg80211_rtw_join_ibss(struct wiphy *wiphy, struct net_device *ndev,
 	psecuritypriv->ndisencryptstatus = Ndis802_11EncryptionDisabled;
 	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
 	psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
-	psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_Open; /* open system */
+	psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_open; /* open system */
 	psecuritypriv->ndisauthtype = Ndis802_11AuthModeOpen;
 
 	ret = rtw_cfg80211_set_auth_type(psecuritypriv, NL80211_AUTHTYPE_OPEN_SYSTEM);
@@ -1659,7 +1659,7 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 	psecuritypriv->ndisencryptstatus = Ndis802_11EncryptionDisabled;
 	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
 	psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
-	psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_Open; /* open system */
+	psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_open; /* open system */
 	psecuritypriv->ndisauthtype = Ndis802_11AuthModeOpen;
 
 	ret = rtw_cfg80211_set_wpa_version(psecuritypriv, sme->crypto.wpa_versions);
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index d722121c3633..716105a7d275 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -531,7 +531,7 @@ static void rtw_init_default_value(struct adapter *padapter)
 	psecuritypriv->sw_encrypt = pregistrypriv->software_encrypt;
 	psecuritypriv->sw_decrypt = pregistrypriv->software_decrypt;
 
-	psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_Open; /* open system */
+	psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_open; /* open system */
 	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
 
 	psecuritypriv->dot11PrivacyKeyIndex = 0;
-- 
2.54.0

