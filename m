Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CC93F44E4
	for <linux-staging@lists.linux.dev>; Mon,  1 Jun 2026 20:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780346567; cv=none; b=mrZUIgQ1YRgAMdreGLAXfRLojqZ7krKETfznoT0jc/8OAo2e3T4pLGe8tnDD9cgUIPYu/9e3FTlESvi/SLqjVVCc6tka6wMuSvFeaeaIWSpLgvI66PHCXwsbXY+hTMw6itP1yawQDzFc7HNSY2mqfuzzm6Z2qc+EIxmPZQM2aDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780346567; c=relaxed/simple;
	bh=U3JysPbIC14+YpzkqayR9eqPCZfQFQV6Km/60sWOFyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lzC6Pc61VjsH06lM+S76hpudnfJ0fhxGTvNQ9lJ0U4xnueodS5T7vGXqxOdIJ99NrjbZalHUg1TYmj1wr4VFTGrLSVCV8QnAvbSFttpAVrlVBRbykm2XiPwZmK0/JrZcbJ4LWpJX0g0gbQ6yDEyf3G2ZymBnRvRkak1ag6pQx2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLss+C46; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLss+C46"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490a7a9f81bso14929725e9.1
        for <linux-staging@lists.linux.dev>; Mon, 01 Jun 2026 13:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780346564; x=1780951364; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1tiuR5RmT6OyRnS1iYz+XIpaI1gyRLvRNXteszQc4Bs=;
        b=HLss+C46APjRRd9LUOAcevJyeUwv0sZmKRRRPoEK6A55oXSxlh9BNr8Te5M9txlZqA
         WDmw7tmsMZ5fh6vgQYmo6VObrZotz4jyUfyQMM3xJ3Hn5hPcvxnpfUJJx6iyjsSBDSGQ
         L+uU6Z5+QHKqKMMhe9v51EIiBmYjHMQvfdmxdMcj2JHzCS9au6cFCGOSSbqp6e99XPb4
         svPjzFwmKdGAj5a+Ma1YPEDnb+40z/doF7wmazuT0Tr8deydxAajikQq9EJ2PB33ilFL
         2FzFxTm7NoPR2SHMnRDvEDiyC0BX2bTrd17TrKSDZ1K4EvtYp4qKos5ke09g9/rNKojT
         k3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780346564; x=1780951364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1tiuR5RmT6OyRnS1iYz+XIpaI1gyRLvRNXteszQc4Bs=;
        b=OqDt4zx5RxHlmL68FV7ZVlSLFE75PsnO9a1pLrge+FUvZRWrdu4AyQT+3eWF5S2X87
         ej/l76CYSsz2uOjvIpZyIxf9HFaLWtSkvrF799VHQV3L+9zuITS/WGGyiADLb2PKtgN+
         kD32AtTikWHmypH7SQWJD1B7eQdXE97s+OhEYi7v1g5QkVIUWKec1rPBej+BxfO24utE
         QqzuOGBrTBBavYM1A+Hl0gNJxpR+ffkwkBy1VLDvBgg1axv3Nd+D7SDoo7W5eQ1x0Rm6
         aAPi0pFn6bvKkrS0iNeXsayqTHYiOC1GcFz+R/LetTc3ZBDCKXAj4ggGvcR1gk72Ug8y
         Se4g==
X-Gm-Message-State: AOJu0YxQGc1DFnLh6aDQ1bSfRQnl9o5hwJQ3Hvpai7dbNTDokskoe17A
	9ugNDUX9QbK06j+R/iOwBq/ZZL6oj6cGiWTNkxjjPWeEusiaJldXOqvm
X-Gm-Gg: Acq92OG7k2Hb3EN9pLvMeTnclfdWzhYGaC9vpThO4j0s3f6YVpLZ86UwGAxNjYzGLzM
	kP9qbirsGM/7yVvwgkWotp7XJnuUVPGt/dIOfo1PB31EJoShlivd+n7+YlPn7KjuLbilz5beveC
	bgy4NHkB9nORikUtgCX+OYhCzmtp7GXrmeKpv36Z7LzZ/P3ysz1floYUYg9uN2d4M8oFJDBpsgs
	cIVhcw7BXzdO8IS07H/S9T+l/v1m0ID34WoQqWii/u3hxM4gosCD14MNu56wQO42SIzjRoeOHs/
	LhtybIS2K6B4EU6bL0sqeH+Filhgg2PIw/sI/8elubVripHRh7y78qmd19QkCBG1gaHYcD/aNPY
	YOF3yZTZHgFQ2lUX5rKbtbCqjPrrwHH7eTqeb2Wyswgo0vPaCR1yU9qYj0IZKIdOmCMXhcl9nPF
	7IU8vd1pwWi7hD4ksJygzcHtGjhJ2GuFb7dsI9x09YDPY1CFxVRAjwIiypXpq+zFvLtzoLrQMOi
	0TgmStzU6/EXwtB4qO6XUp/6T8=
X-Received: by 2002:a05:600c:46cd:b0:490:af63:2cb1 with SMTP id 5b1f17b1804b1-490b0e66c58mr15472995e9.7.1780346564103;
        Mon, 01 Jun 2026 13:42:44 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-002-204-131-161.002.204.pools.vodafone-ip.de. [2.204.131.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e19a06sm16988405e9.5.2026.06.01.13.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 13:42:43 -0700 (PDT)
From: fliegbert2@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH 5/6] staging: rtl8723bs: Rename camelcase variable dot11AuthAlgrthm_Shared
Date: Mon,  1 Jun 2026 20:39:57 +0000
Message-ID: <537369224ad6d8dff2d045561d0d821469dd125c.1780343502.git.fliegbert2@gmail.com>
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

Rename variable dot11AuthAlgrthm_Shared to dot11_auth_algrthm_shared
to resolve checkpatch.pl CamelCase finding.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     | 10 +++++-----
 drivers/staging/rtl8723bs/core/rtw_xmit.c         |  2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h      |  2 +-
 drivers/staging/rtl8723bs/include/rtw_security.h  |  2 +-
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 52f6d59cd44d..3ace1535895e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -856,10 +856,10 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 
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
 
@@ -868,7 +868,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 	}
 
 	if (seq == 2) {
-		if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared) {
+		if (pmlmeinfo->auth_algo == dot11_auth_algrthm_shared) {
 			 /*  legendary shared system */
 			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&len,
 				pkt_len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_);
@@ -886,7 +886,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 		/* open system */
 		go2asoc = 1;
 	} else if (seq == 4) {
-		if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared)
+		if (pmlmeinfo->auth_algo == dot11_auth_algrthm_shared)
 			go2asoc = 1;
 		else
 			goto authclnt_fail;
@@ -2574,7 +2574,7 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 		memcpy(pwlanhdr->addr3, get_my_bssid(&pmlmeinfo->network), ETH_ALEN);
 
 		/*  setting auth algo number */
-		val16 = (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared) ? 1 : 0;/*  0:OPEN System, 1:Shared key */
+		val16 = (pmlmeinfo->auth_algo == dot11_auth_algrthm_shared) ? 1 : 0;/*  0:OPEN System, 1:Shared key */
 		if (val16)
 			use_shared_key = 1;
 		le_tmp = cpu_to_le16(val16);
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 9caa5da75a5e..54c795cfad7b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -528,7 +528,7 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
 
 		switch (psecuritypriv->dot11AuthAlgrthm) {
 		case dot11_auth_algrthm_open:
-		case dot11AuthAlgrthm_Shared:
+		case dot11_auth_algrthm_shared:
 		case dot11_auth_algrthm_auto:
 			pattrib->key_idx = (u8)psecuritypriv->dot11PrivacyKeyIndex;
 			break;
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 85c18df913fd..3d2639996371 100644
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
index b72b1643ce5e..46c1bdfc63c2 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -172,7 +172,7 @@ struct security_priv {
 do {\
 	switch (psecuritypriv->dot11AuthAlgrthm) {\
 	case dot11_auth_algrthm_open:\
-	case dot11AuthAlgrthm_Shared:\
+	case dot11_auth_algrthm_shared:\
 	case dot11_auth_algrthm_auto:\
 		encry_algo = (u8)psecuritypriv->dot11PrivacyAlgrthm;\
 		break;\
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index f910c8817e2c..41fc6229b323 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1339,7 +1339,7 @@ static int rtw_cfg80211_set_auth_type(struct security_priv *psecuritypriv,
 		break;
 	case NL80211_AUTHTYPE_SHARED_KEY:
 
-		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Shared;
+		psecuritypriv->dot11AuthAlgrthm = dot11_auth_algrthm_shared;
 
 		psecuritypriv->ndisencryptstatus = Ndis802_11Encryption1Enabled;
 
@@ -1698,7 +1698,7 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 	}
 
 	/* For WEP Shared auth */
-	if ((psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_Shared ||
+	if ((psecuritypriv->dot11AuthAlgrthm == dot11_auth_algrthm_shared ||
 	     psecuritypriv->dot11AuthAlgrthm == dot11_auth_algrthm_auto) && sme->key) {
 		u32 wep_key_idx, wep_key_len, wep_total_len;
 		struct ndis_802_11_wep	 *pwep = NULL;
-- 
2.54.0

