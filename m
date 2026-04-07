Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAC027AC57
	for <linux-staging@lists.linux.dev>; Tue,  7 Apr 2026 14:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775572669; cv=none; b=BA5qYBKXT9ff7pssMToo06AP8AbwWKY7AveRG64XUGUY2+bfXpxlGxGR0g58FyGxOkfdF/lqhF1rOK1LB4pBHv16W5khr0CX6D+81TC0FdTdvriW16ULohvTp+P4vE8GrY76UHMm26eSA2JiTLIoiD+aTAfibUJItgt1GEasy/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775572669; c=relaxed/simple;
	bh=ZJwrDpkC4tZSOhDBLZmpIE9jLAUUIvuARzKusvHogyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XQoH5U4Xmm4FDZUreK9zmmUbKrMZ1p5dZ6wChjeFx7QX+KG3eQGHHYVh+3r6J/ptt2gNKA6Esbp4vaEibItIjORzRSsFe6OZ+cEr9qbAdm9u4n3ccdpy7oVjlO3rz9JXNlWqIsK+6NndQ9r8NCIQAG8yly8l4Lv41kiqRGsdqtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pj9A90Ed; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pj9A90Ed"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79a2ee65171so72236047b3.2
        for <linux-staging@lists.linux.dev>; Tue, 07 Apr 2026 07:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775572667; x=1776177467; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUcJQyEkMQ290qUw44Io+sL/0N3gsQUbh08eB7OHGZU=;
        b=pj9A90EdqYSDot0dG8FfplhzrRYY9ZI8zOuBKnkiqqgiyKK/rz+9i4dCFc+s/6ljwC
         AghYzntJEviuxwzNZYvS6ChNpcdXQ2PY2SLJMyRRXoDxc7WcTAM2pGVjwv88wBNow8xn
         fjCyoAPZGwqunzDVyKMd0CY/dHKPLpcWwPmC0NQxI54GcmgBz0V1iND6NakZajZndDQc
         yhbxOWY6ZJj0GfOCsB6xJIdTW4seOlz4NdM2qj48fP17slZhGdOPLWE03xseDZ1X6oQX
         4Ik3yUevb9y/UDtCUb1MngXfX44GDVoQm/3kB4D8wonIkUu8Adcr1eKtOx3D7EYnyvkd
         iDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775572667; x=1776177467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WUcJQyEkMQ290qUw44Io+sL/0N3gsQUbh08eB7OHGZU=;
        b=MkucMIM1dpAXFxaM63miuuqJEvsgzUUzxzsaSIHa9AAQsSM6V1y8rLW7u4a6jzm6AB
         /80AEvR6IEGtTt7NKQikVDV3NcrMS1GX5q07uQKhBCmRjxzdcJlCQYR77C7Fzjtmq/aa
         23zfBCeWGr5eStUNxJ5Iy2skX89yaINCld8bVDHMWlXvZYzqD2oEVFJBcOKlQesTWxCk
         t7fdAFmLTdxZtIWeFGzKG0MnRSHbJQJ1eYPWymyzZBQ2/+EfiAm/f33wPXIOu2RkPduZ
         m36IMg3xDBxJZy9qvq4cGnmOfWtTckQkx7yNTSACV5p2ppV/FLExM4SAdjNYw2vMtvlx
         Hogw==
X-Gm-Message-State: AOJu0YymjS/0gl49UDyvPyq75xazU6+9qMTdBfKvsw1H68zgI4MPxUtq
	to6zSXrDpws6t5AqeG2riJSs2Q6iKistIiYLi43tHWQuUjRCzeERFdBFrCXzHw==
X-Gm-Gg: AeBDieuTwvy6DnAdliailY08BF9MdL+TmeLViOlCYPe7rpDXPKW7ZOn89tmAULHalWy
	6h35sSwbY9T06hf3KlwPMeBmm+SjIxsHSa8ZMTJpnrSuHFLF4k6MLR74iyV8ja+hTU9UV/0K+q8
	JRoLVOE9I2xN0t9B0D7YX3H1KRPgKiRmXOxTZFpSJx/datsdGw3jb++s6pe+m8EkPFLbmCcYj/t
	byxjKndvquLTm77D1DvgcgM6OJ6VskLBoRAaouO3Yk7FUi/lTcNc2IgzteO2nYJa9blgBs7jQTN
	rygNnoFhBdG8qADbgpxhTOzWti4ngMgj23HIs22aAutpBepsDhgXG4paBqft8dTudKwk9FT96qv
	bzlVB5o0yB+QRNUKtyjSMDiq+7NXfNKeAnZMuDJkAO4oNKhiseSogpeNJJU+c/C+JGbd/YjlEm2
	RWK7F7Az+os4Cc68IMjyx75LII
X-Received: by 2002:a05:690e:158d:10b0:649:6b96:8025 with SMTP id 956f58d0204a3-650486c2735mr13076098d50.9.1775572667375;
        Tue, 07 Apr 2026 07:37:47 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6503a828f3csm7868159d50.3.2026.04.07.07.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 07:37:46 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 1/6] staging: rtl8723bs: remove unnecessary rtw_bug_check() function
Date: Tue,  7 Apr 2026 17:33:26 +0300
Message-ID: <20260407143622.9767-2-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407143622.9767-1-nikolayof23@gmail.com>
References: <20260407143622.9767-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the rtw_bug_check() function as it does nothing and always
returns 'true', making any checks on its result meaningless.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c         | 10 ----------
 drivers/staging/rtl8723bs/include/osdep_service.h |  9 ---------
 2 files changed, 19 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index ddfc56f0253d..8e9387ad2810 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -351,9 +351,6 @@ int is_same_network(struct wlan_bssid_ex *src, struct wlan_bssid_ex *dst, u8 fea
 	u16 s_cap, d_cap;
 	__le16 tmps, tmpd;
 
-	if (rtw_bug_check(dst, src, &s_cap, &d_cap) == false)
-		return false;
-
 	memcpy((u8 *)&tmps, rtw_get_capability_from_ie(src->ies), 2);
 	memcpy((u8 *)&tmpd, rtw_get_capability_from_ie(dst->ies), 2);
 
@@ -457,11 +454,6 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
 {
 	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
 
-	rtw_bug_check(&pmlmepriv->cur_network.network,
-		&pmlmepriv->cur_network.network,
-		&pmlmepriv->cur_network.network,
-		&pmlmepriv->cur_network.network);
-
 	if (check_fwstate(pmlmepriv, _FW_LINKED) && (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
 		update_network(&pmlmepriv->cur_network.network, pnetwork, adapter, true);
 		rtw_update_protection(adapter, (pmlmepriv->cur_network.network.ies) + sizeof(struct ndis_802_11_fix_ie),
@@ -486,8 +478,6 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 	list_for_each(plist, phead) {
 		pnetwork = list_entry(plist, struct wlan_network, list);
 
-		rtw_bug_check(pnetwork, pnetwork, pnetwork, pnetwork);
-
 		if (is_same_network(&pnetwork->network, target, feature)) {
 			target_find = 1;
 			break;
diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index 955e8678dc26..9392af858995 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -69,15 +69,6 @@ static inline void flush_signals_thread(void)
 }
 
 #define rtw_warn_on(condition) WARN_ON(condition)
-
-static inline int rtw_bug_check(void *parg1, void *parg2, void *parg3, void *parg4)
-{
-	int ret = true;
-
-	return ret;
-
-}
-
 #define _RND(sz, r) ((((sz)+((r)-1))/(r))*(r))
 
 extern void rtw_free_netdev(struct net_device *netdev);
-- 
2.53.0

