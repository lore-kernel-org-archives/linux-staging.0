Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4FB2F1FC9
	for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 09:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768122056; cv=none; b=NjA4/Y7hdzvasTY93rGA2ZlLseaIhDhc1F/j+l6R2XDXQD5MJ/4PCZPmvuIDNo5Gxca39690FgZru3NkS9r09AzTeRfuAV2I/fOw94Wv2CZgR8j2SmJ3cSXG8JhdJ7diPuBITjniM8oEkZKYvzPZmjRiVOgJQ6eM+Y2bK3hllxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768122056; c=relaxed/simple;
	bh=Y4vCL0OdjuIIqRuEVYRP3TW8r2JvKvHJbNaCBR+2KLw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vEtmD/n3q8PpfYJjO/Th/R1xb9Hgo8y5qKvmNz6hXSZ6cT4ZU2Eggy75/K8q3jfbFn5fgc2NJQptfccPvbxg+iMzpXosfHR+uqC9i21AYIC2kkpdoI2y3hXHtCi8ROnQLgKvGxdVE4KDZugjQ+3nWXUvREnVORM25JVWaH2QE5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITJVEfj1; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITJVEfj1"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a09757004cso51408835ad.3
        for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 01:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768122055; x=1768726855; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qlGMuJxryxU2LDg8VqPoXHjOSQMsoQxzQvU3EG1Fpac=;
        b=ITJVEfj1Uf0KT0zXgXLK12e9SufBwMRPSBZi4G7a+drS+Y1yrLYaz6V8KbwuTyiFV9
         41k+EdeZ6jr1p9Qyx00BxMxeS50Nk5KtogbCkKOyHwyd7so80B9GtB17/u4C2Tv4UE6u
         +Kj4ongDvDeoWseYnSBK8FUZp4ge/Qkrkvdun6U+G3jdOxPfumtQO1enyrxoHyBO23S/
         isp9oYLA64+N5xJVmbDHv51WKXek1CLhJH2ic5idZLPM58eEZevg02aaLcNp+MB5suXG
         tzxaLUYimIjhMH1tkv+MDbyOLFo+NjM3j/tuet/XQYK19fWd071ayxb3SNsiGHRSyP3B
         s7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768122055; x=1768726855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlGMuJxryxU2LDg8VqPoXHjOSQMsoQxzQvU3EG1Fpac=;
        b=F4x9n+3bVoXyZ49Y8QFmw+krhwBnahoNVtXjIKBkIifMvHSdB1aH+2WssX8JV3gpOR
         r7lx+MLv3ZM4i5eqvp2SBEKmuzBKkb2nmvcSjkYa3d0kOT21zVYjl+Mf9n7OjWDQZOqH
         j8jiJotA4cUwy0b3ll/de5D1b7o8kG9V0FHob73XcAO1fx7yWwBt+x8zt7XNWrJwaci7
         JU/9SGIVyIE/sqH1WlIJmkDB/RI7zetegra9lPHBYkvFQ2BjjUVrvfl9/GlDfIeeNSQc
         dRTCqmYhlnrI/D9xNqzYMzNHiX1DS0elGfE4iuefvOLdkQPt1gFwVcaT7/sO4dBKqImv
         JCag==
X-Gm-Message-State: AOJu0YwlSsPz+3Kj4ld3K18kT987mh7lr91Z/hUC+GsRNjt885bbGDKW
	qi8cmkNFH2EtzpvAPROHpIUKdhnbZFwsBCsnERigUO3yDXRG6w0pdc5x
X-Gm-Gg: AY/fxX4b9acbjKHNb3Va+a/mW30hWBMB83cR3YNSY5PzDzGviCZXETvwlXmVTDXdcmA
	QL6x+2NB6PZ85L5cz3/zdcKe2ySCOA32HbouI1YinkhujTwYC/+18f7Cejz70jNZPdXIbOT3i7w
	kTSbWNSdLJlEcgNdrf8qRxeRfcM1G8mPnjZu3p3taezwIPvh2zLzkS4mETkHyO0AXTLYNNynhcI
	FC3uLacQgDruSZSl0aIW4yHZ80fiTe0CdxLWxgwJELd62Y+1M3ezk+jl1Ny4dXbw7c+avwEy6QP
	EVgt6HQu7Z5v/2Fo7RrRKZ99ZpV23htbDPwCfS4pLJMZ1iPA7iGQcVVPDNss7oer4UzqGr2JKtn
	6maXTmadcdan94Ej2m5jJqmxO5k28Cj9ZLitj++yLcAeA0bj9/+s5+I5YAjJYrHqjAKmrsBfboO
	F+E8JIJlusyCFJ5Lj/J2TG8spe5o3zOqjebTWz
X-Google-Smtp-Source: AGHT+IGIBfievlyhlC6c3vxyTuM6NL3sYbtm1b6AEZrGT8edzCveVLripArVSNzPdlyJeW9v3fdAhw==
X-Received: by 2002:a17:903:2385:b0:2a2:bff6:42f2 with SMTP id d9443c01a7336-2a3ee415695mr139274195ad.6.1768122054907;
        Sun, 11 Jan 2026 01:00:54 -0800 (PST)
Received: from LAPTOP-PJU7MKF4.localdomain ([157.34.27.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2c0fsm145486185ad.66.2026.01.11.01.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 01:00:54 -0800 (PST)
From: Anubhav Kokane <dev.anubhavk@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Anubhav Kokane <dev.anubhavk@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix comparison order in rtw_ieee80211.c
Date: Sun, 11 Jan 2026 09:00:34 +0000
Message-ID: <20260111090034.9323-1-dev.anubhavk@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch warning: "Comparisons should place the constant on the
right side of the test".

Move the constant _SUCCESS to the right side of the comparison
operator.

Also fix whitespace around binary operator '+' and wrap lines to fit
coding style limits.

Signed-off-by: Anubhav Kokane <dev.anubhavk@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 8fdeeda88..f45ae5d5f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -1009,7 +1009,8 @@ static int rtw_get_cipher_info(struct wlan_network *pnetwork)
 	pbuf = rtw_get_wpa_ie(&pnetwork->network.ies[12], &wpa_ielen, pnetwork->network.ie_length-12);
 
 	if (pbuf && (wpa_ielen > 0)) {
-		if (_SUCCESS == rtw_parse_wpa_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is8021x)) {
+		if (rtw_parse_wpa_ie(pbuf, wpa_ielen + 2, &group_cipher,
+				     &pairwise_cipher, &is8021x) == _SUCCESS) {
 			pnetwork->bcn_info.pairwise_cipher = pairwise_cipher;
 			pnetwork->bcn_info.group_cipher = group_cipher;
 			pnetwork->bcn_info.is_8021x = is8021x;
@@ -1019,7 +1020,8 @@ static int rtw_get_cipher_info(struct wlan_network *pnetwork)
 		pbuf = rtw_get_wpa2_ie(&pnetwork->network.ies[12], &wpa_ielen, pnetwork->network.ie_length-12);
 
 		if (pbuf && (wpa_ielen > 0)) {
-			if (_SUCCESS == rtw_parse_wpa2_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is8021x)) {
+			if (rtw_parse_wpa2_ie(pbuf, wpa_ielen + 2, &group_cipher,
+					      &pairwise_cipher, &is8021x) == _SUCCESS) {
 				pnetwork->bcn_info.pairwise_cipher = pairwise_cipher;
 				pnetwork->bcn_info.group_cipher = group_cipher;
 				pnetwork->bcn_info.is_8021x = is8021x;
-- 
2.43.0

