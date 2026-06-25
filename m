Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D5A3242AB
	for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 15:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782400662; cv=none; b=eghftnpETWOn1AgOQ2tUoFt943cg/jHO2IwQlOKyfbLdh2BG/7thkpm4IcqSd86SMeJVeqRDaBGKDFF/w3VCxEdoTd47xkdEML0bO0XR6GHDbyXeoO0VX1h1470ugXgVIu4ziQhDThgV+AFFPdsNDlecC7QeOXnOLyzO6/JurFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782400662; c=relaxed/simple;
	bh=1iRIHwUsnk97XWO86W96de0R7EA3QOESCBX6qXIYMZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YIX4pg/K7alWw8+mmxnAGDSiYhMMvGBuyfpQxwHDgAfwJHjRqwHXSgJjxlRXbBR2Tfz7HlUSrqDKU2MhpA01tW86neCfFko3uWXY0lLiO7LfGrXKXOZe2/3Lv/qwXBK4MwL1HEX3Fs0eRJpyv+DNSFM8nJQ3k9geOiO2eRrBfdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DhQtkvhB; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhQtkvhB"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-662dc3879acso2310961d50.0
        for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 08:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782400660; x=1783005460; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Ek1TqCtpygntPp/6sPMz/HLCA4fUH5zyvh/pd7+KhE=;
        b=DhQtkvhBd3rhjTfR5CN9qGsomMyoMio8pGWvLtb2N76Cjr6k5+92j3+Ihtu3ahC+fr
         qq/N1LY1vRq7IF6Ax8O8KHKE7QKXVC8EJD35UiR5qBt7GuQJslObbQLRW2WSHrDv842m
         Audl4lH9PQtOcnJSnwRTP+Sy1UVEY3JXC8zEUhRYsdCTOxpl4taPKWg0cPsmVDypx/vu
         gc+3fJIGgbBaHlisHtzq9Hc6/BUDAASfJJKgZAN7I8BA4X0Bz31a8Hqwk8+3QYw6UQ4+
         s/4NZmQ1UYT79VLEmPQfH5B8im5crmlkfDw8WzDH/3GrqCJ6RkIZ/7A/gKlM1RaSYcgP
         kcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782400660; x=1783005460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Ek1TqCtpygntPp/6sPMz/HLCA4fUH5zyvh/pd7+KhE=;
        b=bH5SnY814+CAb9VyyPJwM5KCtuqEWsW6w51nYDldB4Mb+2Esx/fj88W7uUBoFmYHtE
         zqBSx52vKYWAVmKreyWkg8owQ3UIZQLx2aeItEk9QyJmhmhmSuwLNLN88Bj0jwJZWYOX
         FBF3xpj0/tU39cgIwSe1+fl3Fc5bYnKpC0U59tzWEiDgPnGdnT1A4KYtNF+JNpAo9Np6
         u6peVf/Imzf1mCzzX/+rDSd1ZXXUfPbdPVrXmlW0ntlG9G/coSFazbFIkPI4GXJhuAdv
         3YAaqO+79HXLVACw0ESn+TjEiA+hde7qkhL6BqLp5DuhxnODJd9cBIJDWCXjOZSZJPPT
         qOWg==
X-Forwarded-Encrypted: i=1; AHgh+Rp+KxQCFZ4lDOCN6t1Bj6KAXmap6VW/J43Q9x7N0YEV2Q/sCqjBrAYSCfIGBjQVzg1fHR0Mf5/GpziFYytZ@lists.linux.dev
X-Gm-Message-State: AOJu0YzAFvmy+X5fu8j17X/vB0GO4cbut6QZbj24rReZamAdsgz2fySq
	WOBjzlh2sTtBzYjYQp2vMVsm7ZvTdLYcgRFSdbSioOTwXBIVaS0AfJUG
X-Gm-Gg: AfdE7clwzctUEPhIEMMV79LCYHYgehJdJWMuEkpZLeTrv4gs1s9ba6DvO2eWMoN2XmW
	F1GLA0lss/qo2MDyiBztlE/1AG367VCjED90g8IgOhTLCfwzqusi6ByuaKiDk4iyk8ZvufGKMVK
	ktHZwU5L4zcfKWVwc6VbMW+ftXZ+EBuKR1oKJbVLEyGYyhL/K3FDG4HRnzl/Qm5qy174W0R8fbF
	bNrkM91c6muGtl7arWbru4vSOgsYtZ6Q5Iou7rfn/n8wofSVtbSKlo+OF0eKLx6466DFR2LHbLT
	khaCCk8IWWor+X8Ffsu/+9ncCawdS4UHOC8ZRuGZR36CXh8atKAuu9pQZzqhYsHh5wS6AItRqom
	XK9XaC6V4MN+AMVOZEyoGelbsccLjZBMhe0lSG30jR5F9Z14rH2Pbbr9Rw1gqoe6zne5qoph8ag
	qy4hh/JA81sSh+HOZIjjggiMj/loqAbk9IpCDznHxwiRk=
X-Received: by 2002:a05:690e:d47:b0:662:ec09:a1e3 with SMTP id 956f58d0204a3-66487fefef2mr2257565d50.47.1782400660287;
        Thu, 25 Jun 2026 08:17:40 -0700 (PDT)
Received: from fedora (c-69-141-67-19.hsd1.nj.comcast.net. [69.141.67.19])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a51a9b10esm71509831cf.15.2026.06.25.08.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 08:17:39 -0700 (PDT)
From: Aditya Tipre <tipreaditya@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ethan Tidmore <ethantidmore06@gmail.com>,
	Rohan Tripathi <trohan2000@gmail.com>,
	Nikolay Kulikov <nikolayof23@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Minu Jin <s9430939@naver.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aditya Tipre <tipreaditya@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename shadowed variable
Date: Thu, 25 Jun 2026 11:16:06 -0400
Message-ID: <20260625151606.96229-1-tipreaditya@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The inner variable ie in update_bcn_erpinfo_ie() shadows an outer local
variable of the same name. This triggers a -Wshadow warning.

Rename the inner variable to erp_ie to remove the warning
and make the code less ambiguous.

No functional change.

Signed-off-by: Aditya Tipre <tipreaditya@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 065850a9e894..a86685922913 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1307,20 +1307,21 @@ static void update_bcn_erpinfo_ie(struct adapter *padapter)
 		       &len,
 		       (pnetwork->ie_length - _BEACON_IE_OFFSET_));
 	if (p && len > 0) {
-		struct ndis_80211_var_ie *ie = (struct ndis_80211_var_ie *)p;
+		struct ndis_80211_var_ie *erp_ie = (struct ndis_80211_var_ie *)p;
 
 		if (pmlmepriv->num_sta_non_erp == 1)
-			ie->data[0] |= RTW_ERP_INFO_NON_ERP_PRESENT | RTW_ERP_INFO_USE_PROTECTION;
+			erp_ie->data[0] |= RTW_ERP_INFO_NON_ERP_PRESENT |
+					    RTW_ERP_INFO_USE_PROTECTION;
 		else
-			ie->data[0] &= ~(RTW_ERP_INFO_NON_ERP_PRESENT |
-					  RTW_ERP_INFO_USE_PROTECTION);
+			erp_ie->data[0] &= ~(RTW_ERP_INFO_NON_ERP_PRESENT |
+					      RTW_ERP_INFO_USE_PROTECTION);
 
 		if (pmlmepriv->num_sta_no_short_preamble > 0)
-			ie->data[0] |= RTW_ERP_INFO_BARKER_PREAMBLE_MODE;
+			erp_ie->data[0] |= RTW_ERP_INFO_BARKER_PREAMBLE_MODE;
 		else
-			ie->data[0] &= ~(RTW_ERP_INFO_BARKER_PREAMBLE_MODE);
+			erp_ie->data[0] &= ~(RTW_ERP_INFO_BARKER_PREAMBLE_MODE);
 
-		ERP_IE_handler(padapter, ie);
+		ERP_IE_handler(padapter, erp_ie);
 	}
 }
 
-- 
2.54.0

