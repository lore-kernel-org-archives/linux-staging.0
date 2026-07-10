Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4481F410D32
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 10:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783680447; cv=none; b=ABh9/zupv4fOD0Q7IOqV0Bmr1O7BEL8hApBoq/IFS5svtUOMFBmvGPXCsxMJp6P9/WAQHFCBGcZm68QABgcHF3Nkyft/nsD0E/so0kxfg8ysacdIFTSXmxSckne6GdubBWSeY3bg5UjJILK1eD7Qdo/6RnP81Cq6dIaSOV/IEac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783680447; c=relaxed/simple;
	bh=/jNWIjTCM4Ht+Cq3DJXq9qAAg5eer1GZ2r8D9AAbxk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KzotNrH27ZR8GevzdLBgZk0EggD6+w4Jh/GtogI8gbkBvhc/KZ9fYtJrStfz3eKRfyvb/ZyrnOj85uiBUPLzZtQlD29fVVnu71/0lvAire3E8+EJpIDXH0TA1zSZHzjzDary7NW5jfG+bLf0Cg2fAThx/Z7q04ZZrEWoa3BoNgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5Vm+LAo; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5Vm+LAo"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47df6a5202bso453047f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 03:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783680442; x=1784285242; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FJWvU8OK/yo3ywSu6mgK3LQQeKvie3MXh60m4ig8GHk=;
        b=A5Vm+LAolFh8fyZMEXZOvmbYlVl16y5j6eKvUkg5qIKKUmAZ1to6zvqydYh5Uy8HfZ
         QulnVXtOgjqq8vLmKPpP91OvgxEEbqiteLsHm9RViaRhZGnQ//nSHl7PQEJ45z22YW/+
         w6IyIfXAEUa/wywjuKc0mNUQJNx0AYRy3vOzlVNU/bGTaJjJ1QhUiKfujUlCur+inVRT
         RGuCItp0jo36rvOQUMOnI7qU0jHb5YtClYhX4so6MCOoX24CSvMzaEPCRjDlBI29DFvs
         r9eXiC9DKG6OXTT4jza9TUSR87U5swDJKc+e6SikfQebh1r8C9/Yss1ua4e4vI5s9n2e
         ODMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783680442; x=1784285242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FJWvU8OK/yo3ywSu6mgK3LQQeKvie3MXh60m4ig8GHk=;
        b=oVL8wMHJiXpsw5Z/D7vdd7GlUqiWyHFIctnHY3ERbsdZNYsVO2PYXXWhe45xnUIrD8
         6DlmT+y85gcF3SPwTegU81Ah4kvBfelpGDsWy5ONUb5W+76UbZz+dgdsSqBt5Nt5pjpm
         oGWTH5aSNIvUjC/ky2Ldjfmi1CIZs8iTjFmpBxlQCdBbExp5CsPSeQhNOI33eH1I1Vg2
         q1cI2D9LPuiJDJm1JxXduZjmrdg5QbNpTyH06W83DnegRxBbS1DjcTxy9yPXLY2ouPPu
         ROJFwAJHSmzn8l11W1+lQwhABNa557QRQo38Kp5iUEwokr7MuPMdAdUwzcpiRPUO8o1s
         rAiw==
X-Forwarded-Encrypted: i=1; AHgh+Rq23aK1I+l/0JkDq29Dq/XByUpWURXReWSPoU6nO+TUmQM+cXuWSE8rjdZG3YkzJogx7I6CGDtqoBBEHqC4@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9mAYyYyrPz8bFVJGjw6MsW5+2Vmb5k4TlFgW/sh2K+AR+h30F
	ro6CfpsZcSIroEy6Xt9ZUSHI/ur8fkjjwegI1PBsSHBZEvtpJwRf5/0RksM4kzq7
X-Gm-Gg: AfdE7cluD+PLSGZUZSH1R3alugufnBybEA8p+nGiPjz6D2XW3hpBU4MNMYMjTiVzgmo
	0bpdyEUdWqc1a6RfJ++ro/lmmUOeE3GgcP+BDHoyCiJNMPCjUJvSAdxRuCo10nDTLQ094bAPld+
	Kx0U8L09zFvbn1pwV4/q/4EKYDqZ3VkNF+83EoWjgm+v2D2QYWD/LmLUbrhPQ7WIRbTkOnji1ff
	JU2ik7DYQ6FFxnbb+sPlRjt526UANYbGwYu+1fGte1hCtf6rscCs7j6wd8EzgmLtpA6zFfCVHm/
	4aLUOg+sTRBR9SRb/WXj7eQkqcXDjUbJCPCdvppK/VIRz3tiOigh/0mWpRhPgEAbR/jPMLD7lv/
	dIiHi3efZRb1aduKUIDN0oDlq+fsvL37bvVK3m8jEuuWP7DHFxVV2z6hyCmdxEPSaXxy+NrhLCx
	Q4jlGI8op4yuPdJWLqX0IiM3QtoSYkRSeWFEsXlnpwQuTfhDAXH+wWfuDFQLnspFHNINlC+0IWC
	6NT8Op/gJoBxiI9
X-Received: by 2002:a05:6000:1a8d:b0:473:1089:154f with SMTP id ffacd0b85a97d-47df0722b7bmr12709464f8f.0.1783680441843;
        Fri, 10 Jul 2026 03:47:21 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm66551861f8f.17.2026.07.10.03.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:47:21 -0700 (PDT)
From: fliegbert2@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v3 4/5] staging: rtl8723bs: Rename camelcase enum value dot11AuthAlgrthm_Shared
Date: Fri, 10 Jul 2026 10:45:28 +0000
Message-ID: <20260710104529.5366-5-fliegbert2@gmail.com>
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
index f20697fb9e93..2ebfd7a0bb69 100644
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

