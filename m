Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE27D27707
	for <linux-staging@lists.linux.dev>; Mon,  3 Aug 2026 00:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785718185; cv=none; b=HABQEj7XmmuQSB8+X3L2CvZONtIAsGwsWhDIR0RYj4cgTNRnLubE6whwiKTIdhOVBz2HqdXbV54cw5d2hGZU4LvKvRJ9Kj5PgokFoIpO+0evHRQyf6p3ObIIVBzEO2/SWOYkhuhT+tI/Ng05YtXwoL80ARppjHKjantwJUliYvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785718185; c=relaxed/simple;
	bh=RmdWQ40WACLEfQuBEwRKYHDY2nwKyeglBCr2/+Semv4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aH25Si0VpMpzXd3TCm1sktFxGvXikrTY3QAG4L+25L6WGH3rAetqUBEDd7AD0jw/45L7ONuObzZb5UPZR9E9VyqlOPcQYhHUlcPmNkUMUYxaAgx5YmKmd7c5MB37nCFV2eBVds9jyEbFG97Z+qnwYwzysfwF9YcNXIFOnoEInuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D8n0E+84; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8n0E+84"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cca0c5799eso22289485ad.0
        for <linux-staging@lists.linux.dev>; Sun, 02 Aug 2026 17:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785718183; x=1786322983; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cuNxYG+m1i3A6tq4bgitFIgN68FwLjQXK2bjDLK0VxI=;
        b=D8n0E+84Vem48IfdfOAb0/sASQXj+O3heoqWRrkxgHn8QmPAVugELT56H9rZZlwO53
         PdeGlYN1f6F+d1B8+4Ey876XkSmIspvuLYR7dW6nvvAOHWE1a2ZOzjc38ykUZRJnv2dz
         yN9gPWg4QH7e3igtXAfceMefLS+64znVzvLU2/w4mONPavvNIFGDWa/325WOfVr/VoSp
         o8ZaUNFZAgUnbhkqYESMoat5Q8nker8Jjp49c9RLwHyU1uTknUrnWY/Am5BMeLUKz3pK
         RQKSIiTtaSKmVBawxMDSXER9iiysCX0hKa9GpR/WybWY0220VRjJPGHsabct2WvktkpA
         Fozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785718183; x=1786322983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cuNxYG+m1i3A6tq4bgitFIgN68FwLjQXK2bjDLK0VxI=;
        b=hlEdC7ukNF8ThAHTzRMhK3ZZgW7j6QbFxhe1y5MOwIDx2HNUk/bJup91vm+OnSkidc
         Z4/9NGlKk5l0kwfI4IdZ/y40nMvbQdOGOVtJ3U5M5T6r4JWAPT0egmir/Zg4IZ0z6kJu
         qOiDiisy6SV9rPWbqPkmZVzGTpDkDqKxxPY2QN2sfdI/IKT95rWVd5oRCFo1tc+ZVXzb
         AAP9W42hbRwzr0AGPLXUz4OfDL2S6SazOE6lSkhz8xVWMjtTyIRD7O3WUflU6qKa7gaa
         3n1dEq89z+4bysZUR8MwgA41/1oyF8LvSnHviTpjns4dNhI3tY02SD2U0QKxKXG9yu/S
         6P/A==
X-Forwarded-Encrypted: i=1; AHgh+Rq9X9Di5xa0xUZ7MRghE9a6O4atKbcUsMZWG+BZeOBSqYNiAxtaw8roPiYkxdCGxb1PvTe6lEWSzJve4qBd@lists.linux.dev
X-Gm-Message-State: AOJu0YxQXX56Nz6yffAri1l++nZonoKPYTOHqDfPxDMWTwRej0JaM4Mh
	sYW7suP47O9/joy8eehCtoihDnURnPtqST+ad4NDKvpWrIWCu0Char3j
X-Gm-Gg: AR+sD10liFEP9kVakWQZLpf/Ft/tEZQpJH7MV6aPaL0b/w5TjImCc/5r5oiVrnlNtja
	U9fLrBhakCZhxd6qcBOrXEZpoL+vBvZldUDKKRXnDsDLNOrwdwTecogEN8sYF+29Um3FaDlcC0f
	JtXJ/a1OxhHdyUmcNa4czYIrYxzPrnLiNHRdus0J+p6Pk17XMgbO6h+iUmdH4yxKcDLQkbtSuPn
	UQMjFygpNZNhtZ97Ipw1rOJqXT3e3/SnS1kid8tXvsLbk9TK8QuyUjVHNHn7eTa7ochZk5ss6xv
	N7eLjo7Rs0386TyajC0bk8GiwBHyoG4sBWUfc5+8HQXPTsuKV7AKq2dhQOa171QKJ5h04fSNleo
	SvGR8gcmLhHVAdK2+TNbLn07QyGfKKTYR5q4sEh5j3AFHVUeA34nI5SiIOGwzACzJZBSD/4Z031
	VfFAo620lBJ5EKHIGa2e69pgLbywbtjrsUe6Rotorwlpq3rnYX6oMxolkSAHfylIs4L2lZ3zEsR
	wNW3JmiDjlxYPU6OsgPlPgk/6jwDSvOWBw9yeJqgXk=
X-Received: by 2002:a17:903:185:b0:2cf:bf1e:36f2 with SMTP id d9443c01a7336-2d0522983cbmr84444925ad.25.1785718183097;
        Sun, 02 Aug 2026 17:49:43 -0700 (PDT)
Received: from lucas-inspiron153525.. (host110.181-12-179.telecom.net.ar. [181.12.179.110])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e044912sm35807345eec.15.2026.08.02.17.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 17:49:42 -0700 (PDT)
From: Lucas Jeffrey <luquijeffrey@gmail.com>
To: gregkh@linuxfoundation.org
Cc: johannes.berg@intel.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lucas Jeffrey <luquijeffrey@gmail.com>
Subject: [PATCH] staging: rtl8723bs: handle key setup failures
Date: Sun,  2 Aug 2026 21:49:19 -0300
Message-ID: <20260803004919.901586-1-luquijeffrey@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return values from key setup helpers were ignored in
rtw_cfg80211_ap_set_encryption().

Propagate failures from rtw_ap_set_wep_key(),
rtw_ap_set_group_key(), and rtw_ap_set_pairwise_key() back to
cfg80211 instead of continuing after an unsuccessful key setup.

This avoids silently reporting success when the key setup command
could not be queued or helper functions fail to allocate memory.

Signed-off-by: Lucas Jeffrey <luquijeffrey@gmail.com>
---
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 967cd1b34aed..8e5aa036d5eb 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -563,7 +563,9 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 
 		psecuritypriv->dot11DefKeylen[wep_key_idx] = wep_key_len;
 
-		rtw_ap_set_wep_key(padapter, param->u.crypt.key, wep_key_len, wep_key_idx, 1);
+		if (rtw_ap_set_wep_key(padapter, param->u.crypt.key, wep_key_len, wep_key_idx, 1) == _FAIL)
+			ret = -EIO;
+
 
 		goto exit;
 	}
@@ -604,7 +606,10 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 
 			psecuritypriv->dot11PrivacyAlgrthm = psecuritypriv->dot118021XGrpPrivacy;/*  */
 
-			rtw_ap_set_group_key(padapter, param->u.crypt.key, psecuritypriv->dot118021XGrpPrivacy, param->u.crypt.idx);
+			if (rtw_ap_set_group_key(padapter, param->u.crypt.key, psecuritypriv->dot118021XGrpPrivacy, param->u.crypt.idx) == _FAIL) {
+				ret = -EIO;
+				goto exit;
+			}
 
 			pbcmc_sta = rtw_get_bcmc_stainfo(padapter);
 			if (pbcmc_sta) {
@@ -640,7 +645,10 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 					psta->dot118021XPrivacy = _NO_PRIVACY_;
 				}
 
-				rtw_ap_set_pairwise_key(padapter, psta);
+				if (rtw_ap_set_pairwise_key(padapter, psta) == _FAIL) {
+					ret = -EIO;
+					goto exit;
+				}
 
 				psta->ieee8021x_blocked = false;
 
@@ -678,7 +686,10 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 
 				psecuritypriv->dot11PrivacyAlgrthm = psecuritypriv->dot118021XGrpPrivacy;/*  */
 
-				rtw_ap_set_group_key(padapter, param->u.crypt.key, psecuritypriv->dot118021XGrpPrivacy, param->u.crypt.idx);
+				if (rtw_ap_set_group_key(padapter, param->u.crypt.key, psecuritypriv->dot118021XGrpPrivacy, param->u.crypt.idx) == _FAIL) {
+					ret = -EIO;
+					goto exit;
+				}
 
 				pbcmc_sta = rtw_get_bcmc_stainfo(padapter);
 				if (pbcmc_sta) {
-- 
2.43.0

