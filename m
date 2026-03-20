Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F092B37FF48
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 12:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774009377; cv=none; b=OSn9nZM9Fd9rFJBkyfgnlp41Ce3GKoENm6nyxNIK0RmsAeDnMDQ0aFjDLpNbXGwL6CR61uRiH0h8Tvx6EpVsDKYFn4DhG8yOaeWVAcmdIhsUzd3wvbfE3VWISnVUFUt15Tlxr0XxZBf1qRLK7ZTj4Fmag/F2AIJ//Blxrrz8BeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774009377; c=relaxed/simple;
	bh=7EB3PZFxFOOVjFJcLB73Utpw4FfrX+75x5bNmbgOtRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FlOgtpM1a5UE6ZDNTxsZic0pZDOgCimdGnebPdsEnf9EAbwhENSJcpbXzzEztbJ5szno1VkzzHXYnftaG0W38wZeEVikJ7yECCZnasPUNYnDYkIsChi1ZEB0tf9ffstIyFtxQ4BcDE4anWQHCy4dGHziWZQ+Exp6bgH2BLTeJG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhf0/w+i; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhf0/w+i"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79a75818937so4700777b3.2
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 05:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774009375; x=1774614175; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRk6NtXR4+eSwt+9G0oczGM1jp8Qzua1m8bN82VET/8=;
        b=bhf0/w+iBPRUFxEqhaT06xYsXDwp3gaA3lmJZgVBIrdqijzlUzX9RnB63w0xXfL2ea
         2lkFfDvzgtonhOzu/Aeae7tF8mmWY+ioodcj06yLtCo+SQIJkBmbce/CS7HqMf20tXb4
         UZAvXSELvSJ1H+D4RwLQJBTNJwcDb6H0OTfDuKOwzFdXTcq++VrbTSeeQp3/vYO9/wwp
         ZOiduuHhKmKsuLqwAQ2j1alsr5dbVmVM2FB3eRd8QgtwCB7AlLqHUj29c57go47PEke+
         0olljrQtUEJdnAm6IqRdcouKmDmbkbd0lqyxBdM7XNLNo/QG7H1pkkyBZVHA4E0CFerQ
         IfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774009375; x=1774614175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XRk6NtXR4+eSwt+9G0oczGM1jp8Qzua1m8bN82VET/8=;
        b=XGO3c+VLmN2yjC6hBv691UXmASEwELoFoEPXsS9YVQHuO08vVvIvwqYph9i+Yfrk/W
         CJq0HlO1E9NXgWL9nEUMCfGdJqgsWNpJhRw1J5JNFCdo0SyuuHDVxYBClLU3pOe0xt6J
         VF22ICRHNEv+fNOJ2tL8e58qdEU+z8VTBeqY3/BY2Gi/X9JaOsJCSkmJDf63rgDxmOiq
         cSWAut/WXCrTuUGxqKSF2k0r6PaLdgWlYA66fySjF+Kk3w3lETBKTY8FHkveq7OkVxh2
         OnHfOHTi3GyQolIPvyxn/tH2hrDiSVsFJt/ip30bciOFLTVs784fXgkGzyYdMP/qfJB6
         c1Og==
X-Gm-Message-State: AOJu0Yz9UJycKQEmvPpYMsjAGx2cmDsjJxsikjh2oTsS2l9F90FXljjZ
	DLOJkpnTUbK5d1SgtH1kiJ14WRCqOlFp3TkeiV81tVrLSclK3wX9dIudOGqhJw==
X-Gm-Gg: ATEYQzxDQHfq5+GVvjtk91KOUG70K8ammOXJIHKbCjM5h3h6Zax2Igj/fsV1o1uCf8r
	csCyHYKv/NHuaAZaMnz5VkL7KtfZwvKqbWa6mfWqii0SuXeaZ8JCE4S+RyhblPzwzlKekWVKXrK
	0yet+QsUGYFwrBH+BnKE3PDEXNQVgI9Ec0ufY8G3/H7KP6YBWzHEzCf6XfOM5dY0VPuOq7qhTOB
	S++pnaAofSIxNUkuA0AUMBX4YmiCVY2/wl0rhJD7VSXwloqumOFSnExrjaksi+r3rn3BLl6Arb1
	DEVtbqdKKDCwgJlngvxuX9/lR29jiM3HzsMMIE2Oc47x69IluFcjrE0jrsugwfCBqjCU8kRrSMp
	LwqdCtB8kFEYJ5UXAXBa/Knb35smt1gde7YkSegQO6C994kGWjbFv3x1sdCuBWFvoOktsOanvbr
	lOEGDbRFL5HWYFK/o5nPWSeA==
X-Received: by 2002:a05:690c:e3c1:b0:796:6df5:485a with SMTP id 00721157ae682-79a90b9ba99mr28124887b3.39.1774009374909;
        Fri, 20 Mar 2026 05:22:54 -0700 (PDT)
Received: from archlinux ([93.186.98.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a9057f820sm14075977b3.40.2026.03.20.05.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 05:22:54 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 3/5] staging: rtl8723bs: remove custom is_zero_mac_addr() function
Date: Fri, 20 Mar 2026 15:15:01 +0300
Message-ID: <20260320122119.19563-4-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320122119.19563-1-nikolayof23@gmail.com>
References: <20260320122119.19563-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the custom function is_zero_mac_addr() and replace all calls to it
with the default kernel function is_zero_ether_addr() to avoid
duplicating existing code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c      | 2 +-
 drivers/staging/rtl8723bs/include/ieee80211.h  | 6 ------
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index eb4a32a998ae..c20a143ace4b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -11,7 +11,7 @@ u8 rtw_validate_bssid(u8 *bssid)
 {
 	u8 ret = true;
 
-	if (is_zero_mac_addr(bssid) ||
+	if (is_zero_ether_addr(bssid) ||
 	    is_broadcast_mac_addr(bssid) ||
 	    is_multicast_mac_addr(bssid))
 		ret = false;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 5516593bc8ab..43c2c3afa81e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1694,7 +1694,7 @@ static int rtw_check_roaming_candidate(struct mlme_priv *mlme
 		goto exit;
 
 	/* got specific addr to roam */
-	if (!is_zero_mac_addr(mlme->roam_tgt_addr)) {
+	if (!is_zero_ether_addr(mlme->roam_tgt_addr)) {
 		if (!memcmp(mlme->roam_tgt_addr, competitor->network.mac_address, ETH_ALEN))
 			goto update;
 		else
diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 14c806a22b38..37b9b363c073 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -518,12 +518,6 @@ static inline int is_broadcast_mac_addr(const u8 *addr)
 		(addr[3] == 0xff) && (addr[4] == 0xff) && (addr[5] == 0xff));
 }
 
-static inline int is_zero_mac_addr(const u8 *addr)
-{
-	return ((addr[0] == 0x00) && (addr[1] == 0x00) && (addr[2] == 0x00) &&   \
-		(addr[3] == 0x00) && (addr[4] == 0x00) && (addr[5] == 0x00));
-}
-
 #define CFG_IEEE80211_RESERVE_FCS (1<<0)
 #define CFG_IEEE80211_COMPUTE_FCS (1<<1)
 
-- 
2.53.0

