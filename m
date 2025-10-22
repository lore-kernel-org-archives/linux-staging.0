Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A57D242D8B
	for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 06:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761114216; cv=none; b=IR+HKW5aRpVW9cz6IejZeT1AHDCy9oxMa2w0Ad6ANtRXxeQJ/5soGMO36niugjZOFe9sKmqKtbUpAzeoLzmi104v5L/1vfgEELIY/MCjnWjrsbYuMfv1Bpz46pRvD5t19eoEekkJSxcp9udKbAtnuSIvGxB9U/ypX3SmtCe3RQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761114216; c=relaxed/simple;
	bh=jqwOPTT/o5N4P2uY/I0h1RKQxATI/heA/jcVXeksvG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B2p3SBerVM1xXKPrYt4Z2SeVDXDVCPjX7WSrYOcQAYw52Jtjy8eLmYqec4SH9fPgpjdAJuHb72RULfECHJC+2vE9RKrmDMT2pJktLyXSlXB2Bpcr6MG5gi5KrROsfX12YYQtxJzDA8rLGA5Hkui0O+1IcKLH+GmHNrSkOMQb/8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZdpjqyL; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZdpjqyL"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-330b4739538so6067197a91.3
        for <linux-staging@lists.linux.dev>; Tue, 21 Oct 2025 23:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761114214; x=1761719014; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jqmjyts0iLEXMuKSaol8oJR6HT/TScQSBk26ZZCHWOY=;
        b=fZdpjqyLbrOwk7mDVD8R5igOP+J5Ym5liJODofiiI4Qs3BLb3IBpuMOJfTu2Tb/iuQ
         txoiHE2SSRjDA0gZUUOZuUm9JEfNGEksnpURGeD4vuhjygblbIW9bF29MQU9bNaj4rpZ
         t+7zdF0C57v/6sK3ISmdkgQ/Vkt+055w0wj0sHjcgtxMqm0ZG8qT341+Q8VPXEBPdye7
         ZM+iAtiJplAyp1EFSxjraSOZ1KzdkbzmYgQzZDztqFZh3dJ0APxPk8zbLU2MUqXqnpke
         PBPUQrangdgonW2Mw933AdnQUKISWP1A3uVm6W6F86kXArrEBBrgFE9UZiZaAxbwaaX/
         QCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761114214; x=1761719014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jqmjyts0iLEXMuKSaol8oJR6HT/TScQSBk26ZZCHWOY=;
        b=CujxintcsJTPESscqc5mTXQehgPuwfD44OLYKVtypNvv5Rt8T5aEOLgMEl4df8+0f6
         i4xElfzlHbd3OoKUPzeowmMUigdCm6i7wouYB07KkQJaylXs1cDNtJIrpSK70mUHgmgj
         iYeEe26yq1xAEJ0o1OE1Fa3/8bMeo8OvHQ7G+oZoHH+hPe3ydFqCxHSwk37Vql85IGSS
         VI4tilplG+BskqKKg/m/nDkJBYx2wqAoqsJGE6jFuxbKIPqysM1aAVEMcp6V51wJqIzn
         PdFjMllLEDq7xH8uegSpYJIHhpyU1i9+F49KBzaTDzC6U4ZCJ1//Mh6MDHOXzGQqnmU8
         U8Hg==
X-Gm-Message-State: AOJu0YxfBQUr27uPn2TredbYNoFtqOA0xuERDXWLJOjc0Ya/VkZV8D2O
	su6VqKxq9USIsxPOXyGQyJEc2vYOnGxfkWfjAOTCnk0XYUCdgICTcf+tX3F4UQGDXks=
X-Gm-Gg: ASbGnctUthu8NFxAoQ9BUev3GPzUj7MeEvsCrPttaMAxBl7vfct8emn8rj9I9GJawuF
	im1rgg4mYwHzMny6GVBrYy+9pUqcUXpEWzsCcM7CXQiEc+YU+2+dVlkBvlII/N0EsoRKXsTJVOM
	NzD+XtrbkWA8Iphx9Nad6grTWTNsE9NM0ykfsKCxDyWjiwiMIX6CrmNQ5smdKO2luvMKnvp4XWw
	0AiYMvwR2wwV/LDRcuspvXNzI65Pj/FeH8RH0+tgKM580+Z1GsJLk6OLooL55euZseWCLkJ7REW
	W9uliZIfjKOdEOz+vDd5YvlyvSgsWITnHVFFFSQLzFPUYbRhsk8pTkUErcOMo83tS1FonJvvELc
	2OEApwBbvYe6a97KtiVqK8hFB8w3rdWLEx/G5YN5Kb4ZprblcRZv6Rgk3P2LiIBJHftPl6hJjd7
	wJqYnLGgKOvDWZDhxuJJ5h
X-Google-Smtp-Source: AGHT+IEK33L5LzW3jZxTj/duWpm1Y9YDwvuSXODcj2f2HlgSrQyPo+1FOlZmK4lcjzwE2sZWeGeD0Q==
X-Received: by 2002:a17:90b:2692:b0:32b:9506:1780 with SMTP id 98e67ed59e1d1-33bcf88821emr26195440a91.9.1761114213641;
        Tue, 21 Oct 2025 23:23:33 -0700 (PDT)
Received: from localhost.localdomain ([103.98.209.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e2240e3c4sm1500233a91.16.2025.10.21.23.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 23:23:33 -0700 (PDT)
From: Dharanitharan R <dharanitharan725@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	dharanitharan27 <dharanitharanr05@gmail.com>,
	Dharanitharan R <dharanitharan725@gmail.com>
Subject: [PATCH v3] [PATCH v2] staging: rtl8723bs: use ether_addr_copy() and simplify NULL checks
Date: Wed, 22 Oct 2025 06:23:04 +0000
Message-ID: <20251022062304.4061-1-dharanitharan725@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: dharanitharan27 <dharanitharanr05@gmail.com>

This patch addresses multiple checkpatch warnings and coding-style issues
in rtl8723bs:

- Lines 120, 212, 215, 249, 255, 256, 261, 262, 263: Replaced
  memcpy() with ether_addr_copy() for MAC/Ether address copies,
  following kernel best practices.

These changes improve code clarity, align with Linux kernel style
guidelines, and fix checkpatch.pl warnings.

---
Tested by compiling the module successfully with:
    make M=drivers/staging/rtl8723bs

Signed-off-by: Dharanitharan R <dharanitharan725@gmail.com>
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

