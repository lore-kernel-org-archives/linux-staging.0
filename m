Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D07C410D37
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 10:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783680442; cv=none; b=fIshb/wKHcWRVswsPuI79VSKYX+gnurWeQ9X0vcpxAMfIqPtRZe9ok54LClLkVN1i6PxshSjGBA+mEiSMQOfx1IV4bXIUEDvYo0CJ+9KqtPjgcdBdeBuBsiBZACymgjzv1QE9rt7K4BspI75dYDnA8Eb4tOPt6v7U2b09lipEVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783680442; c=relaxed/simple;
	bh=4cgGUEHLjuVJblWe4pf5NRyHu8ApC9iiLhmKcykYVNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S7FBfb9cFijB2Tvm1i+/6ZXFRwkI2nB4xfZWPgQ58CW++M0kbcvULy2jSAqBupYGx8+n80ABHz7I1YWIxAOfcDQZZp7IR6N+T49/SgWphPeU0a4PZTtCK5WsycaufI/+uqrSSvIVFbJXsqjXiXTbLJi6W7Y+yE9T18utvSVi/Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qpw6xfhK; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qpw6xfhK"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4758bd3731bso559591f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 03:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783680438; x=1784285238; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J0ubhz2/KwcaKEuFvi8OZRskAWa/R1LNJIkvhpxTHeo=;
        b=qpw6xfhKbOlHOPFp02kr5CoPIekQaOkaZLBNe9hmSpRw1tKrz8xPwTZvjGi31rj/fA
         pFpExMdYPxOsUpBdGy1s2KuUBRlDtTbUWiOh7agqf59n3Lhz2Zh1IvHj2L7hQFTcI+dt
         0lehoB9EAVkSkAx926J989SX+1nShGxgwVKHQYt5NurTupZCtNrlRltv1H/OhJyzuqsp
         Py14mWvqJRcyCqh8vffT5+aRdU//agscQS7dZzQc6JdKdJicV6+xMMp1EhTKOpJ3VlU6
         LgWENXQrhONa4BDWVxdL043L33tTrZLzaX9R0MyaRRKBXOcYPExHWnaBBYXFTXXk5sAk
         xlGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783680438; x=1784285238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J0ubhz2/KwcaKEuFvi8OZRskAWa/R1LNJIkvhpxTHeo=;
        b=Uwq3huNveHGek5ncNile7HZ9xXmbqoCzyM5QUUZWwmC1Bug0PzCPDIS2oItiCryP8X
         GWU+21XpRZeAwIZKwyGEzKqa8RyVUT02qyILRhb8wa5hmNeHYp0cUCCXxaMUbj2r5i1/
         cdl1A6lH5Yq5YByFY4N/XQ36qMvNd6Qgd0nLvJKe1ZPPRWRdkrlk68DtD81Ab94eY0Pp
         oBEbMNe5NNYpYNrqfmaEzsg1qb4p/fGlcClIOtOhM6qP9vCdkVbunuRCp3Iv3DMfnzrD
         w5dyTqwysbBMzmUvtR955YwIvrYsYSJ4JWlko7XniEIZcz0JTT18/CewpYjySSTYENVP
         ZWyQ==
X-Forwarded-Encrypted: i=1; AHgh+RoMfr9+dcf8je8XrN1P56MOtpx2Gz00+6c4H7vOUsh4L0gLOcoCZmmAcnrQAXbKMK8wFaKcRcSgyQqRZl/j@lists.linux.dev
X-Gm-Message-State: AOJu0YxvfoZjNmUhPol/yeumrC+uqjkp4NPr/S+N8aEnjDnnoB+KgaUs
	GbRsYV+rpII8gZhDrdcwSajv/+BK0FF3tAxunY/MCN7mWvs6IVXg2UvB7kOFOiBN
X-Gm-Gg: AfdE7ck3+kxzdHmN4HHhoiyQZAZxLf8ESx3MaLX4saUuvdC+LaAm/+fD3IPNdv28mpq
	LMGib8x7mN61ZiiCnBjzSypTBl0mReH/CnysAWTLaTIrKqSeZrDXt70DnU2eB9+DS28gTRbBF1X
	ifzc05pGhgorecO7pADJHdUUY66TRUpLruVeUwgjKLDp9bWWMjcovM+XN+JI2iBRgoWLYims2xk
	vipKYH8czvGj2F1C8HDcxxashv3SZGLthznm9/qamTYlAO9k1+7EVmUklNVYcpFQxdXOIn14f4t
	XkT95Ankmx5MVoe01Zq2HJXzwBc9127UUGLg6+y5aTAsXyOXusV1H9fnPsp//YRhR+gGRX0yHKC
	9TEGI8xfO0jLl1VgRR6HPi6fZ6GQImu6yN+6ALvzEq7jPcCpKoDF5pJOs+3xOb6CQKpQA5bARu6
	sei411i4NTZEr/HKSeZppl6E2Fz2zmsOeS8S7Fo/8RqN4dumsYSuVx7ibX5S+zqyYkgZ6rM4By2
	OLxnpk9p9rxzDjH
X-Received: by 2002:a05:6000:4604:b0:473:5bbe:780a with SMTP id ffacd0b85a97d-47ef699a5afmr3605033f8f.31.1783680438429;
        Fri, 10 Jul 2026 03:47:18 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm66551861f8f.17.2026.07.10.03.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:47:18 -0700 (PDT)
From: fliegbert2@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v3 2/5] staging: rtl8723bs: Rename camelcase enum value dot11AuthAlgrthm_Open
Date: Fri, 10 Jul 2026 10:45:26 +0000
Message-ID: <20260710104529.5366-3-fliegbert2@gmail.com>
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
index 180891e49971..f19ece2ffb39 100644
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

