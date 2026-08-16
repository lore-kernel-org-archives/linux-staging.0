Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A963A641F
	for <linux-staging@lists.linux.dev>; Sun, 16 Aug 2026 16:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786897808; cv=none; b=Ozl14F3OyzvVdINcFlYVOUEZ7C1/B4Hib5qdA1qEUCq/9obog5BQQJ2B9xJDO/bIUPkSVyozuynwzy3Ndsuz8HHfkl3BGhQFIA6XqH1mnCDLwy1Zv8GOtG6kVc6GvTtMi27VcDOGn6V8VJiPDvSn8AROR+ICu/Oq5/3z86fbyRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786897808; c=relaxed/simple;
	bh=Pb4VVeWgEfniCj19PLQx+HsSuodrc3wg5mwivzE5bWs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xpij/QwBuxTnCu4CLahKuyTH5bNkdvBHU03weio5Rl/yLEc+inC/CObWn+bvFv/3+uAHf2vBNvBrWedWsf4P8A7BnPN6NPUC+gGNEeX36EoX+OXLU4nqYKqNuFrrNQOP9aqP1CkbZxgRP+N8JBBqA80A62wVauWSg2gsQIvYmso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghE9EEj+; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghE9EEj+"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso33506665ad.1
        for <linux-staging@lists.linux.dev>; Sun, 16 Aug 2026 09:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786897805; x=1787502605; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fVV+SHkbRnQG4qiT+n0JZKykb3p8vniCPAe1/is51R4=;
        b=ghE9EEj+pTG6RdUrVmSNQWRG0kBMcFbtWLyVwb9VTCH9kkyZsPxErtpXPswmWX3X8y
         Y2A+67qsPp9K0rLbWFdvi/UcYCelFkYt/Qgd8TyzM0fvz8tqEYPq+ZKoZP7tCKrTWvdE
         Sb06aj48oJ1d1F6szHg+kf+ypnoaJzlmhdtnRluXIRNS1wVvE77etiEoz2xa2YFY4Z9y
         QpgsEVNj01jzY2WUmR6YaQJfJ/ugEUIzfCfrVPINp7942RWdAT8vmiQaHhDIMt+Luu8h
         g58IGz381JlsWMJmssjTgeym/OrmUqYfgo22tUaANbK/J/XsPDJW8QZxrp7ZvMoJWWw1
         lezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786897805; x=1787502605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVV+SHkbRnQG4qiT+n0JZKykb3p8vniCPAe1/is51R4=;
        b=iSIq+WBBV2YQVtqmI8XhNrzXQV4zH8ovEOui9uh531ImRjXXDHMoOinErqdvTto5MJ
         z+784OmvRkucJYo7RwXCDpV2SgT1vkM6rLdsidxB0p3isMJHFonAA/W/QkW1PCiwYHWh
         i4QHllHk0NGlEytzNaydyM8jei6pCUq8zYqD3KtzdRtIc2pqOhngUYXt2nS15IXrPmpU
         auYLu/JyiGjYAbOwdqqYja36YUsD0V3HY/XjXy9g5JvghEmfHnLJe9+nnIEtBKxRnqdH
         7RuAKDFKqAvjwkd81TP/3pOOihhMF8yrqaYe6kAFIWAyoWMEMACqg4uxxwTnADmF21SC
         FgLQ==
X-Gm-Message-State: AOJu0YyNn7V6u3zZdjb/1cPA5vQO2svsYJ1bUH/aV35XoMkiJT3sFb1y
	OGv5ZCCSI57Q3VbUbbNccHrY3VQYqlsItecw3E/HxfhuRdYEMiJ/a935
X-Gm-Gg: AR+sD11mHjMwMpP6BEWmHWwQcvJAZdYk9Dm226uUBxr3QTGiZ9mKt7jcElZRenMeqK/
	pNohliawYzFEWu73zRmwpbVWWF54tH6rHVRc9N0bZVLmFHhxPtQqqZjmz3fywagdaDzu4AGHGnl
	b4ZECXF5LlJhaPIigLFhQzDScM9nyJ/eAuU4LucGiFMkkr85ls0GxiiLXTa+UKDA5SLZcaF5jAO
	W/zT1lySzWW/CRSzsfWR1AvkAazlKIY1DcTDt67u+qYSPf0NTeRw6NURwA6dUPVyxqnFUh6fHPO
	IzHykHq5Ie85Kzj64MEJRA1Fi4DxtiGSAcRNq0O3yeQXUstGcjn52t9AJh41aIVLROYBYOQKbGb
	u84TrtZZUZp/1/IErIsF3fdB/lHo2a48O6oD4QTG6Z6ChbVFLLPjoUs9Y9yqiH9DtVMAEw57Mdd
	gz7wUH6q3k1YPskXpBh9MbhOVv4i+uHbBezZrG8SBTltYkP9yRNWqAnkS+RTCQd3cJuujAbPzxx
	fSzcII8/XcFk08Y5YYwC2K+bO0P+d2GKhKJgw==
X-Received: by 2002:a17:902:fda4:b0:2d3:ac92:babd with SMTP id d9443c01a7336-2d3b0d091e3mr243449505ad.21.1786897805138;
        Sun, 16 Aug 2026 09:30:05 -0700 (PDT)
Received: from DESKTOP-PKFJL56.localdomain (36-234-0-40.dynamic-ip.hinet.net. [36.234.0.40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3ae800480sm26419115ad.33.2026.08.16.09.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 09:30:03 -0700 (PDT)
From: Hank Yang <s950343@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hank Yang <s950343@gmail.com>
Subject: [PATCH] staging: rtl8723bs: shorten long lines in update_network()
Date: Mon, 17 Aug 2026 00:28:18 +0800
Message-ID: <20260816162819.68666-1-s950343@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split long lines to comply with kernel coding style, as flagged by
checkpatch.pl:

  CHECK: line length of 129 exceeds 100 columns (if condition)
  CHECK: line length of 121 exceeds 100 columns (ss_final calculation)
  CHECK: line length of 119 exceeds 100 columns (sq_final calculation)

Signed-off-by: Hank Yang <s950343@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 1196ec011..10c50aa0b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -417,7 +417,8 @@ void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
 	long rssi_final;
 
 	/* The rule below is 1/5 for sample value, 4/5 for history value */
-	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) && is_same_network(&padapter->mlmepriv.cur_network.network, src, 0)) {
+	if (check_fwstate(&padapter->mlmepriv, _FW_LINKED) &&
+	    is_same_network(&padapter->mlmepriv.cur_network.network, src, 0)) {
 		/* Take the recvpriv's value for the connected AP*/
 		ss_final = padapter->recvpriv.signal_strength;
 		sq_final = padapter->recvpriv.signal_qual;
@@ -428,8 +429,10 @@ void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
 			rssi_final = rssi_ori;
 	} else {
 		if (sq_smp != 101) { /* from the right channel */
-			ss_final = ((u32)(src->phy_info.signal_strength) + (u32)(dst->phy_info.signal_strength) * 4) / 5;
-			sq_final = ((u32)(src->phy_info.signal_quality) + (u32)(dst->phy_info.signal_quality) * 4) / 5;
+			ss_final = ((u32)(src->phy_info.signal_strength) +
+				    (u32)(dst->phy_info.signal_strength) * 4) / 5;
+			sq_final = ((u32)(src->phy_info.signal_quality) +
+				    (u32)(dst->phy_info.signal_quality) * 4) / 5;
 			rssi_final = (src->rssi + dst->rssi * 4) / 5;
 		} else {
 			/* bss info not receiving from the right channel, use the original RX signal infos */
-- 
2.43.0

