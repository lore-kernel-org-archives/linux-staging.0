Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C378A359A99
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 16:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783700530; cv=none; b=EVOIRdwk3CoBFuPsYwM5nsnY6xlTqNLVL/NbHW0QcRIaMcMXnQTHBl6dwgTa/oS1x8BJefuca72rY1ye5C8BcbjLau+X649zrQ9IbYT5hNeMHcCcYfFwE87rZSPqxwrMWnBVcG+sHMPMV0+PaoossMzSzZ2lMFRuMb1qQzSnF+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783700530; c=relaxed/simple;
	bh=RvJD0O4IrME8GlF4rz3eS0b50mG3gUoldsNBYY+Bc6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mTymZqqt0qpBsVILLQvMalix96uPdyPUu0NM0U01ia2g9xYL2qh3D5xHk8HrtqUXCqP/ggWhZLqGtMt05hGKVPfQGx6TqCmKV8IyB/kmpOr966eI+UKUl2M14cR1vRTHocyogt4tFxn5+FsoqmUE5voT6Us+qNbn81VWfkZNqFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qu1jGBXg; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qu1jGBXg"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so850961f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 09:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783700523; x=1784305323; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tnnuDqpf863Ubk5BT+RjnlPm+FKRZIS+XiHlleqOY14=;
        b=qu1jGBXg/ce3knAAkk/w+NM+eCOaLJFcUuKTQx+9QXGROxsCx0YRJnjFB/pCb1P4X+
         kwbtHh4xIw9vZo0v0t1Vv6YOs2E8qk4mFBBoupQauIJ8rcMCbg2Z1Dr5xjvUt532nICt
         ilWGGZGS1x8bMcZkbQbTpIuu9s7hSVYbfs48H0F4upk5f8Ju7/6zsVMr3bK32rcHRWtu
         ylCWSwSe2ECKaxJjkdmhHoCv3gnhIgxcDQ8BByflRVj02TDvy0NgDEO5NArnbMCrkxZ9
         OnlKOBw2dsWTZ7zOpRE+vrgZGpKpA2Q4eITzek1hzsU8byYVCTMX7V7o5/0ELUfGjlT1
         5s8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783700523; x=1784305323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tnnuDqpf863Ubk5BT+RjnlPm+FKRZIS+XiHlleqOY14=;
        b=gxN3r49KW/Df4zbkcnKFGqOTuDJ0pvJzHp2IMFJxWzkFdcuj7X+ogAaFbWl1+1lmwg
         dPtntEmqJV85hQRJbezzIdlWQ+TV8N7v3Hq96dfiaSj42ksoREtIexcDZYgrH7uSZYY7
         u6ursQZuEjM1ZO8LzzRbSqbYP/4vzqoGZLn9CyYGBMHvXwJSQtBVzpOs/Dn+1VyIQYKv
         RH3/zbwDmRJPO8HYxCAVyjoV4BAN5pXh5MadSgImqSPIxWbwE2SM9ySbxoctAlKtINdp
         bwRQGqwpcqxPU3FYdwxDltEQ6+Jsqpzb6bb+lUvZUguH5c5RbPkuvvYLkUoNV+Iw8f09
         vTKg==
X-Forwarded-Encrypted: i=1; AHgh+RohmbBTtYt4OYWj7didwZShCt8lmVEuUIY6CoKpfh87OBTwdbeidlDDmKfkPGm0iPNUfCvJw/osi5FqA51u@lists.linux.dev
X-Gm-Message-State: AOJu0YzXUo8QDABH4BvXle21jwxrmGhPHHrc0YiEhNGmhnvl3lJHKLeA
	MPMx/3W4NIHetLYtrbqaVkfbeCLB/j/e6hj1rD1ok3K+rLj0tSVA+WLc
X-Gm-Gg: AfdE7clwyEF7a3nRzhSS+3ZpyG5wa5MiJKtG7+jG1++np+2QSMowzlm/vdi2ilw3Stq
	R3gE/z9B/PhIxiTUSDfhN4h/0UZembC6vDfL78s0/W9eZEZXNQbp0BWwuOXur6wO77wpq5szFka
	kPFvGM08gdxtjMVjTBfwrC3qTqwSvNdq0hSLTvtORv5IOyMfJJXsmoFEZM65qCCMErV2MGBGK4H
	wnpOBWy3CBD3LjACNZqDNwjgmRXWyfLgG3kWSjWXufjNjxYJlqwbK3//4XjLwkcLMMYOm8ODHt+
	5mhLf5OcuDBOlHhC+Tfa8Ki4PmXkPy+fbfWUoce1anxramakGrxbRanyaE2+6wrq5pe5bECAsD/
	IQrpul2lp0WSVGw02oJN2Nz8mRQO9XCjuFHzHlzXM3C0PgfuKeJieYuF/EqzHri3OpvvCUrwcfx
	Y+QpYvz1fdIQUCiVDhZQskdXgs0uxj2Fw6O2yM/yl3GSVBFLFBKKXhcsDFKq1my576ALyxOQgm4
	GRw9w==
X-Received: by 2002:a05:6000:41f7:b0:472:79bc:3919 with SMTP id ffacd0b85a97d-47df079051fmr14004913f8f.39.1783700522900;
        Fri, 10 Jul 2026 09:22:02 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm69436063f8f.17.2026.07.10.09.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:22:02 -0700 (PDT)
From: fliegbert2@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v4 4/5] staging: rtl8723bs: Rename camelcase enum value dot11AuthAlgrthm_Shared
Date: Fri, 10 Jul 2026 16:20:16 +0000
Message-ID: <20260710162017.5660-5-fliegbert2@gmail.com>
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
index 83a35ff78752..9fadd345b640 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -862,10 +862,10 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 
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
 
@@ -874,7 +874,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 	}
 
 	if (seq == 2) {
-		if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared) {
+		if (pmlmeinfo->auth_algo == dot11_auth_algrthm_shared) {
 			 /*  legendary shared system */
 			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&len,
 				pkt_len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_);
@@ -892,7 +892,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 		/* open system */
 		go2asoc = 1;
 	} else if (seq == 4) {
-		if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared)
+		if (pmlmeinfo->auth_algo == dot11_auth_algrthm_shared)
 			go2asoc = 1;
 		else
 			goto authclnt_fail;
@@ -2593,7 +2593,7 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 		memcpy(pwlanhdr->addr3, get_my_bssid(&pmlmeinfo->network), ETH_ALEN);
 
 		/*  setting auth algo number */
-		val16 = (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared) ? 1 : 0;/*  0:OPEN System, 1:Shared key */
+		val16 = (pmlmeinfo->auth_algo == dot11_auth_algrthm_shared) ? 1 : 0;/*  0:OPEN System, 1:Shared key */
 		if (val16)
 			use_shared_key = 1;
 		le_tmp = cpu_to_le16(val16);
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 04e849871975..f060968eed21 100644
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
index 825a4a4532ce..e244910a75cc 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -172,7 +172,7 @@ struct security_priv {
 do {\
 	switch (psecuritypriv->dot11_auth_algrthm) {\
 	case dot11_auth_algrthm_open:\
-	case dot11AuthAlgrthm_Shared:\
+	case dot11_auth_algrthm_shared:\
 	case dot11_auth_algrthm_auto:\
 		encry_algo = (u8)psecuritypriv->dot11_privacy_algrthm;\
 		break;\
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 980fe8ff26c8..f742450cfdad 100644
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

