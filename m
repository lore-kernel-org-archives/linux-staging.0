Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39106342158
	for <linux-staging@lists.linux.dev>; Tue, 21 Oct 2025 15:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761060445; cv=none; b=f8b/y4kDnykG574KWTL7PCfrsEXR9EGfpEVNiIhoueQn5Xyrll8Y/Gl6YzxBvlRNaT3kyxRatbtB/jrtQp+gVccPNE1gfYigzshIvH/eUBDWgHOubhuXncyIODGp4QpCOyrmr1xfy+WaYFHtuFhHo2bMyFcv0DQDnZOE5hw9hcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761060445; c=relaxed/simple;
	bh=jqwOPTT/o5N4P2uY/I0h1RKQxATI/heA/jcVXeksvG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hnRo/5pLr14ICn4OHGXd3bkEwK0B0ehST5mpE0vHaNedBDedXoyb3fr4Y9C0Cbo71OUHEeSjeC1WDl1YhV8WjjupxurmcaMpYIEmyPe6LmU4kwd7k+jL3PL+hnRc/Chfrlw5yctdz83DZlxkH5yvwA8eHN9u9mlMCFUTWxiVKuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Exbf/MKv; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Exbf/MKv"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7930132f59aso7674912b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 21 Oct 2025 08:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761060443; x=1761665243; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jqmjyts0iLEXMuKSaol8oJR6HT/TScQSBk26ZZCHWOY=;
        b=Exbf/MKvbgzF0QFDk8DXHUyeZWHjbTCKp5aizB+bT0gwDQlWNZnO2hdR8KNGsCZat7
         CnVcRC68ALSR1fljwXwMY/Muy8WqkiPigAfkiOiOAyL/6RFIdcs2nzBLDrrSLsmdjTo+
         4IMeQopYnoEDIwKWUSfcHSKEQidhDRp7VaS4KOn8gcg0kVP5kBrjaHU3XdygAp8Yth0I
         GvABTalaGFCQZrqYCbq0PxgwqPEswapMb+eO0XPo+kg5OF2Tkk+aiCnhAodD6Ah0nKV6
         GLfkbeodLZ39FJomWkh1bLvYR9VaPzcRi55AIsyVPDkpTApVFqcqO2XaRT3EvsvaIfaD
         5IoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761060443; x=1761665243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jqmjyts0iLEXMuKSaol8oJR6HT/TScQSBk26ZZCHWOY=;
        b=XSGYFNSO+Z5upex1KD38gysMzE8OG12yBaKQ3Sh1Zys88VvggEnSCPhH+veSmF0Rr8
         +S04DHFMlleSsrHAT3UTkv357EujNKC+2yP319HlqeXAxLDOTSN7/dgkD2QWTaM0GSkc
         9pzg7epR4BZFeb2xxg0tkZw7OJN+pLwdFv4ePINBVdtn8Fo3PMTmhFq6SBwZ1W5NoHho
         jMMeFJyzkIAyPOZqFbdiaes8FJO3DsOB7hQADCRyFOayB4tTanIYkuxoop9kYVo/lQRI
         0aD1QQSjjSysmKjcO3e+9RLsdr9PWNDNovNPqKC0cNnHmM1mqDR5n/l20ZTPXKIdeE/U
         a7GQ==
X-Gm-Message-State: AOJu0YwGg1mo7P2W3hPQsa1L0LZ7nqXpVFJ2UIeJS6jQ8CMKIFN+XWdo
	gdjXagcRJJBxREXOdiynVSrLo6JMr9qKiTyy3DwBPeeNLe41v+litdgd
X-Gm-Gg: ASbGncs8iirCjIcLydYVl/RdQVVglOHtMJkXRahjXKGSSf75x3BQY7idIvBLHTBNMaJ
	KttLzIVN7hFk4/l+STSh/by5WWMzFbjQM6mYTHBuF9ltHDgDVqrMDyQBOWaxnUPGA8snAq31MNB
	zkju5wfwPAaGUfFuDDkNwpXGJWB68dfnhI8E8qnOl5PhFYpumyNNVOKtspule7wbQ9ZPnntx5J7
	pLTSL4zpLwsWG9NrSDgaYK/iznBElE+b0v+HQFUP/wd9whfrxi2NMd158Z9WTFSCz7j74BQPpEZ
	hd3GrwQIgAyl6yBvoc0RCaF+DeZK7yP5NO5HhTJFi+YT0uly6+yb5DhaNpTcXRl/emBYib8uk4c
	wGdJIGhvzMclacmxXOu6fIPPWyVBn8EFA/6gXKscY7y9dAnch6mYGLbMwoF/klBIgExvVQ4srhB
	lHhTkbTGU8B0Abxcj5HTcrhyjaQ6WKQQLQ
X-Google-Smtp-Source: AGHT+IEQKh2loEfgH5Go2a5LwXIL0mhjD2bDHO8AnVaHmsXJeFw3/pnV6OVloD3XHh25Srze4gT20A==
X-Received: by 2002:a05:6a00:1706:b0:77f:1d7a:b97f with SMTP id d2e1a72fcca58-7a220d55b41mr22127714b3a.28.1761060443257;
        Tue, 21 Oct 2025 08:27:23 -0700 (PDT)
Received: from localhost.localdomain ([38.134.138.172])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f3c38sm11665110b3a.37.2025.10.21.08.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 08:27:22 -0700 (PDT)
From: Dharanitharan R <dharanitharan725@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	dharanitharan27 <dharanitharanr05@gmail.com>,
	Dharanitharan R <dharanitharan725@gmail.com>
Subject: [PATCH] [PATCH v2] staging: rtl8723bs: use ether_addr_copy() and simplify NULL checks
Date: Tue, 21 Oct 2025 15:26:55 +0000
Message-ID: <20251021152655.40041-1-dharanitharan725@gmail.com>
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

