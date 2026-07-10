Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D1043B3D4
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 16:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783700529; cv=none; b=hVxJSPBfpOhfvTYEVJqvpnrmUkmf1r/hvbB4A8VYWTy0kJdn9jZIQq3qS5s1nFtCVW2Ge9naNonMKyTfhCDbZBIucHlmNJ0auN3u8TkU3V6ql07m9dd6ApRwtIQQe4Y+hTtLH53Yypyes9IQUWkbRzNk1kMq0XbiyX4RDDP9FME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783700529; c=relaxed/simple;
	bh=BU2GeFT20h5Ac9Q7spff1U3doR1whjDFOMvjU6Q7RfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VkoYdj8VjZ3fE1jnNOriuNIA3NtMxTTkMytZXGvlolUG0t8hz140q/7lVaUxzQW3OMdqCf8iTLtI3piu9kr26WV5+bOcmZ/tg28o3Npyse/h9z7LdX4NF+yvwq4bFpCh7VNNsSnYU7sFxWdzy334/+NF5Fj2atkhZGVgFBXFcE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YUgBuBCL; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUgBuBCL"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso9567325e9.3
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 09:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783700522; x=1784305322; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w8hCS7VJJdPRUvjXUeGs6KL+sFZGVy0WstSn80jpSrk=;
        b=YUgBuBCL8+TyM+H2f05ewb3gABvdyy5rOdhPdD8fz0s/evUEpMjnq/2s6FvHnuxqPd
         LRfE1XLfNcJzDNLyH1X/WX/FRX3kwEYbgu+hxNV/3eFEmdkFKqy9ha31A+vFy/zp0CGZ
         L6jOoieVzMro+If1w570Lf4EaupaT114mRYnDViNi/o0kZ7DXXXVyd9lj4QKKEPeRtfE
         SceszPCJwKkhdVFu3/pgaHO/6asfDipRMpi/lnae8Evk0K0Er60u84XN+uPGeOOio7rX
         6bObQ5DN1cNwnjYL8e3lT1lsWsAdPtsV/iL7zMcJBfuRDjji97J1a1+5JzP3a92yyqP6
         qGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783700522; x=1784305322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w8hCS7VJJdPRUvjXUeGs6KL+sFZGVy0WstSn80jpSrk=;
        b=QCZzUHxYcwgYpNLCA7+z7rCr++UEoQd3DUkKXRqR6v/Hvyc89lLIKGWdJFkcY9Z3Ra
         0g04imbT2Yj7fA6h8IrBiMxrYCEDQG4BbyoCYVuJDppQFqifhwu7pikPjYK0kksGGlH2
         9EZ29gwckvzLqJZKJ9O/crzxjloXqAw+ow5qrSqnhI/FSHy2PQH90rGAukYeus8VKqUk
         ZVCWGARlTcUEOtGd+JvigR1g8LwtaAfwvatpgMVvEftDJbYaxPtiW7Y1f7cbXkz5AMlJ
         QxFP1lXlx9Hn39IEA6kkydeBNYSwoeMqL88fPzVLod0SWfZ/xT0ttXCvs4KzAGrm53Dx
         2HWw==
X-Forwarded-Encrypted: i=1; AHgh+Ro+X30pTtTTZQmBtKeffc1Fnml8MHVYcD2jihVduFSaR0TWpcXenhJLEngUCMg0zVVbiPpAG6ep07qv9tvX@lists.linux.dev
X-Gm-Message-State: AOJu0YwlDPVX2EowTFqU4rJ9Z879CZh2WrBAnZDNefP2RRlXnOz32l7W
	6DlVJZWxBskQ/KCchCS2qjFBHGMe1/YXbzlYaQAx7Lccl0vBOPGm+N5iwSHNGUUm
X-Gm-Gg: AfdE7cl1KIGMlcbTpaVjVQcnnhOq0Y5GYuijyEFC/biMRd84Mysz8qJjxJ6L4yOkNv9
	N1BumD/P0JtbScW5BYbaCCMHMa99nSwSffCh5Ha9RoELGiCYELa8+IQyP4zZN11GdrZAjZt1qbq
	Ap9ZJtvwebrSSneN7oI27VS9jGthm8jgZERMLEaxOj1Kbei5/cBMFIX/NGqNHiV49VnAf//hh00
	Xh6kL1Uq67Cr3KLk0nQn/xbpdc30OR4EK5EWrttzp3TinXrd9Xr6zxB4ScwGqX/sO75FRUUHh2Q
	qcdDExT613HJRvdypRdQc6jGiE4ppUsplFWY6Xq8YaCNauhXtk7gKG3z8gsjFchcp0Q3v7m2ELj
	EwaUo5xik3VRLfeDmYXuUIHsKBasqyFyUCXHTtO3vvlT6CQ3msKnUb7JSeUqHv3rtMIcHlYIdO2
	TMJDq34VM3ss02JcZfsP8E/V9Z/9EfKWfhJkyGdCw8hVj7kozuE3Kd2aRqhpNI2a5LdvsfKgEYH
	Ypyiw==
X-Received: by 2002:a05:600c:8284:b0:493:e504:cbef with SMTP id 5b1f17b1804b1-493e68508f0mr126535045e9.0.1783700522197;
        Fri, 10 Jul 2026 09:22:02 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm69436063f8f.17.2026.07.10.09.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:22:01 -0700 (PDT)
From: fliegbert2@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v4 3/5] staging: rtl8723bs: Rename camelcase enum value dot11AuthAlgrthm_Auto
Date: Fri, 10 Jul 2026 16:20:15 +0000
Message-ID: <20260710162017.5660-4-fliegbert2@gmail.com>
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
index 827c37ac594e..83a35ff78752 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -861,7 +861,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 	status	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 4));
 
 	if (status != 0) {
-		if (status == 13) { /*  pmlmeinfo->auth_algo == dot11AuthAlgrthm_Auto) */
+		if (status == 13) { /*  pmlmeinfo->auth_algo == dot11_auth_algrthm_auto) */
 			if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared)
 				pmlmeinfo->auth_algo = dot11_auth_algrthm_open;
 			else
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index baf52159cb7f..04e849871975 100644
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
index 0ccb38233bd6..825a4a4532ce 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -173,7 +173,7 @@ do {\
 	switch (psecuritypriv->dot11_auth_algrthm) {\
 	case dot11_auth_algrthm_open:\
 	case dot11AuthAlgrthm_Shared:\
-	case dot11AuthAlgrthm_Auto:\
+	case dot11_auth_algrthm_auto:\
 		encry_algo = (u8)psecuritypriv->dot11_privacy_algrthm;\
 		break;\
 	case dot11_auth_algrthm_8021x:\
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 73156ed5daef..980fe8ff26c8 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -539,7 +539,7 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 		if (psecuritypriv->bWepDefaultKeyIdxSet == 0) {
 			/* wep default key has not been set, so use this key index as default key. */
 
-			psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_Auto;
+			psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_auto;
 			psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
 			psecuritypriv->dot11_privacy_algrthm = _WEP40_;
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

