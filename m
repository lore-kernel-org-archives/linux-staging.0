Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC533081D5
	for <linux-staging@lists.linux.dev>; Thu, 23 Oct 2025 09:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761211887; cv=none; b=YW5nQfm0H5erMxIPshW8ol8XnGngTWwHgNX2P1MyZq1lHcjNDlK0JZ2fG8rf1FDoEu9q+WwBu8w+YMBIyedRXRT+YWSI17RkSTDELNgWFufUgwYjzQJncBiTjFtOgwvbQM5ZHWHHUS3h2fwvBiu4ZWNtll3lSgkAl4fPhQQtQks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761211887; c=relaxed/simple;
	bh=vcdlb289vf/OdexQuNAvebpz3oRCCCzgmQ4XNgktblw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uOJSOiT0JD14BoR2SA7r0hRKOPxirsFH9vS6UqJD/585rfRqd9le7gRIStGDqv+dyb68A4CJITtRxoO9jjFSG27xBCTv1hK2d59UWKno/Zeugr5+8WU+Zapg0ZlH9YBRW1RZy/LQ0xqYFcsGWx30RXRdN+C/EAMmf7sZRg9qbLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dW88snaQ; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dW88snaQ"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b553412a19bso365862a12.1
        for <linux-staging@lists.linux.dev>; Thu, 23 Oct 2025 02:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761211884; x=1761816684; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TRPcjKi+AkVobBF6w/ayskRQ6WJVFSRAbJBbh75w6GI=;
        b=dW88snaQG/NjDQb1lftBprJhjOeDL4WRbrBXkQtPTNkkFDPPwcZ/cl98McOhJtmZ/A
         7sjSA9fKHeiVYHQB0DmKNYtEFP712W2t0JEQvhnIXcT/hKcDu/2H98lDPbtigRZAaUQo
         d2MFF8okUPT29KaDq/3jWxJFPoDwt6DWEENooktZCQ0eODcm2MDVNIC7I7u1zb/pg5/+
         ODjhWkeX0HznrlSor8Su1VbqoyQZxgKA9blSuGZW2y6/LdhwVyDUXoEZixs9Mdk55KDZ
         iOhAm0NuElk4dWOG4j9tQlspB2CL7h202lZgWHaYeR0+qxgQbLDGwmoz92erRHeq8Sng
         D12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761211884; x=1761816684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRPcjKi+AkVobBF6w/ayskRQ6WJVFSRAbJBbh75w6GI=;
        b=crPwpnZGYxVRxwTmxnCsBbV2Uh5EczEvpLEgI+/iFklnqjLRoMZwxCkQ79KbcKRv9V
         ytHy6SI3R/6GYhrDd5Ww5Kk9pUhe08I717SCxYnvBhtLWKxJftOGkrZHDf+YEThcbymG
         sDoWfuLLaIxlRd9Cf3BpiJvae6xpbai81mM5qCu1z/Xegy5XIh5JUCqse3miBn+Tle2s
         3M9LXINuefMJwQDdwQKNYh5oT1GQbu9LRtmWmcBoj9GOiwu3bwMEKLaPQxJLitSZeI0S
         7QfNB7HTLF2fXcPVs8sm83LypZhFF+0VzIjf/3XgD8pi7GODydLMjQvHUauaFoTyiXTm
         9mMw==
X-Gm-Message-State: AOJu0YzvuHTusYmUaXH50MYRFJLO+e2C8/Op0DSjYZyW/2cEezijaLL/
	W4PQkny6Bhy5E1u+CwE34O/oeDzT0iBwypgPjS2R3nx3qEbZDfcn7DiC
X-Gm-Gg: ASbGnct5U+NrZZ29gyzGqa6M/wi23yfNH/Ac4EWn2o6MEObcuAnPNu0Xmu348foiYr+
	Q5MvQyQERHI9aUZxyWSt/YWZEXA3cijJyknD+52q6wKC6yoLZFPQfOpwCS/F0FJUIsgVku7Hkf8
	WX9s8DdkERABeZ4LCn9Sz4wnsa5FDI/29rFMOE9Xog2AfTKVilfMQ6myTmi1ije3YRd9yxbrICq
	O/A5W0JLOoC8Z/h4YqhByF2uqtLUnsWXF7ZB16Z2AkHspCwJSNnZtGYmaRUSSEoKo2hZCyzzlYo
	H7LkFpOxnOFL0ZycC0OzHDe4oZTYxkLJxHgxP7G3OESps8EnJLtFDetEAVrZfFPBTlvAZUoysEN
	lDl2I+5IT4SWrVhDzZ7fUwNVnppG8NOIoZqQe3QW6gDSlufWs98UU8NM1pU5wEL932a3x2NwSXB
	OEBywPDfIdApxhS86ji9tT03/ll49spORm
X-Google-Smtp-Source: AGHT+IFD8XEDOVYfADsKz5fjGhOvvRiWX3Cv3+kOv6VNidDcJCQEpGQ1h29z6FgozbXMmBXA7gQezg==
X-Received: by 2002:a17:903:b8b:b0:26d:e984:8157 with SMTP id d9443c01a7336-290c9c89ca7mr240728085ad.8.1761211884351;
        Thu, 23 Oct 2025 02:31:24 -0700 (PDT)
Received: from localhost.localdomain ([117.239.104.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946de1a6e3sm17276665ad.52.2025.10.23.02.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 02:31:23 -0700 (PDT)
From: Dharanitharan R <dharanitharan725@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Dharanitharan R <dharanitharan725@gmail.com>
Subject: [PATCH v4] staging: rtl8723bs: use ether_addr_copy() and simplify NULL checks
Date: Thu, 23 Oct 2025 09:30:52 +0000
Message-ID: <20251023093052.1822-1-dharanitharan725@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch replaces multiple memcpy() calls with ether_addr_copy()
for copying MAC/Ethernet addresses in rtl8723bs.

These changes improve code clarity, align with Linux kernel best
practices, and fix checkpatch.pl warnings.

Tested by compiling the module successfully with:
    make M=drivers/staging/rtl8723bs

Signed-off-by: Dharanitharan R <dharanitharan725@gmail.com>
---
v4: Fixed subject, corrected From email address, improved commit message format
v3: Removed redundant line number details from description
v2: Initial improvements for code style and checkpatch compliance
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 33 ++++++++++----------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 63c4ebe9df12..af6cdda8238d 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -7,6 +7,7 @@
 
 #include <drv_types.h>
 #include <rtl8723b_hal.h>
+#include <linux/etherdevice.h>
 #include "hal_com_h2c.h"
 
 #define MAX_H2C_BOX_NUMS	4
@@ -117,8 +118,8 @@ static void ConstructBeacon(struct adapter *padapter, u8 *pframe, u32 *pLength)
 	*(fctrl) = 0;
 
 	eth_broadcast_addr(pwlanhdr->addr1);
-	memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
-	memcpy(pwlanhdr->addr3, get_my_bssid(cur_network), ETH_ALEN);
+	ether_addr_copy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)));
+	ether_addr_copy(pwlanhdr->addr3, get_my_bssid(cur_network));
 
 	SetSeqNum(pwlanhdr, 0/*pmlmeext->mgnt_seq*/);
 	/* pmlmeext->mgnt_seq++; */
@@ -209,10 +210,10 @@ static void ConstructPSPoll(struct adapter *padapter, u8 *pframe, u32 *pLength)
 	SetDuration(pframe, (pmlmeinfo->aid | 0xc000));
 
 	/*  BSSID. */
-	memcpy(pwlanhdr->addr1, get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
+	ether_addr_copy(pwlanhdr->addr1, get_my_bssid(&(pmlmeinfo->network)));
 
 	/*  TA. */
-	memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
+	ether_addr_copy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)));
 
 	*pLength = 16;
 }
@@ -246,21 +247,21 @@ static void ConstructNullFunctionData(
 	switch (cur_network->network.infrastructure_mode) {
 	case Ndis802_11Infrastructure:
 		SetToDs(fctrl);
-		memcpy(pwlanhdr->addr1, get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
-		memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
-		memcpy(pwlanhdr->addr3, StaAddr, ETH_ALEN);
+		ether_addr_copy(pwlanhdr->addr1, get_my_bssid(&(pmlmeinfo->network)));
+		ether_addr_copy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)));
+		ether_addr_copy(pwlanhdr->addr3, StaAddr);
 		break;
 	case Ndis802_11APMode:
 		SetFrDs(fctrl);
-		memcpy(pwlanhdr->addr1, StaAddr, ETH_ALEN);
-		memcpy(pwlanhdr->addr2, get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
-		memcpy(pwlanhdr->addr3, myid(&(padapter->eeprompriv)), ETH_ALEN);
+		ether_addr_copy(pwlanhdr->addr1, StaAddr);
+		ether_addr_copy(pwlanhdr->addr2, get_my_bssid(&(pmlmeinfo->network)));
+		ether_addr_copy(pwlanhdr->addr3, myid(&(padapter->eeprompriv)));
 		break;
 	case Ndis802_11IBSS:
 	default:
-		memcpy(pwlanhdr->addr1, StaAddr, ETH_ALEN);
-		memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
-		memcpy(pwlanhdr->addr3, get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
+		ether_addr_copy(pwlanhdr->addr1, StaAddr);
+		ether_addr_copy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)));
+		ether_addr_copy(pwlanhdr->addr3, get_my_bssid(&(pmlmeinfo->network)));
 		break;
 	}
 
@@ -765,9 +766,9 @@ static void ConstructBtNullFunctionData(
 		SetPwrMgt(fctrl);
 
 	SetFrDs(fctrl);
-	memcpy(pwlanhdr->addr1, StaAddr, ETH_ALEN);
-	memcpy(pwlanhdr->addr2, myid(&padapter->eeprompriv), ETH_ALEN);
-	memcpy(pwlanhdr->addr3, myid(&padapter->eeprompriv), ETH_ALEN);
+	ether_addr_copy(pwlanhdr->addr1, StaAddr);
+	ether_addr_copy(pwlanhdr->addr2, myid(&padapter->eeprompriv));
+	ether_addr_copy(pwlanhdr->addr3, myid(&padapter->eeprompriv));
 
 	SetDuration(pwlanhdr, 0);
 	SetSeqNum(pwlanhdr, 0);
-- 
2.43.0

