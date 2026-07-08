Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D1443C7BC
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 12:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513208; cv=none; b=Ccca3/WkniRcZh7CzmAfwdgRy/T1EdlGuSErrtfa90SCVst2opsjASr+JEYrPrmWvIt5y5uXJD7EFPy+r2sbQJSbigX51GkuHAM3vpavEc3BEP7J/QJNyTvAp8yB4zJ4eU5nmUd3ExYtgbdpnXStAsl6lnhkNHChj1Jv0gtSQWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513208; c=relaxed/simple;
	bh=Y9xZuTJSu9Az/zl3Wly3qQ/NTpIoAj6EOTXHrQP8VmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u4+ad8kRisZ2nvjuq1zBwmyjjieEi6AT8Kbxjp8gnNEOGAaQGv5UiYtgraP+lP1lQuLJJk2SPvHLIHTlL8sMmD+1vYs/BMm6I8qOm/bkvzXl9ec2Q0RLtPnBwfsTWrkhhxeSpT0GeuB1JdxJmW3YHW80ErhrPvmXpJy9km07TVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sCAvr/dL; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sCAvr/dL"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so3977765e9.1
        for <linux-staging@lists.linux.dev>; Wed, 08 Jul 2026 05:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783513205; x=1784118005; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TOoHilKN5qDYDverrJuk4srt1f8cmFRAs7mit9DPHPo=;
        b=sCAvr/dLxJ/A0EzHkYGDqc1P5Y/mjBaafwg1QhTbRdxumjtiU8sv0Qt0TKdoPd+RM/
         NMuJjVsK9T85bQQS/MRQrkHkX67vkZB8ogXxNDiTk0Z+1WWjWmsPYoOPfUxmnuDU3ahd
         69Qw9cMYK3UnkYpRP9m7mSuZJELQTQTKr0BR3X1C18xVeXAmpdbFRp7+wO3ogWI+wFc6
         f1R6Hmlei5JnsY2BLaMyqxoK5EtkGxGQRbkk8w84ljJ6JO4hpUJLuuLCMnMBhmULarn0
         1QT+IVnKzwQ5G/LZwBP5HhYEmqvyrhaii0DklkEG823Kbf8Mt1l+k5S0cXhO2Uuck2nb
         4fmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513205; x=1784118005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TOoHilKN5qDYDverrJuk4srt1f8cmFRAs7mit9DPHPo=;
        b=bAHOcbEEWZkXnm+5akzM6CmRQL6O0mrE5754Txf8AvWieW7mFfwEdDhpioe4Jk0coN
         MC7HePAHynQmwBhv0YVOMDH8k31HolPHJ7Jr/Uv4gQ5loO9LllyomBgM6bauVzARkvfx
         a8aaPmssaA4m72brGLP0Q77xv39I8YQRi21EbUIfEnrXGlAZW1hluGVc/t+46E8OqsL7
         CEkok53I3x6wQ34woq+X+BisPeetV9LLyRfGd5CP5r1JFvFcn/FjEYUp2uoCiH7LHRV5
         C4owGDyUSVIovUM5N/rtoL+B29weVOpaWNcFOO/N6nEK1aPdjtiGmIgdlHXl4H5oRLao
         fLzQ==
X-Forwarded-Encrypted: i=1; AHgh+RqH5PIO0zNEfuwW90mVzmdNyc75N2Fn81HWv6YCIWNFv4wfraA1jr3EI1YH4pqdlalGccvlRQEtHswhsArH@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6dLSzJBHvrwQaRNu4gHTyWvJpU2IWYTHqmlM+fvnA94JSLvZV
	g277uR5Yprr/aswg6q56lzkAeHT3K5u8R5UtfcPKcEol6+Kq3Xx3Rg7a
X-Gm-Gg: AfdE7cnkDxnRerAdGQbYFF9g5WYIetlAG5iwrl9OQH+QyS+k2Xj6BhvZmf/Yyz4jV5M
	ZtXMoJ0ue2omMXUjoImsp1q6OiL5QoOVoKOlqaX+DZZIpmqIFcnbsbYhFMKyC3rXB5vAGaDxHaN
	fnYpIRDsXS0IvdN9Al/ihDDCrGZbxUVzHilbqQVhbsupUofdrh7hTeAmI+0oLdQFImUL/2sta5v
	7cfASzrkRwHiYiCnt+YHEaPQAMOwKPUN+wgK/WW7xexLoAa0UJtzbJvNFFDgq9C/HCKat2YRiMo
	TsStyJzwXrhhMUtitwD3jnRHtkttrGgLiWjgH6AijdQsOO4Hw5mAxepTwRGV9iozXxyMY9sapXS
	q7AQhwLb6tc1HRa9Efgi5oYT/pSvR8bJFt64rr2s4Uv3QXIbUFF+SXuIWZO56VXEdeml9Yg+Md/
	borvEy3TH3s8R8alcudit7ngU50sr3t7NXGU/KHEEuqf4UDlX3hmOyBTagXueEFjp8rcY6omv0c
	sxbYA==
X-Received: by 2002:a05:600c:4445:b0:493:bee0:4360 with SMTP id 5b1f17b1804b1-493e63a50c1mr23446145e9.17.1783513205278;
        Wed, 08 Jul 2026 05:20:05 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f50418sm122571205e9.11.2026.07.08.05.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:20:04 -0700 (PDT)
From: fliegbert2@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v2 5/6] staging: rtl8723bs: Rename camelcase enum value dot11AuthAlgrthm_Shared
Date: Wed,  8 Jul 2026 12:16:02 +0000
Message-ID: <20260708121603.2393-6-fliegbert2@gmail.com>
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

Rename enum value dot11AuthAlgrthm_Shared to dot11_auth_algrthm_shared
to fix checkpatch.pl CamelCase finding.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     | 10 +++++-----
 drivers/staging/rtl8723bs/core/rtw_xmit.c         |  2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h      |  2 +-
 drivers/staging/rtl8723bs/include/rtw_security.h  |  2 +-
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index d721b75ade7a..e5d645fa01f1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -859,10 +859,10 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 
 	if (status != 0) {
 		if (status == 13) { /*  pmlmeinfo->auth_algo == dot11_auth_algrthm_auto) */
-			if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared)
+			if (pmlmeinfo->auth_algo == dot11_auth_algrthm_shared)
 				pmlmeinfo->auth_algo = dot11_auth_algrthm_open;
 			else
-				pmlmeinfo->auth_algo = dot11AuthAlgrthm_Shared;
+				pmlmeinfo->auth_algo = dot11_auth_algrthm_shared;
 			/* pmlmeinfo->reauth_count = 0; */
 		}
 
@@ -871,7 +871,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 	}
 
 	if (seq == 2) {
-		if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared) {
+		if (pmlmeinfo->auth_algo == dot11_auth_algrthm_shared) {
 			 /*  legendary shared system */
 			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&len,
 				pkt_len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_);
@@ -889,7 +889,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 		/* open system */
 		go2asoc = 1;
 	} else if (seq == 4) {
-		if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared)
+		if (pmlmeinfo->auth_algo == dot11_auth_algrthm_shared)
 			go2asoc = 1;
 		else
 			goto authclnt_fail;
@@ -2577,7 +2577,7 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 		memcpy(pwlanhdr->addr3, get_my_bssid(&pmlmeinfo->network), ETH_ALEN);
 
 		/*  setting auth algo number */
-		val16 = (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared) ? 1 : 0;/*  0:OPEN System, 1:Shared key */
+		val16 = (pmlmeinfo->auth_algo == dot11_auth_algrthm_shared) ? 1 : 0;/*  0:OPEN System, 1:Shared key */
 		if (val16)
 			use_shared_key = 1;
 		le_tmp = cpu_to_le16(val16);
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 7ba71b5f142d..7dabb722b534 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -525,7 +525,7 @@ static int update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 
 		switch (psecuritypriv->dot11_auth_algrthm) {
 		case dot11_auth_algrthm_open:
-		case dot11AuthAlgrthm_Shared:
+		case dot11_auth_algrthm_shared:
 		case dot11_auth_algrthm_auto:
 			pattrib->key_idx = (u8)psecuritypriv->dot11PrivacyKeyIndex;
 			break;
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 88965de0a02e..f2b020988ca1 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -45,7 +45,7 @@
 
 enum {
 	dot11_auth_algrthm_open = 0,
-	dot11AuthAlgrthm_Shared,
+	dot11_auth_algrthm_shared,
 	dot11_auth_algrthm_8021x,
 	dot11_auth_algrthm_auto,
 	dot11AuthAlgrthm_WAPI,
diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index f164146ebed5..ae4149b6bbb3 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -172,7 +172,7 @@ struct security_priv {
 do {\
 	switch (psecuritypriv->dot11_auth_algrthm) {\
 	case dot11_auth_algrthm_open:\
-	case dot11AuthAlgrthm_Shared:\
+	case dot11_auth_algrthm_shared:\
 	case dot11_auth_algrthm_auto:\
 		encry_algo = (u8)psecuritypriv->dot11PrivacyAlgrthm;\
 		break;\
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 84cff63276f9..c1f0f94b813b 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1323,7 +1323,7 @@ static int rtw_cfg80211_set_auth_type(struct security_priv *psecuritypriv,
 		break;
 	case NL80211_AUTHTYPE_SHARED_KEY:
 
-		psecuritypriv->dot11_auth_algrthm = dot11AuthAlgrthm_Shared;
+		psecuritypriv->dot11_auth_algrthm = dot11_auth_algrthm_shared;
 
 		psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
 
@@ -1682,7 +1682,7 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 	}
 
 	/* For WEP Shared auth */
-	if ((psecuritypriv->dot11_auth_algrthm == dot11AuthAlgrthm_Shared ||
+	if ((psecuritypriv->dot11_auth_algrthm == dot11_auth_algrthm_shared ||
 	     psecuritypriv->dot11_auth_algrthm == dot11_auth_algrthm_auto) && sme->key) {
 		u32 wep_key_idx, wep_key_len, wep_total_len;
 		struct ndis_802_11_wep	 *pwep = NULL;
-- 
2.54.0

