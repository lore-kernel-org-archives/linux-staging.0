Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E355825771
	for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 20:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782419399; cv=none; b=WGZrw35yQh0vbsXYyr7h2R+VQU8Lb1nKX6H5J8WWB/4KW+2hxU05iPjGDFdq4oB37RZ4eFAJh9qZOtMUn6hQ5bDl1sPddPumnVDoLDGV3eXOM1ZUDlLIXjEaje4VagpGVehv0uJxT7JmLb4XWlroMXiCnlKEJk1NoecDNvQ9BbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782419399; c=relaxed/simple;
	bh=5+nKdvkG+WmsXwu5G3vmgjHovCBbUwkkl1WPmTxRkEE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Pv6NmpS2BfkGPCdXpBWBwP3zLZx412k0WWfu4D3zReml6w7fsACZb8CNWXhIphSeRLC2QwwThAaxJdxfI4ZgiMr1EW6mmtia8B8aACp551XVm7jWFqsJiT6I7tHTh395AtQFsifOEDWTYxEZLQgGrAbJnXArjIrHEEMmu+NDElw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lzvQYMv7; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzvQYMv7"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-139d5c9a495so775166c88.0
        for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 13:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782419396; x=1783024196; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UjaiIZ+XjuswCFzZsqBDs1nnY06nMhFFVLNeQuNdOdA=;
        b=lzvQYMv7g0Sitx8yy7D9uzif6i7ozEG2QwyZRHZKFw6Y2ABOgNR0Jh4OZZuU2M0mzk
         Iscksi8BKCycU5zpOeXr/+AxORj8vjeyP5JcCbpKtOMlnOvFgL8S4/EGOUseb4oxrDsU
         bM+gIXQeIaICiAO9COHg4wVkdpHlUKjg7x4eMXKM18bgDxVuCI4csYt1d3lu33xP66k4
         nLb8/B9WQgYxxIQa66hkVP9BV4LqcfycWDGOmfAcQi7PshqG0cTWTaXlfSvgnrOdod9+
         iJQtpD2F4CgWs6c12aGYCYoOygME6RB91A72elMtWlx1WJ8//Un36E4frKpL6v4iK/LT
         Yrgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782419396; x=1783024196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjaiIZ+XjuswCFzZsqBDs1nnY06nMhFFVLNeQuNdOdA=;
        b=UTJnKNVr8UOSPKyhhOLlFD2jRjv/0IwCFufNVeuCx1PGHTNO7tS/Mg14tqjzgyp+7b
         UVp7ilmD00iU8BvEQInuKKF2xkA8Kp9D0mp7JpIwHj0yN/8Vtea4IOoWDrbSgSb1aZ1p
         iJu7UJpCZZnMw5d5x9y2axgiRtBDUtp6dsW4WZNWYaGJA1bZ9ozYTGrxPp8DsL4YDo91
         jijyn8V3O/hNNynXiMnEmFvQIy7a+CS/exz6Q0bgwFiKwAT48oFkixf+fKvhjCtUpeAf
         UTye8QHz9bxJLTpRUiEs1jrmhNVb52nLHDlolTLLBeS/57yDh0fDEjpD0SCfe8/1ezYP
         PQbA==
X-Gm-Message-State: AOJu0YzFmU17K8p8mdgQ6qtyHbnoVRYqwBZ7soyNag3Zo5RJ8cKKDFmf
	T9FMbGitMrQFx0FcUT8fpVSdTt5HcwKN4DGprIXJFsb7lNvPCAsr6JMRZGae8uT4
X-Gm-Gg: AfdE7clvG1lj62TBxkn2dZneDLOvAoB677CItzAo0SVg4qHjFYKqamffD4HpQ1eOQq2
	WJyn01uHRxhqnBRw/gCY4NAAIPghGrWKzM9z7CfONv5DoeDLWOhaYvKyiETuXhb6LvqrkiCp0ht
	CopTY7uaZErBgUWwRb5RxSYKgTFSPNkbSq4bOCOmq0tUAgUxmiKdFicn6Ce2vO2ldulxolE2y7b
	hcd3ZeL6H0OBBHcceIJbeSDTq3muI826iRc76drqrvLw9ta+GhY4U8AjQJXfel8Y2Rvn/t3yKLB
	9TBJ2YGesKZbAeahkXsLXdY805JT1KUqcHfEDe9rcutyJHayNvGBdp6xjO6q/hZBi2UV120Zysp
	8YwYdeLSIIzXJSgru79fDLzH6/PmoSYWhnPBgCdK2L9BWwq/omwi1sZUVlIutM7hj+Vio4XxdSO
	yyH6FgwIN+7Lh1dOzyRqZy/3lwZ3APmeURJ9pY58+T5jAd7tHSuv+QAoAJtjmjlMI=
X-Received: by 2002:a05:701b:2404:b0:139:beb9:fcd0 with SMTP id a92af1059eb24-139dbb4955bmr2198183c88.27.1782419395889;
        Thu, 25 Jun 2026 13:29:55 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([36.255.89.42])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f5fc82sm10528991c88.5.2026.06.25.13.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 13:29:55 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	skhan@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix OOB reads in rtw_get_wps_ie()
Date: Thu, 25 Jun 2026 20:29:11 +0000
Message-Id: <20260625202911.26782-1-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_get_wps_ie() iterates over IE data from network frames without
validating that the IE header and payload fit within the remaining
buffer before reading them. Specifically:

- in_ie[cnt + 1] is read without checking cnt + 1 < in_len
- memcmp(&in_ie[cnt + 2], ...) accesses cnt + 2 without bounds check
- in_ie[cnt + 1] is used as length without verifying payload fits

Add bounds checks at the top of the loop body to break early if fewer
than 2 bytes remain for the IE header, or if the declared payload
extends past the end of the buffer. Also require at least 4 bytes of
payload before comparing the WPS OUI.

Fixes: 554c0a3abf21 ("staging: rtl8723bs: add r8723bs driver")
Cc: stable@vger.kernel.org
Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index d0bbe1bb979c..82dc0ad27e79 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -660,7 +660,14 @@ u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_ie, uint *wps_ielen)
 	while (cnt < in_len) {
 		eid = in_ie[cnt];
 
-		if ((eid == WLAN_EID_VENDOR_SPECIFIC) && (!memcmp(&in_ie[cnt + 2], wps_oui, 4))) {
+		if (cnt + 2 > in_len)
+			break;
+
+		if (in_ie[cnt + 1] + 2 > in_len - cnt)
+			break;
+
+		if ((eid == WLAN_EID_VENDOR_SPECIFIC) && (in_ie[cnt + 1] >= 4) &&
+		    (!memcmp(&in_ie[cnt + 2], wps_oui, 4))) {
 			wpsie_ptr = &in_ie[cnt];
 
 			if (wps_ie)
-- 
2.34.1

