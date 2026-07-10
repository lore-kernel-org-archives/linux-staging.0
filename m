Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD0B435EEE
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 16:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783700529; cv=none; b=PFlTUeIveXkl7gQxp4Gt/Ivw4iWyiGFK3w0tUImhzCGAWvsSQQ6b9D27iCOHxEX0ydkXQ+496FxibNDU/1Fm0HmDTIuKh4Hv0abji1aRkozc9Isbpqvk/GVZGaBtTfUPdc0QSVO5alMmdjnW/jSGJ9GwNMqJniuB/f3+dFIND6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783700529; c=relaxed/simple;
	bh=nCH6TfdTtNx2fyhAj6LfaDKPZg7DbGS0P/oq/L2roNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HNhNpYHBeT2gMDpY0hKkb6h0bZx+hnHGvhapakpb6uWYD37T9ydsZsqYQTv8K59A+XjFpCXvFAZmAB5oL4jxkg+ErCcGdXnis5+9cbHIJRbWHBcW5MQw8QXd6OCbfKPteurbBpGW8NoP9NT6TVn5FNJEUSUEH3dISNI0AKRSeK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1rBC3xN; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1rBC3xN"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47640541585so584716f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 09:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783700521; x=1784305321; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N3bNSV51sINCL8eRo9OlGlxkQYWbQg5xFOOO3RKL1ow=;
        b=E1rBC3xNRJtOOOU66kNECffYG6wmZQf4PlrjUlwp/Z5/EE5Z5z8Qlrp9QsOAyyXuow
         /JSYJHVXexpCX4OzvSt3kh6thUCd/cbnCZfsMNWq4SboVWY349HYckRIlnNKbiFx3t3G
         y7czUyFmkF2XgycxpAX/8se7y/yLYSEiQXiVGu3VzaqcBrENLYYui8hrBOlBGdVoKYjP
         fwCuzlIGzf85GV/UkbKVFp3ZGYgD3pzE7gEZPkSefuy1ij9z6FI3ZNlbWHqP1jeSgbZ7
         EPPumGYiuYvRX7G1Tin8pSboyjdjcQXFgTYJY0HHJ5dDg1liOVe/VaPvam2A9qgnWkVU
         MjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783700521; x=1784305321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N3bNSV51sINCL8eRo9OlGlxkQYWbQg5xFOOO3RKL1ow=;
        b=X/IrP1ZFaI2z8c/ZXmy+2y1yUO0VaQJAQ6jeSglDN20EQ+3N9tS8/qQJm5pfu3JmtU
         eth7fI2QeNF+4yHCxCgMOdOaN9wORvbD+WGnHGqfmlrjlUO0g8Uj+JWZ6EFdC747HrBR
         lrOHQwkh17Li7ZaHlnnCrq2VdvvyRf9BUGf1Z8oE0wi7+gXXyLv43VXfe5SwLemM7q5H
         wm/8XU8yJGolxY+XoE3xi5GMOO4GzSBSzAxMz+eoe70k9XQJojSLZXX8+FNnxGZ2T0HS
         1lZyZaOrG5XtaIkuT+Z71qRp/KJkq/0U7ZkEOqWPu7BRAj73kElyJctTwTdGi43kk4ar
         mguw==
X-Forwarded-Encrypted: i=1; AHgh+Rq5yr+Urf7RfTeuV8jeWOilj9x7PJsiieLl56aqXX5enVKp9EdRdKL2qezN6SFh4sEcliGiq32BRiC3pfub@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9NawZN5YEmKeVjy0mVnzLVEOj7mJWvxLAkGBJlnHCR8hwnzBL
	IJiocTXZyxWFa12xtnsBXuqNybTeGJ/3FC/3BoBPAHsZv80eFycybxgD
X-Gm-Gg: AfdE7cks12vvfvwog3dx2MXbtYwycOUc9Pun3R3LZ7CmLY8hktm1khIUzQbJsI2zfUT
	nhHfkGPSd7JVvbhGJRJy4JOfD1XZFi6eUg3WpNkQif2TH6a+8P0JwJUu5R+WcnCMnRDejtz2s57
	sgwj2DHZANw4mMGaGXVBN5xNs8Z7MInnLH/HHXM6AafD0QVQMpKB3edaTUWSgZC1SjjjaoM3eNH
	Gznvdi7fl4VwE02h6hM7ggOJQ2XTZ2xYiZkfOEBl+tYLAUxZE9oLK1nE98ixix0qqbRWZcsGxi/
	O/GS0mflLCsXprlPJLVsBkuuezcju5OrlOy7YJ3JEL6IxttclX4IO4KcUnoGdObUs9LiKQig66r
	XizJfqininmM32eKsDFos8/W+h2DnoRJTMYK0obUqOV/RUMjFLxGo9h3+kiLKFdrQLWZdbaAv65
	IREjN+7HxpNyPCG0SCb91R/Q8DCMCybk84rSPxOv9TWMVGN0JfFAAuFtRB7LO6rAcu9R3MegT1H
	q04nQ==
X-Received: by 2002:a05:6000:2584:b0:475:f0f0:9efe with SMTP id ffacd0b85a97d-47df0787d9emr13889995f8f.53.1783700521443;
        Fri, 10 Jul 2026 09:22:01 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm69436063f8f.17.2026.07.10.09.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:22:01 -0700 (PDT)
From: fliegbert2@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v4 2/5] staging: rtl8723bs: Rename camelcase enum value dot11AuthAlgrthm_Open
Date: Fri, 10 Jul 2026 16:20:14 +0000
Message-ID: <20260710162017.5660-3-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260710162017.5660-1-fliegbert2@gmail.com>
References: <cover.1780343502.git.fliegbert2@gmail.com>
 <20260710162017.5660-1-fliegbert2@gmail.com>
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
index 40b3a1ef7f68..ad8a2a320d85 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1119,7 +1119,7 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 		/*  */
 		struct security_priv *psec_priv = &adapter->securitypriv;
 
-		psec_priv->dot11_auth_algrthm = dot11AuthAlgrthm_Open;  /* open system */
+		psec_priv->dot11_auth_algrthm = dot11_auth_algrthm_open;  /* open system */
 		psec_priv->dot11_privacy_algrthm = _NO_PRIVACY_;
 		psec_priv->dot11PrivacyKeyIndex = 0;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index eaf5b727dde7..827c37ac594e 100644
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
 
@@ -863,7 +863,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 	if (status != 0) {
 		if (status == 13) { /*  pmlmeinfo->auth_algo == dot11AuthAlgrthm_Auto) */
 			if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared)
-				pmlmeinfo->auth_algo = dot11AuthAlgrthm_Open;
+				pmlmeinfo->auth_algo = dot11_auth_algrthm_open;
 			else
 				pmlmeinfo->auth_algo = dot11AuthAlgrthm_Shared;
 			/* pmlmeinfo->reauth_count = 0; */
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 0da05c4bee10..baf52159cb7f 100644
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
index d2df45f03525..0ccb38233bd6 100644
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
 		encry_algo = (u8)psecuritypriv->dot11_privacy_algrthm;\
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 601519ce228f..73156ed5daef 100644
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
 	psecuritypriv->dot11_privacy_algrthm = _NO_PRIVACY_;
 	psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
-	psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_Open; /* open system */
+	psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_open; /* open system */
 	psecuritypriv->ndisauthtype = Ndis802_11AuthModeOpen;
 
 	ret = rtw_cfg80211_set_auth_type(psecuritypriv, NL80211_AUTHTYPE_OPEN_SYSTEM);
@@ -1659,7 +1659,7 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 	psecuritypriv->ndisencryptstatus = Ndis802_11EncryptionDisabled;
 	psecuritypriv->dot11_privacy_algrthm = _NO_PRIVACY_;
 	psecuritypriv->dot118021XGrpPrivacy = _NO_PRIVACY_;
-	psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_Open; /* open system */
+	psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_open; /* open system */
 	psecuritypriv->ndisauthtype = Ndis802_11AuthModeOpen;
 
 	ret = rtw_cfg80211_set_wpa_version(psecuritypriv, sme->crypto.wpa_versions);
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index fb6fc603f279..fc3c9c786a10 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -531,7 +531,7 @@ static void rtw_init_default_value(struct adapter *padapter)
 	psecuritypriv->sw_encrypt = pregistrypriv->software_encrypt;
 	psecuritypriv->sw_decrypt = pregistrypriv->software_decrypt;
 
-	psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_Open; /* open system */
+	psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_open; /* open system */
 	psecuritypriv->dot11_privacy_algrthm = _NO_PRIVACY_;
 
 	psecuritypriv->dot11PrivacyKeyIndex = 0;
-- 
2.54.0

